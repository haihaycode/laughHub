<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
	<fmt:setLocale value="${sessionScope.lang }" scope="request" />
    <fmt:setBundle basename="client" scope="request" />
<!DOCTYPE html>
<html>
<head>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Askbootstrap">
<meta name="author" content="Askbootstrap">
<title>${videoWatch.title}${content.title  }</title>
<!-- Favicon Icon -->
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/img/favicon.png">
<!-- Bootstrap core CSS-->
<link
	href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath}/css/osahan.css"
	rel="stylesheet">
<!-- Owl Carousel -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendor/owl-carousel/owl.carousel.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendor/owl-carousel/owl.theme.css">
</head>
<!-- toastr-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
	integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/nprogress/0.2.0/nprogress.min.css"
	integrity="sha512-42kB9yDlYiCEfx2xVwq0q7hT4uf26FUgSIZBK8uiaEnTdShXjwr8Ip1V4xGJMg3mHkUt9nNuTDxunHF0/EgxLQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.10.7/sweetalert2.css"
	integrity="sha512-n1PBkhxQLVIma0hnm731gu/40gByOeBjlm5Z/PgwNxhJnyW1wYG8v7gPJDT6jpk0cMHfL8vUGUVjz3t4gXyZYQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />



<script src="${pageContext.request.contextPath}/app/js/angular.min.js"></script>
<script src="${pageContext.request.contextPath}/app/js/myApp.js"></script>
<body id="page-top" ng-app="myApp" ng-controller="Ctrls">
	<!--include nav -->
	<jsp:include page="/views/client/partials/nav.jsp"></jsp:include>



	<div id="wrapper">
		<!--include Sidebar -->

		<jsp:include page="/views/client/partials/sidebar.jsp"></jsp:include>

		<div id="content-wrapper">
			<!--main -->
			<c:if test="${content != null }">
				<jsp:include page="${content.contentUrl }"></jsp:include>
			</c:if>
			<!--end main -->

			<!--include footer -->
			<jsp:include page="/views/client/partials/footer.jsp"></jsp:include>
		</div>

	</div>




	<jsp:include page="/views/client/partials/scrollToTop.jsp"></jsp:include>
	<jsp:include page="/views/client/partials/logoutModal.jsp"></jsp:include>
	<!-- Modal show message-->
	<jsp:include page="/views/client/partials/showMessage.jsp"></jsp:include>



	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->

	<script
		src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Owl Carousel -->
	<script
		src="${pageContext.request.contextPath}/vendor/owl-carousel/owl.carousel.js"></script>
	<!--toastr-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
		integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/nprogress/0.2.0/nprogress.min.js"
		integrity="sha512-bUg5gaqBVaXIJNuebamJ6uex//mjxPk8kljQTdM1SwkNrQD7pjS+PerntUSD+QRWPNJ0tq54/x4zRV8bLrLhZg=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.10.7/sweetalert2.min.js"
		integrity="sha512-csaTzpLFmF+Zl81hRtaZMsMhaeQDHO8E3gBkN3y3sCX9B1QSut68NxqcrxXH60BXPUQ/GB3LZzzIq9ZrxPAMTg=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<!-- Custom scripts for all pages-->
	<script src="${pageContext.request.contextPath}/js/custom.js"></script>

	<script src="${pageContext.request.contextPath}/js/toatrConfig.js"></script>
</body>
</html>