<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
	<fmt:setLocale value="${sessionScope.lang }" scope="request" />
    <fmt:setBundle basename="admin" scope="request" />
<div class="container-fluid pb-0">
	<div class="video-block section-padding">
		<div class="row">

			<div class="col-xl-12 col-sm-12 mb-3">
				<div class="video-card">
					<div>
						<div class="rounded text-white">
							<img class="card-img" src="${pageContext.request.contextPath}/img/features.png" alt="Card image" height="450px">
							<div class="card-img-overlay">
								<h5 class="card-title">&nbsp  <fmt:message key="menu.Hello" /> : <code>(${user.id }) <strong>${user.fullname }</strong> </code> </h5>
								<p class="card-text text-dark">&nbsp &nbsp <a style="color: blue" href="${pageContext.request.contextPath}/index"><i class="fas fa-home fa-lg me-3 fa-fw"></i> <fmt:message key="menu.GoToHome" /> </a></p>
								<p class="card-text text-dark">&nbsp &nbsp </p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-12 col-sm-12 mb-3">
				<div class="video-card">
					<h6>&nbsp &nbsp <fmt:message key="menu.Top_videos_with_the_highest_views" /></h6>
					<div>
						<canvas id="top6VideoViews"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="video-block section-padding">
		<div class="row">
			<div class="col-xl-6 col-sm-6 mb-3">
				<div class="video-card">
					<h6> &nbsp &nbsp <fmt:message key="menu.Videos_-_clips_have_been_posted" /></h6>
					<div>
						<canvas id="CountVideo"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="video-block section-padding">
		<div class="row">
			<div class="col-xl-12 col-sm-6 mb-3">
				<div class="card">
					<div class="card-header h6">
						<i class="fas fa-users fa-lg me-3 fa-fw"></i> <fmt:message key="menu.Manage_users_on_the_site" />
					</div>
					<div class="card-body">
						<h5 class="card-title">
							<button type="button" class="btn btn-light rounded">
								<i class="fas fa-users fa-lg me-3 fa-fw"></i> <span
									class="badge badge-light">${countUsers.size()}</span> <span
									class="sr-only">unread messages</span>
							</button>

						</h5>
						<p class="card-text"><fmt:message key="menu.Manage_users_on_the_site_detail" /></p>
						<a href="${pageContext.request.contextPath}/admin/users"
							class="btn btn-primary"><i class="fas fa-hand-point-right"></i> </a>
					</div>
				</div>
			</div>

			<div class="col-xl-6 col-sm-6 mb-3">
				<div class="card">
					<div class="card-header h6">
						<i class="fas fa-bars fa-lg me-3 fa-fw"></i> <fmt:message key="menu.Manage_categories_of_videos_clips" />
					</div>
					<div class="card-body">
						<h5 class="card-title">
							<button type="button" class="btn btn-light rounded">
								<i class="fas fa-bars fa-lg me-3 fa-fw"></i> <span
									class="badge badge-light">${countCategories.size()}</span> <span
									class="sr-only">unread messages</span>
							</button>

						</h5>
						<p class="card-text"><fmt:message key="menu.Manage_categories_of_videos_clips_detail" /></p>
						<a href="${pageContext.request.contextPath}/admin/categories"
							class="btn btn-primary"><i class="fas fa-hand-point-right"></i> </a>
					</div>
				</div>
			</div>


			<div class="col-xl-6 col-sm-6 mb-3">
				<div class="card">
					<div class="card-header h6">
						<i class="fas fa-video fa-lg me-3 fa-fw"></i> <fmt:message key="menu.Manage_videos_clips" />
					</div>
					<div class="card-body">
						<h5 class="card-title">
							<button type="button" class="btn btn-light rounded">
								<i class="fas fa-video fa-lg me-3 fa-fw"></i> <span
									class="badge badge-light">${countVideos.size()}</span> <span
									class="sr-only">unread messages</span>
							</button>

						</h5>
						<p class="card-text"><fmt:message key="menu.Manage_videos_clips_detail" /></p>
						<a href="${pageContext.request.contextPath}/admin/videos"
							class="btn btn-primary"><i class="fas fa-hand-point-right"></i> </a>
					</div>
				</div>
			</div>
		</div>



	</div>
	<hr class="mt-0">

</div>
<script>
    const ctx = document.getElementById('top6VideoViews');

    // Tạo một mảng chứa nhãn từ dữ liệu JSTL
    const labels = [
        <c:forEach items="${topViews}" var="video" varStatus="loop">
            '${video.id}'<c:if test="${!loop.last}">, </c:if>
        </c:forEach>
    ];

    // Tạo một mảng chứa dữ liệu từ dữ liệu JSTL
    const data = [
        <c:forEach items="${topViews}" var="video" varStatus="loop">
            ${video.views}<c:if test="${!loop.last}">, </c:if>
        </c:forEach>
    ];

    // Tạo một mảng chứa tiêu đề của video
    const titles = [
        <c:forEach items="${topViews}" var="video" varStatus="loop">
            '${video.title}'<c:if test="${!loop.last}">, </c:if>
        </c:forEach>
    ];

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: '<fmt:message key="menu.view" />',
                data: data,
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            },
            tooltips: {
                callbacks: {
                    label: function(tooltipItem) {
                        const title = titles[tooltipItem.index];
                        return 'Lượt xem: ' + tooltipItem.yLabel + ' - ' + title;
                    }
                }
            }
        }
    });
    
    
    
    
</script>

<script>
    const countVideoActive = ${countVideoActive}; // Số video đã được kích hoạt
    const countVideoNoActive = ${countVideoNoActive}; // Số video chưa được kích hoạt

    const countVideoCtx = document.getElementById('CountVideo').getContext('2d');
    const myChart = new Chart(countVideoCtx, {
        type: 'bar',
        data: {
            labels: ['<fmt:message key="menu.activated" />', '<fmt:message key="menu.deactivate" />', '<fmt:message key="menu.countVideo" />'],
            datasets: [{
                label: '<fmt:message key="menu.countVideo" />',
                data: [countVideoActive, countVideoNoActive, countVideoActive + countVideoNoActive],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.5)', // Màu nền cho phần đã kích hoạt
                    'rgba(255, 99, 132, 0.5)', // Màu nền cho phần chưa kích hoạt
                    'rgba(75, 192, 192, 0.5)' // Màu nền cho phần tổng video đã đăng
                ],
                borderColor: [
                    'rgba(54, 162, 235, 1)', // Màu viền cho phần đã kích hoạt
                    'rgba(255, 99, 132, 1)', // Màu viền cho phần chưa kích hoạt
                    'rgba(75, 192, 192, 1)' // Màu viền cho phần tổng video đã đăng
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>

