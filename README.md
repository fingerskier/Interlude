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
	- appSession! - these CFCs are persisted and are invoked per session (see below)
	- appRequest! - these CFCs are persisted and are invoked per request (see below)
	- session! - these CFCs are instantiated in the session-scope (see below)
	- request! - these CFCs are instantiated in the request-scope (see below)


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
	- Events
		- web-socket listeners...
	- Session Plugins
		- TBD
		- CFCs can be automatically run before/after sessions
		- or CFCs can be instantiated into the session-scope
	- Request Plugins
		- TBD
		- Still exploring the merits of this with web-sockets...
	

TODO
====
- Finish scope auto-wiring - Session & Request CFC auto-wiring isn't working; probably gonna dump the request version as it's usefulness with SPA/web-sockets is questionable.
- Test web-socket functionality - I'd like to mesh the Angular + CF web-socket events w/ some kind of shared scope
- Mock-up sample functionality - I want a nicely featured chat-room and news.  This is problematic because, as a seed project, this stuff must be widely useable but easy to extract in future projects.
