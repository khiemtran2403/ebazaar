<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>eBazaar - Modify Product</title>
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

jQuery.validator.addMethod( "australianDate",
	    function(value, element) {
    return value.match(/^\d\d?\/\d\d?\/\d\d\d\d$/);
},
"Please enter a date in the format mm/dd/yyyy."
);
jQuery(function ($) {
    $('#form').validate({
        rules: {
        	name: {
        		required: true,
                maxlength: 50
            },
            mfg: {
            	required: true,
                australianDate : true
            },
            quantityavail: {
            	required: true,
            	number: true,
            	maxlength: 10
            },
            unitprice: {
            	required: true,
            	number: true
            },
            description: {
        		required: true
            }
        },
        messages: {
        	name: {
        		  required: "Please enter Product Name",              
                  maxlength: "Catalog Name should be less than 50 characters"
            },
            mfg: {
                required: "Please enter Manufacture Date",                             
            },    
            quantityavail: {
            	 required: "Please enter Available Quantity",
            	 number: "Available Quantity should contain only number",
            	 maxlength: "Available Quantity should be less than 10 characters"
            },
            unitprice: {
           	 required: "Please enter Unit Price",
           	 number: "Unit Price should contain only number",
           },
           description: {
        	   required: "Please enter Description for Product",
           }
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
						<h1 class="page-header">Product Detail for ${product.name }</h1>
						<form id="form" method="post" action="${pageContext.servletContext.contextPath}/modifyProduct">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover">
								<tr>
									<td><label>Product Name</label></td>
									<td><input type="text" class="form-control" name="name" id="name" value ="${product.name }"></td>
								</tr>
								<tr>
									<td><label>Manufacture Date</label></td>
									<td><input type="text" class="form-control" name="mfg" id="mfg" value="${product.mfg }"></td>
								</tr>
								<tr>
									<td><label>Number Items In Stock</label></td>
									<td><input type="text" class="form-control" name="quantityavail" id="quantityavail" value="${product.quantityAvail }"></td>
								</tr>
								<tr>
									<td><label>Unit Price</label></td>
									<td><input type="text" class="form-control" name="unitprice" id="unitprice" value="${product.unitPrice }"></td>
								</tr>
								<tr>
									<td><label>Description</label></td>
									<td><input type="text" class="form-control" name="description" id="description" value="${product.description }"></td>
								</tr>
							</table>
						</div>

							<input type="submit" class="btn btn-primary" value="Modify Product">
							<button type="button"
								onclick="window.location.href='${pageContext.request.contextPath}/manageProducts/catalogId/${catid }/catalogName/${catname }'"  class="btn btn-primary" name="submit">Previous Screen</button>
							<input type="hidden" name="id" id="id" value="${product.id }" />
							<input type="hidden" name="catname" id="catname" value="${catname }" />
							<input type="hidden" name="catid" id="catid" value="${catid }" />
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