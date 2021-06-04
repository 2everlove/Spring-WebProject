<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="../../../resources/css/user.css">
<script type="text/javascript">
	$(document).ready(function(){
		$("#errorMsgArea").text('${msg}');	
	});
</script>


	<section class="section__content">
		<div class="section_wrapper">test : ${sessionScope.user}</div>
		
		
			<form role="form" action="/main" method="get">
			<div id="user_upper"></div>
			<div>
				<c:if test="${!empty sessionScope.user}">
				<h3>${msg}</h3>
	          	<button type=submit>메인페이지</button><br>
	          	</c:if>
	        </div>
	       </form>
	</section>

<c:if test="${empty sessionScope.user}">
<p>데이터가 없습니다.</p>
</c:if>
<jsp:include page="../includes/footer.jsp"/>


