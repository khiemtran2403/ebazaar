<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>eBazaar - Login</title>
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
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Please Sign In</h3>
					</div>
					<div class="panel-body">
						<c:if test="${not empty error}">
							<div class="alert alert-danger fade in">
								<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
								<strong>${error}</strong>
							</div>
						</c:if>

					<!-- implementing angularjs material design form validation -->
						<div ng-controller="mainController" layout-padding layout="column" ng-cloak="" ng-app="validationApp">
							<md-card> 
								<md-card-content>
									<form id="loginForm" name="loginForm" action="processLogin" method="POST" novalidate>
										<div layout="column">									
											<md-input-container> 
												<label>Username</label>
												<input type="text" name="id" ng-model="user.username" minlength="1" maxlength="8" id="id" required autofocus onkeyup="checkAllFields(); return false;">
												<div ng-messages="loginForm.id.$error">
													<div ng-message="required">Username is required.</div>
													<div ng-message="minlength">Username is too short.</div>
													<div ng-message="maxlength">Username is too long.</div>
												</div>
											</md-input-container>
											<md-input-container> 
												<label>Password</label>
												<input type="password" id="password" name="password" ng-model="user.password" required onkeyup="checkAllFields(); return false;">
												<div ng-messages="loginForm.password.$error">										
													<div ng-message="required">Password is required.</div>
												</div>
											</md-input-container>
										</div>
										<div class="form-group">
											<input type="submit" class="btn btn-lg btn-primary btn-block" id="submit" value="Sign in">
										</div>								
									</form>
								</md-card-content> 
							</md-card>
						</div>
					<!-- End of Material Design form -->
				</div>
			</div>
		</div>
	</div>
	</div>
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
		
		function checkAllFields(){

			var status = true;

			var username = document.getElementById('id');
			var password = document.getElementById('password');

			if (username.value == "" || password.value == "") {
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