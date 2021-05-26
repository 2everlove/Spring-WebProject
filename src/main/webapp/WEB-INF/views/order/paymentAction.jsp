<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#amount option:selected").text();
});
</script>
<style type="text/css">
body { text-align: center; }
fieldset { text-align: left; width: 70%; margin: 30px auto; }
.content2 { padding: 10px; }
.view{ font-size: 0.9em; }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>결제 성공했습니다.</h2>
	<fieldset>
		<label>받는 사람 정보</label>
		<div class="content2">
			<label>이름</label> <label class="view">${vo.user_name}</label>
		</div>
		<div class="content2">
			<label>주소</label> <label class="view">${vo.user_address}</label>
		</div>
	</fieldset>
	<fieldset>
		<label>결제 정보</label>
		<div class="content2">
			<label>상품 아이디</label> <label class="view">${pvo.product_id}</label>
		</div>
		<div class="content2">
			<label>상품 개수</label> <label class="view">${amoun.i}</label>
		</div>
		<div class="content2">
			<label>총 결제 금액</label> <label class="view">${pvo.pboard_unit_price * i}</label>
		</div>
	</fieldset>
	<p>
		<a href="/cart">장바구니</a>
		<a href="/myPage">마이페이지</a>
	</p>
</body>
</html>