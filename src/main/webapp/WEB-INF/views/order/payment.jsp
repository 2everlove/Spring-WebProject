<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#paymentAction").submit(function(){
		alert("결제 성공했습니다.\n수량은 "+$('#amount option:selected').val()+"개 입니다.");
	});
});
</script>
<style>
.order { text-align: center; }
fieldset { text-align: left; width: 70%; margin: 30px auto; }
.content2 { padding: 10px; }
.content { padding: 150px; }
.button{
    background-color: transparent;
    cursor: pointer;
    border: none;
    outline: none;
}
.view{ font-size: 0.9em; }
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
					<label>상품 개수</label>
					<select id="amount">
						<c:forEach begin="1" end="10" var="i">
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>
				</div>
				<div class="content2">
					<label>총 결제 금액</label> <label class="view">${pvo.pboard_unit_price}</label>
				</div>
			</fieldset>
			<button type="submit" id="button">결제</button>
			<input class="button" type="button" value="장바구니" onclick="location.href='cart'">
		</form>
	</div>
</body>
</html>
<%@include file="../includes/footer.jsp" %>