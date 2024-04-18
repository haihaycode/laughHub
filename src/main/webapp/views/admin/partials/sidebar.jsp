<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<style>
a{
 overflow: hidden;

}
</style>
<ul class="sidebar navbar-nav">
	<li
		class="nav-item ${content.scriptUrl.equals('admin') ? 'active' : '' }">
		<a class="nav-link" href="${pageContext.request.contextPath}/admin">
			<i class="fas fa-fw fa-home"></i> <span><fmt:message key="menu.home" /></span>
	</a>
	</li>
	<li
		class="nav-item ${content.scriptUrl.equals('users') ? 'active' : '' }">
		<a class="nav-link"
		href="${pageContext.request.contextPath}/admin/users"> <i
			class="fas fa-fw fa-users"></i> <span><fmt:message key="menu.User_list" /></span>
	</a>
	</li>
	<li
		class="nav-item ${content.scriptUrl.equals('categories') ? 'active' : '' }">
		<a class="nav-link"
		href="${pageContext.request.contextPath}/admin/categories"> <i
			class="fas fa-fw fa-bars"></i> <span><fmt:message key="menu.Manage_video_categories" /></span>
	</a>
	</li>
	<li
		class="nav-item ${content.scriptUrl.equals('videos') ? 'active' : '' }">
		<a class="nav-link"
		href="${pageContext.request.contextPath}/admin/videos"> <i
			class="fas fa-fw fa-video"></i> <span><fmt:message key="menu.Video_management" /></span>
	</a>
	</li>



	<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
		href="#" role="button" data-toggle="dropdown"
		aria-haspopup="true" aria-expanded="false"> <i
			class="fas fa-fw fa-list-alt"></i> <span><fmt:message key="menu.Statistics_and_Reports" /></span>
	</a>
		<div class="dropdown-menu">
			<a class="dropdown-item " 
				href="${pageContext.request.contextPath}/admin/statistic?category=like"
				data-toggle="tooltip" data-placement="top" title=""
				data-original-title="<fmt:message key="menu.Statistics_of_likes_by_video" />"><fmt:message key="menu.Statistics_of_likes_by_video" /> </a> <a class="dropdown-item text-wrap" data-toggle="tooltip"
				data-placement="top" title=""
				data-original-title="<fmt:message key="menu.Statistics_of_favorite_people_by_video" />"
				href="${pageContext.request.contextPath}/admin/statistic?category=UsersLIke"><fmt:message key="menu.Statistics_of_favorite_people_by_video" /></a> <a class="dropdown-item text-wrap" data-toggle="tooltip"
				data-placement="top" title=""  
				data-original-title="<fmt:message key="menu.Statistics_on_senders_recipients_of_each_shared_video" />"
				href="${pageContext.request.contextPath}/admin/statistic?category=share"><fmt:message key="menu.Statistics_on_senders_recipients_of_each_shared_video" /></a>
		</div></li>
	<li class="nav-item channel-sidebar-list">

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
	</li>
</ul>