<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<script type='text/javascript'
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-1.11.1.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/resources/js/menu_jquery.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/resources/js/simpleCart.min.js">
	
</script>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation"
	style="margin-bottom: 0; margin-top: 30px;">

	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#"><img alt=""
			src="${pageContext.request.contextPath}/resources/bootstrap/img/logo_final.png"
			class="img-responsive" style="margin-top: -40px; height: 75px;"></a>
			<a class="navbar-brand">Welcome To eBazaar - An Online Shopping Portal</a>
	</div>

	<ul class="nav navbar-top-links navbar-right">		
		<sec:authorize ifNotGranted="ADMIN, CUSTOMER">
			<li><a href="${pageContext.servletContext.contextPath}/login"><i
					class="glyphicon glyphicon-log-in fa-fw"></i>&nbsp; Login</a></li>
		</sec:authorize>
		
		<sec:authorize ifAnyGranted="ADMIN, CUSTOMER">
			<li><a href="${pageContext.servletContext.contextPath}/processLogout"><i
					class="fa fa-sign-out fa-fw"></i>Logout</a></li>
		</sec:authorize>		

		<!-- /.dropdown -->
	</ul>
	<!-- /.navbar-top-links -->

	<!-- anish -->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li class="sidebar-search">
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" placeholder="Search...">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div> <!-- /input-group -->
				</li>
				<li><a href="${pageContext.servletContext.contextPath}"><i
						class="fa fa-search fa-fw"></i> Browse Catalogs</a></li>

				<li><a
					href="${pageContext.servletContext.contextPath}/customer/viewPastOrder"><i
						class="glyphicon glyphicon-book"></i> Order History</a></li>
				<li><a
					href="${pageContext.servletContext.contextPath}/customer/retrievesavedcart"><i
						class="fa  fa-shopping-cart fa-fw"></i> Retrieve Saved Cart</a></li>										
				
				<sec:authorize access="hasRole('ADMIN')">
					<li><a href="#"><i class="glyphicon glyphicon-tasks"></i>
							Manage<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
						<%--<li><a href="${pageContext.servletContext.contextPath}/listProducts">Products</a></li>--%>	
							<li><a href="${pageContext.servletContext.contextPath}/listCatalogs">Catalogs/Products</a></li>
						</ul> <!-- /.nav-second-level -->
					</li>
				</sec:authorize>

			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
</nav>