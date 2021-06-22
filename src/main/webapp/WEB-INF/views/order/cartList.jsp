<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/css/payment.css">
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function page(page){
	document.listForm.action="/cartList";
	document.listForm.pageNo.value=page;
	document.listForm.submit();
	
}
$(document).ready(function(){
	$("#allCheck").click(function(){
        var chk = $("#allCheck").prop("checked");
        if(chk) {
            $(".checkbox").prop("checked", true);
        } else {
             $(".checkbox").prop("checked", false);
        }
        $(".checkbox").click(function(){
            $("#allCheck").prop("checked", false);
		});
	});
	$("#deleteBtn").click(function(){
		alert('장바구니에서 삭제합니다.');
	});
	$("#checkDelete").click(function(){
		var url = "/delete";
		var valueArr = new Array();
		var list = $("input[class='checkbox']");
		for(var i=0; i<list.length; i++){
			if(list[i].checked){
				valueArr.push(list[i].value);
			}
		}
		if(valueArr.length == 0){
			alert("하나 이상 선택해주세요.");
		} else {
			var chk = confirm("정말 삭제하시겠습니까?");
			$.ajax({
				url: url,
				type: 'POST',
				traditional: true,
				data: {valueArr : valueArr},
				success: function(val){
					if(val = 1){
						alert("삭제 성공");
						location.replace("cartList");
					} else {
						alert("삭제 실패");
					}
				}
			});
		}
	});
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<section class="order">
	<div class="content">
		<h2>장바구니 목록</h2>
		<input type="hidden" name="product_id" value="${cvo.product_id}">
		<p class="orderList">
			<button type="button" onclick="location.href='orderList'">결제 목록</button>
		</p>
			<table width="80%">
				<thead>
					<tr>
						<th><input type="checkbox" id="allCheck">카트 아이디</th>
						<th>받는 사람 이름</th>
						<th>받는 사람 주소</th>
						<th>상품 이름</th>
						<th>가격</th>
						<th>개수</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="cvo" items="${list}">
						<tr>
							<td class="center"><input type="checkbox" value="${cvo.cart_id}" class="checkbox">${cvo.cart_id}</td>
							<td class="center" id="order_name">${cvo.user_name}</td>
							<td class="center" id="order_address">${cvo.user_address}</td>
							<td class="center">${cvo.product_name}</td>
							<td class="center" id="order_totalprice">${cvo.cart_totalprice}</td>
							<td class="center" id="order_totalcount">${cvo.cart_totalcount}</td>
							<td class="center"><a href='/deleteCart?cart_id=${cvo.cart_id}'><button type="button" id="deleteBtn">삭제</button></a></td>
							<td class="center"><a href='/payment?cart_id=${cvo.cart_id}&product_id=${cvo.product_id}&order_totalcount=${cvo.cart_totalcount}&order_totalprice=${cvo.cart_totalprice}&pboard_unit_stocks=${pBoard.pboard_unit_stocks}'>
								<button type="button" id="orderBtn">주문</button></a>
							</td>
						</tr>
					</c:forEach>
					<c:if test="${list.size() == 0 }">
						<tr>
							<td colspan='8' align="center">게시글이 존재하지 않습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<div class="button">
				<button type="button" id="checkDelete">삭제</button>
			</div>
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
			<form method=get action="/cartList" name="listForm">
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