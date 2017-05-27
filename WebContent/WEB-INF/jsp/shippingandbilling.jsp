<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>eBazaar - Shipping And Billing Address</title>
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
		<div id="page-wrapper" ng-controller="mainController" layout-padding layout="column" ng-cloak="" ng-app="validationApp">
			<div class="container-fluid">
				<form
					action="${pageContext.servletContext.contextPath}/customer/payment"
					method='post'
					name="billShipAddressForm">
					<div class="row">
						<div class="col-lg-12">
							<h1 class="page-header">Shipping and Billing Addresses</h1>

							<p class="error">${message}</p>
						</div>
						<!-- /.col-lg-12 -->
					</div>
					<div class="col-lg-6">
						<div class="panel panel-primary">
							<div class="panel-heading">Shipping Address</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-12">
										<md-card> 
											<md-card-content>
												<div layout="column">									
													<md-input-container> 
														<label>Street</label>
														<input type="text" value="${shippingAddress.street }" name="shipStreet" ng-model="shipStreet" ng-minlength="1" id="shipStreet" required autofocus onkeyup="checkFields(); return false;">
														<div ng-messages="billShipAddressForm.shipStreet.$error">
															<div ng-message="required">Street is required.</div>
														</div>
													</md-input-container>
												</div>							
											</md-card-content>
											<md-card-content>
												<div layout="column">									
													<md-input-container> 
														<label>City</label>
														<input type="text" value="${shippingAddress.city }" name="shipCity" ng-model="shipCity" ng-minlength="1" id="shipCity" required onkeyup="checkFields(); return false;">
														<div ng-messages="billShipAddressForm.shipCity.$error">
															<div ng-message="required">City is required.</div>
														</div>
													</md-input-container>
												</div>							
											</md-card-content>
											<md-card-content>
												<div layout="column">									
													<md-input-container> 
														<label>State</label>
														<input type="text" value="${shippingAddress.state }" name="shipState" ng-model="shipState" ng-minlength="1" id="shipState" required onkeyup="checkFields(); return false;">
														<div ng-messages="billShipAddressForm.shipState.$error">
															<div ng-message="required">State is required.</div>
														</div>
													</md-input-container>
												</div>							
											</md-card-content>
											<md-card-content>
												<div layout="column">									
													<md-input-container> 
														<label>Zip</label>
														<input type="text" value="${shippingAddress.zip }" name="shipZip" ng-model="shipZip" ng-minlength="5" ng-maxlength="5" id="shipZip" required onkeyup="checkFields(); return false;">
														<div ng-messages="billShipAddressForm.shipZip.$error">
															<div ng-message="required">Zip is required.</div>
															<div ng-message="minlength">Zip should be 5 digits.</div>
															<div ng-message="maxlength">Zip should not exceed 5 digits.</div>
														</div>
													</md-input-container>
												</div>							
											</md-card-content> 
										</md-card>
									</div>
									<!-- /.col-lg-6 (nested) -->
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="panel panel-primary">
							<div class="panel-heading">Billing Address</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-12">
										<md-card> 
											<md-card-content>
												<div layout="column">									
													<md-input-container> 
														<label>Street</label>
														<input type="text" value="${billingAddress.street }" name="billStreet" ng-model="billStreet" ng-minlength="1" id="billStreet" required onkeyup="checkFields(); return false;">
														<div ng-messages="billShipAddressForm.billStreet.$error">
															<div ng-message="required">Street is required.</div>
														</div>
													</md-input-container>
												</div>							
											</md-card-content>
											<md-card-content>
												<div layout="column">									
													<md-input-container> 
														<label>City</label>
														<input type="text" value="${billingAddress.city }" name="billCity" ng-model="billCity" ng-minlength="1" id="billCity" required onkeyup="checkFields(); return false;">
														<div ng-messages="billShipAddressForm.billCity.$error">
															<div ng-message="required">City is required.</div>
														</div>
													</md-input-container>
												</div>							
											</md-card-content>
											<md-card-content>
												<div layout="column">									
													<md-input-container> 
														<label>State</label>
														<input type="text" value="${billingAddress.state }" name="billState" ng-model="billState" ng-minlength="1" id="billState" required onkeyup="checkFields(); return false;">
														<div ng-messages="billShipAddressForm.billState.$error">
															<div ng-message="required">State is required.</div>
														</div>
													</md-input-container>
												</div>							
											</md-card-content>
											<md-card-content>
												<div layout="column">									
													<md-input-container> 
														<label>Zip</label>
														<input type="text" value="${billingAddress.zip }" name="billZip" ng-model="billZip" ng-minlength="5" id="billZip" required onkeyup="checkFields(); return false;">
														<div ng-messages="billShipAddressForm.billZip.$error">
															<div ng-message="required">Zip is required.</div>
															<div ng-message="minlength">Zip should be 5 digits.</div>
														</div>
													</md-input-container>
												</div>							
											</md-card-content> 
										</md-card>
									</div>
									<!-- /.col-lg-6 (nested) -->
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="col-lg-4">
							<div class="checkbox">
								<label> <input id="sameShipBill" type="checkbox"
									name="sameShipBill" value="sameShipBill">Billing Same
									As Shipping
								</label>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="checkbox">
								<label> <input type="checkbox" name="saveShippingAdd"
									value="saveShippingAdd">Save Shipping Address
								</label>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="checkbox">
								<label> <input type="checkbox" name="saveBillingAdd"
									value="saveBillingAdd">Save Billing Address
								</label>
							</div>
						</div>
					</div>
					<div class="col-lg-12"
						style="margin-top: 25px; margin-bottom: 20px;">
						<div class="col-lg-3">
							<button type="button" onclick="window.location.href='${pageContext.servletContext.contextPath}/customer/selectshipaddress'"	class="btn btn-primary" name="submit"
								>Select Shipping</button>
						
						</div>
						<div class="col-lg-3">

							<button type="button"
								onclick="window.location.href='${pageContext.servletContext.contextPath}/customer/selectbilladdress'"
								class="btn btn-primary" name="submit"
								>Select Billing</button>
						</div>
						<div class="col-lg-3">
							<input type="submit" class="btn btn-success" value="Checkout" id="checkout"/>
						</div>
						<div class="col-lg-3">
							<button type="button" onclick="window.location.href='${pageContext.servletContext.contextPath}'"
								class="btn btn-primary ">Back To Home</button>
						</div>
					</div>
				</form>
			</div>
		</div>

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
		var validationApp = angular.module('validationApp', [ 'ngMaterial', 'ngMessages' ]);

		validationApp.controller('mainController', function($scope) {

			$scope.submitted = false;
			$scope.shipStreet = "${shippingAddress.street}";
			$scope.shipCity = "${shippingAddress.city}";
			$scope.shipState = "${shippingAddress.state}";
			$scope.shipZip = "${shippingAddress.zip}";

			$scope.billStreet = "${billingAddress.street}";
			$scope.billCity = "${billingAddress.city}";
			$scope.billState = "${billingAddress.state}";
			$scope.billZip = "${billingAddress.zip}";
		});

		function billingShippingSame(){
			
		}

		function checkFields(){
			var checkoutBttn = document.getElementById("checkout");
			checkoutBttn.disabled = true;
			var status = true;

			var shipStreet = document.getElementById("shipStreet");
			var shipCity = document.getElementById("shipCity");
			var shipState = document.getElementById("shipState");
			var shipZip = document.getElementById("shipZip");

			var billStreet = document.getElementById("billStreet");
			var billCity = document.getElementById("billCity");
			var billState = document.getElementById("billState");
			var billZip = document.getElementById("billZip");

			if(shipStreet.value=="" || shipCity.value=="" || shipState.value=="" || shipZip.value=="" || billStreet.value=="" || 
					billCity.value=="" || billState.value=="" || billZip.value==""){
				status = false;
				checkoutBttn.disabled = true;
			}else{
				status = true;
				checkoutBttn.disabled = false;
			}
			
			return status;
		}
	</script>

</body>
</html>