<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<fmt:setBundle basename="client" />
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm modal-dialog-centered"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel"><fmt:message key="menu.areyoulogout"/></h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body"><fmt:message key="menu.mess_logout"/></div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal"><fmt:message key="menu.cancel"/></button>
				<button type="button" class="btn btn-primary  rounded"
					ng-click="logout($event)">
					<span class="spinner-border d-none"></span> <fmt:message key="menu.logout"/>
				</button>
			</div>
		</div>
	</div>
</div>