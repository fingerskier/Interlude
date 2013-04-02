<cfcomponent extends="Interlude">
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

	<cffunction name="onError" returntype="void">
		<cfargument name="exception" required="true" type="any">
		<cfargument name="eventName" required="true" type="string">

		<cfdump var="#arguments#">

		<cfreturn>
	</cffunction>

	<cffunction name="setupListeners">
	</cffunction>
</cfcomponent>
