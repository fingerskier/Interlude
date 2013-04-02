<cfparam name="attributes.path" default="">

<cfoutput>
  <cfif application.development>
    <script src="#application.URL##attributes.path#" type="application/javascript"></script>
  <cfelse>
    <cfinclude template="#attributes.path#">
  </cfif>
</cfoutput>

<cfexit method="exitTag">
