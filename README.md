node-find-rss [![Build Status](https://travis-ci.org/nikezono/node-find-favicon.png)](https://travis-ci.org/nikezono/node-find-favicon)
---

[![NPM](https://nodei.co/npm/find-favicon.png)](https://nodei.co/npm/find-favicon/)

find favicon from html

##install

***using npm:***

    npm install find-favicon

****or using package.json:***

    "find-favicon": "*"

##usage
    # Coffeescript
    finder = require 'find-favicon'
    finder "http://www.apple.com/",(error,favicon)->
      console.log error if error
      console.log favicon

      # =>
      # [ { url: 'http://www.apple.com/favicon.ico',
            path: '/favicon.ico'
            } ]
