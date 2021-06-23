<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/main.css">
<script type="text/javascript" defer="defer">
document.title = '${sellerVO.user_name} : widele';
$(document).ready(function() {
	let type="${pBoard.pboard_unit_enabled}";
	let utype="${sessionScope.user.user_type}";
	if(type=="1"){
		if(utype=="0"){
		} else {
			alert("판매가 중지된 상품입니다.");
			history.back();
		}
	}
	if ($("input[name=order_totalcount]").val() == 1) {
		$("input[name=pboard_unit_stocks]").val('${pBoard.pboard_unit_stocks}'-1);
	}
	$(".up-button").click(function() {
		let tempcount = $("input[name=order_totalcount]").val();
		let totalcount = Number(tempcount) + 1;
		var stock = '${pBoard.pboard_unit_stocks}';
		var price = '${pBoard.pboard_unit_price}';
		let totalprice = Number(totalcount) * price;
		let stocks = stock - Number(totalcount);
		$("input[name=order_totalcount]").val(totalcount);
		$("input[name=order_totalprice]").val(totalprice);
		$("input[name=pboard_unit_stocks]").val(stocks);
	});
	$(".down-button").click(function() {
		let tempcount = $("input[name=order_totalcount]").val();
		let totalcount = 0;
		var price = '${pBoard.pboard_unit_price}';
		var stock = '${pBoard.pboard_unit_stocks}';
		if (Number(tempcount) <= 1) {
			totalcount = 1;
		} else {
			totalcount = Number(tempcount) - 1;
		}
		let totalprice = Number(totalcount) * price;
		let stocks = stock - Number(totalcount);
		$("input[name=order_totalcount]").val(totalcount);
		$("input[name=order_totalprice]").val(totalprice);
		$("input[name=pboard_unit_stocks]").val(stocks);
	});
	

});
</script>
<!-- 페이징, 목록, 가격, 정렬 -->
<section class="section__content">
	<!-- New -->
	<div class="section__wrapper">
		<div class="section__productsList" id="new">
			<div class="detail__wrapper">
				<c:forEach var="fileThum" items="${fileThumList }">
					<c:url value="/fileDisplay" var="urlThum">
						<c:param name="file_name" value="${fileThum.file_s_savePath}"></c:param>
					</c:url>
					<img src="${urlThum }" class="thumnail__products-detail">
				</c:forEach>

				<form method="get" class="detail__form">
					<div>
						<input type="hidden" value="${pBoard.pboard_unit_no}"
							name="pboard_unit_no"> <input type="hidden"
							value="${pBoard.file_pictureId}" name="file_pictureId">
						<input type="hidden" value="${pBoard.pboard_unit_price}"
							name="pboard_unit_price">
						<input type="hidden" value="${pBoard.product_id}"
							name="product_id"> <input type="hidden"
							value="${pBoard.user_id}" name="user_id">

						<fmt:formatNumber type="number" maxFractionDigits="3"
							value="${pBoard.pboard_unit_price}" var="price"></fmt:formatNumber>
						<fmt:formatNumber type="number" maxFractionDigits="3"
							value="${pBoard.pboard_unit_stocks}" var="stocks"></fmt:formatNumber>
						<fmt:formatDate var="regdate"
							value="${pBoard.pboard_unit_regdate}" pattern="yy.MM.dd"
							timeZone="Asia/Seoul" />
						<fmt:formatDate var="updateDate"
							value="${pBoard.pboard_unit_updateDate}" pattern="yy.MM.dd"
							timeZone="Asia/Seoul" />
						<p>
							제품 <span>${productVO.product_name}</span>
						<p>
							가격 <span>${price}</span>
						<p>
							재고 <span><input type="text" value="${stocks}" name="pboard_unit_stocks"></span>
						<p>
							<span class="detail__count"><input type="text"
								name="order_totalcount" class="detail__count-input" value="1">
								<span>
									<button type="button" class="up-button">
										<i class="fas fa-chevron-up"></i>
									</button>
									<button type="button" class="down-button">
										<i class="fas fa-chevron-down"></i>
									</button>
								</span>
							</span>
						<p>
							총금액 <span><input type="text" value="${price}" name="order_totalprice" readonly></span>
						<p>
							등록일 <span>${regdate}</span>
						<p>
							수정일 <span>${updateDate}</span> 
						<p>
							<input type="submit" class="detail__btn payment" value="결제" onclick="javascript: form.action='/payment';" />
							<input type="submit" class="detail__btn cart" value="장바구니" onclick="javascript: form.action='/cart';" />
					</div>
				</form>
			</div>
			<div class="detail__var">
				<ul role="menuitem">
					<li><a href="javascript:void(0)" role="presentation">상세정보</a></li>
					<li><a href="javascript:void(0)" role="presentation">리뷰</a></li>
				</ul>
			</div>
			<div class="detail__description">
				<ul id="fileList">
					<c:forEach var="fileDesc" items="${fileDescList }">
						<c:url value="/fileDisplay" var="urlDesc">
							<c:param name="file_name" value="${fileDesc.file_savePath}"></c:param>
						</c:url>
						<img src="${urlDesc}" class='detail__description-img'>
					</c:forEach>
				</ul>
			</div>
			<%@include file="reviewproduct.jsp"%>
		</div>
	</div>
</section>


<%@include file="../includes/footer.jsp"%>
<script type="text/javascript" src="/resources/js/detail.js">
<!--
	
//-->
</script>