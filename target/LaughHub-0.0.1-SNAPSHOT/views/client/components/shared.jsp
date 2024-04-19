
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<fmt:setLocale value="${sessionScope.lang }" scope="request" />
    <fmt:setBundle basename="video" scope="request" />
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
				<div class="col-md-12">
					<div class="login-main ">
						<table class="table table-borderless">
							<thead>
								<tr>
									<th><fmt:message key="video.Video_recipient"/></th>
									<th><fmt:message key="video.Video"/></th>
									<th><fmt:message key="video.time"/></th>
								</tr>
							</thead>
							<tbody>

								<c:if test="${not empty shared }">
									<c:forEach items="${shared}" var="share">
										<tr>
											<td>${share.emails }</td>
											<td> <p> <Strong>${share.video.title }</Strong> | <a href="${pageContext.request.contextPath}/watchVideo?v=${share.video.id }"><fmt:message key="video.detail"/></a></p> </td>
											<td>${share.sharedate }</td>
										</tr>
									</c:forEach>

								</c:if>


							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>



	</div>






</div>

