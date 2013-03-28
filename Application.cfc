<cfcomponent extends="Interlude">
	<cfset this.customTagPaths = expandPath("./tags")>
	<cfset this.datasource = "test">
	<cfset this.name = "Interlude_0">
	<cfset this.sessionManagement = true>

	<cffunction name="setupListeners">
		<cfargument name="listener" required="true" type="struct">

		<cfset on("user-login", "user.login")>
	</cffunction>

	<cffunction name="onRequestStart">
		<cfif isDefined("URL.restart") and (URL.restart is "goober")>
			<cfset restartApplication()>
		</cfif>

		<cfif isDefined("URL.event")>
			<cfparam name="URL.data" default="">
			<cfset emit(URL.event, URL.data)>
		</cfif>
	</cffunction>

	<cffunction name="onRequestEnd"></cffunction>

	<cffunction name="onSessionStart"></cffunction>

	<cffunction name="onSessionEnd">
		<cfargument name="SessionScope" required="true">
		<cfargument name="ApplicationScope" required="false">
	
	</cffunction>

	<cffunction name="restartApplication">
		<cfset applicationstop()>
	</cffunction>
</cfcomponent>
