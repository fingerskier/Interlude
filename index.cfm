<cfprocessingdirective suppressWhiteSpace="true">
  <cfdirectory action="list" directory="css" filter="*.css" name="styleFiles" recurse="true" type="file">
  <cfdirectory action="list" directory="js" filter="*.js" name="scriptFiles" recurse="true" type="file">

  <cfoutput>
    <!DOCTYPE html>
    <html ng-app="app">
      <head>
        <meta charset="utf8">
        <base href="/">
        <title>Interlude</title>
        <link rel="shortcut icon" href="favicon.ico">
        <cfif not application.development>
          <style>
        </cfif>
          <cf_stylesheet path="lib/jquery/css/jquery-ui.css"> 
          <cf_stylesheet path="lib/bootstrap/css/bootstrap.css"> 
          <cf_stylesheet path="lib/bootstrap/css/bootstrap-responsive.css"> 
          <cf_stylesheet path="main.css"> 
        <cfif application.development>
          </style>
        </cfif>

        <cfif not application.development>
          <script type="application/javascript">
        </cfif>
          <cf_script path="lib/jquery/js/jquery.js">
          <cf_script path="lib/jquery/js/jquery-ui.js">
          <cf_script path="lib/bootstrap/js/bootstrap.js">
          <cf_script path="lib/angular/angular.js">
          <cf_script path="lib/angular/angular-ui.js">
          <cf_script path="lib/angular/angular-ui-bootstrap.js">
          <cf_script path="lib/angular/angular-ui-ieshiv.js">
          <cf_script path="js/application.js">
          <cf_script path="js/services.js">
          <cf_script path="js/controllers.js">
          <cf_script path="js/directives.js">
          <cf_script path="js/filters.js">
        <cfif application.development>
          </script>
        </cfif>
        
        <cfwebsocket name="WS" onMessage="WSmsg"></cfwebsocket>
      </head>

      <body ng-controller="InterludeController">
        <cfinclude template="view/main.cfm">
      </body>
    </html>
  </cfoutput>
</cfprocessingdirective>