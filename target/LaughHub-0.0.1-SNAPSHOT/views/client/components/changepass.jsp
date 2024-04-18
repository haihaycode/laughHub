<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				Social &nbsp; <a class="fb" href="#">${user.fullname !=null ? user.fullname :  'Tài khoản'}</a>
				<a class="tw" href="#">LaughHub</a> <a class="gp" href="#">Trang
					chủ</a>
			</div>
		</div>
	</div>
	<div class="single-channel-nav">
		<nav class="navbar navbar-expand-lg navbar-light">
			<a class="channel-brand" href="#">${user.fullname !=null ? user.fullname :  'Tài khoản'}
				&nbsp;<span title="" data-placement="top" data-toggle="tooltip"
				data-original-title="Verified"><i
					class="fas fa-check-circle text-primary"></i></span>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item "><a class="nav-link " href="info">Thông
							tin cá nhân </a></li>
					<li class="nav-item active"><a class="nav-link "
						href="changepass">Đổi mật khẩu</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Lịch sử
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">yêu
							thích </a></li>
					<li class="nav-item"><a class="nav-link" href="#">Đã share
					</a></li>
					<li class="nav-item "><a class="nav-link" href="#">Top
							video </a></li>
					<li class="nav-item"><a class="nav-link" href="#">Danh mục
							video mới</a></li>


					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Donate </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
						</div></li>
				</ul>

			</div>
		</nav>
	</div>



	<div class="container-fluid pb-0">
		<div class="container pl-0 pr-0 ">
			<div class="row no-gutters">
				<div class="col-md-5">
					<div class="login-main">
						<div class="text-center mb-5 login-main-left-header pt-4">

							<h5 class="mt-3 mb-1 fw-bold fs-5"> <code>Ồ ! </code> bạn muốn thay đổi mật khẩu mới ? </h5>
							<p>Cập nhật các thông tin mới nhất</p>
						</div>
						<form class="mx-1 mx-md-4" action="" method="post">

							<div class="d-flex flex-row align-items-center mb-4">
								<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
								<div class="form-outline flex-fill mb-0">
									<label class="form-label" for="form3Example3c1">Mật
										khẩu cũ *</label><input type="password" name="passwordold"
										class="form-control " />

								</div>
							</div>
							<div class="d-flex flex-row align-items-center mb-4">
								<i class="fas fa-user-lock fa-lg me-3 fa-fw"></i>
								<div class="form-outline flex-fill mb-0">
									<label class="form-label" for="form3Example3c1">Mật
										khẩu mới *</label><input type="password" name="password"
										class="form-control " />

								</div>
							</div>
							<div class="d-flex flex-row align-items-center mb-4">
								<i class="fas fa-user-lock fa-lg me-3 fa-fw"></i>
								<div class="form-outline flex-fill mb-0">
									<label class="form-label" for="form3Example3c1">Nhập
										lại Mật khẩu *</label><input type="password" name="repassword"
										class="form-control " />

								</div>
							</div>


							<div class="d-flex justify-content-center ">
								<button type="submit" class="btn btn-primary rounded">
									Cập nhật mật khẩu </button>

							</div>

						</form>

						<div class="text-center mt-5">
							<p class="light-gray">
								Bạn quên mật khẩu tài khoản ? <a href="forgotpass">Quên mật
									khẩu</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-7">
					<div class="login-main-right ">
						<div class="owl-carousel owl-carousel-login">
							<div class="item">
								<div class="carousel-login-card text-center">
									<img src="img/features-2.png" class="img-fluid" alt="LOGO">

									<h5 class="mt-5 mb-3">Xem video miến phí</h5>
									<p class="mb-4">"Tại LaughHub, bạn có thể khám phá hàng
										ngàn video miễn phí từ các thể loại phim, hài kịch, âm nhạc và
										nhiều hơn nữa. Không cần phải đăng ký hoặc đăng nhập, chỉ cần
										truy cập và thưởng thức! Với bộ sưu tập đa dạng và nội dung
										mới được cập nhật liên tục, bạn sẽ luôn tìm thấy điều gì đó
										thú vị để xem trên LaughHub. Dù bạn đang muốn giải trí hay tìm
										kiếm thông tin mới, hãy tham gia cùng chúng tôi và khám phá
										thế giới video miễn phí ngay hôm nay!"</p>
								</div>
							</div>
							<div class="item">
								<div class="carousel-login-card text-center">
									<img src="img/features-2.png" class="img-fluid rounded"
										alt="LOGO">
									<h5 class="mt-5 mb-3">Tải video một cách dễ dàng</h5>
									<p class="mb-4">"Với LaughHub, việc tải video trở nên dễ
										dàng và tiện lợi hơn bao giờ hết. Chỉ cần một vài bước đơn
										giản, bạn có thể tải về video yêu thích của mình để xem
										offline mọi lúc, mọi nơi. Không cần phải lo lắng về kết nối
										internet hay giới hạn dữ liệu, bạn có thể trải nghiệm nội dung
										video mà không cần phải kết nối mạng. Hãy khám phá và tải về
										những video độc đáo và thú vị từ LaughHub ngay hôm nay!"</p>
								</div>
							</div>
							<div class="item">
								<div class="carousel-login-card text-center">
									<img src="img/features-3.png" class="img-fluid" alt="LOGO">
									<h5 class="mt-5 mb-3">Tạo tài khoản và xem video một cách
										dễ dàng</h5>
									<p class="mb-4">"Với LaughHub, việc tạo tài khoản và trải
										nghiệm thế giới video trở nên vô cùng đơn giản. Chỉ cần một
										vài bước đơn giản, bạn có thể tạo tài khoản và bắt đầu khám
										phá hàng ngàn video từ mọi thể loại. Đăng ký ngay hôm nay để
										trải nghiệm dịch vụ xem video miễn phí tốt nhất, với sự thuận
										tiện và tiện lợi tuyệt đối!"</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



	</div>






</div>

