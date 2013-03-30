<cfcomponent>
	<cfset this.customTagPaths = "tags">
	<cfset this.datasource = "AD">
	<cfset this.debugipaddress = "127.0.0.1">
	<cfset this.enablerobustexception = false>
	<cfset this.loginStorage = "session">
	<cfset this.name = "Interlude_0">
	<cfset this.ormenabled = true>
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
		
		<cfreturn>
	</cffunction>

	<cffunction name="onMissingTemplate" returntype="boolean">
		<cfargument name="targetPage" required="true">

		<div class="ui-state-error">#arguments.targetPage# is no viewy</div>
		
		<cfreturn true>
	</cffunction>
	
	<cffunction name="onRequestStart" returntype="boolean">
		<cfargument name="targetPage" required="true">
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
