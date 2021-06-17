<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/css/payment.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<section class="order">
	<div class="content">
		<h2>결제 목록</h2>
		<table width="80%">
			<thead>
				<tr>
					<th>주문 아이디</th>
					<th>받는 사람 이름</th>
					<th>받는 사람 주소</th>
					<th>상품 아이디</th>
					<th>가격</th>
					<th>개수</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="ovo" items="${list}">
					<tr>
						<td class="center"><a href='/orderStatus?order_id=${ovo.order_id}'>${ovo.order_id}</a></td>
						<td class="center">${ovo.order_name}</td>
						<td class="center">${ovo.order_address}</td>
						<td class="center">${ovo.product_id}</td>
						<td class="center">${ovo.order_totalprice}</td>
						<td class="center">${ovo.order_totalcount}</td>
					</tr>
				</c:forEach>
				<c:if test="${list.size() == 0 }">
					<tr>
						<td colspan='6' align="center">주문이 존재하지 않습니다.</td>
					</tr>
				</c:if>

			</tbody>
		</table>
	</div>
</section>
</html>
<%@include file="../includes/footer.jsp"%>