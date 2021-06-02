<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script type="text/javascript">
$(document).ready(function(){
	$("#cartForm").submit(function(){
		var ans = confirm('장바구니로 이동하겠습니까?');
		
		if(ans) {
			location.href = "cartList";
		}
	});
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
</style>
	<section class="order">
		<div class="content">
			<h2>주문/결제 사항</h2>
			<form role="form" action="/cartAction" method="post" class="payment_form" id="cartForm">
			<fieldset>
				<label>받는 사람 정보</label>
				<div class="content2">
					<input name="user_id" value="${sessionScope.user.user_id}">
					<label>주소</label> <input class="view" name="user_address"
						value="${uvo.user_address}">
				</div>
				<div class="content2">
					<label>이름</label> <input class="view" name="user_name"
						value="${uvo.user_name}">
				</div>
			</fieldset>
			<fieldset>
				<label>결제 정보</label>
				<div class="content2">
					<label>상품 이름</label>
					<input class="view" name="product_name" value="${productVO.product_name}">
				</div>
				<div class="content2">
					<label>상품 개수</label> <input class="view" name="cart_totalcount"
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
	</section>

</html>
<%@include file="../includes/footer.jsp"%>