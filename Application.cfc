<cfcomponent extends="Interlude">
	<cffunction name="onApplicationStart">
		
	</cffunction>
	
	<cffunction name="onApplicationEnd">
	</cffunction>
	
	<cffunction name="onSessionStart">
	</cffunction>
	
	<cffunction name="onSessionEnd">
	</cffunction>
	
	<cffunction name="onRequestStart">
	</cffunction>
	
	<cffunction name="onRequestEnd">
	</cffunction>
	
	<cffunction name="onError">
		<cfdump var="#arguments#">
	</cffunction>
</cfcomponent>