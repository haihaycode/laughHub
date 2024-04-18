/**
 * LOGIC FRONT END
 */

var app = angular.module('myApp', []);
app.controller('Ctrls', function($scope, $rootScope, $window, $http, $timeout) {
	//LOADING
	$scope.startLoad = function(button) {
		// Disable the button
		$(button).prop("disabled", true);
		// Hide the login text and show the spinner
		$(button).find('.login-text').addClass('d-none');
		$(button).find('.spinner-border').removeClass('d-none');
	}
	$scope.endLoad = function(button) {
		// Enable the button
		$(button).prop("disabled", false);
		// Show the login text and hide the spinner
		$(button).find('.login-text').removeClass('d-none');
		$(button).find('.spinner-border').addClass('d-none');
	}
	//END FUNC LOADING



	// các hàm xử lý phương thức 
	$scope.test = function(event) {
		$scope.startLoad(event.target);
	};
	//LOGIN 

	$scope.register = function(event) {
		console.log($scope.studentR);
		$scope.startLoad(event.target);
		// Gọi API để tạo người dùng mới
		$http.post('/LaughHub/register', $scope.studentR)
			.then(function(response) {
				toastr.success(response.data);////
				$scope.endLoad(event.target);
				setTimeout(function() {
					$window.location.href = '/LaughHub/login';
				}, 1500);
			})
			.catch(function(error) {
				toastr.error(error.data)
				$scope.endLoad(event.target);
			});
	};
	$scope.login = function(event) {
		console.log($scope.studentLogin);
		$scope.startLoad(event.target);
		// Gọi API để tạo người dùng mới
		$http.post('/LaughHub/login', $scope.studentLogin)
			.then(function(response) {
				toastr.success(response.data);////
				$scope.endLoad(event.target);
				setTimeout(function() {
					$window.location.href = '/LaughHub/index';
				}, 1500);
			})
			.catch(function(error) {
				toastr.error(error.data)
				$scope.endLoad(event.target);
			});
	};
	$scope.logout = function(event) {
		NProgress.start();
		$http.get('/LaughHub/logout')
			.then(function(response) {
				toastr.success(response.data);////
				$scope.endLoad(event.target);
				setTimeout(function() {
					$window.location.href = '/LaughHub/login';
				}, 1000);
				NProgress.done();
			})
			.catch(function(error) {
				toastr.error(error.data)
				$scope.endLoad(event.target);
				NProgress.done();
			});
	};
	$scope.sendOTP = function() {
		console.log($scope.email);
		$scope.disableSendOTPButton = true;
		var countDownTime = 10;
		$scope.buttonText = countDownTime.toString();
		var countdown = function() {
			countDownTime--;
			if (countDownTime <= 0) {
				$scope.disableSendOTPButton = false;
				$scope.buttonText = "Gửi OTP";
			} else {
				$scope.buttonText = countDownTime.toString();
				$timeout(countdown, 1000);
			}
		};
		$http.post('/LaughHub/api/forgotpass/sendTP', { email: $scope.email })
			.then(function(response) {
				toastr.success(response.data);
				countdown();
			})
			.catch(function(error) {
				toastr.error(error.data);
				$scope.disableSendOTPButton = false;
				$scope.buttonText = "Gửi OTP"; // Đặt lại nút "Gửi OTP" nếu gặp lỗi khi gọi API
			});
	};


	$scope.checkOTP = function(event) {
		$scope.startLoad(event.target);
		$scope.disableSendOTPButton = true;
		$http.post('/LaughHub/api/forgotpass/checkTP', {
			password: $scope.password,
			otp: $scope.otp,
			email: $scope.email
		})
			.then(function(response) {
				toastr.success(response.data);
				countdown();
			})
			.catch(function(error) {
				$scope.endLoad(event.target);
				toastr.warning(error.data);
				$scope.disableSendOTPButton = false;
				$scope.buttonText = "Gửi OTP"; // Đặt lại nút "Gửi OTP" nếu gặp lỗi khi gọi API
			});
	};




});

app.directive('rePass', function() {
	return {
		require: 'ngModel',
		link: function(scope, element, attr, ngModelCtrl) {
			ngModelCtrl.$validators.rePass = function(modelValue, viewValue) {
				if (!viewValue) return true;
				var pass = scope.studentR ? scope.studentR.password : '';
				var isValid = viewValue === pass;
				return isValid;
			};
		}
	};
});