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

		<cfif isDefined("message.event")>
			<cfparam name="message.data" default="">
			<cfset deserializeJSON(message.data)>
			<cfset emit(message.event, message.data)>
		</cfif>
	</cffunction>

	<cffunction name="canSendMessage">
		<cfargument name="message">
		<cfargument name="subscriberInfo">
		<cfargument name="publisherInfo">

	</cffunction>
</cfcomponent>
