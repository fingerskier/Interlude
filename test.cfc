<cfcomponent>
	<cffunction access="remote" name="test" returnformat="JSON">
		<cfargument name="data">

		<cfreturn now() & data>
	</cffunction>
</cfcomponent>
