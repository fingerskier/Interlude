<cfcomponent output="false">
	<cfset this.logUnhandledEvents = false>
	<cfset this.rebuildPerRequest = true>
	
	<cffunction name="emit">
	</cffunction>
	
	<cffunction name="ignore">
	</cffunction>
	
	<cffunction name="on">
	</cffunction>
	
	<cffunction name="onApplicationStart">
		<cfset registerComponents()>
	</cffunction>
</cfcomponent>