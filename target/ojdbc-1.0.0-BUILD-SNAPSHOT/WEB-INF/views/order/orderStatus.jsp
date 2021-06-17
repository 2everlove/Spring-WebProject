<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/css/payment.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<section class="order">
	<div class="content">
		<c:if test="${ovo.order_status == 0}">
		<p class="status">주문 취소</p>
		</c:if>
		<c:if test="${ovo.order_status == 1}">
		<p class="status">주문 완료</p>
		</c:if>
		<c:if test="${ovo.order_status == 2}">
		<p class="status">택배사 전달</p>
		</c:if>
		<c:if test="${ovo.order_status == 3}">
		<p class="status">배송 준비</p>
		</c:if>
		<c:if test="${ovo.order_status == 4}">
		<p class="status">배송중</p>
		</c:if>
		<c:if test="${ovo.order_status == 5}">
		<p class="status">배송 완료</p>
		</c:if>
</div>
</section>
</html>
<%@include file="../includes/footer.jsp"%>