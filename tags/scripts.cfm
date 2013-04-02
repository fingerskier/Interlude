<cfparam name="attributes.mode" default="production">

<cfif thisTag.executionMode is "start">
  <cfif attributes.mode is "production">
    <script>
  </cfif>
<cfelseif thisTag.executionMode is "end">
  <cfif attributes.mode is "production">
    </script>
  </cfif>

  <cfexit method="exitTag">
</cfif>
