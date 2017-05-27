<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>eBazaar - Manage Catalog</title>
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
            name: {
                required: true,
                maxlength: 50,
            },
           
        },
        messages: {
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
						<h1 class="page-header">Manage Catalogs</h1>

						<div class="container">

							<!-- Trigger the modal with a button -->
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#myModal">Add New Catalog</button>

							<!-- Modal -->

							<div class="modal fade" id="myModal" role="dialog">
								<div class="modal-dialog">

									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Add New Catalog</h4>
										</div>
										<div class="modal-body">
											<div>
												<form id="form" method="post"
													action="${pageContext.servletContext.contextPath}/addNewCatalog" >
													<div class="table-responsive">

													<fieldset>
															<div><br></div>
															<!-- Text input-->

															<div class="form-group">
																<label class="col-md-4 control-label">Catalog Name</label>
																<div class="col-md-6  inputGroupContainer">
																	<div class="input-group">
																		<span class="input-group-addon"><i
																			class="glyphicon glyphicon-user"></i></span> <input
																			name="name" id ="name" placeholder="Catalog Name"
																			class="form-control" type="text">
																	</div>
																</div>
															</div>

														</fieldset>
												</div>
												<div><br></div>
												<div class="modal-footer">
												 	 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
													 <button type="submit" class="btn btn-primary" name="login_form_submit" value="AddCatalog">Add Catalog</button>
												</div>
												</form>
											</div>
										</div>

									</div>

								</div>
							</div>


						</div>
						<div class="col-lg-20">
							<br>
						</div>
						<div class="list-group">
							<c:forEach var="catalogPres" items="${catalogs}">

								<div class="col-lg-3 col-md-6">
									<div class="panel panel-primary">
										<div class="panel-heading">
											<div class="row">
												<div class="col-xs-3">
													<i class="fa fa-users fa-5x"></i>
												</div>
												<div class="col-xs-9 text-right">
													<div class="huge">${totalProducts}</div>
													<div>${catalogPres.name}</div>
												</div>
											</div>
										</div>
										<a
											href="${pageContext.request.contextPath}/manageProducts/catalogId/${catalogPres.id }/catalogName/${catalogPres.name }">
											<div class="panel-footer">
												<span class="pull-left">Manage Products</span> <span
													class="pull-right"><i
													class="fa fa-arrow-circle-right"></i></span>
												<div class="clearfix"></div>
											</div>
										</a> <a
											href="${pageContext.request.contextPath}/modifyCatalog/catalogId/${catalogPres.id }/catalogName/${catalogPres.name }">
											<div class="panel-footer">
												<span class="pull-left">Modify Catalog</span> <span
													class="pull-right"><i
													class="fa fa-arrow-circle-right"></i></span>
												<div class="clearfix"></div>
											</div>
										</a> <a
											href="${pageContext.request.contextPath}/deleteCatalog/catalogId/${catalogPres.id }/catalogName/${catalogPres.name }"
											data-toggle="modal"
											data-confirm="Are you sure to delete this catalog ?">
											<div class="panel-footer">
												<span class="pull-left">Delete Catalog</span> <span
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

	<script
		src="${pageContext.request.contextPath}/resources/js/deleteConfirmation.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/dist/js/sb-admin-2.js"></script>

</body>
</html>