# Interlude v0.1

A ColdFusion + AngularJS seed project for single-page, real-time apps...
...very much a work-in-progress/playground project at the moment


## Roadmap

###### note-to-self: odd numbered version denotes in-progress; even numbers are "stable"; a third digit (if any) denotes minor additions/changes...

``` v0.1 - v0.2
Get the basic framework setup and running...with tests.

``` v0.3 - v0.4
Test and implement client/server functionality with a basic application: news, chat, and accounts.

``` v0.5 - v0.6
Testing in real-world scenarios.

``` v0.7 - v0.8
Perhaps minification/compression of CSS & JS for production.  Auto-wiring of CRUD functionality for ORM.


Read http://www.adobe.com/devnet/coldfusion/articles/html5-websockets-coldfusion-pt1.html#articlecontentAdobe_numberedheader_3
Need to account for nested apps == relative paths
Auto-load CSS and JS files
  concatenation & compression for production mode (UglifyJS & Stylus)


## Whatcha Need

ColdFusion
Clone this repo


## Patterns

Client

  - Use cfajaxproxy object directly for an RPCish call
  - Use cfwebsocket + invokeAndPublish() for "real-time" data
  - Jasmine tests in /test/*_test.js (run them via testClient.html)

Server

  - ORM CFCs in /model
  - Data services in /service
    - these are automatically instatiated in application.service
  - MXunit tests in /test/*_test.cfc (run them via testServer.cfm)

Dev Flow

  - run ./browser to load the app and both test-runners


## Contributing

Still pre-alpha...any suggestions or contributions are welcome!
