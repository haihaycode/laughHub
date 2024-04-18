<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
	<fmt:setLocale value="${sessionScope.lang }" scope="request" />
    <fmt:setBundle basename="Info" scope="request" />
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
				<a class="tw" href="#">LaughHub</a> <a class="gp" href="#">Haihaycode</a>
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

							<h5 class="mt-3 mb-1 fw-bold fs-5"><fmt:message key="info.title"/></h5>
							<p><fmt:message key="info.title1"/></p>
						</div>
						<form class="mx-1 mx-md-4" action="" method="post"
							enctype="multipart/form-data">

							<div class="d-flex flex-row align-items-center mb-4">
								<i class="fas fa-user fa-lg me-3 fa-fw"></i>
								<div class="form-outline flex-fill mb-0">
									<label class="form-label" for="form3Example3c1"><fmt:message key="info.account"/></label><input type="text" name="id" value="${user.id}"
										class="form-control " disabled required />

								</div>
							</div>

							<div class="d-flex flex-row align-items-center mb-4">
								<i class="fas fa-signature fa-lg me-3 fa-fw"></i>
								<div class="form-outline flex-fill mb-0">
									<label class="form-label" for="form3Example3c2"> <fmt:message key="info.fullname"/></label> <input type="text" name="fullname" id="form3Example3c2"
										value="${user.fullname }" class="form-control" minlength="6" />
								</div>
							</div>



							<div class="d-flex flex-row align-items-center mb-4">
								<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
								<div class="form-outline flex-fill mb-0">
									<label class="form-label" for="form3Example4c5"> <fmt:message key="info.email"/></label>
									<input type="email" id="form3Example4c5" value="${user.email }"
										class="form-control" name="email" />
								</div>
							</div>

							<div class="d-flex flex-row align-items-center mb-4">
								<i class="fas fa-image fa-lg me-3 fa-fw"></i>
								<div class="form-outline flex-fill mb-0">
									<label class="form-label" for="imageUpload"><fmt:message key="info.image"/></label> <input
										type="file" id="imageUpload" class="form-control"
										name="imageAccount" accept="image/*"
										onchange="previewImage(event)" />
								</div>
							</div>

							<div class="d-flex justify-content-center mb-4">
								<img id="imagePreview"
									class="img-thumbnail rounded-circle  d-none"
									alt="Preview Image" />
							</div>

							<div class="d-flex justify-content-center ">
								<button type="submit" class="btn btn-primary rounded">
									<fmt:message key="info.btnUpdate"/></button>

							</div>

						</form>

						<div class="text-center mt-5">
							<p class="light-gray">
									<fmt:message key="info.are_you_changePass"/><a href="changepass"><fmt:message key="info.changePass"/></a>
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






</div>

<script type="text/javascript">
	function previewImage(event) {
		var input = event.target;
		var reader = new FileReader();

		reader.onload = function() {
			var img = document.getElementById('imagePreview');
			img.src = reader.result;
			img.classList.remove('d-none'); // Hiển thị ảnh khi đã chọn
		};

		reader.readAsDataURL(input.files[0]);
	}
</script>