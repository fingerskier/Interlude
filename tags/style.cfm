<cfif thisTag.executionMode is "start">
	<style>
<cfelseif thisTag.executionMode is "end">
	</style>
<cfelse>
	<cfoutput>#thisTag.generatedContent#</cfoutput>
</cfif>
