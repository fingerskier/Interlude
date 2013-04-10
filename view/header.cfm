<div class="navbar">
	<div class="navbar-inner">
		<div class="container">
			<a class="brand info" href="#">Interlude</a>
			<ul class="nav">
				<li><a ng-href="{{rootURL('')}}">Home</a></li>
				<li><a ng-href="{{rootURL('account')}}">Account</a></li>
				<li><a ng-href="{{rootURL('chat')}}">Chat</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
					<ul class="dropdown-menu">
					<li><a href="#">Action</a></li>
					<li><a href="#">Another action</a></li>
					<li><a href="#">Something else here</a></li>
					<li class="divider"></li>
					<li class="nav-header">Nav header</li>
					<li><a href="#">Separated link</a></li>
					<li><a href="#">One more separated link</a></li>
					</ul>
				</li>
			</ul>
			<form class="navbar-search pull-right" action="">
				<input type="text" class="search-query span2" placeholder="Search">
			</form>
		</div>
		<div class="container">
			<ul class="breadcrumb">
			<li>
				<a href="{{rootURL(root)}}">{{root}}</a> <span class="divider">/</span>
			</li>
			<li><a href="{{branchURL(branch)}}">{{branch}}</a> <span class="divider">/</span></li>
			<li><a href="{{leafURL(leaf)}}">{{leaf}}</a> <span class="divider">/</span></li>
			</ul>
		</div>
	</div>
</div>
