<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>eBazaar - Modify Catalog</title>
<meta name="generator" content="Bootply" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
	
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.js"></script>
<script
	src="http://ajax.microsoft.com/ajax/jquery.validate/1.7/additional-methods.js"></script>

<script type="text/javascript">
jQuery(function ($) {
    $('#form').validate({
        rules: {
            id: {
                required: true,
                maxlength: 5,
                number: true
            },
            name: {
                required: true,
                maxlength: 50,
            },
           
        },
        messages: {
            id: {
                required: "Please enter Catalog ID",
                maxlength: "Catalog ID should be less than 5 characters",
                number: "Catlog ID should contain only number"
            },
            name: {
                required: "Please enter catalog name",              
                maxlength: "Catalog Name should be less than 50 characters"
               
            },           
        },
    });
});
</script>	
	
<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
</head>
<body>


	<div id="wrapper">
		<jsp:include page="headernav.jsp" />


		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Catalog Detail: ${catalogName }</h1>
						<form id="form" method="post" action="${pageContext.servletContext.contextPath}/modifyCatalog">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover">
								<tr>
									<td><label>Catalog ID</label></td>
									<td><input type="text" class="form-control" name="id" id="id" value ="${catalogId }" readonly></td>
								</tr>
								<tr>
									<td><label>Catalog Name</label></td>
									<td><input type="text" class="form-control" name="name" id="name" value= "${catalogName }" ></td>
								</tr>
							</table>
						</div>

							<input type="submit" class="btn btn-primary" value="Modify Catalog">
							<button type="button"
								onclick="window.location.href='${pageContext.servletContext.contextPath}/listCatalogs'"  class="btn btn-primary" name="submit">Previous Screen</button>
						</form>
						<div class="alert alert-success" role="alert">${successMessage }</div>

					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>

	<jsp:include page="footernav.jsp" />
	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/dist/js/sb-admin-2.js"></script>

</body>
</html>