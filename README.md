Interlude
=========

An opinionated, ColdFusion application framework.  This [will be] a working application built to be easily transmogriphied into your application.


The Basics
----------

- The AngularJS client is tied to a ColdFusion server through cfwebsocket.
- cfwebsocket handles Flash fallback for deficient browsers :)
- Using Angular's event-system data to/from the server is handled.
- Using CFCs web-socket events are handled by the server.
- Pluggable architecture to add/subtract features easily.


Why?
----
The only thing simpler than CF development is not having to start it from scratch...


API
---
TBA

These directories have special significance:

	- appController! - these CFCs are instantiated under application.controller
	- appService! - these CFCs are isntantiated under application.service
	- appSession! 
		- these CFCs are persisted and are invoked per session
		- before() methods are invoked on session start
		- after() methods are invoked on session end
	- appRequest!
		- these CFCs are persisted and are invoked per request
		- before() methods are invoked on session start
		- after() methods are invoked on session end
	- session!
		- these CFCs are instantiated in the session.com
		- this is meant to provide common utilities available throughout the user's session
	- request!
		- these CFCs are instantiated in the request-scope
		- this provide utilities availabe in every request


Example Application Structure
-----------------------------
```
Application.cfc
index.cfm
someView.cfm
appController
	c1.cfc
	c2.cfc
appService
	s1.cfc
	s2.cfc
appSession
appRequest
session
	n1.cfc
	n2.cfc
request
	r1.cfc
	r2.cfc
```


Patterns
--------
AngularJS
	- 3-tier URLs
		- domain.net/root/branch/leaf
		- this functionality is built-in
		- can check $scope.root, $scope.branch, and $scope.leaf to determine UI state
	- Events
		- Angular's event system is tied to web-sockets via the 'socket' service
		- The 'socket' service automatically applies changes to the current scope

ColdFusion
<<<<<<< HEAD

	- Single-Page Apps
		- each major feature of your application is represented as a .cfm in the root directory
		- wrap a page in <cf_layout> to include the framework functionality
	- Messaging
		- add a web-socket channel in Application.cfc
		- copy the example.cfc to create a web-socket listener (in the channel directory) 
	- Plugins
		- As described above: CFCs in specific directories are auto-wired
		- These will be invoked at certain times, or be available in a certain scope throughout the application
=======
	- Events
		- web-socket listeners...
	- Session Plugins
		- TBD
		- CFCs can be automatically run before/after sessions
		- or CFCs can be instantiated into the session-scope
	- Request Plugins
		- TBD
		- Still exploring the merits of this with web-sockets...
>>>>>>> a0000184ba973512a8aef676c296c692ab3f900a
	

TODO
====
- Test web-socket functionality
	- I'd like to mesh the Angular + CF web-socket events w/ some kind of shared scope
- Mock-up sample functionality
	- I want a nicely featured chat-room and news.  This is problematic because, as a seed project, this stuff must be commonly useable but easy to extract in future projects.
