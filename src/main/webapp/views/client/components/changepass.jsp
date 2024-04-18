<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
	<fmt:setLocale value="${sessionScope.lang }" scope="request" />
    <fmt:setBundle basename="passchange" scope="request" />
    
<style>
.channel-profile-img {
	border: 1px solid red;
}
</style>
<c:choose>
	<c:when test="${not empty user.avatar}">
		<c:set var="avatarPath"
			value="/LaughHub/upload/client/image/${user.avatar}" />
	</c:when>
	<c:otherwise>
		<c:set var="avatarPath"
			value="https://uploads.nhanhoa.com/news/no-avatar.png" />
	</c:otherwise>
</c:choose>
<div class="single-channel-page">
	<div class="single-channel-image">
		<img class="img-fluid" alt="" src="img/bginfo.svg"
			style="height: 360px !important;">
		<div class="channel-profile">
			<img class="channel-profile-img p-1" alt="" src="${avatarPath}">
			<div class="social hidden-xs">
				Social &nbsp; <a class="fb" href="#">${user.fullname !=null ? user.fullname :  ''}</a>
				<a class="tw" href="#">LaughHub</a> <a class="gp" href="#"> Haihaycode</a>
			</div>
		</div>
	</div>
	<jsp:include page="/views/client/partials/single-channel-nav.jsp"></jsp:include>



	<div class="container-fluid pb-0">
		<div class="container pl-0 pr-0 ">
			<div class="row no-gutters">
				<div class="col-md-5">
					<div class="login-main">
						<div class="text-center mb-5 login-main-left-header pt-4">

							<h5 class="mt-3 mb-1 fw-bold fs-5"> <fmt:message key="changePass.title"/> </h5>
							<p><fmt:message key="changePass.title_1"/></p>
						</div>
						<form class="mx-1 mx-md-4" action="" method="post">

							<div class="d-flex flex-row align-items-center mb-4">
								<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
								<div class="form-outline flex-fill mb-0">
									<label class="form-label" for="form3Example3c1"><fmt:message key="changePass.passold"/>*</label><input type="password" name="passwordold"
										class="form-control " />

								</div>
							</div>
							<div class="d-flex flex-row align-items-center mb-4">
								<i class="fas fa-user-lock fa-lg me-3 fa-fw"></i>
								<div class="form-outline flex-fill mb-0">
									<label class="form-label" for="form3Example3c1"><fmt:message key="changePass.passnew"/> *</label><input type="password" name="password"
										class="form-control " />

								</div>
							</div>
							<div class="d-flex flex-row align-items-center mb-4">
								<i class="fas fa-user-lock fa-lg me-3 fa-fw"></i>
								<div class="form-outline flex-fill mb-0">
									<label class="form-label" for="form3Example3c1"><fmt:message key="changePass.repassnew"/> *</label><input type="password" name="repassword"
										class="form-control " />

								</div>
							</div>


							<div class="d-flex justify-content-center ">
								<button type="submit" class="btn btn-primary rounded">
									<fmt:message key="changePass.btnChangePass"/> </button>

							</div>

						</form>

						<div class="text-center mt-5">
							<p class="light-gray">
								<fmt:message key="changePass.are_you_forgotpass"/> <a href="forgotpass"><fmt:message key="changePass.forgotpass"/></a>
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

									<h5 class="mt-5 mb-3"><fmt:message key="changePass.watch_videos_for_free"/></h5>
									<p class="mb-4">"<fmt:message key="changePass.watch_videos_for_free_1"/>"</p>
								</div>
							</div>
							<div class="item">
								<div class="carousel-login-card text-center">
									<img src="img/features-2.png" class="img-fluid rounded"
										alt="LOGO">
									<h5 class="mt-5 mb-3"><fmt:message key="changePass.Download_videos_easily"/></h5>
									<p class="mb-4">"<fmt:message key="changePass.Download_videos_easily_1"/>"</p>
								</div>
							</div>
							<div class="item">
								<div class="carousel-login-card text-center">
									<img src="img/features-3.png" class="img-fluid" alt="LOGO">
									<h5 class="mt-5 mb-3"><fmt:message key="changePass.Create_an_account_and_watch_videos_one_way_easy"/></h5>
									<p class="mb-4">"<fmt:message key="changePass.Create_an_account_and_watch_videos_one_way_easy_1"/>"</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



	</div>






</div>

