<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<fmt:setBundle basename="client" />
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
					<li class="nav-item ${content.scriptUrl.equals('info') ? 'active' : '' }"><a class="nav-link " href="${pageContext.request.contextPath}/info"><fmt:message key="menu.info"/></a></li>
					<li class="nav-item ${content.scriptUrl.equals('changepass') ? 'active' : '' }"><a class="nav-link "
						href="${pageContext.request.contextPath}/changepass"><fmt:message key="menu.changepass"/></a></li>
					<li class="nav-item ${content.scriptUrl.equals('histories') ? 'active' : '' }"><a class="nav-link" href="${pageContext.request.contextPath}/histories"><fmt:message key="menu.history"/>
					</a></li>
					<li class="nav-item  ${content.scriptUrl.equals('favorites') ? 'active' : '' }"><a class="nav-link" href="${pageContext.request.contextPath}/favorites">
						<fmt:message key="menu.favorite"/> </a></li>
					<li class="nav-item  ${content.scriptUrl.equals('shared') ? 'active' : '' }"><a class="nav-link" href="${pageContext.request.contextPath}/shared"><fmt:message key="menu.share"/>
					</a></li>
					


					
				</ul>

			</div>
		</nav>
	</div>