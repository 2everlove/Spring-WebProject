<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/css/payment.css">
<link rel="stylesheet" type="text/css" href="/resources/css/nboard.css">
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function page(page){
	document.listForm.action="/orderList";
	document.listForm.pageNo.value=page;
	document.listForm.submit();
	
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
					<th>받는 사람 이름</th>
					<th>받는 사람 주소</th>
					<th>상품 이름</th>
					<th>가격</th>
					<th>개수</th>
					<th>주문일</th>
					<th>배송 현황</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="ovo" items="${list}">
					<tr>
						<td class="center">${ovo.num}</td>
						<td class="center">${ovo.order_name}</td>
						<td class="center">${ovo.order_address}</td>
						<td class="center">${ovo.product_name}</td>
						<td class="center">${ovo.order_totalprice}</td>
						<td class="center">${ovo.order_totalcount}</td>
						<td class="center">
						<fmt:parseDate value="${ovo.order_regdate}" pattern="yyyy-MM-dd" var="order_regdate" />
						<fmt:formatDate value="${order_regdate}" pattern="yyyy-MM-dd" var="regDate"/>
						
						${regDate}
						</td>
						<td><a href='/orderStatus?order_id=${ovo.order_id}'><button type="button">배송 현황</button></a></td>
						<input type="hidden" class="pboard_user_id" value="${ovo.pboard_user_id}">
					</tr>
				</c:forEach>
				<c:if test="${list.size() == 0 }">
					<tr>
						<td colspan='6' align="center">주문이 존재하지 않습니다.</td>
					</tr>
				</c:if>

			</tbody>
		</table>
		<!-- 페이징 처리 -->
		<div id="pagination-box">
				<nav>
					<ul class="pagination" style="text-align: center; margin: 0 auto;">
						<c:if test="${pageNavi.prev}">
							<li onClick="javascript:page(${pageNavi.startPage-1});"><a href="#" tabindex="-1">&lt;</a></li>
						</c:if>
						<c:forEach begin="${pageNavi.startPage }" end="${pageNavi.endPage }" var="page">
							<c:choose>
								<c:when test="${page eq pageNavi.cri.pageNo }">
									<li onClick="page(${page })"><a href="#">${page }<span class="active"></span></a></li> <!-- 현재페이지 -->
								</c:when>
								<c:otherwise>
									<li onClick="page(${page })"><a href="#">${page }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pageNavi.next}">
							<li onClick="page(${pageNavi.endPage+1});"><a href="#">&gt;</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
			<!-- 페이징 끝 -->
			<form method=get action="/orderList" name="listForm">
                 <!-- 상세보기 검색 유지용 -->
                 ${pageNavi.cri.type }
                 <input type=hidden name=pageNo value=${pageNavi.cri.pageNo }>
                 <input type=hidden name=orderby value=${pageNavi.cri.orderby }> 
                 <!-- 상세보기 검색 유지용 끝 -->
			</form>
	</div>
</section>
</html>
<%@include file="../includes/footer.jsp"%>