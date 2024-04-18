<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<nav
	class="navbar navbar-expand navbar-light bg-white static-top osahan-nav sticky-top">
	&nbsp;&nbsp;
	<button class="btn btn-link btn-sm text-secondary order-1 order-sm-0"
		id="sidebarToggle">
		<i class="fas fa-bars"></i>
	</button>
	&nbsp;&nbsp; <a
		class="navbar-brand mr-1 d-flex  justify-content-center align-items-center"
		href="index"><img class="img-fluid" alt="" src="img/favicon.png"
		width="50px">
		<p class="m-0">LaughHub</p> </a>
	<!-- Navbar Search -->
	<form
		class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-5 my-2 my-md-0 osahan-navbar-search">
		<div class="input-group">
			<input type="text" class="form-control " placeholder="Tìm kiếm ...">
			<div class="input-group-append">
				<button class="btn btn-light " type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</div>
	</form>
	<!-- Navbar -->
	<ul class="navbar-nav ml-auto ml-md-0 osahan-right-navbar">
		<li class="nav-item mx-1"><a class="nav-link" href="upload.html">
				<i class="fa fa-heart" aria-hidden="true"></i>&nbsp; Yêu thích
		</a></li>
		<li class="nav-item dropdown no-arrow mx-1"><a
			class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <span
				class="badge badge-danger">9+</span>
		</a>
			<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="alertsDropdown">
				<a class="dropdown-item" href="#"><i class="fas fa-fw fa-edit "></i>
					&nbsp; Action</a> <a class="dropdown-item" href="#"><i
					class="fas fa-fw fa-headphones-alt "></i> &nbsp; Another action</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#"><i class="fas fa-fw fa-star "></i>
					&nbsp; Something else here</a>
			</div></li>
		<li class="nav-item dropdown no-arrow mx-1"><a
			class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i> <span
				class="badge badge-success">7</span>
		</a>
			<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="messagesDropdown">
				<a class="dropdown-item" href="#"><i class="fas fa-fw fa-edit "></i>
					&nbsp; Action</a> <a class="dropdown-item" href="#"><i
					class="fas fa-fw fa-headphones-alt "></i> &nbsp; Another action</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#"><i class="fas fa-fw fa-star "></i>
					&nbsp; Something else here</a>
			</div></li>
		<li class="nav-item dropdown no-arrow osahan-right-navbar-user">
			<a class="nav-link dropdown-toggle user-dropdown-link" href="#"
			id="userDropdown" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> <img alt="Avatar"
				src="${avatarPath}"> ${user.fullname !=null ? user.fullname :  'Tài khoản'}
		</a>
			<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="userDropdown">
				<c:choose>
					<c:when test="${not empty user}">
						<a class="dropdown-item" href="info"><i
							class="fas fa-fw fa-user-shield"></i> &nbsp; Tài khoản của tôi</a>
						<a class="dropdown-item" href="changepass"><i
							class="fas fa-fw fa-user-cog"></i> &nbsp; Đổi mật khẩu</a>
					</c:when>
					<c:otherwise>
						<a class="dropdown-item" href="register"><i
							class="fas fa-fw fa-user-plus"></i> &nbsp; Đăng ký</a>
						<a class="dropdown-item" href="login"><i
							class="fas fa-fw fa-user-lock"></i> &nbsp; Đăng Nhập</a>

					</c:otherwise>
				</c:choose>
				<div class="dropdown-divider"></div>

				<a class="dropdown-item" href="forgotpass"><i
					class="fas fa-fw fa-user-edit"></i> &nbsp; Quên mật khẩu</a>
				<c:if test="${not empty user}">
					<a class="dropdown-item" href="#" data-toggle="modal"
						data-target="#logoutModal"><i
						class="fas fa-fw fa-sign-out-alt"></i> &nbsp; Đăng xuất</a>
				</c:if>

				<c:if test="${not empty user and user.admin}">
					<a class="dropdown-item" href="account.html"> <i
						class="fas fa-fw fa-users-cog"></i> &nbsp; Đi đến trang quản trị
					</a>
				</c:if>

			</div>
		</li>
	</ul>
</nav>