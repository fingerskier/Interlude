<cfcomponent extends="CFIDE.websocket.ChannelListener" output="false">
	<cffunction name="afterUnsubscribe">
		<cfargument name="subscriberInfo">

	</cffunction>

	<cffunction name="allowPublish">
		<cfargument name="publisherInfo">

	</cffunction>

	<cffunction name="allowSubscribe">
		<cfargument name="subscriberInfo">

	</cffunction>

	<cffunction name="beforePublish">
		<cfargument name="message">
		<cfargument name="publisherInfo">

	</cffunction>

	<cffunction name="canSendMessage">
		<cfargument name="message">
		<cfargument name="subscriberInfo">
		<cfargument name="publisherInfo">

	</cffunction>
</cfcomponent>