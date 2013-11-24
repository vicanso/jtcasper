
setting = require './setting'
casper = require('casper').create setting.options
casper.on 'page.error', (msg, trace) ->
  this.echo "Error: #{msg}, #{JSON.stringify(trace)}"
async = require 'async'

async.eachLimit setting.capture, 1, (item, cbf) ->
  casper.start item.url
  if item.scripts
    casper.then ->
      item.scripts.forEach (script, i) =>
        casper.wait (i + 1) * 20, ->
          @evaluate (selector, func, args) ->
            obj = $ selector
            obj[func].apply obj, args
          , script.selector, script.func, script.args
  if item.exists
    casper.then ->
      item.exists.forEach (selector) =>
        if !@exists selector
          @echo "the #{selector} not found in page #{item.url}"
  delay = item.delay || 1000
  casper.wait delay, ->
    @evaluate ->
      $(window).scrollTop 0
    casper.then ->
      selector = item.selector || 'body'
      @captureSelector "./#{item.name}.jpg", selector, {
        format : 'jpg'
        quality : 75
      }
  casper.then ->
    cbf null
, ->
  console.dir 'complete'

casper.run()
