<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e6bac257a0b73cfaf15255dbb453d5f&libraries=services"></script>
<script src='//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script type="text/javascript">
$(document).ready(function(){
	$("#cartForm").submit(function(){
		alert('장바구니에 추가합니다.');
	});
	//지도 api
	$('.user_address_search').click(function(){
		let tr = $(this).closest("div");
		var mapContainer = tr.find('#kmap')[0], // 지도를 표시할 div
		mapOption = {
		    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		    level: 5 // 지도의 확대 레벨
		};
		
		//지도를 미리 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new daum.maps.Marker({
		    position: new daum.maps.LatLng(37.537187, 127.005476),
		    map: map
		});
		
		new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수
                tr.find('#kmap').show();
                // 주소 정보를 해당 필드에 넣는다.
                tr.find('.user_address').val(addr+" ");
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
		tr.find('.user_address').select();
	});
	
});
</script>
<link rel="stylesheet" type="text/css" href="/resources/css/payment.css">
	<section class="order">
		<div class="content">
			<h2>주문/결제 사항</h2>
			<form role="form" action="/cartAction" method="post" class="payment_form" id="cartForm">
			<fieldset>
				<input class="view" name="pboard_unit_no" type="text" value="${pBoard.pboard_unit_no}">
				<label>받는 사람 정보</label>
				<div class="content2">
					<input name="user_id" type="hidden" value="${sessionScope.user.user_id}">
					<label>주소</label> 
					<input type="text" name="user_address" class="user_address" value="${uvo.user_address}">
					<input type="button" class="user_address_search" value="주소 검색"><br>
					<div id="kmap" style="width:200px;height:200px;margin-top:10px;display:none"></div>
				</div>
				<div class="content2">
					<label>이름</label> <input class="view" name="user_name"
						value="${uvo.user_name}">
				</div>
			</fieldset>
			<fieldset>
				<label>결제 정보</label>
				<div class="content2">
					<label>상품 이름</label>
					<input name="pboard_unit_price" type="hidden" value="${pBoard.pboard_unit_price}">
					<input class="view" name="product_id" type="hidden" value="${pBoard.product_id}">
					<input class="view" name="product_name" value="${productVO.product_name}">
				</div>
				<div class="content2">
					<label>상품 개수</label> <input class="view" name="cart_totalcount"
						value="${param.order_totalcount}">
				</div>
				<div class="content2">
					<label>총 결제 금액</label> <input class="view" name="cart_totalprice"
						value="${pBoard.pboard_unit_price * param.order_totalcount}">
				</div>
				<div class="content2">
					<label>재고수</label>
					<input class="view" name="pboard_unit_stocks" value="${pBoard.pboard_unit_stocks}">
				</div>
			</fieldset>
			<button type="submit" class="detail__btn cart">장바구니 담기</button>
			</form>
		</div>
	</section>

</html>
<%@include file="../includes/footer.jsp"%>