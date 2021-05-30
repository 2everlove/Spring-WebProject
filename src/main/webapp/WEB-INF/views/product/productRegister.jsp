<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>
<script type="text/javascript">
	document.title='상품등록 : widele';
	$(document).ready(function(){
		$(".search__select").hide();
		
		$(".code_type").change(function(){
			let parentElement = $(this).closest("div");
			$(parentElement).find('select').hide();
			$(parentElement).find('option').remove();
			if($(this).val()!=""){
				checkProductName($(this).attr("name"), $(this).val(), parentElement);
			}
		});
		
		$(".search__select").focusout(function(){
			console.log("fo");
			let parentElement = $(this).closest("div");
			$(parentElement).find('select').hide();
			$(parentElement).find('option').remove();
		});
		
		$(".search__select").click(function(){
				let searchValue = $(this).val();
				console.log(searchValue);
				let parentElement = $(this).closest("div");
				$(parentElement).find('input').val(searchValue);
		});
	});
	
	function checkProductName(code_type,code_value, parentElement){
		$.ajax({
			url:'/checkProduct/'+code_type+"/"+code_value,
			method: 'get',
			dataType:'json',
			success: function(datas, status){
				let result ="";
				console.log(datas);
				if(datas.result != "error"){
					$(parentElement).children('select').show();
					let i = 0;
					$.each(datas.result, function(i, data){
						result += "<option name='search__value' value="+data+">"+data+"</option>"
						i++;
					});
					$(parentElement).children('select').append(result);
				} else{
					if(confirm("조회하는 값이 없습니다. ["+code_type+"] "+code_value+"의 추가를 원하시면 문의해주세요.")){
						window.location.href = "/inquiry";
					} else {
						$(parentElement).find('select').hide();
						$(parentElement).find('option').remove();
						$(parentElement).find('input').val("");
						$(parentElement).find('input').select();
					}
				}
				
			},
			error: function(errorThorwon){
				console.log(errorThorwon);
			}
			
		});
		
		function getProductId(){
			
		}
	}
</script>
    <!-- 페이징, 목록, 가격, 정렬 -->
    <section class="section__content">
        <!-- New -->
        <div class="section__wrapper">
        	<div class="section__productsList">
	        	<div class="search__wrapper-input">
	        		<div class="search__input">
		    			<label>파일 <input type="text" name="file_pictureId"></label>
		    		</div>
		    		<div class="search__input">
		    			<label>카테고리 <input type="text" name="category" class="code_type" onKeypress="javascript:if(event.keyCode==13){}"></label>
		    			<select class="search__select" name="">
		        		</select>
		    		</div>
		    		<div class="search__input">
		    			<label>제조사 <input type="text" name="manufacturer" class="code_type" onKeypress="javascript:if(event.keyCode==13){}"></label>
		    			<select class="search__select" name="">
		        		</select>
		    		</div>
		    		<div class="search__input">
		    			<label>상품 이름 <input type="text" name="product_name" class="product_name" onKeypress="javascript:if(event.keyCode==13){}"></label>
		    			<select class="search__select" name="">
		        		</select>
		    		</div>
		    		<div class="search__input">
		    			<label>상품 아이디<input type="text" name="product_id"></label>
		    		</div>
		    		<div class="search__input">
		    			<label>가격 <input type="number" name="pboard_unit_price"></label>
		    		</div>
		    		<div class="search__input">
		    			<label>재고 <input type="number" name="pboard_unit_stocks"></label>
		    		</div>
		    		<div class="search__input">
		    			<label>작성자 <input type="text" name="user_id"></label>
		    		</div>
		    		<div contentEditable="true" style="border: 1px solid black; border-radius: 3px; min-height: 50px;">
						대표 이미지를 텍스트와 함께 입력이 가능
					</div>
	        	</div>
	    	</div>
	    	
    	</div>
   	</section>

<%@include file="../includes/footer.jsp" %>