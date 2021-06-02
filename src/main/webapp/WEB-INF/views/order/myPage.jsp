<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style>
.order { text-align: center; }
fieldset { text-align: left; width: 70%; margin: 30px auto; }
.content2 { padding: 10px; }
.content { padding: 150px; }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="order">
	<div class="content">
	<h2>주문/결제</h2>
		<form id="paymentAction" role="form" action="/paymentAction" method="post">
			<fieldset>
				<label>받는 사람 정보</label>
				<div class="content2">
					<label>이름</label> <input placeholder="name" name="name"
						type="text">
				</div>
				<div class="content2">
					<label>주소</label> <input placeholder="address" name="address"
						type="text">
				</div>
			</fieldset>
			<fieldset>
				<label>결제 정보</label>
				<div class="content2">
					<label>상품 아이디</label> <input placeholder="productId" name="productId"
						type="text">
				</div>
				<div class="content2">
					<label>상품 개수</label>
					<select name="amount">
						<c:forEach begin="1" end="10" var="i">
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>
				</div>
				<div class="content2">
					<label>상품 색깔</label> <input placeholder="productColor" name="productColor"
						type="text">
				</div>
				<div class="content2">
					<label>총 결제 금액</label> <input placeholder="totalPrice" name="totalPrice"
						type="text">
				</div>
			</fieldset>
			<button type="submit">결제</button>
		</form>
	</div>
</body>
</html>
<%@include file="../includes/footer.jsp" %>