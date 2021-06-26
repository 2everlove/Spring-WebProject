<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
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
</style>
</head>
<body class="order">
	<div class="content">
		<h2>장바구니 추가</h2>
		<form role="form" action="/insertCart" method="post" class="payment_form">
			<fieldset>
				<label>받는 사람 정보</label>
				<div class="content2">
					<input class="view" type="hidden" name="user_id"
						value="${pBoard.user_id}"> <label>이름</label> <input
						class="view" name="user_name" value="${uvo.user_name}">
				</div>
				<div class="content2">
					<label>주소</label> <input class="view" name="user_address"
						value="${uvo.user_address}">
				</div>
			</fieldset>
			<fieldset>
				<label>결제 정보</label>
				<div class="content2">
					<label>상품 이름</label> <input class="view" name="product_name"
						value="${productVO.product_name}">
				</div>
				<div class="content2">
					<label>상품 개수</label> <input class="view" name=cart_totalcount
						value="${param.order_totalcount}">
				</div>
				<div class="content2">
					<label>총 결제 금액</label> <input class="view" name="cart_totalprice"
						value="${pBoard.pboard_unit_price * param.order_totalcount}">
				</div>
			</fieldset>
			<button type="submit" class="detail__btn cart">장바구니 담기</button>
		</form>
	</div>
</body>

</html>
<%@include file="../includes/footer.jsp"%>