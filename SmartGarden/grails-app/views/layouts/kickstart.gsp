<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport"		content="width=device-width, initial-scale=1.0">
    <meta name="description"	content="">
    <meta name="author"			content="">
    
	<title><g:layoutTitle default="${meta(name:'app.name')}" /></title>
	<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
	
	<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	
	<link rel="stylesheet" href="${resource(dir:'bootstrap/css',file:'bootstrap.css')}" />
	<link rel="stylesheet" href="${resource(dir:'bootstrap/css',file:'bootstrap-responsive.css')}" />
	<link rel="stylesheet" href="${resource(dir:'kickstart/css',file:'docs.css')}" />
	<link rel="stylesheet" href="${resource(dir:'kickstart/css',file:'kickstart.css')}" />

    <link rel="apple-touch-icon" href="assets/ico/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="assets/ico/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="assets/ico/apple-touch-icon-114x114.png">
    
    <g:layoutHead />
	
    <!-- Note: Place at the end of the document to load faster -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="${resource(dir:'bootstrap/js',file:'bootstrap.js')}"></script>
    <script src="${resource(dir:'kickstart/js',file:'kickstart.js')}"></script>
	<g:javascript library="application" />
	<r:layoutResources />
</head>

<body>
	<div id="Navbar" class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<!-- .btn-navbar is used as the toggle for collapsed navbar content -->
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
	            	<span class="icon-bar"></span>
	            	<span class="icon-bar"></span>
				</a>

				<a class="brand" href="${createLink(uri: '/')}">
					<img class="logo" src="${resource(dir:'kickstart/img',file:'grails.png')}" alt="${meta(name:'app.name')}" height="25" border="0" />
					${meta(name:'app.name')}
					<small> v${meta(name:'app.version')}</small>
				</a>

          		<div class="nav-collapse">
          			<ul class="nav">
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">Garden Stuff<b class="caret"></b></a>
							<ul class="dropdown-menu">
			                    <li class="controller"><g:link controller="location">Locations</g:link></li>
			                    <li class="controller"><g:link controller="garden">Gardens</g:link></li>
			                    <li class="controller"><g:link controller="weatherInfo">Weather Info</g:link></li>
							</ul>
						</li>
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">User Stuff<b class="caret"></b></a>
							<ul class="dropdown-menu">
			                    <li class="controller"><g:link controller="user">Manage Users</g:link></li>
			                    <li class="controller"><g:link controller="register">Register</g:link></li>
							</ul>
						</li>
						<g:render template="/menu/language"/>														
						<g:render template="/menu/info"/>	
					</ul>
					
					<form class="navbar-search pull-left" action="/SmartGarden/searchable" method="get" id="searchableForm" name="searchableForm">
  						<input type="text" name="q" class="search-query" placeholder="Search">
					</form>
				
					<div class="pull-right">
						<ul class="nav">
							<sec:ifLoggedIn>
         						<p class="navbar-text pull-right">Logged in as <sec:username/> (<g:link controller='logout'>Logout</g:link>)</p>
      						</sec:ifLoggedIn>
      						<sec:ifNotLoggedIn>
         						<g:link controller="login">Login</g:link>
      						</sec:ifNotLoggedIn>
						</ul>													
					</div>
				</div>
				
			</div>
		</div>
	</div>

	<g:if test="${ pageProperty(name:'page.header') }">
   		<g:pageProperty name="page.header" />
	</g:if>
	<g:else>
		<header id="Header" class="jumbotron masthead">
			<div class="inner">
				<div class="container">
					<h1 class="title"><g:layoutTitle default="${meta(name:'app.name')}" /></h1>
				</div>
			</div>
		</header>
	</g:else>

	<div id="Content" class="container">
		<%-- Only show the "Pills" navigation menu if a controller exists (but not for home) --%>
		<g:if test="${	params.controller != null
					&&	params.controller != ''
					&&	params.controller != 'home'
		}">
			<ul id="Menu" class="nav nav-pills">
		        <g:set var="entityName" value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />
		        <%-- Set which "pill" of the menu is active --%>
				<li class="${ params.action == "list" ? 'active' : '' }">
					<g:link action="list"><g:message code="default.list.label" args="[entityName]"/></g:link>
				</li>
				<li class="${ params.action == "create" ? 'active' : '' }">
					<g:link action="create"><g:message code="default.new.label"  args="[entityName]"/></g:link>
				</li>
			</ul>
        </g:if>
                        
        <g:if test="${flash.message}">
            <div class="alert alert-info">${flash.message}</div>
        </g:if>
            
		<g:layoutBody />
        <g:pageProperty name="page.body" />
	</div>

	<g:if test="${ pageProperty(name:'page.footer') }">
	    <g:pageProperty name="page.footer" />
	</g:if>
	<g:else>
		<footer id="Footer">
		</footer>
	</g:else>
		
    <r:layoutResources />
</body>

</html>