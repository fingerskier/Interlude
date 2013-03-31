***Interlude
A ColdFusion + AngularJS seed project for single-page, real-time apps...
...very much a work-in-progress/playground project

TODO
----

dump Jade for straight markup w/ cfincludes

Whatcha Need
------------

ColdFusion
Clone this repo
External helpers: Jade & Stylus
	install node.js
	npm install Jade
	npm install Stylus

Patterns
--------

Client

	- Use cfajaxproxy object directly for an RPCish call
	- Use cfwebsocket + invokeAndPublish() for "real-time" data
	- Jasmine tests in /test/*_test.js (run them via testClient.html)
	- Jade, via the build script, compiles everything into an index.html file (if you include other views where appropriate)
	- Stylus, as above, processes everything into main.css (if all other .styl files are included from it)

Server
	- ORM CFCs in /model
	- Data services in /service
	- MXunit tests in /test/*_test.cfc (run them via testServer.cfm)

Dev Flow
	- run ./browser to load the app and both test-runners
	- run ./build to make /index.html and /main.css

Contributing
------------

Still pre-alpha...
