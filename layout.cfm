<cfif thisTag.ExecutionMode is "start">
	<cfwebsocket name="WSchat" onmessage="ws_msg_handler">

	<!DOCTYPE html>
	<html>
		<head>
			<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
			<link href="css/jquery-ui.css" rel="stylesheet" type="text/css">
			<link href="css/qunit.css" rel="stylesheet" type="text/css">

			<link href="css/application.css" rel="stylesheet" type="text/css">

			<script language="javascript" src="js/jquery.js" type="text/javascript">
			<script language="javascript" src="js/jquery-ui.js" type="text/javascript">
			<script language="javascript" src="js/bootstrap.js" type="text/javascript">
			<script language="javascript" src="js/qunit.js" type="text/javascript">
			<script language="javascript" src="js/angular.js" type="text/javascript">

			<script language="javascript" src="js/application.js" type="text/javascript">
			<script language="javascript" src="js/services.js" type="text/javascript">
			<script language="javascript" src="js/directives.js" type="text/javascript">
			<script language="javascript" src="js/filters.js" type="text/javascript">
			<script language="javascript" src="js/controllers.js" type="text/javascript">
		</head>

		<body class="ui-widget-content">
<cfelseif thisTag.ExecutionMode is "end">
		</body>
	</html>

	<cfexit method="exittag">
<cfelse>
	<cfoutput>#thisTag.GeneratedContent#</cfoutput>
</cfif>