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
		<div class="status">
			<i class="fas fa-times fa-4x"></i>
			<div>주문 취소</div>
		</div>
		</c:if>
		<c:if test="${ovo.order_status == 1}">
		<div class="status">
			<div class="detail">
				<i class="fas fa-credit-card fa-6x"></i>
				<p>주문 완료</p>
			</div>
			<div class="detail">
				<i class="fas fa-box fa-4x" style="color:#e2e2e2;"></i>
				<p>택배사 전달</p>
			</div>
			<div class="detail">
				<i class="fas fa-truck-loading fa-4x" style="color:#e2e2e2;"></i>
				<p>배송 준비</p>
			</div>
			<div class="detail">
				<i class="fas fa-shipping-fast fa-4x" style="color:#e2e2e2;"></i>
				<p>배송중</p>
			</div>
			<div class="detail">
				<i class="fas fa-check fa-4x" style="color:#e2e2e2;"></i>
				<p>배송 완료</p>
			</div>
		</div>
		</c:if>
		<c:if test="${ovo.order_status == 2}">
		<div class="status">
			<div class="detail">
				<i class="fas fa-credit-card fa-4x" style="color:#e2e2e2;"></i>
				<p>주문 완료</p>
			</div>
			<div class="detail">
				<i class="fas fa-box fa-6x"></i>
				<p>택배사 전달</p>
			</div>
			<div class="detail">
				<i class="fas fa-truck-loading fa-4x" style="color:#e2e2e2;"></i>
				<p>배송 준비</p>
			</div>
			<div class="detail">
				<i class="fas fa-shipping-fast fa-4x" style="color:#e2e2e2;"></i>
				<p>배송중</p>
			</div>
			<div class="detail">
				<i class="fas fa-check fa-4x" style="color:#e2e2e2;"></i>
				<p>배송 완료</p>
			</div>
		</div>
		</c:if>
		<c:if test="${ovo.order_status == 3}">
		<div class="status">
			<div class="detail">
				<i class="fas fa-credit-card fa-4x" style="color:#e2e2e2;"></i>
				<p>주문 완료</p>
			</div>
			<div class="detail">
				<i class="fas fa-box fa-4x" style="color:#e2e2e2;"></i>
				<p>택배사 전달</p>
			</div>
			<div class="detail">
				<i class="fas fa-truck-loading fa-6x"></i>
				<p>배송 준비</p>
			</div>
			<div class="detail">
				<i class="fas fa-shipping-fast fa-4x" style="color:#e2e2e2;"></i>
				<p>배송중</p>
			</div>
			<div class="detail">
				<i class="fas fa-check fa-4x" style="color:#e2e2e2;"></i>
				<p>배송 완료</p>
			</div>
		</div>
		</c:if>
		<c:if test="${ovo.order_status == 4}">
		<div class="status">
			<div class="detail">
				<i class="fas fa-credit-card fa-4x" style="color:#e2e2e2;"></i>
				<p>주문 완료</p>
			</div>
			<div class="detail">
				<i class="fas fa-box fa-4x" style="color:#e2e2e2;"></i>
				<p>택배사 전달</p>
			</div>
			<div class="detail">
				<i class="fas fa-truck-loading fa-4x" style="color:#e2e2e2;"></i>
				<p>배송 준비</p>
			</div>
			<div class="detail">
				<i class="fas fa-shipping-fast fa-6x"></i>
				<p>배송중</p>
			</div>
			<div class="detail">
				<i class="fas fa-check fa-4x" style="color:#e2e2e2;"></i>
				<p>배송 완료</p>
			</div>
		</div>
		</c:if>
		<c:if test="${ovo.order_status == 5}">
		<div class="status">
			<div class="detail">
				<i class="fas fa-credit-card fa-4x" style="color:#e2e2e2;"></i>
				<p>주문 완료</p>
			</div>
			<div class="detail">
				<i class="fas fa-box fa-4x" style="color:#e2e2e2;"></i>
				<p>택배사 전달</p>
			</div>
			<div class="detail">
				<i class="fas fa-truck-loading fa-4x" style="color:#e2e2e2;"></i>
				<p>배송 준비</p>
			</div>
			<div class="detail">
				<i class="fas fa-shipping-fast fa-4x" style="color:#e2e2e2;"></i>
				<p>배송중</p>
			</div>
			<div class="detail">
				<i class="fas fa-check fa-6x"></i>
				<p>배송 완료</p>
			</div>
		</div>
		</c:if>
</div>
</section>
</html>
<%@include file="../includes/footer.jsp"%>