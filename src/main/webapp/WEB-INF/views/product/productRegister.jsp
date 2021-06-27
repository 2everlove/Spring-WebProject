<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/main.css">
<script type="text/javascript">
	document.title='상품등록 : widele';
	$(document).ready(function(){
		$(".search__select").hide();
		
		$(".code_type").change(function(){
			let parentElement = $(this).closest("div");
			$(parentElement).find('select').hide();
			$(parentElement).find('option').remove();
			$(this).prop('data');
			if($(this).val()!=""){
				checkProductName($(this).attr("name"), $(this).val(), parentElement);
			}
		});//
		
		$('input[name=product_name]').change(function(){
			$('input[name=manufacturer]').val("");
			$('input[name=category]').val("");
			let parentmanu = $('input[name=manufacturer]').closest("div");
			let parentcate = $('input[name=category]').closest("div");
			getProductManuCate();
		});//
		
		
		$("#file_pictureId").change(function(){
			$('#file_pictureIdClone').val($("#file_pictureId").val());
		});//
			
		$(".search__select").focusout(function(){
			console.log("fo");
			let parentElement = $(this).closest("div");
			$(parentElement).find('input').attr('data', true);
			$(parentElement).find('select').hide();
			$(parentElement).find('option').remove();
			if($('input[name=manufacturer]').attr('data') && $('input[name=category]').attr('data') && $('input[name=product_name]').val()==""){
				getProductId(parentElement);
			}
		});//
		
		$(".search__select").click(function(){
				let searchValue = $(this).val();
				let searchDataValue = $(this).find('option:checked').attr('data-id');
				console.log(searchDataValue);
				let parentElement = $(this).closest("div");
				$(parentElement).find('input').val(searchValue);
				if(searchDataValue!=null){
					$('input[name=product_id]').val(searchDataValue);
					if($('input[name=manufacturer]').val() =="" || $('input[name=category]').val() ==""){
						getManuCate(searchDataValue);
					}
				}
		});//
		
		$('#file_pictureId').on("change", function(){
			viewFile($('#file_pictureId').val());
		});//
		
		
		$('#pRegisterBtn').click(function(){
			if($('input[name=product_id]').val()==""){
				$('input[name=product_name]').select();
				return false;
			}
			if($('input[name=category]').val() ==""){
				$('input[name=category]').select();
				return false;
			}
			if($('input[name=manufacturer]').val()==""){
				$('input[name=manufacturer]').select();
				return false;
			}
			if($('input[name=pboard_unit_price]').val()==""){
				$('input[name=pboard_unit_price]').select();
				return false;
			}
			if($('input[name=pboard_unit_stocks]').val()==""){
				$('input[name=pboard_unit_stocks]').select();
				return false;
			}
			if($('input[name=product_name]').val()==""){
				$('input[name=product_name]').select();
				return false;
			}
			if($('input[name=file_pictureId]').val()==""){
				$('input[name=uploadFile]').select();
				return false;
			}
			if($('input[name=file_pictureIdClone]').val()==""){
				$('input[name=uploadFile]').select();
				return false;
			}
			$("form[name=pBoardForm]").submit(); 
		});

		
		
		//파일 업로드
		$("#uploadBtn").on("click", function(){
			if($('#fileUpload').val()==""){
				alert("파일을 선택하세요.");
				$('#fileUpload').click();
				return false;
			}
			let formData = new FormData(document.uploadForm);
			console.log(formData.get("file_pictureId")+formData.get("uploadFile"));
			//파일업로드 컨트롤러 -> 서버에 저장
			$.ajax({
				url : '/fileUploadAjax',
				method : 'POST',
				dataType : 'json',
				processData : false,
				contentType : false,
				data : formData,
				success : function(datas){
					console.log("success");
					console.log(datas);
					alert(datas.count+"개가 업로드 되었습니다.");
					let file_pictureId = "";
					//$('#attachNo').val(datas.attachNo);
					/* $("") 태그 $("#") id $(".") class */
					$('input[name=file_pictureId]').val(datas.file_pictureId);
					//document.uploadForm.uploadFile.value="";
					$('#fileupload').val("");
					viewFile(datas.file_pictureId);
				},
				error : function(errorThrown){
					console.log(errorThrown);
				}
			});
		});
		
	});//
	
	//파일view
	function viewFile(file_pictureId){
		$.ajax({
			url:'/fileUploadAjax/'+file_pictureId,
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
						result += "<li><div class='img_wrapper' style='position: relative;'>"
									+"<img src=/fileDisplay?file_name="+file_savePath+" style=' width: 100%; height: 100%; object-fit: cover;'><br>"
									+data.file_name
									+"<span onclick=attachFileDelete('"+data.file_uuid+"','"+data.file_pictureId+"'); data-type='image' style='cursor: pointer; position: absolute; right: 20px; top: 15px; font-size:20px;'>❌</span>"
									+"<p class='arrow_box'>close</p></div></li>";
					} else {
						//이미지가 아니면 파일이름을 출력
						result += "<li>"
									+"<a href=/fileDisplay?file_name="+file_savePath+" download='"+fName +"'><br>"
									+data.file_name+"</a>"
									+"  <span onclick=attachFileDelete('"+data.file_uuid+"','"+data.file_pictureId+"'); style='cursor: pointer; position: absolute; left: 80%; top: 10%;'>❌</span></li>";
					}
					
				});
				if(datas.length == 0){
					if(confirm(file_pictureId+'번에 해당하는 데이터가 없습니다. 다시 검색을 원하시면 확인, \n'+file_pictureId+'번에 데이터를 저장하시려면 취소를 눌러주세요')){
						$('#file_pictureId').val("");
						$('#fileUpload').val("");
						$('#file_pictureId').select();
					} else {
						$('#fileUpload').val("");
						$('#fileUpload').click();
					}
				}
				$('#fileList').html(result);
				if($(location).attr('pathname').match('/board/get')){
					$('span[data-type=image]').remove();
				}
			},
			error : function(){
				
			}
		});
	}//
	
	//file 삭제
	function attachFileDelete(file_uuid, file_pictureId){
		$.ajax({
			url:'/fileDelete/'+file_uuid+'/'+file_pictureId,
			method:'get',
			success: function(datas){
				console.log(datas);
				viewFile(file_pictureId);
			},
			error : function(errorThrown){
				console.log(errorThrown);
			}
		})
	}//
	
	//code 확인
	function checkProductName(code_type,code_value, parentElement){
		$.ajax({
			url:'/checkInsertCodeValue/'+code_type+"/"+code_value,
			method: 'get',
			dataType:'json',
			success: function(datas, status){
				let result ="";
				console.log(datas);
				if(datas.result != "error"){
					$(parentElement).children('select').show();
					$.each(datas.result, function(i, data){
						result += "<option name='search__value' value="+data+">"+data+"</option>"
					});
					$(parentElement).children('select').append(result);
					$('input[name=product_name]').val("");
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
	}//
	
	//code에서 따온 제조사, 카테고리로 상품검색
	function getProductId(){
		let parentElement = $('input[name=product_name]').closest("div");
		$.ajax({
			url:'/checkProduct/'+$('input[name=manufacturer]').val()+"/"+$('input[name=category]').val(),
			method: 'get',
			dataType:'json',
			success: function(datas, status){
				let result ="";
				console.log(datas);
				if(datas.result != "error"){
					$(parentElement).children('select').show();
					$.each(datas.result, function(i, data){
						result += "<option name='search__value' value="+data.product_name+" data-id="+data.product_id+">"+data.product_name+"</option>"
					});
					$(parentElement).children('select').append(result);
				} else{
					if(confirm("조회하는 값이 없습니다. ["+$('input[name=manufacturer]').val()+"] "+$('input[name=category]').val()+"의 추가를 원하시면 문의해주세요.")){
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
	}//
	
	//상품으로 제조사, 카테고리 검색
	function getProductManuCate(){
		let parentElement = $('input[name=product_name]').closest("div");
		let parentmanu = $('input[name=manufacturer]').closest("div");
		let parentcate = $('input[name=category]').closest("div");
		$.ajax({
			url:'/checkProduct/'+$('input[name=product_name]').val(),
			method: 'get',
			dataType:'json',
			success: function(datas, status){
				let result ="";
				console.log(datas);
				if(datas.result != "error"){
					$(parentElement).children('select').show();
					$.each(datas.result, function(i, data){
						result += "<option name='search__value' value="+data.product_name+" data-id="+data.product_id+">"+data.product_name+"</option>"
					});
					$(parentElement).children('select').append(result);
				} else{
					if(confirm("조회하는 값이 없습니다. ["+$('input[name=manufacturer]').val()+"] "+$('input[name=category]').val()+"의 추가를 원하시면 문의해주세요.")){
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
	}//
	
	//상품id 로 제조사, 카테고리 입력
	function getManuCate(searchDataValue){
		let parentElement = $('input[name=product_name]').closest("div");
		let parentmanu = $('input[name=manufacturer]').closest("div");
		let parentcate = $('input[name=category]').closest("div");
		$.ajax({
			url:'/searchProductId/'+searchDataValue,
			method: 'get',
			dataType:'json',
			success: function(datas, status){
				let result ="";
				console.log(datas);
				if(datas.result != "error"){
					$('input[name=manufacturer]').val(datas.result.product_manufacturer);
					$('input[name=category]').val(datas.result.product_category);
				} else{
					if(confirm("조회하는 값이 없습니다. ["+$('input[name=manufacturer]').val()+"] "+$('input[name=category]').val()+"의 추가를 원하시면 문의해주세요.")){
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
	}//
	

</script>
    <!-- 페이징, 목록, 가격, 정렬 -->
    <section class="section__content">
        <!-- New -->
        <div class="section__wrapper">
        	<div class="section__productsList">
	        	<div class="search__wrapper-input">
	        		<div class="search__wrapper">
	        		<button type="button" id="pRegisterBtn">등록</button>
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
			    		<form method="post" action="insertProductBoard" name="pBoardForm">
			        		<div class="search__input">
				    			<label><input type="hidden" name="file_pictureId" id="file_pictureIdClone"></label>
				    		</div>
				    		<div class="search__input">
				    			<label><input type="hidden" name="product_id"></label>
				    		</div>
				    		<div class="search__input">
				    			<label>new<input type="radio" name="pboard_unit_condition" value="0" checked;></label>
				    			<label>sale<input type="radio" name="pboard_unit_condition" value="1"></label>
				    			<label>event<input type="radio" name="pboard_unit_condition" value="2"></label>
				    		</div>
				    		<div class="search__input">
				    			<label>가격 <input type="number" name="pboard_unit_price"></label>
				    		</div>
				    		<div class="search__input">
				    			<label>재고 <input type="number" name="pboard_unit_stocks"></label>
				    		</div>
				    		<div class="search__input">
				    			<label>작성자 <input type="hidden" name="user_id" value="${sessionScope.user.user_id}"><input type="text" value="${sessionScope.user.user_id}" disabled></label>
				    		</div>
				    		
			    		</form>
						<form name="uploadForm" action="/uploadFile" method="post" enctype="multipart/form-data">
							<input type="hidden" class="form__file" name="file_usingType" id="file_usingType" value="3">
							<input type="hidden" class="form__file" name="file_pictureId" id="file_pictureId">
							<input type="file" name="uploadFile" id="fileUpload" multiple="multiple" accept="image/*">
							<br>
							<br>
							<button type="button" id="uploadBtn" style="border: 1px solid black; border-radius: 3px;">upload</button>
						</form>
							<br>
							<br>
			    		<div id="upload__view" style="border: 1px solid black; border-radius: 3px; min-height: 50px; width: 700px;">
							<ul id="fileList">
								
							</ul>
						</div>
					</div>
	        	</div>
	    	</div>
	    	
    	</div>
   	</section>

<%@include file="../includes/footer.jsp" %>
<style>
.arrow_box {
  display: none;
  position: absolute;
  width: 50px;
  padding: 8px;
  text-align: center;
  -webkit-border-radius: 8px;
  -moz-border-radius: 8px;  
  border-radius: 8px;
  background: #333;
  color: #fff;
  font-size: 14px;
}

.arrow_box:after {
  position: absolute;
  bottom: 100%;
  left: 50%;
  width: 0;
  height: 0;
  margin-left: -10px;
  border: solid transparent;
  border-color: rgba(51, 51, 51, 0);
  border-bottom-color: #333;
  border-width: 10px;
  pointer-events: none;
  content: " ";
}

span:hover + p.arrow_box {
  display: block;
  top:50px;
  right:8px;
}
</style>