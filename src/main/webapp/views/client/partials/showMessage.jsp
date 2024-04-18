<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:if test="${not empty sessionScope.message}">
	<script type="text/javascript">

function checkAndShowMessage() {
	var message = `<%=session.getAttribute("message")%>
	`;
		if (message != null) {
			if(message.includes("(lỗi)")){
				toastr.warning(message);
			}else{
				toastr.success(message);
			}
			
		}
	}
	window.onload = checkAndShowMessage;
</script>

</c:if>
