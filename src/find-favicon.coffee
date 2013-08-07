module.exports = (req,callback)->

  # dependency
  htmlparser = require("htmlparser2")

  # utility
  url          = require 'url'
  request      = require 'request'

  # instance property
  favicon      =
    url: req
    path: req
  cand = ''

  parser = new htmlparser.Parser(
    onopentag: (name, attr) ->
      cand = attr.href if name is 'link' and (attr.rel is 'icon' or attr.rel is 'shortcut icon' or attr.type is 'image/x-icon')
  )

  # main
  request.get
    uri: req
    encoding: null
  , (err,res,body)->
    if err?
      callback err,null
      return

    parser.write body
    parser.end()

    obj = url.parse req

    if cand.length > 0
      if cand.match /[http|https]:\/\//
        favicon.url = cand
        return callback null,favicon
      else
        favicon.path = cand
        if cand.charAt(0) is '/'
          favicon.url = "#{obj.protocol}//#{obj.host}#{cand}"
          callback null,favicon
        else
          favicon.url = "#{obj.protocol}//#{obj.host}/#{cand}"
          callback null,favicon
    else
      guess = "#{obj.protocol}//#{obj.host}/favicon.ico"
      request guess, (err,res,body)->
        favicon.url = guess if res.statusCode is 200
        callback null,favicon
