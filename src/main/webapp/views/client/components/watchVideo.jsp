<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<fmt:setLocale value="${sessionScope.lang }" scope="request" />
    <fmt:setBundle basename="video" scope="request" />
    
<div class="container-fluid pb-0">
	<div class="video-block section-padding">
		<div class="row">
			<div class="col-md-8">
				<div class="single-video-left">
					<div class="single-video rounded">
						<iframe width="100%" height="400px" class="rounded"
							src="https://www.youtube.com/embed/${videoWatch.id }?showinfo=0"
							allowfullscreen> </iframe>

					</div>
					<div class="single-video-title box mb-3">
						<h2>
							<a href="#">${videoWatch.title}</a>
						</h2>
						<p class="mb-0">
							<i class="fas fa-eye"></i> ${videoWatch.views} <fmt:message key="video.view"/>
						</p>
					</div>
					<div class="single-video-author box mb-3">
						<div class="float-right">
							<button class="btn btn-danger ml-3" type="button"
								ng-click="like('${videoWatch.id }',$event)">
								<fmt:message key="video.favorite"/> <strong><strong class="likeCount">
										${videoWatch.favorites.size()}</strong></strong>
							</button>
							<button class="btn btn-info btn-share"
								ng-click="share('${videoWatch.id }',$event)">
								<i class="fas fa-share"></i>
							</button>
						</div>

						<c:choose>
							<c:when test="${not empty videoWatch.poster}">
								<c:set var="avatarPath"
									value="/LaughHub/upload/client/poster/${videoWatch.poster}" />
							</c:when>
							<c:otherwise>
								<c:set var="avatarPath"
									value="https://cdn-icons-png.flaticon.com/512/6046/6046607.png" />
							</c:otherwise>
						</c:choose>

						<img class="img-fluid" src="${avatarPath}" alt="">
						<p class="">
							<a href="#"><strong>${videoWatch.title} |
									${videoWatch.videoCategory.categoryName} </strong></a> <span title=""
								data-placement="top" data-toggle="tooltip"
								data-original-title="Verified"><i
								class="fas fa-check-circle text-success"></i></span>
						</p>
						<small class=""> <fmt:message key="video.public"/> ${videoWatch.videodate} </small>
					</div>
					<div class="single-video-info-content box mb-3">
						<h6><fmt:message key="video.category"/></h6>
						<p>
							<a
								href="${pageContext.request.contextPath}/index?idCategory=${videoWatch.videoCategory.id }">${videoWatch.videoCategory.categoryName }</a>
						</p>
						<p>${videoWatch.videoCategory.description }</p>
						<h6><fmt:message key="video.description"/>:</h6>
						<p>${videoWatch.description }</p>
						<h6><fmt:message key="video.Other_categories"/>:</h6>
						<p class="tags mb-0">

							<c:if test="${not empty ServletContextCategories}">
								<c:forEach var="category" items="${ServletContextCategories}">

									<a data-toggle="tooltip" data-placement="top"
										title="${category.description }"
										href="${pageContext.request.contextPath}/index?idCategory=${category.id}">${category.categoryName}</a>

								</c:forEach>
							</c:if>
							<c:if test="${empty ServletContextCategories}">
								<div class="dropdown-item"><fmt:message key="video.notfound"/>!</div>
							</c:if>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="single-video-right">
					<div class="row">
						<div class="col-md-12">
							<div class="adblock">
								<div class="img">
									<script type="text/javascript">
										atOptions = {
											'key' : 'b39d237b89641c756af75ad6d456bdd3',
											'format' : 'iframe',
											'height' : 250,
											'width' : 300,
											'params' : {}
										};
									</script>
									<script type="text/javascript"
										src="//www.topcreativeformat.com/b39d237b89641c756af75ad6d456bdd3/invoke.js"></script>
								</div>
							</div>
							<div class="main-title">
								
								<h6><fmt:message key="video.Other_videos"/></h6>
							</div>
						</div>
						<div class="col-md-12">
							<c:if test="${not empty randomVideo}">
								<c:forEach items="${randomVideo}" var="video">
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

									<div class="video-card video-card-list">
										<div class="video-card-image">
											<a class="play-icon"
												href="${pageContext.request.contextPath}/watchVideo?v=${video.id}"><i
												class="fas fa-play-circle"></i></a> <a href="#"><img
												class="img-fluid" style="height: 100%" src="${avatarPath }"
												alt=""></a>
											<div class="time">${video.id}</div>
										</div>
										<div class="video-card-body">
											<div class="btn-group float-right right-action">
												<a href="#" class="right-action-link text-gray"
													data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false"> <i class="fa fa-ellipsis-v"
													aria-hidden="true"></i>
												</a>

											</div>
											<div class="video-title">
												<c:set var="title" value="${video.title}" />
												<a
													href="${pageContext.request.contextPath}/watchVideo?v=${video.id}"></a>
												<a
													href="${pageContext.request.contextPath}/watchVideo?v=${video.id}"><c:out
														value="${fn:substring(title, 0, 50)}" />...</a>
											</div>
											<div class="video-page text-success">
												${video.videoCategory.categoryName } <a title=""
													data-placement="top" data-toggle="tooltip" href="#"
													data-original-title="Verified"><i
													class="fas fa-check-circle text-success"></i></a>
											</div>
											<div class="video-view">
												${video.views } <fmt:message key="video.view"/> &nbsp;<i
													class="fas fa-calendar-alt"></i> ${video.videodate }
											</div>
										</div>
									</div>

								</c:forEach>
							</c:if>
							<c:if test="${empty randomVideo}">

								<p class="text-center col-12">
									 <a
										href="/LaughHub/index?page=0&q=${q}&idCategory=${idCategory}"><fmt:message key="video.back"/>
										?</a>
								</h6>

							</c:if>




							<div class="adblock mt-0">
								<div class="img">
									<script type="text/javascript">
										atOptions = {
											'key' : 'b39d237b89641c756af75ad6d456bdd3',
											'format' : 'iframe',
											'height' : 250,
											'width' : 300,
											'params' : {}
										};
									</script>
									<script type="text/javascript"
										src="//www.topcreativeformat.com/b39d237b89641c756af75ad6d456bdd3/invoke.js"></script>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>