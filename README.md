Interlude
=========

An opinionated, event-based ColdFusion framework


The Basics
----------
The AngularJS client is tied to a ColdFusion server through cfwebsocket.
- cfwebsocket handles Flash fallback for deficient browsers :)
Using Angular's event-system data to/from the server is handled.
Using CFCs web-socket events are handled by the server.
Other conventions are used to persist controllers and services in various scopes.


Why?
----
The only thing simpler than CF development is starting with a working application that can be molded into your vision. 


API
---
```
TBA
```

'com.path'
	For CFCs that are automatically instantiated:
	- 'com' is one of the conventional directories
	- 'path' is the CFC name plus sub-directories
	
Components under the 'appController' directory are instantiated under application.controller
Components under the 'appService' directory are instantiated under application.service
Components under the 'appSession' directory are instantiated
Components under the 'session' directory are instantiated in the session-scope
Components under the 'request' directory are instantiated in request-scope
- note that this could be fairly heavy if abused  


Example Application Structure
-----------------------------
```
Application.cfc
index.cfm
someView.cfm
controller
	c1.cfc
	c2.cfc
service
	s1.cfc
	s2.cfc
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
	3-tier URLs
	* domain.net/root/branch/leaf
	* this functionality is built-in
	* can check $scope.root, $scope.branch, and $scope.leaf to determine UI state
	Events
	* Angular's event system is tied to web-sockets via the 'socket' service
	* The 'socket' service automatically applies changes to the current scope
ColdFusion
	Events
	* 