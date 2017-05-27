<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<link
	href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.css"
	rel='stylesheet' type='text/css' />
<!-- jQuery (necessary JavaScript plugins) -->
<script type='text/javascript'
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-1.11.1.min.js"></script>
<!-- Custom Theme files -->
<link
	href="${pageContext.servletContext.contextPath}/resources/css/style.css"
	rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript">
	
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    

</script>
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Playfair+Display:400,700,900'
	rel='stylesheet' type='text/css'>
<!-- start menu -->
<link
	href="${pageContext.servletContext.contextPath}/resources/css/megamenu.css"
	rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/megamenu.js"></script>
<script>
	$(document).ready(function() {
		$(".megamenu").megamenu();
	});
</script>
<script
	src="${pageContext.servletContext.contextPath}/resources/js/menu_jquery.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/resources/js/simpleCart.min.js">
	
</script>
</head>

<body>
	<div class="header_bg">
		<div class="container">
			<div class="header">
				<div class="head-t">
					<div class="logo">
						<a href="index.html"><img
							src="${pageContext.servletContext.contextPath}/resources/images/logo_final.png"
							class="img-responsive" alt="" /> </a>
					</div>
					<!-- start header_right -->
					<div class="header_right">
						<div class="rgt-bottom">
							<div class="right_btn">
								<a href="#"><span>LOGIN</span></a> <a href="#"><span>LOGOUT</span></a>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
				<!-- start header menu -->
				<ul class="megamenu skyblue">
					<li class="active grid"><a class="color1" href="#">Browse Catalogs</a></li>
					<li class="grid"><a class="color2" href="#">Order History</a></li>
					<li class="grid"><a class="color2" href="#">Retrieve Saved Cart</a></li>
					<li class="grid"><a class="color2" href="#">Maintain Catalogs</a></li>
					<li class="grid"><a class="color2" href="#">Maintain Products</a></li>
				</ul>
			</div>
		</div>
	</div>