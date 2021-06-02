<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
.content {
	padding: 150px;
}
h2{
	text-align: center;
	padding-bottom: 50px;
}
.center{
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<section class="order">
	<div class="content">
		<h2>장바구니 목록</h2>
		<table width="80%">
			<thead>
				<tr>
					<th>받는 사람 이름</th>
					<th>받는 사람 주소</th>
					<th>상품 이름</th>
					<th>장바구니 총 가격</th>
					<th>장바구니 총 상품 개수</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="cvo" items="${list}">
					<tr>
						<td class="center">${cvo.user_name}</td>
						<td class="center">${cvo.user_address}</td>
						<td class="center">${cvo.product_name}</td>
						<td class="center">${cvo.cart_totalprice}</td>
						<td class="center">${cvo.cart_totalcount}</td>
					</tr>
				</c:forEach>

				<c:if test="${list.size() == 0 }">
					<tr>
						<td colspan='5' align="center">게시글이 존재하지 않습니다.</td>
					</tr>
				</c:if>

			</tbody>
		</table>
	</div>
</section>
</html>
<%@include file="../includes/footer.jsp"%>