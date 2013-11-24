module.exports =
  options : 
    viewportSize : 
      width : 1000
      height : 1600
  capture : [
    {
      url : 'http://localhost:10000'
      name : '首页'
      scripts: [
        {
          selector : 'body'
          func : 'scrollTop'
          args : [2000]
        }
        {
          selector : 'body'
          func : 'scrollTop'
          args : [4000]
        }
      ]
      exists : [
        '#header .login'
        '#header .logout'
        '#header .vicanso'
      ]
    }
    {
      url : 'http://localhost:10000'
      name : '登录'
      scripts : [
        {
          selector : '#header .login'
          func : 'click'
        }
        {
          selector : '#loginDlg .account'
          func : 'val'
          args : ['jenny']
        }
        {
          selector : '#loginDlg .pwd1'
          func : 'val'
          args : ['123456']
        }
        {
          selector : '#loginDlg .code'
          func : 'val'
          args : ['1234']
        }
        {
          selector : '#loginDlg .confirm'
          func : 'click'
        }
      ]
    }
    {
      url : 'http://localhost:10000'
      name : '注册'
      selector : '#loginDlg'
      scripts : [
        {
          selector : '#header .login'
          func : 'click'
        }
        {
          selector : '#loginDlg .register'
          func : 'click'
        }
      ]
    }
    # {
    #   url : 'http://localhost:10000/wardrobe'
    #   name : '衣橱'
    # }
    # {
    #   url : 'http://localhost:10000/wardrobe/%E8%A1%A3%E6%9C%8D'
    #   name : '衣服'
    # }
    # {
    #   url : 'http://localhost:10000/wardrobe/%E9%9E%8B%E5%AD%90'
    #   name : '鞋子'
    # }
    # {
    #   url : 'http://localhost:10000/wardrobe/%E5%8C%85%E5%8C%85'
    #   name : '包包'
    # }
  ]