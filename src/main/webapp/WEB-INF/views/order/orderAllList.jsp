<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/css/payment.css">
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
$(document).ready(function(){
	$("#button").click(function(){
		
	});
});
</script>
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
						<th>주문 상태</th>
						<th>받는 사람 이름</th>
						<th>받는 사람 주소</th>
						<th>상품 아이디</th>
						<th>가격</th>
						<th>개수</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ovo" items="${list}">
						<tr>
							<td class="center"><input type="text" id="order_id" value="${ovo.order_id}">${ovo.order_id}</td>
							<td class="center"><input type="text" id="order_status" value="${ovo.order_status}">${ovo.order_status}
 							<select id="selectStatus">
								<option value="${ovo.order_status}"<c:if test="${ovo.order_status == 0}">selected</c:if>>0</option>
								<option value="${ovo.order_status}"<c:if test="${ovo.order_status == 1}">selected</c:if>>1</option>
								<option value="${ovo.order_status}"<c:if test="${ovo.order_status == 2}">selected</c:if>>2</option>
								<option value="${ovo.order_status}"<c:if test="${ovo.order_status == 3}">selected</c:if>>3</option>
								<option value="${ovo.order_status}"<c:if test="${ovo.order_status == 4}">selected</c:if>>4</option>
								<option value="${ovo.order_status}"<c:if test="${ovo.order_status == 5}">selected</c:if>>5</option>
							</select>
							</td>
							<td class="center">${ovo.order_name}</td>
							<td class="center">${ovo.order_address}</td>
							<td class="center">${ovo.product_id}</td>
							<td class="center">${ovo.order_totalprice}</td>
							<td class="center">${ovo.order_totalcount}</td>
							<td class="center"><button type="button" id="button" onclick="location.href='updateOrderList?order_status=${ovo.order_status}&order_id=${ovo.order_id}'">저장</button></td>
						</tr>
					</c:forEach>
					<c:if test="${list.size() == 0 }">
						<tr>
							<td colspan='8' align="center">주문이 존재하지 않습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
	</div>
</section>
</html>
<%@include file="../includes/footer.jsp"%>