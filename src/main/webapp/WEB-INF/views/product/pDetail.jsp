<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>
<script type="text/javascript" defer="defer">
	document.title='${sellerVO.user_nickname} : widele';
	$(document).ready(function(){
		$(".up-button").click(function(){
			let tempcount = $("input[name=order_totalcount]").val();
			let totalcount = Number(tempcount)+1;
			$("input[name=order_totalcount]").val(totalcount);
		});
		$(".down-button").click(function(){
			let tempcount = $("input[name=order_totalcount]").val();
			let totalcount = 0;
			if(Number(tempcount)<=1){
				totalcount = 1;
			} else {
				totalcount = Number(tempcount)-1;
			}
				$("input[name=order_totalcount]").val(totalcount);
		});
		
		if("${fileList}"!=""){
			viewFile();
		}
	});
	
	
	//파일view
	function viewFile(){
		$.ajax({
			url:'/fileUploadAjax/'+'${fileList.file_pictureId}',
			method : 'get',
			dataType : 'json',
			success : function(datas){
				let result ="";
				$.each(datas, function(i, data){
					console.log(data);
					//이미지 썸네일의 경로를 인코딩 처리해서 서버에 보냄
					
					var file_s_savePath = encodeURIComponent(data.file_s_savePath);
					var file_savePath = encodeURIComponent(data.file_savePath);
					console.log(file_s_savePath);
					console.log(data.file_s_savePath);
					
					console.log("인코딩 후 : "+file_savePath);
					let fName = data.file_name;
					//만약 이미지면 이미지 보여줌
					if(data.file_type=='Y'){
						result += "<li>"
									+"<img id='detail__description-img' src=/fileDisplay?file_name="+file_s_savePath+" style=' width: 100%; height: 100%; object-fit: cover;'></li>";
					} else {
						//이미지가 아니면 파일이름을 출력
						result += "<li>"
									+"<a href=/fileDisplay?file_name="+file_savePath+" download='"+fName +"'></li>";
					}
					
				});
				if(datas.length == 0){
					alert(file_pictureId+'번에 해당하는 데이터가 없습니다. 다시 검색해주세요.');
					$('#file_pictureId').val("");
					$('#file_pictureId').select();
				}
				$('#fileList').html(result);
				if($(location).attr('pathname').match('/board/get')){
					$('span[data-type=image]').remove();
				}
				
			},
			error : function(){
				
			}
		});
	}
</script>
    <!-- 페이징, 목록, 가격, 정렬 -->
    <section class="section__content">
        <!-- New -->
        <div class="section__wrapper">
        	<div class="section__productsList">
	        	<div class="detail__wrapper">
	        	 
	        		<img src="/resources/images/Apple/Tablet/ipad4.png" class="thumnail__products-detail">
	        		<form action="/order/productOrder" method="post" class="detail__form">
				    	<div>
				    		<input type="hidden" value="${pBoard.pboard_unit_no}" name="pboard_unit_no">
				    		<input type="hidden" value="${pBoard.file_pictureId}" name="file_pictureId">
				    		<input type="hidden" value="${pBoard.pboard_unit_regdate}" name="pboard_unit_regdate">
				    		<input type="hidden" value="${pBoard.pboard_unit_updateDate}" name="pboard_unit_updateDate">
				    		<input type="hidden" value="${pBoard.pboard_unit_price}" name="pboard_unit_price">
				    		<input type="hidden" value="${pBoard.pboard_unit_stocks}" name="pboard_unit_stocks">
				    		<input type="hidden" value="${pBoard.product_id}" name="product_id">
				    		<input type="hidden" value="${pBoard.user_id}" name="user_id">
				    		
				    		<fmt:formatNumber type="number" maxFractionDigits="3" value="${pBoard.pboard_unit_price}" var="price"></fmt:formatNumber>
				    		<fmt:formatNumber type="number" maxFractionDigits="3" value="${pBoard.pboard_unit_stocks}" var="stocks"></fmt:formatNumber>
				    		<fmt:formatDate var="regdate" value="${pBoard.pboard_unit_regdate}" pattern="yy.MM.dd" timeZone="Asia/Seoul"/>
				    		<fmt:formatDate var="updateDate" value="${pBoard.pboard_unit_updateDate}" pattern="yy.MM.dd" timeZone="Asia/Seoul"/>
				    		<p>제품 <span>${productVO.product_name}</span>
				    		<p>가격 <span>${price}</span>
				    		<p>재고 <span> ${stocks}</span>
				    		<p><span class="detail__count"><input type="text" name="order_totalcount" class="detail__count-input" value="1">
					    			<span>
					    				<button type="button" class="up-button"><i class="fas fa-chevron-up"></i></button>
					    				<button type="button" class="down-button"><i class="fas fa-chevron-down"></i></button>
					    			</span>
				    			</span>
				    		
				    		<p>등록일 <span>${regdate}</span>
				    		<p>수정일 <span>${updateDate}</span>
				    		<p><button type="button" class="detail__btn cart">장바구니</button>
				    		<button type="button" class="detail__btn purchase">구매하기</button>
				    	</div>
	        		</form>
	        	</div>
		    	<div class="detail__var">
		    		<ul role="menuitem">
		    			<li><a href="javascript:void(0)" role="presentation">상세정보</a></li>
		    			<li><a href="javascript:void(0)" role="presentation">리뷰</a></li>
		    			<li><a href="javascript:void(0)" role="presentation">Q&A</a></li>
		    		</ul>
		    	</div>
		    	<div class="detail__description">
		    		<ul id="fileList">
			
					</ul>
		    	</div>
		    	
	    	</div>
    	</div>
   	</section>
   	

<%@include file="../includes/footer.jsp" %>