<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/css/payment.css">
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<section class="order">
	<div class="content">
		<h2>결제/주문</h2>
		<form role="form" action="/productOrder" method="post" class="payment_form">
			<fieldset>
				<label>받는 사람 정보</label>
				<div class="content2">
					<input class="view" name="user_id" value="${sessionScope.user.user_id}">
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
					<label>상품 아이디</label>
					<input class="view" name="product_id" value="${productVO.product_id}">
				</div>
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
					<input class="view" name="order_totalprice" value="${param.order_totalprice}">
				</div>
				<div class="content2">
					<label>재고수</label>
					<input class="view" name="pboard_unit_stocks" value="${pBoard.pboard_unit_stocks}">
				</div>
			</fieldset>
			<button type="submit" id="button" class="detail__btn payment">결제</button>
			<button type="button" id="button" class="detail__btn payment" onclick="location.href='main'">취소</button>
		</form>
	</div>
</section>
</html>
<%@include file="../includes/footer.jsp"%>