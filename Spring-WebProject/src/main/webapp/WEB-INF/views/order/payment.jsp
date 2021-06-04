<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		console.log(count);
	});
</script>
<style>
.order {
	text-align: center;
}

fieldset {
	text-align: left;
	width: 70%;
	margin: 30px auto;
}

.content2 {
	padding: 10px;
}

.content {
	padding: 150px;
}

.button {
	background-color: transparent;
	cursor: pointer;
	border: none;
	outline: none;
}

.view {
	font-size: 0.9em;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="order">
	<div class="content">
		<h2>결제/주문</h2>
		<form role="form" action="/productOrder" method="post" class="payment_form">
			<fieldset>
				<label>받는 사람 정보</label>
				<div class="content2">
					<input class="view" name="user_id" value="${pBoard.user_id}">
					<label>이름</label>
					<input class="view" name="order_name" value="${uvo.user_name}">
				</div>
				<div class="content2">
					<label>주소</label>
					<input class="view" name="order_address" value="${uvo.user_address}">
				</div>
			</fieldset>
			<fieldset>
				<label>결제 정보</label>
				<div class="content2">
					<label>상품 이름</label>
					<input class="view" name="product_name" value="${productVO.product_name}">
				</div>
				<div class="content2">
					<label>상품 개수</label>
					<input class="view" name="order_totalcount" value="${param.order_totalcount}">
				</div>
				<div class="content2">
					<label>총 결제 금액</label>
					<input class="view" name="order_totalprice" value="${pBoard.pboard_unit_price * param.order_totalcount}">
				</div>
			</fieldset>
			<button type="submit" id="button">결제</button>
			<input class="button" type="button" value="장바구니"
				onclick="location.href='cart'">
		</form>
	</div>
</body>
</html>
<%@include file="../includes/footer.jsp"%>