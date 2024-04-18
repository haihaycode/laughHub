<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<fmt:setLocale value="${sessionScope.lang }" scope="request" />
<fmt:setBundle basename="statistic" scope="request" />

<div class="container-fluid pb-0 ">
	<div class="container pl-0 pr-0 ">
		<div class="row no-gutters">
			<div class="col-md-12">
				<div class="login-main border border-1  rounded mr-3 p-3 p-1">


					<Strong> &nbsp;
						<h3 class="text-info">
							<fmt:message key="statistic.Statistics_of_likes_by_video" />
						</h3>
					</Strong>
					<p>
						&nbsp;
						<fmt:message key="statistic.Total" />: ${videos.size() } 
					</p>

					<table class="table table-borderless">
						<thead>
							<tr class="bg-info text-white">
								<th><fmt:message key="statistic.Video_information" /></th>
								<th><fmt:message key="statistic.favorite" /></th>
								<th><fmt:message key="statistic.First_day" /></th>
								<th><fmt:message key="statistic.Last_day" /></th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty videos }">
								<c:forEach items="${videos}" var="video">
									<tr
										class="${video.favorites.size() == 0  ?  'bg-warning' :'' }">
										<td>${video.title }<a
											href="${pageContext.request.contextPath}/watchVideo?v=${video.id }">  <fmt:message key="statistic.detail" /></a></td>
										<td>
											<center>
												<h5>${video.getFavorites().size() }</h3>
											</center>
										</td>
										<td>${!empty video.favorites && video.favorites.size() > 0 ? video.favorites[0].likedate : ""}</td>
										<td>${!empty video.favorites && video.favorites.size() > 0 ? video.favorites[fn:length(video.favorites) - 1].likedate : ""}</td>
									</tr>
								</c:forEach>


							</c:if>
							<c:if test="${ empty videos  }">
								<tr>
									<td colspan="4">Không có dữ liệu nào</td>
								</tr>


							</c:if>


						</tbody>
					</table>



				</div>
			</div>

		</div>
	</div>



</div>


