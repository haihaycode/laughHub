<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<fmt:setLocale value="${sessionScope.lang }" scope="request" />
    <fmt:setBundle basename="Info" scope="request" />
<style>
</style>

<div class="container-fluid pb-0">
	<div class="container pl-0 pr-0 ">
		<div class="row no-gutters">
			<div class="col-md-5">
				<div class="login-main">
					<div class="text-center mb-5 login-main-left-header pt-4">

						<h5 class="mt-3 mb-3 fw-bold fs-5">
							<fmt:message key="info.forgotpass_title"/>
							
						</h5>
						<p><fmt:message key="info.forgotpass_detail"/></p>
					</div>
					<form class="mx-1 mx-md-4" name="frmforgotpass">

						<div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0 ">
								<label class="form-label" for="form3Example4c5"><fmt:message key="info.email"/></label>
								<div class="d-flex">
									<input type="email" id="form3Example4c5" class="form-control"
										ng-model="email" name="email" required />
									<button type="button" class="btn btn-primary ms-3"
										ng-click="sendOTP(this)"
										ng-disabled="disableSendOTPButton ||frmforgotpass.email.$error.email || frmforgotpass.email.$error.required">{{
										buttonText == null ? 'OTP' : buttonText }}</button>
								</div>
								<small ng-show="frmforgotpass.email.$error.required"
									class="form-text text-danger"> * <fmt:message key="info.email"/></small> <small
									ng-show="frmforgotpass.email.$error.email"
									class="form-text text-danger"> * <fmt:message key="info.Invalid"/>
									email</small>
							</div>
						</div>

						<div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
								<label class="form-label" name="otp" for="form3Example4c3"><fmt:message key="info.OTP"/></label> <input type="number" id="form3Example4c3"
									ng-model="otp" name="otp" class="form-control" required
									maxlength="6" /> <small
									ng-show="frmforgotpass.otp.$error.required" id="otp"
									class="form-text text-danger"> *<fmt:message key="info.OTP"/></small> <small
									ng-show="frmforgotpass.otp.$error.maxlength" id="password"
									class="form-text text-danger"> * <fmt:message key="info.Invalid"/> Maxlenght = 6</small></small>
							</div>
						</div>



						<div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
								<label class="form-label" name="password" for="form3Example4c3"></label> <input type="password" id="form3Example4c3"
									ng-model="password" name="password" class="form-control"
									required minlength="6" /> <small
									ng-show="frmforgotpass.password.$error.required" id="password"
									class="form-text text-danger"> * <fmt:message key="info.passNew"/></small>
								<small ng-show="frmforgotpass.password.$error.minlength"
									id="password" class="form-text text-danger"> *  <fmt:message key="info.Invalid"/> minlenght = 6</small>
							</div>
						</div>







						<div class="d-flex justify-content-center ">
							<button type="button" class="btn btn-primary  rounded"
								ng-disabled="frmforgotpass.$invalid"
								ng-click="checkOTP($event)">
								<span class="spinner-border d-none"></span> <fmt:message key="info.btn_ChangePass"/>
							</button>

						</div>

					</form>
					<div class="text-center mt-5">
						<p class="light-gray">
							<fmt:message key="info.You_don't_have_an_account_yet"/> <a href="register"><fmt:message key="info.create"/></a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-7">
				<div class="login-main-right ">
					<div class="owl-carousel owl-carousel-login">
							<div class="item">
								<div class="carousel-login-card text-center">
									<img src="img/features-2.png" class="img-fluid" alt="LOGO">

									<h5 class="mt-5 mb-3"><fmt:message key="info.watch_videos_for_free"/></h5>
									<p class="mb-4">"<fmt:message key="info.watch_videos_for_free_1"/>"</p>
								</div>
							</div>
							<div class="item">
								<div class="carousel-login-card text-center">
									<img src="img/features-2.png" class="img-fluid rounded"
										alt="LOGO">
									<h5 class="mt-5 mb-3"><fmt:message key="info.Download_videos_easily"/></h5>
									<p class="mb-4">"<fmt:message key="info.Download_videos_easily_1"/>"</p>
								</div>
							</div>
							<div class="item">
								<div class="carousel-login-card text-center">
									<img src="img/features-3.png" class="img-fluid" alt="LOGO">
									<h5 class="mt-5 mb-3"><fmt:message key="info.Create_an_account_and_watch_videos_one_way_easy"/></h5>
									<p class="mb-4">"<fmt:message key="info.Create_an_account_and_watch_videos_one_way_easy_1"/>"</p>
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>



</div>


