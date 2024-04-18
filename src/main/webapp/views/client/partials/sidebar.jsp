<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<ul class="sidebar navbar-nav">
	<li
		class="nav-item ${content.scriptUrl.equals('index') ? 'active' : '' }"><a
		class="nav-link" href="${pageContext.request.contextPath}/index">
			<i class="fas fa-fw fa-home"></i> <span><fmt:message key="menu.home"/></span>
	</a></li>
	<li
		class="nav-item  ${content.scriptUrl.equals('info') ? 'active' : '' }"><a
		class="nav-link" href="${pageContext.request.contextPath}/info"> <i
			class="fas fa-fw fa-user"></i> <span><fmt:message key="menu.info"/></span>
	</a></li>
	<li
		class="nav-item  ${content.scriptUrl.equals('favorites') ? 'active' : '' }"><a
		class="nav-link" href="${pageContext.request.contextPath}/favorites">
			<i class="fas fa-fw fa-heart"></i> <span><fmt:message key="menu.favorite"/></span>
	</a></li>
	<li
		class="nav-item  ${content.scriptUrl.equals('histories') ? 'active' : '' }"><a
		class="nav-link" href="${pageContext.request.contextPath}/histories">
			<i class="fas fa-fw fa-history"></i> <span><fmt:message key="menu.history"/></span>
	</a></li>
	<li
		class="nav-item  ${content.scriptUrl.equals('shared') ? 'active' : '' }"><a
		class="nav-link" href="${pageContext.request.contextPath}/shared">
			<i class="fas fa-fw fa-share"></i> <span><fmt:message key="menu.share"/></span>
	</a></li>




	<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
		href="categories.html" role="button" data-toggle="dropdown"
		aria-haspopup="true" aria-expanded="false"> <i
			class="fas fa-fw fa-list-alt"></i> <span><fmt:message key="menu.category"/> </span>
	</a>
		<div class="dropdown-menu">
			<c:if test="${not empty ServletContextCategories}">
				<c:forEach var="category" items="${ServletContextCategories}">
					<a data-toggle="tooltip" data-placement="top"
						title="${category.description }" class="dropdown-item"
						href="${pageContext.request.contextPath}/index?idCategory=${category.id}">${category.categoryName}</a>
				</c:forEach>
			</c:if>
			<c:if test="${empty ServletContextCategories}">
				<div class="dropdown-item"><fmt:message key="menu.notfound"/> !</div>
			</c:if>
		</div></li>
	<li class="nav-item channel-sidebar-list">
		<ul>
			<li class="nav-item dropdown no-arrow osahan-right-navbar-user">
				<a class="nav-link dropdown-toggle user-dropdown-link" href="#"
				id="userDropdown" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> <img alt=""
					src="${avatarPath}"> ${user.fullname !=null ? user.fullname :  'LaughHub !'}
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<c:choose>
						<c:when test="${not empty user}">
							<a class="dropdown-item" href="info"><i
								class="fas fa-fw fa-user-shield"></i> &nbsp; <fmt:message key="menu.info"/></a>
							<a class="dropdown-item" href="changepass"><i
								class="fas fa-fw fa-user-cog"></i> &nbsp; <fmt:message key="menu.changepass"/></a>
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
						class="fas fa-fw fa-user-edit"></i> &nbsp; <fmt:message key="menu.forgot"/></a>
					<c:if test="${not empty user}">
						<a class="dropdown-item" href="#" data-toggle="modal"
							data-target="#logoutModal"><i
							class="fas fa-fw fa-sign-out-alt"></i> &nbsp; <fmt:message key="menu.logout"/></a>
					</c:if>

					<c:if test="${not empty user and user.admin}">
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/admin"> <i
							class="fas fa-fw fa-users-cog"></i> &nbsp; <fmt:message key="menu.gotoadmin"/>
						</a>
					</c:if>

				</div>
			</li>
		</ul>
	</li>
</ul>