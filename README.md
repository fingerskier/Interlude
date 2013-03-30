*** Interlude
A ColdFusion + AngularJS seed project

Whatcha Need
------------

ColdFusion (tested on ACF10)
Clone this repo
External helpers: Jade & Stylus
	install node.js
	npm install Jade
	npm install Stylus

Patterns
--------

Client
	I use cfajaxproxy and invoke the object directly
	Jasmine tests in /test/*_test.js (run them via specClient.html)
Server
	ORM CFCs in /model
	Data services in /service
	MXunit tests in /test/*_test.cfc (run them via testServer.cfm)
Dev Flow
	run ./browser to load the app and both test-runners
	run ./build to make /index.html and /main.css

Contribute
----------

All contributions are welcome!
Check out angular-stash and coldfusion-stash for other helpful bits
