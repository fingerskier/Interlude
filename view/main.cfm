<h1 class="ui-widget-header">Interlude</h1>

<ul class="nav nav-tabs">
  <li ng-class="{{rootStyle(root)}}">
    <a ng-href="{{rootURL('home')}}">{{rootURL('home')}}</xa>
  </li>

  <li ng-class="{{rootStyle(root)}}">
    <a ng-href="{{rootURL('chat')}}">{{rootURL('chat')}}</a>
  </li>

  <li ng-class="{{rootStyle(root)}}">
    <a ng-href="{{rootURL('account')}}">{{rootURL('account')}}</a>
  </li>
</ul>

<ng-switch on="{{root}}">
  <div ng-switch-when="home">
    <cfinclude template="home.cfm">
  </div>
  <div ng-switch-when="chat">
    <cfinclude template="chat.cfm">
  </div>
  <div ng-switch-when="account">
    <cfinclude template="account.cfm">
  </div>
</ng-switch>

{{goober}}
{{$routeParams}}
{{root}}
{{branch}}
{{leaf}}

<pre id="bottomPanel">Interlude v0.1</pre>