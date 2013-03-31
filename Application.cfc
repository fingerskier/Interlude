<cfcomponent extends="Interlude">
	<cfset this.customTagPaths = "./tags">
	<cfset this.datasource = "Interlude">
	<cfset this.debugipaddress = "127.0.0.1">
	<cfset this.enablerobustexception = false>
	<cfset this.loginStorage = "session">
	<cfset this.name = "Interlude_0">
<!---
	<cfset this.ormenabled = true>
--->
	<cfset this.ormsettings = {
		DBcreate = "dropcreate",
		dialect = "Derby",
		eventHandling = true,
		logSQL = true
	}>
	<cfset this.secureJSON = true>
	<cfset this.sessionManagement = true>
	<cfset this.setClientCookies = true>
	<cfset this.setDomainCookies = false>
	<cfset this.smtpServersettings = {}>
	<cfset this.timeout = 30>

	<cffunction name="onApplicationStart" returntype="boolean">
		<cfreturn true>
	</cffunction>

	<cffunction name="onApplicationEnd" returntype="void">
		<cfargument name="applicationScope" type="struct">

		<cfreturn>
	</cffunction>

	<cffunction name="onError" returntype="void">
		<cfargument name="exception" required="true" type="any">
		<cfargument name="eventName" required="true" type="string">

		<cfdump var="#arguments#">

		<cfreturn>
	</cffunction>

	<cffunction name="onRequestStart" returntype="boolean">
		<cfargument name="targetPage" required="true">

		<cfif isDefined("URL.restart") and (URL.restart is "goober")>
			<cfset applicationStop()>
		</cfif>

		<cfreturn true>
	</cffunction>

	<cffunction name="onRequestEnd" returntype="void">
		<cfreturn>
	</cffunction>

	<cffunction name="onSessionStart" returntype="void">
		<cfreturn>
	</cffunction>

	<cffunction name="onSessionEnd" returntype="void">
		<cfargument name="SessionScope" required="true" type="struct">
		<cfargument default="#structNew()#" name="ApplicationScope" required="true" type="struct">

		<cfreturn>
	</cffunction>
</cfcomponent>
