<cfparam name="attributes.path" default="">

<cfoutput>
  <cfif application.development>
    <link rel="stylesheet" href="#application.URL##attributes.path#">
  <cfelse>
    <cfinclude template="#attributes.path#">
  </cfif>
</cfoutput>

<cfexit method="exitTag">
