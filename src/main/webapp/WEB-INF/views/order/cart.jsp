<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
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
			<fieldset>
				<label>받는 사람 정보</label>
				<div class="content2">
					<label>주소</label> <input class="view" name="order_address"
						value="${ovo.order_address}">
				</div>
				<div class="content2">
					<label>이름</label> <input class="view" name="order_name"
						value="${ovo.order_name}">
				</div>
			</fieldset>
			<fieldset>
				<label>결제 정보</label>
				<div class="content2">
					<label>결제일</label> <input class="view" name="order_regdate"
						value="${ovo.order_regdate}">
				</div>
				<div class="content2">
					<label>상품 개수</label> <input class="view" name="order_totalcount"
						value="${ovo.order_totalcount}">
				</div>
				<div class="content2">
					<label>총 결제 금액</label> <input class="view" name="order_totalprice"
						value="${ovo.totalprice}">
				</div>
			</fieldset>
		</div>
	</section>

</html>
<%@include file="../includes/footer.jsp"%>