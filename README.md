Interlude
=========

An opinionated, ColdFusion application framework.  This [will be] a working application built to be easily transmogriphied into your application.


The Basics
----------

- The AngularJS client is tied to a ColdFusion server through cfwebsocket
- cfwebsocket handles Flash fallback for deficient browsers :)
- Angular's event-system handles data to/from the server
- CFCs handle events via web-sockets to/from the client
- Pluggable architecture to add/subtract features easily


Why?
----
The only thing simpler than CF development is not having to start it from scratch...


API
---
TBA


Example Application Structure
-----------------------------
```
Application.cfc
index.cfm
```


Patterns
--------

AngularJS
---------

	- 3-tier URLs
		- domain.net/root/branch/leaf
		- this functionality is built-in
		- can check $scope.root, $scope.branch, and $scope.leaf to determine UI state
	- Events
		- Angular's event system is tied to web-sockets via the 'socket' service
		- The 'socket' service automatically applies changes to the current scope

ColdFusion
----------

	- Single-Page Apps
		- each major feature of your application is represented as a .cfm in the root directory
		- you can <cfinclude> partials, I prefer using something like Jade to piece it together
	- Messaging
		- register event listeners in your onApplicationStart()
	- Plugins
		- plop a CFC into the listeners directory and register the appropriate CFC.method
	- Events
		- web-socket listeners...as above
	

TODO
====
- Test web-socket functionality
	- Need to validate the web-socket transfers
	- Events are one-way, event-handlers should emit and event to send data back
	- Need to add in methodology for broadcasting vs. pushing to one user vs. pushing to group of users (?roles?) 
	- I'd like to mesh the Angular + CF web-socket events w/ some kind of shared scope
- Mock-up sample functionality
	- I want a nicely featured chat-room and news.  This is problematic because, as a seed project, this stuff must be commonly useable but easy to extract in future projects.
