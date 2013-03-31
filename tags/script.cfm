<!DOCTYPE html>
<html ng-app="app">
  <head>
    <meta charset="utf8">
    <base href="/">
    <title>Interlude</title>
    <link rel="shortcut icon" href="favicon.ico">
    <cf_style>
      <cfinclude template="lib/jquery/css/jquery-ui.css"></cfinclude>
      <cfinclude template="lib/bootstrap/css/bootstrap.css"></cfinclude>
      <cfinclude template="lib/bootstrap/css/bootstrap-responsive.css"></cfinclude>
      <cfinclude template="lib/main.css"></cfinclude>
    </cf_style>
    <cf_script>
      <cfinclude template="lib/jquery/js/jquery.js"></cfinclude>
      <cfinclude template="lib/jquery/js/jquery-ui.js"></cfinclude>
      <cfinclude template="lib/bootstrap/js/bootstrap.js"></cfinclude>
      <cfinclude template="lib/angular/angular.js"></cfinclude>
      <cfinclude template="lib/angular/angular-bootstrap.js"></cfinclude>
      <cfinclude template="lib/angular/angular-ui.js"></cfinclude>
      <cfinclude template="js/services.js"></cfinclude>
      <cfinclude template="js/filters.js"></cfinclude>
      <cfinclude template="js/directives.js"></cfinclude>
      <cfinclude template="js/controllers.js"></cfinclude>
      <cfinclude template="js/application.js"></cfinclude>
    </cf_script>
  </head>
  <body>
    <cfwebsocket name="WS" onMessage="WSmsg"></cfwebsocket>
    <h1 class="ui-widget-header">Interlude</h1>
    <div ng-controller="AppCtrl">
      <pre id="bottomPanel">Interlude v0.1</pre>
    </div>
  </body>
</html>