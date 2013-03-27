<cfcomponent extends="Interlude">
	<cfset this.customTagPaths = expandPath("./tags")>
	<cfset this.datasource = "test">
	<cfset this.name = "Interlude_0">
	<cfset this.sessionManagement = true>
	<cfset this.wschannels = [{
		name="chat",
		CFClistener = "channel.chat"
	},{
		name="news",
		CFClistener = "channel.news"
	}]>

	<cffunction name="environment">
		<cfif findNoCase(".net", CGI.SERVER_NAME)>
			<cfreturn "production">
		<cfelseif findNoCase("local", CGI.SERVER_NAME)>
			<cfreturn "development">
		</cfif>

		<cfreturn "unknown">
	</cffunction>

	<cffunction name="wireCFCs">
		<cfargument name="path" required="true" type="string">

		<cfset var comDirs = "">
		<cfset var result = structNew()>
		<cfset var subPath = "">
		<cfset var thisName = "">
		<cfset subPath = replacenocase(arguments.path, application.path, '')>
		<cfset subPath = replace(subPath, '/', '.', 'all')>
		<cfset subPath = replacenocase(subPath, '.cfc', '')>

		<cfif arguments.path contains '.cfc'>
			<cfobject component="#subPath#" name="result" type="component">
		<cfelse>
			<cfdirectory action="list" directory="#arguments.path#" name="comDirs" recurse="false">
			<cfloop query="#comDirs#">
				<cfset thisName = name>
				<cfif right(name, 4) is '.cfc'>
					<cfset thisName = left(name, len(name)-4)>
				</cfif>
				<cfset result[thisName] = wireCFCs(directory & "/" & name)>
			</cfloop>
		</cfif>

		<cfreturn result>
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
			<cfcase value="development">
			</cfcase>
			<cfcase value="production">
			</cfcase>
		</cfswitch>

		<cfset application.com = structNew()>
		<cfset application.com.appRequest = wireCFCs("#application.path#com/appRequest")>
		<cfset application.com.appSession = wireCFCs("#application.path#com/appSession")>
		<cfset application.com.controllers = wireCFCs("#application.path#com/controllers")>
		<cfset application.com.services = wireCFCs("#application.path#com/services")>
	</cffunction>

	<cffunction name="onApplicationEnd">
	</cffunction>

	<cffunction name="onError">
		<cfargument name="Exception" required="true">
	    <cfargument name="EventName" type="String" required="true">

		<cfdump var="#arguments#">
	</cffunction>

	<cffunction name="onRequestStart">
		<cfset var CFC = "">

		<cfset request = wireCFCs("#application.path#com/request")>

		<cfloop collection="#application.com.appRequest#" item="CFC">
			<cfif isDefined("CFC.before") and isCustomfunction(CFC.before)>
				<cfinvoke component="#CFC#" method="before" requestScope="#request#">
			</cfif>
		</cfloop>
		<!--- TODO: Ignored URLs (installation) --->
		<!--- TODO: Admin stuff (application restart, app settings) --->
		<cfif isDefined("URL.restart") and (URL.restart is "goober")>
			<cfset applicationstop()>
		</cfif>
	</cffunction>

	<cffunction name="onRequestEnd">
		<cfdump var="#session#">
		<cfdump var="#request#">

		<cfloop collection="#application.com.appRequest#" item="CFC">
			<cfif isDefined("CFC.after") and isCustomfunction(CFC.after)>
				<cfinvoke component="#CFC#" method="after" requestScope="#request#">
			</cfif>
		</cfloop>
	</cffunction>

	<cffunction name="onSessionStart">
		<cfset var CFC = "">

		<cfset session = wireCFCs("#application.path#com/session")>

		<cfloop collection="#application.com.appSession#" item="CFC">
			<cfif isDefined("CFC.before") and isCustomfunction(CFC.before)>
				<cfinvoke component="#CFC#" method="before" sessionScope="#session#">
			</cfif>
		</cfloop>
	</cffunction>

	<cffunction name="onSessionEnd">
		<cfargument name="SessionScope" required="true">
	    <cfargument name="ApplicationScope" required="false">

		<cfset var CFC = "">

		<cfloop collection="#application.com.appSession#" item="CFC">
			<cfif isDefined("CFC.after") and isCustomfunction(CFC.after)>
				<cfinvoke component="#CFC#" method="after" sessionScope="#sessionScope#">
			</cfif>
		</cfloop>

	</cffunction>
</cfcomponent>