<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
</style>

<div class="container-fluid pb-0">
	<div class="container pl-0 pr-0 ">
		<div class="row no-gutters">
			<div class="col-md-5">
				<div class="login-main">
					<div class="text-center mb-5 login-main-left-header pt-4">

						<h5 class="mt-3 mb-3 fw-bold fs-5">
							Đăng nhập tài khoản tại
							<code> LaughHub</code>
						</h5>
						<p>Đăng nhập tài khoản ngay để có những trải nghiệm xem video
							tuyệt vời nhất</p>
					</div>
					<form class="mx-1 mx-md-4" name="frmLogin">
						<div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-user fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
								<label class="form-label" for="form3Example3c1">Nhập Tài
									Khoản</label> <input type="text" name="username" id="form3Example3c1"
									ng-model="studentLogin.id" class="form-control" required
									minlength="6" /> <small
									ng-show="frmLogin.username.$error.required"
									class="form-text text-danger"> * Vui lòng nhập tên tài
									khoản</small> <small ng-show="frmLogin.username.$error.minlength"
									class="form-text text-danger"> * Tên tài khoản phải hơn
									6 kí tự</small>

							</div>
						</div>



						<div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
								<label class="form-label" name="password" for="form3Example4c3">Mật
									Khẩu</label> <input type="password" id="form3Example4c3"
									ng-model="studentLogin.password" name="password"
									class="form-control" required minlength="6" /> <small
									ng-show="frmLogin.password.$error.required" id="password"
									class="form-text text-danger"> * Vui lòng nhập mật khẩu</small>
								<small ng-show="frmLogin.password.$error.minlength"
									id="password" class="form-text text-danger"> * Mật khẩu
									phải hơn 6 kí tự</small>
							</div>
						</div>

						<div class="form-check mb-4 ml-4">
							<input class="form-check-input" type="checkbox"
								id="rememberMeCheckbox" ng-model="studentLogin.rememberMe">
							<label class="form-check-label" for="rememberMeCheckbox">
								Ghi nhớ đăng nhập </label>
						</div>





						<div class="d-flex justify-content-center ">
							<button type="button" class="btn btn-primary  rounded"
								ng-disabled="frmLogin.$invalid" ng-click="login($event)">
								<span class="spinner-border d-none"></span> Đăng Nhập
							</button>

						</div>

					</form>
					<div class="text-center mt-5">
						<p class="light-gray">
							Bạn đã chưa có tài khoản ? <a href="register">Đăng ký</a>
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
								<p class="mb-4">"Tại LaughHub, bạn có thể khám phá hàng ngàn
									video miễn phí từ các thể loại phim, hài kịch, âm nhạc và nhiều
									hơn nữa. Không cần phải đăng ký hoặc đăng nhập, chỉ cần truy
									cập và thưởng thức! Với bộ sưu tập đa dạng và nội dung mới được
									cập nhật liên tục, bạn sẽ luôn tìm thấy điều gì đó thú vị để
									xem trên LaughHub. Dù bạn đang muốn giải trí hay tìm kiếm thông
									tin mới, hãy tham gia cùng chúng tôi và khám phá thế giới video
									miễn phí ngay hôm nay!"</p>
							</div>
						</div>
						<div class="item">
							<div class="carousel-login-card text-center">
								<img src="img/features-2.png" class="img-fluid rounded"
									alt="LOGO">
								<h5 class="mt-5 mb-3">Tải video một cách dễ dàng</h5>
								<p class="mb-4">"Với LaughHub, việc tải video trở nên dễ
									dàng và tiện lợi hơn bao giờ hết. Chỉ cần một vài bước đơn
									giản, bạn có thể tải về video yêu thích của mình để xem offline
									mọi lúc, mọi nơi. Không cần phải lo lắng về kết nối internet
									hay giới hạn dữ liệu, bạn có thể trải nghiệm nội dung video mà
									không cần phải kết nối mạng. Hãy khám phá và tải về những video
									độc đáo và thú vị từ LaughHub ngay hôm nay!"</p>
							</div>
						</div>
						<div class="item">
							<div class="carousel-login-card text-center">
								<img src="img/features-3.png" class="img-fluid" alt="LOGO">
								<h5 class="mt-5 mb-3">Tạo tài khoản và xem video một cách
									dễ dàng</h5>
								<p class="mb-4">"Với LaughHub, việc tạo tài khoản và trải
									nghiệm thế giới video trở nên vô cùng đơn giản. Chỉ cần một vài
									bước đơn giản, bạn có thể tạo tài khoản và bắt đầu khám phá
									hàng ngàn video từ mọi thể loại. Đăng ký ngay hôm nay để trải
									nghiệm dịch vụ xem video miễn phí tốt nhất, với sự thuận tiện
									và tiện lợi tuyệt đối!"</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



</div>


