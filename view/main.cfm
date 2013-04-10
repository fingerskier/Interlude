<div ng-cloak>
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

  {{root}}
  {{branch}}
  {{leaf}}

  <pre id="bottomPanel">Interlude v0.1</pre>
</div>