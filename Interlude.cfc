<cfcomponent>
	<cfset this.wschannels = [{ name="interlude", CFClistener = "WS" }]>

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

	<cffunction name="emit">
		<cfargument name="event" required="true" type="string">
		<cfargument name="data" required="false" default="">

		<cfset var CFC = "">
		<cfset var eventArray = application.interlude.event[arguments.event]>
		<cfset var method = "">
		<cfset var result = "">
		<cfset var thisn = "">

		<cfloop array="#eventArray#" index="thisn">
			<cfset method = listLast(thisn, ".")>
			<cfset CFC = listDeleteAt(thisn, listLen(thisn, "."), ".")>
			<cfset CFC = application.interlude.listener[CFC]>
			<cfinvoke component="#CFC#" method="#method#" data="#arguments.data#" result="result">
			<cfif isDefined("result")>
				<cfset publish("data", serializeJSON(result))>
			</cfif>
		</cfloop>
	</cffunction>

	<cffunction name="on">
		<cfargument name="event" required="true" type="string">
		<cfargument name="handler" required="true">

		<cfparam name="application.interlude.event['#arguments.event#']" default="#arrayNew(1)#">

		<cfset arrayAppend(application.interlude.event['#arguments.event#'], arguments.handler)>
	</cffunction>

	<cffunction name="onApplicationStart">
		<cfset application.interlude.debugs = arrayNew(1)>
		<cfset application.interlude.errors = arrayNew(1)>
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

		<cfset application.interlude.listener = structNew()>
		<cfset application.interlude.listener = wireCFCs("#application.path#listeners")>
		<cfset application.interlude.event = structNew()>
		<cfset setupListeners(application.interlude.listener)>
	</cffunction>

	<cffunction name="onApplicationEnd"></cffunction>

	<cffunction name="onError">
		<cfargument name="Exception" required="true">
		<cfargument name="EventName" type="String" required="true">

		<cfdump var="#arguments#">
	</cffunction>

	<cffunction name="onRequestStart">
		<cfif isDefined("URL.restart") and (URL.restart is "goober")>
			<cfset restartApplication()>
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
