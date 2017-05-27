<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>eBazaar - Manage Product</title>
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
        	productname: {
        		required: true,
                maxlength: 50
            },
            mfgdate: {
                required: true,
                australianDate : true
            },
            totalquantity: {
            	required: true,
            	number: true,
            	maxlength: 10
            },
            price: {
            	required: true,
            	number: true
            },
            description: {
        		required: true
            }
        },
        messages: {
        	productname: {
        		  required: "Please enter Product Name",              
                  maxlength: "Catalog Name should be less than 50 characters"
            },
            mfgdate: {
                required: "Please enter Manufacture Date",                             
            },    
            totalquantity: {
            	 required: "Please enter Available Quantity",
            	 number: "Available Quantity should contain only number",
            	 maxlength: "Available Quantity should be less than 10 characters"
            },
            price: {
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
						<h1 class="page-header">Manage Products for "${catalog.name}"</h1>
						<div class="container">

							<!-- Trigger the modal with a button -->
							<button type="button" class="btn btn-danger" data-toggle="modal"
								data-target="#myModal">Add New Product Modal</button>

							<!-- Modal -->
								<div class="modal fade" id="myModal" role="dialog">
									<div class="modal-dialog">

										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h4 class="modal-title">Add New Product</h4>
											</div>
										<div class="modal-body">
											<form id="form" method="post"
												action="${pageContext.servletContext.contextPath}/addNewProduct">
												<div class="table-responsive">
													<table
														class="table table-striped table-bordered table-hover">
														<tr>
															<td><label>Catalog Name</label></td>
															<td><input type="text" class="form-control"
																name="catname" id="catname" value="${catalog.name}" readonly></td>
														</tr>
														<tr>
															<td><label>Product Name</label></td>
															<td><input type="text" class="form-control"
																name="productname" id="productname"></td>
														</tr>
														<tr>
															<td><label>Manufacture Date</label></td>
															<td><input type="text" class="form-control"
																name="mfgdate" id="mfgdate"></td>
														</tr>
														<tr>
															<td><label>Number Items In Stock</label></td>
															<td><input type="text" class="form-control"
																name="totalquantity" id="totalquantity"></td>
														</tr>
														<tr>
															<td><label>Unit Price</label></td>
															<td><input type="text" class="form-control"
																name="price" id="price"></td>
														</tr>
														<tr>
															<td><label>Description</label></td>
															<td><input type="text" class="form-control"
																name="description" id="description"></td>
														</tr>
													</table>
												</div>
												<div class="modal-footer">
													<input type="submit" class="btn btn-danger"
														value="Add Product">
													<input type="hidden" name="catid" id="catid"
													value="${catalog.id }">
												</div>
											</form>
										</div>
									</div>

									</div>
								</div>
							

						</div>
						<div class="col-lg-20">
							<br>
						</div>
						<div class="list-group">
							<c:forEach var="productPres" items="${products}">

								<div class="col-lg-3 col-md-6">
									<div class="panel panel-red">
										<div class="panel-heading">
											<div class="row">
												<div class="col-xs-3">
													<i class="fa fa-users fa-5x"></i>
												</div>
												<div class="col-xs-9 text-right">
													<div class="huge">${totalQuantity}</div>
													<div>${productPres.name }</div>
												</div>
											</div>
										</div>
										<a
											href="${pageContext.servletContext.contextPath}/viewProduct?id=${productPres.id }&catname=${catalog.name }&catid=${catalog.id }">
											<div class="panel-footer">
												<span class="pull-left">Modify Product</span> <span
													class="pull-right"><i
													class="fa fa-arrow-circle-right"></i></span>
												<div class="clearfix"></div>
											</div>
										</a> <a
											href="${pageContext.servletContext.contextPath}/deleteProduct/id/${productPres.id }/catid/${catalog.id }/catname/${catalog.name}"
											data-toggle="modal" data-confirm="Are you sure to delete this product ?">
											<div class="panel-footer">
												<span class="pull-left">Delete Product</span> <span
													class="pull-right"><i
													class="fa fa-arrow-circle-right"></i></span>
												<div class="clearfix"></div>
											</div>
										</a>
									</div>
								</div>

							</c:forEach>
						</div>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->

	</div>

	<jsp:include page="footernav.jsp" />
	
	<!-- delete confirmation -->
	<script
		src="${pageContext.request.contextPath}/resources/js/deleteConfirmation.js"></script>
	
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