<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>eBazaar - Enter Quantity</title>
<meta name="generator" content="Bootply" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
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
	
<link
	href="https://cdn.gitcdn.link/cdn/angular/bower-material/v1.1.0-rc.5/angular-material.css"
	rel="stylesheet" />
</head>
<body>


	<div id="wrapper">
		<jsp:include page="headernav.jsp" />


		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Quantity</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->

				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">Please enter the desired quantity</div>
						<div class="panel-body">
							<c:if test="${not empty message}">
							 <div class="alert alert-danger alert-dismissable">
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
								${message}
							</div>
							</c:if>
							<div class="row">
								<div class="col-lg-12">
									<div ng-controller="mainController" layout-padding layout="column" ng-cloak="" ng-app="validationApp">
										<md-card> 
											<md-card-content>
												<form id="registration_form" name="registration_form" action="${pageContext.servletContext.contextPath}/addQuantity" method="POST" novalidate>
													<div layout="column">									
														<md-input-container> 
															<label>Quantity</label>
															<input type="text" name="quantity" ng-model="product.quantity" minlength="1" id="quantity" required autofocus onkeyup="checkFields(); return false;">
															<div ng-messages="registration_form.quantity.$error">
																<div ng-message="required">Quantity is required.</div>
															</div>
														</md-input-container>
													</div>
													<div class="form-group">
														<input type="submit" class="btn btn-lg btn-primary btn-block" id="submit" value="Submit">
													</div>								
												</form>
											</md-card-content> 
										</md-card>
									</div>
								</div>
								<!-- /.col-lg-6 (nested) -->
							</div>
						</div>

					</div>
				</div>
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
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-messages.min.js"></script>
	<script
		src="https://cdn.gitcdn.link/cdn/angular/bower-material/v1.1.0-rc.5/angular-material.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-animate.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-aria.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-route.min.js"></script>
	
	<script>
		var submitBttn = document.getElementById('submit');
		submitBttn.disabled = true;
		
		function checkFields(){

			var status = true;

			var quantityText = document.getElementById('quantity');
			

			if (quantityText.value == "") {
				status = false;
				submitBttn.disabled = true;
			}else{
				status = true;
				submitBttn.disabled = false;
			}
			return status;
		}
		var validationApp = angular.module('validationApp', [ 'ngMaterial', 'ngMessages' ]);

		validationApp.controller('mainController', function($scope) {

			$scope.submitted = false;
		});
	</script>

</body>
</html>