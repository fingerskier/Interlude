Interlude
=========

An opinionated, event-based ColdFusion framework


The Basics
----------
Events are generated by your application
Your application is notified of events in one of several ways:
	GET: URL.emit, data will be an aggregate of accompanying URL variables if they exist
	POST: form.emit, data will be an aggregate of accompanying POST data if it exists
	Internal: application.emit('event~name', data);
No matter how an event is triggered it eventually is handled by the internal event system
Listeners can be registered via application.on('event~name', method.path)
	event-names are not case-sensitive
	the dot-path to the handler function must be previously instantiated (see below)

Event data is optional, this would be any bits that logically accompany the event


Why?
----
Because it's far easier.
Traditional web-applications are also built on an event system: applicationStart, sessionEnd, pageRequest, etc...  In a well-designed REST implementation each URI is, essentially, an event.  However, we fail ourselves when we go beyond the basic framework events and try to fall back into a different style of programming: temporal, object-message-passing, whatever.  An event system allows us to not only separate concerns, but also separate sequencing.  This means writing testable units on a whim without having the mock-up huge chunks of the application beforehand.

API
---
on('event~name', 'com.dot.path');
	the dot-path is optional when called from a constructor
emit('event~name', data);
	data is optional
ignore('event~name', 'com.dot.path');
	unregisters a listener
	the dot-path is optional when called from within a CFC, in this case [if omitted] it is assumed to mean the current CFC/method

'com.doth.path'
	this is of the form 'component.method', this is translated to application.com.component.method but that is transparent to you
	nested directories/paths are fine


Example Application Structure
-----------------------------
Application.cfc
index.cfm
someView.cfm
com
  controllers
    aCtrl.cfc
    bCtrl.cfc
  services
    someSrvc.cfc
    anotherSrvc.cfc

This yields an auto-created structure in the application-scope: application.com
These component instances know nothing of each other.
The application keeps a table of events, and listeners registered to those events.


But...
------
Aren't I going to get lost in the weeds, with event registrations scattered about?  Potentially, but that's up to you.  You'll probably prefer to register events in onApplicationStart (or around that time) all at once.  This will give you a nice map of your program flow and avoid frivolous event registrations.
Don't I have enough events already?  applicationStart/End, sessionStart/End, requestStart/End, error, et al.  This is a nice starting point but finer-grained events allow us to focus control toward an eventual end: events are handled when they change the model or emit a response event.  This frees us from having to transition to another style of programming within our application.
How?  The beauty of ColdFusion applications is that we have a variety of states that can be thought to create the current "mode" in which a user is operating.  So, event-handler can mutate the application, session, and request objects to create the current application state (specific to each user).  Additionally, each event might carry data with it that contributes to this "mode" and moves us toward handling the event.
What about unhandled events?  No one will ever know...unless they read the logs.  Unhandled events are logged if you so desire.
