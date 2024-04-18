
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<fmt:setLocale value="${sessionScope.lang }" scope="request" />
    <fmt:setBundle basename="client" scope="request" />

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
					<div class="login-main row">

						<c:if test="${not empty watchedVideos}">
							<c:forEach items="${watchedVideos}" var="video">


								<c:choose>
									<c:when test="${not empty video.poster}">
										<c:set var="avatarPath"
											value="/LaughHub/upload/client/poster/${video.poster}" />
									</c:when>
									<c:otherwise>
										<c:set var="avatarPath"
											value="https://cdn-icons-png.flaticon.com/512/6046/6046607.png" />
									</c:otherwise>
								</c:choose>

								<div class="col-xl-3 col-sm-6 mb-3" style="height: 100%">
									<div class="video-card">
										<div class="video-card-image">
											<a class="play-icon"
												href="${pageContext.request.contextPath}/watchVideo?v=${video.id}"><i
												class="fas fa-play-circle"></i></a> <a href="${video.id}"><img
												class="img-fluid " style="height: 140px"
												src="${avatarPath }" alt=""></a>
											<div class="time">${video.id}</div>
										</div>
										<div class="video-card-body">
											<div class="video-title" style="height: 50px">
												<c:set var="title" value="${video.title}" />
												<a
													href="${pageContext.request.contextPath}/watchVideo?v=${video.id}"><c:out
														value="${fn:substring(title, 0, 50)}" />...</a>



											</div>
											<div class="video-page text-success">
												<a
													href="${pageContext.request.contextPath}/index?idCategory=${ video.videoCategory.id}">${video.videoCategory.categoryName}</a>
												&nbsp; <a title="" data-placement="top"
													data-toggle="tooltip" href="#"
													data-original-title="Verified"><i
													class="fas fa-check-circle text-success"></i></a>
											</div>
											<div class="info">
												${video.views} <fmt:message key="menu.view"/> |<i class="likeCount">
													${video.favorites.size()}</i> <fmt:message key="menu.view"/> &nbsp;<i
													class="fas fa-calendar-alt"></i> ${video.videodate}
											</div>
											<div
												class="video-view d-flex justify-content-end align-items-center m-3">

												<div class="actions">
													<button class="btn btn-primary btn-like"
														ng-click="like('${video.id }',$event)">
														<i class="fas fa-thumbs-up"></i>
													</button>
													<button class="btn btn-info btn-share"
														ng-click="share('${video.id }',$event)">
														<i class="fas fa-share"></i>
													</button>

													<form class="btn " action="" method="post"
														class="form-inline">
														<input type="hidden" name="id" value="${video.id}">
														<button type="submit" class="btn btn" name="action"
															value="removeWatchTv">
															<i class="fas fa-trash-alt" style="color: red"></i>
														</button>
													</form>


												</div>


											</div>

										</div>
									</div>
								</div>

							</c:forEach>
						</c:if>
						<c:if test="${empty watchedVideos}">

							<p class="text-center col-12">
								 <a href="/LaughHub/index"> <fmt:message key="menu.back"/>
									?</a>
							</h6>

						</c:if>
					</div>
				</div>

			</div>
		</div>



	</div>






</div>

