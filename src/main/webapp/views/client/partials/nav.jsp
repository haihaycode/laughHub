<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<fmt:setBundle basename="client"/>
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
		href="index"><img class="img-fluid" alt="" src="${pageContext.request.contextPath}/img/favicon.png"
		width="50px">
		<p class="m-0">LaughHub</p> </a>
	<!-- Navbar Search -->
	<form action="${pageContext.request.contextPath}/index"
		class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-5 my-2 my-md-0 osahan-navbar-search">
		<div class="input-group">
			<input type="text" name="q" value="${q }" class="form-control " placeholder="<fmt:message key="menu.search"/>">
			<div class="input-group-append">
				<button class="btn btn-light " type="submit">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</div>
	</form>
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
						<a class="dropdown-item" href="info"><i
							class="fas fa-fw fa-user-shield"></i> &nbsp; <fmt:message key="menu.myaccount"/></a>
						<a class="dropdown-item" href="changepass"><i
							class="fas fa-fw fa-user-cog"></i> &nbsp;<fmt:message key="menu.changepass"/></a>
					</c:when>
					<c:otherwise>
						<a class="dropdown-item" href="register"><i
							class="fas fa-fw fa-user-plus"></i> &nbsp; <fmt:message key="menu.create"/></a>
						<a class="dropdown-item" href="login"><i
							class="fas fa-fw fa-user-lock"></i> &nbsp; <fmt:message key="menu.login"/></a>

					</c:otherwise>
				</c:choose>
				<div class="dropdown-divider"></div>

				<a class="dropdown-item" href="forgotpass"><i
					class="fas fa-fw fa-user-edit"></i> &nbsp;<fmt:message key="menu.forgot"/></a>
				<c:if test="${not empty user}">
					<a class="dropdown-item" href="#" data-toggle="modal"
						data-target="#logoutModal"><i
						class="fas fa-fw fa-sign-out-alt"></i> &nbsp; <fmt:message key="menu.logout"/></a>
				</c:if>

				<c:if test="${not empty user and user.admin}">
					<a class="dropdown-item"  href="${pageContext.request.contextPath}/admin"> <i
						class="fas fa-fw fa-users-cog"></i> &nbsp; <fmt:message key="menu.gotoadmin"/>
					</a>
				</c:if>

			</div>
		</li>
	</ul>
</nav>