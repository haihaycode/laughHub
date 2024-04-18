<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
	<fmt:setLocale value="${sessionScope.lang }" scope="request" />
    <fmt:setBundle basename="admin" scope="request" />
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
		href="${pageContext.request.contextPath}/admin"><img class="img-fluid" alt=""
		src="${pageContext.request.contextPath}/img/favicon.png" width="50px">
		<p class="m-0">LaughHub - <fmt:message key="menu.System_Management" /> </p> </a>

	<!-- Navbar Search -->
	<div
		class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-5 my-2 my-md-0 osahan-navbar-search">
		
	</div>
	<!-- Navbar -->
	<jsp:include page="/views/admin/partials/lang.jsp"></jsp:include>
	
	<ul class="navbar-nav ml-auto ml-md-0 osahan-right-navbar">
		
		<li class="nav-item dropdown no-arrow osahan-right-navbar-user">
			<a class="nav-link dropdown-toggle user-dropdown-link" href="#"
			id="userDropdown" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> <img alt=""
				src="${avatarPath}"> ${user.fullname !=null ? user.fullname :  ''}
		</a>
			<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="userDropdown">
				<c:choose>
					<c:when test="${not empty user}">
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/info"><i
							class="fas fa-fw fa-user-shield"></i> &nbsp; <fmt:message key="menu.myaccount" /></a>
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/changepass"><i
							class="fas fa-fw fa-user-cog"></i> &nbsp; <fmt:message key="menu.changePass" /></a>
					</c:when>
					<c:otherwise>
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/register"><i
							class="fas fa-fw fa-user-plus"></i> &nbsp; <fmt:message key="menu.create" /></a>
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/login"><i
							class="fas fa-fw fa-user-lock"></i> &nbsp; <fmt:message key="menu.login" /></a>

					</c:otherwise>
				</c:choose>
				<div class="dropdown-divider"></div>

				<a class="dropdown-item"
					href="${pageContext.request.contextPath}/forgotpass"><i
					class="fas fa-fw fa-user-edit"></i> &nbsp;  <fmt:message key="menu.forgotPass" /></a>
				<c:if test="${not empty user}">
					<a class="dropdown-item" href="#" data-toggle="modal"
						data-target="#logoutModal"><i
						class="fas fa-fw fa-sign-out-alt"></i> &nbsp;  <fmt:message key="menu.logout" /></a>
				</c:if>

				<c:if test="${not empty user and user.admin}">
					<a class="dropdown-item"
						href="${pageContext.request.contextPath}/index"> <i
						class="fas fa-fw fa-home"></i> &nbsp; <fmt:message key="menu.GoToHome" />
					</a>
				</c:if>

			</div>
		</li>
	</ul>
	
	  
</nav>