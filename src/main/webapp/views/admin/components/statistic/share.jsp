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
						<h3 class="text-info"><fmt:message key="statistic.Statistics_on_senders_and_recipients_of_each_shared_video" /></h3>
					</Strong>
					<div class="form-group">
						<select id="videoSelect" class="custom-select">
							<option
								data-href="${pageContext.request.contextPath}/admin/statistic?category=share">--
								<fmt:message key="statistic.select_video" /> --</option>

							<c:if test="${not empty videos }">


								<c:forEach items="${videos}" var="video">
									<option value="${video.id}"
										${param.v == video.id ? 'selected' : '' }
										data-href="${pageContext.request.contextPath}/admin/statistic?category=share&v=${video.id}">${video.title}
									</option>
								</c:forEach>




							</c:if>

						</select>
					</div>


					<table class="table table-borderless">
						<thead class="mb-2">
							<tr class="bg-info text-white ">
								<th><fmt:message key="statistic.Sender_Account" /></th>
								<th><fmt:message key="statistic.fullname" /></th>
								<th><fmt:message key="statistic.Sender_email" /></th>

							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty users }">
								<c:forEach items="${users}" var="user">

									<tr class="bg-warning">
										<th>${user.id }</th>
										<th>${user.fullname }</th>
										<th>${user.email }</th>

										<c:set var="count" value="0" />
										<c:forEach items="${shares}" var="share">
											<c:if
												test="${share.getVideo().getId() == param.v && share.getUser().getId() == user.id}">
												<tr>
													<c:set var="count" value="${count + 1}" />
													<td>${count }</td>
													<td><fmt:message key="statistic.Recipient_email" /> : ${share.getEmails()}</td>
													<td><fmt:message key="statistic.Sender_time" /> : ${share.getSharedate()}</td>
												</tr>
											</c:if>
										</c:forEach>



									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty users }">
								<tr>
									<td colspan="5">-- -- </td>
								</tr>
							</c:if>



						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>



</div>

<script>
	document.getElementById('videoSelect').addEventListener('change',
			function() {
				var selectedOption = this.options[this.selectedIndex];
				var selectedUrl = selectedOption.getAttribute('data-href');

				window.location.href = selectedUrl;
			});
</script>