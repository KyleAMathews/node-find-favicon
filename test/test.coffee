# test dependency
path = require 'path'
assert  = require 'assert'

# test framework
finder = require path.resolve('lib','find-favicon')

# test Property
shokai   = "http://shokai.org/blog/"
shokai2  = "http://shokai.org/blog"
apple    = "http://www.apple.com/"
livedoor = "http://news.livedoor.com/"
geta6    = "http://blog.geta6.net"
# findRSS
describe "find-favicon", ->

  it "エラー処理できる",->
    finder "egergre",(e,favicon)->
      assert.equal favicon,null
      assert.equal e?, true

  it "faviconがhtmlのlinkタグから取得できる",(done)->
    finder livedoor,(e,favicon)->
      console.log 
      assert.equal favicon.url?,true
      done()

  it "faviconを自動で探索する", (done)->
    finder shokai,(e,favicon)->
      assert.equal favicon.url,'http://shokai.org/favicon.ico'
      done()
