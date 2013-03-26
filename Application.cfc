<cfcomponent extends="Interlude">
	<cfset this.customTagPaths = expandPath("./tags")>
	<cfset this.datasource = "test">
	<cfset this.name = "Interlude_0">
	<cfset this.sessionManagement = true>
	
	<cffunction name="environment">
		<cfif findNoCase(".net", CGI.SERVER_NAME)>
			<cfreturn "production">
		<cfelseif findNoCase("local", CGI.SERVER_NAME)>
			<cfreturn "development">
		</cfif>
		
		<cfreturn "unknown">
	</cffunction>
	
	<cffunction name="onApplicationStart">
		<cfset application.path = getDirectoryFromPath(getBaseTemplatePath())>
		<cfset application.path = replace(application.path, "\", "/", "all")>
		
		<cfif CGI.HTTPS is "on">
			<cfset application.URL = "https://">
		<cfelse>
			<cfset application.URL = "http://">
		</cfif>
		<cfset application.URL &= CGI.HTTP_HOST>
		<!--- TRIP-DE-TRIP!!! --->
		<cfset application.URL &= "/Interlude">
		<!--- TRIP-DE-TRIP!!! --->

		<cfswitch expression="#environment()#">
			<cfcase value="production">
		</cfswitch>
	</cffunction>
	
	<cffunction name="onApplicationEnd">
	</cffunction>
	
	<cffunction name="onSessionStart">
	</cffunction>
	
	<cffunction name="onSessionEnd">
	</cffunction>

	<cffunction name="onRequestStart">
		<!--- TODO: Ignored URLs (installation) --->
		<!--- TODO: Admin stuff (application restart, app settings) --->
	</cffunction>
	
	<cffunction name="onRequestEnd">
	</cffunction>
	
	<cffunction name="onError">
		<cfdump var="#arguments#">
	</cffunction>
</cfcomponent>