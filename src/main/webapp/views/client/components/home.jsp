<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="${sessionScope.lang }" scope="request" />
<fmt:setBundle basename="client" scope="request" />

<div class="container-fluid pb-0">
	<div class="top-mobile-search">
		<div class="row">
			<div class="col-md-12">
				<form class="mobile-search">
					<div class="input-group">
						<input type="text" placeholder="<fmt:message key="menu.search"/>"
							class="form-control">
						<div class="input-group-append">
							<button type="button" class="btn btn-dark">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="video-block section-padding">
		<div class="row">

			<div class="col-xl-12 col-sm-12">
				<c:if test="${not empty categories}">
					<c:forEach items="${categories}" var="category">
						<c:set var="y" value="0"></c:set>
						<button type="button" data-toggle="tooltip" data-placement="top"
							title="${category.description } "
							class="btn btn-${idCategory ==category.id ?'primary':'secondary'   } btn-sm rounded m-1 ">
							<a style="color: white"
								href="${pageContext.request.contextPath}/index?idCategory=${category.id}">${category.categoryName}</a>
							<span class="badge badge-light"> <c:forEach
									items="${videos}" var="video">
									<c:if test="${category.id eq video.videoCategory.id}">
										<c:set var="y" value="${y + 1}"></c:set>
									</c:if>
								</c:forEach> ${y}
							</span>
						</button>
					</c:forEach>
				</c:if>
				<c:if test="${empty categories}">
					<tr>
						<td colspan="5"><fmt:message key="menu.notfound" /></td>
					</tr>
				</c:if>
				<button type="button"
					class="btn btn-${idCategory ==0 ?'primary':'secondary'   } btn-sm rounded m-1 ">
					<a style="color: white"
						href="${pageContext.request.contextPath}/index?idCategory=0">
						Tất cả</a> <span class="badge badge-light">${ServletContextVideos =! null ? ServletContextVideos.size() : '0'}</span>
					<span class="sr-only">unread messages</span>
				</button>

			</div>



		</div>
	</div>

	<div class="video-block section-padding">
		<div class="row">
			<div class="col-md-12">
				<div class="main-title mb-3">
					<div class="btn-group float-right right-action mb-3">
						<a href="#" class="right-action-link text-gray"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<fmt:message key="menu.Sorted_by" /> <i class="fa fa-caret-down"
							aria-hidden="true"></i>
						</a>
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/index?idCategory=${idCategory}&views=${views}&q=${q}&page=${pageCount}"><i
								class="fas fa-fw fa-eye"></i> &nbsp; <c:choose>
									<c:when test="${views == true}">
										<fmt:message key="menu.Lowest_views" />
									</c:when>
									<c:otherwise>
										<fmt:message key="menu.Top_views" />
									</c:otherwise>
								</c:choose> </a> <a class="dropdown-item"
								href="${pageContext.request.contextPath}/index?idCategory=${idCategory}&sortByDateAsc=${sortByDateAsc}&q=${q}&page=${pageCount}"><i
								class="fas fa-fw fa-heart"></i> &nbsp; <fmt:message
									key="menu.Sort_by_posting_date" /> </a> <a class="dropdown-item"
								href="${pageContext.request.contextPath}/index"><i
								class="fas fa-fw fa-times-circle"></i> &nbsp; <fmt:message
									key="menu.resetVideo" /> </a>
						</div>
					</div>
					<h1></h1>
				</div>
			</div>


			<c:if test="${not empty list}">
				<c:forEach items="${list}" var="video">


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

					<div class="col-xl-3 col-sm-6 mb-3 " style="height: 100%">
						<div class="video-card">
							<div class="video-card-image">
								<a class="play-icon"
									href="${pageContext.request.contextPath}/watchVideo?v=${video.id}"><i
									class="fas fa-play-circle"></i></a> <a href="${video.id}"><img
									class="img-fluid " style="height: 140px" src="${avatarPath }"
									alt=""></a>
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
									&nbsp; <a title="" data-placement="top" data-toggle="tooltip"
										href="#" data-original-title="Verified"><i
										class="fas fa-check-circle text-success"></i></a>
								</div>




								<div class="info">
									${video.views}
									<fmt:message key="menu.view" />
									| <i class="likeCount"> ${video.favorites.size()}</i>
									<fmt:message key="menu.like" />
									&nbsp;<i class="fas fa-calendar-alt"></i> ${video.videodate}
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
									</div>
								</div>

							</div>
						</div>
					</div>

				</c:forEach>
			</c:if>
			<c:if test="${empty list}">

				<p class="text-center col-12">
					<a href="/LaughHub/index?page=0&q=${q}&idCategory=${idCategory}"><fmt:message
							key="menu.back" /> ?</a>
				</h6>

			</c:if>
		</div>

		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center pagination-sm mb-4">
				<li class="page-item ${pageCount == 0 ? 'disabled' : ''}"><a
					class="page-link"
					href="/LaughHub/index?page=0&q=${q}&idCategory=${idCategory}"
					tabindex="-1"><fmt:message key="menu.first" /></a></li>

				<li class="page-item ${pageCount == 0 ? 'disabled' : ''}"><a
					class="page-link"
					href="/LaughHub/index?page=${pageCount-1}&q=${q}&idCategory=${idCategory}"
					tabindex="-1"><i class="fas fa-angle-left"></i></a></li>


				<c:forEach var="i" begin="${pageCount >= 1 ? pageCount - 1 : 0}"
					end="${pageCount + 1}">
					<c:if test="${i >= 0 && i < Pages}">
						<li class="page-item ${i == pageCount ? 'active' : ''}"><a
							class="page-link"
							href="/LaughHub/index?page=${i}&q=${q}&idCategory=${idCategory}">${i + 1}</a></li>
					</c:if>
				</c:forEach>

				<li
					class="page-item ${pageCount >= 0 && pageCount< Pages  ? '' : 'disabled'}"><a
					class="page-link"
					href="/LaughHub/index?page=${pageCount+1}&q=${q}&idCategory=${idCategory}"
					tabindex="-1"><i class="fas fa-angle-right"></i></a></li>


				<li class="page-item  ${ pageCount == Pages -1 ? 'disabled' : ''}"><a
					class="page-link"
					href="/LaughHub/index?page=${Pages-1}&q=${q}&idCategory=${idCategory}"
					tabindex="-1"><fmt:message key="menu.last" /></a></li>
			</ul>
		</nav>

	</div>
	<hr class="mt-0">

</div>