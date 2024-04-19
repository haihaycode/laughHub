
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<ul class="navbar-nav ml-auto ml-md-0 osahan-right-navbar">

	<li class="nav-item dropdown no-arrow mx-1"><a
		class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
		role="button" data-toggle="dropdown" aria-haspopup="true"
		aria-expanded="false"> <i class="fas fa-language"></i> <span
			class="badge badge-danger">${lang}</span>
	</a>
		<div class="dropdown-menu dropdown-menu-right"
			aria-labelledby="alertsDropdown">

			<form action="${pageContext.request.contextPath}/lang" method="post">

				<button class="dropdown-item ${lang.equals('en') ? 'active' : '' }"" name="language" value="en"
					type="submit">
					<i class="fas fa-globe"></i> &nbsp;English
				</button>
				<button class="dropdown-item ${lang.equals('vi') ? 'active' : '' }"" name="language" value="vi"
					type="submit">
					<i class="fas fa-globe"></i> &nbsp;Tiếng việt
				</button>

			</form>


		</div></li>

</ul>