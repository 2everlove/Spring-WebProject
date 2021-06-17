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
	$(".button").click(function(){
		let tr = $(this).closest("tr");
		let formData = new FormData();
		let formDataorder_id = tr.find(".order_id").val();
		let formDataorder_status = tr.find(".order_status").val();
		let formDataorder_name = tr.find(".order_name").val();
		let formDataorder_address = tr.find(".order_address").val();
		let formDataproduct_id = tr.find(".product_id").val();
		let formDataorder_totalprice = tr.find(".order_totalprice").val();
		let formDataorder_totalcount = tr.find(".order_totalcount").val();
		formData.append('order_id',formDataorder_id);
		formData.append('order_status',formDataorder_status);
		formData.append('order_name',formDataorder_name);
		formData.append('order_address',formDataorder_address);
		formData.append('product_id',formDataproduct_id);
		formData.append('order_totalprice',formDataorder_totalprice);
		formData.append('order_totalcount',formDataorder_totalcount);
		console.log(formDataorder_id);
		updateOrderList(formData ,$(this));
	});
});

function updateOrderList(formData, btn){
	$.ajax({
		url : '/admin/updateOrderList',
		method : 'POST',
		dataType : 'json',
		processData : false,
		contentType : false,
		data : formData,
		success : function(){
			console.log(formData.get('order_status'));
			btn.closest("tr").find('.torder_status').html(formData.get('order_status'));
			alert(formData.get('order_id')+"번 주문이 수정되었습니다.");
		},
		error : function(errorThrown){
			console.log(errorThrown);
		}
	});
}
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
							<td>${ovo.order_id}</td>
							<td ><span class="torder_status">${ovo.order_status}</span>
 							<select class="order_status" name="selectStatus">
								<option value="0"<c:if test="${ovo.order_status == 0}">selected</c:if>>주문 취소</option>
								<option value="1"<c:if test="${ovo.order_status == 1}">selected</c:if>>주문 완료</option>
								<option value="2"<c:if test="${ovo.order_status == 2}">selected</c:if>>택배사 전달</option>
								<option value="3"<c:if test="${ovo.order_status == 3}">selected</c:if>>배송준비</option>
								<option value="4"<c:if test="${ovo.order_status == 4}">selected</c:if>>배송 중</option>
								<option value="5"<c:if test="${ovo.order_status == 5}">selected</c:if>>배송 완료</option>
							</select>
							</td>
							<td class="torder_name">${ovo.order_name}</td>
							<td class="torder_address">${ovo.order_address}</td>
							<td class="tproduct_id">${ovo.product_id}</td>
							<td class="torder_totalprice">${ovo.order_totalprice}</td>
							<td class="torder_totalcount">${ovo.order_totalcount}</td>
							<td class="center"><button type="button" class="button">저장</button></td>
							<input type="hidden" class="order_id" value="${ovo.order_id}">
							<input type="hidden" class="order_status" value="${ovo.order_status}">
							<input type="hidden" class="order_name" value="${ovo.order_name}">
							<input type="hidden" class="order_address" value="${ovo.order_address}">
							<input type="hidden" class="product_id" value="${ovo.product_id}">
							<input type="hidden" class="order_totalprice" value="${ovo.order_totalprice}">
							<input type="hidden" class="order_totalcount" value="${ovo.order_totalcount}">
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