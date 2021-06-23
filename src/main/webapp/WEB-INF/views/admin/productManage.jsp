<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/admin-product.css">
<script type="text/javascript" >
<!--

//-->
</script>
<script type="text/javascript">
	document.title='마이페이지 : widele';
	function page(page){
		document.listForm.action="/admin/productControl";
		document.listForm.pageNo.value=page;
		document.listForm.submit();
	}
	
	$(document).ready(function(){
		$(".colorPickSelector").colorPick();

		$(".colorPickSelector").colorPick({
			  'initialColor': '#3498db',
			  'allowRecent': true,
			  'recentMax': 5,
			  'allowCustomColor': false,
			  'palette': ["#1abc9c", "#16a085", "#2ecc71", "#27ae60", "#3498db", "#2980b9", "#9b59b6", "#8e44ad", "#34495e", "#2c3e50", "#f1c40f", "#f39c12", "#e67e22", "#d35400", "#e74c3c", "#c0392b", "#ecf0f1", "#bdc3c7", "#95a5a6", "#7f8c8d"],
			  'onColorSelected': function() {
			    this.element.css({'backgroundColor': this.color, 'color': this.color});
			    this.element.closest('td').find('input').val(this.color);
			  }
		});
		$('#thum').hide();
		$('.updateBtn').click(function(){
			let currentRow = $(this).closest('tr');
			let Formproduct_manufacturer = currentRow.find('.product_manufacturer').val();
			let Formproduct_category = currentRow.find('.product_category').val();
			let Formproduct_name = currentRow.find('.product_name').val();
			let Formproduct_description = currentRow.find('.product_description').val();
			let Formproduct_color = currentRow.find('.product_color').val();
			let Formproduct_id = currentRow.find('.product_id').val();
			let Formfile_pictureId = currentRow.find('.file_pictureId').val();
			let formData = new FormData();
			formData.append('product_manufacturer', Formproduct_manufacturer);
			formData.append('product_category', Formproduct_category);
			formData.append('product_name', Formproduct_name);
			formData.append('product_description', Formproduct_description);
			formData.append('product_color', Formproduct_color);
			formData.append('product_id', Formproduct_id);
			formData.append('file_pictureId', Formfile_pictureId);
			console.log(Formproduct_manufacturer,Formproduct_category,Formproduct_name,Formproduct_description,Formproduct_color,Formproduct_id);
			updateProduct(formData, $(this));
		});
		
		$('.updateFileBtn').hide();
		$('.fileUpload').hide();
		$('.updatePicBtn').click(function(){
			$('.file_column').css('width','150px');
			$(this).closest('td').find('input[type=file]').show();
			$(this).closest('td').find('.updatePicBtn').hide();
			$(this).closest('td').find('.updateFileBtn').show();
			
		});
		
		$('.updateFileBtn').click(function(){
			console.log($('.fileUpload').val());
			let btn = $(this);
			if($(this).closest('td').find('.fileUpload').val()!=""){
				let currentRow = $(this).closest('td');
				let Formfile_usingType = currentRow.find('.file_usingType').val();
				const Formfile_pictureId = currentRow.find('.file_pictureId').val();
				let Formfile_uuid = currentRow.find('.file_uuid').val();
				let FormfileUpload = currentRow.find('.fileUpload').val();
				let Formproduct_id = $(this).closest('tr').find('.product_id').val();
				console.log(Formfile_usingType, Formfile_pictureId, Formfile_uuid, FormfileUpload);
				let formData = new FormData($(this).closest('form[name=uploadForm]')[0]);
				attachFileDelete(Formfile_uuid, Formfile_pictureId);

				attachFile(formData, $(this));
				updateFileId(Formfile_pictureId,Formproduct_id, $(this).closest('tr'));
				$(this).closest('td').find('input[type=file]').val("");
				$(this).closest('td').find('input[type=file]').hide();
				$(this).closest('td').find('.updatePicBtn').show();
				$(this).closest('td').find('.updateFileBtn').hide();
			} else {
				alert("파일을 선택해주세요.");
				$(this).closest('tr').find('.fileUpload').click();
			}
		});
		
		
		
	});
	
	//파일 업로드
	function attachFile(formData, btn){
		//파일업로드 컨트롤러 -> 서버에 저장
		$.ajax({
			url : '/fileUploadAjax',
			method : 'POST',
			enctype: 'multipart/form-data',
			dataType : 'json',
	        processData: false,    
	        contentType: false,     
	        cache: false,
	        async: false, 
			data : formData,
			success : function(datas){
				console.log("success");
				console.log(datas);
				alert(datas.count+"개가 업로드 되었습니다.");
				viewFile(datas.file_pictureId, btn);
				if(formData.get('product_name')!=null){
					$('#file_pictureId').val(datas.file_pictureId);
					console.log("탔다");
				}
			},
			error : function(errorThrown){
				console.log(errorThrown);
			}
		});
	}
	
	//파일view
	function viewFile(file_pictureId, btn){
			console.log("viewid"+file_pictureId);
			
		$.ajax({
			url:'/fileUploadAjax/'+file_pictureId,
			method : 'get',
			dataType : 'json',
			success : function(datas){
				console.log("view"+datas);
				console.log("view"+btn);
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
				btn.closest('tr').find('img').attr('src', "/fileDisplay?file_name="+file_savePath);
				btn.closest('tr').find('.fileUpload').val("");
				btn.closest('tr').find('.file_uuid').val(data.file_uuid);
				
				});
			},
			error : function(errorThrown){
				console.log(errorThrown);
			}
		});
	}//
	
	//file 삭제
	function attachFileDelete(file_uuid, file_pictureId){
		let rtn = false;
		$.ajax({
			url:'/fileDelete/'+file_uuid+'/'+file_pictureId,
			method:'get',
			success: function(datas){
				console.log(datas);
				rtn = true;
			},
			error : function(errorThrown){
				console.log(errorThrown);
			}
		})
		return rtn;
	}//
	
	//상품 업데이트
	function updateProduct(formData, btn){
		let url = '/admin/productUpdate';
		console.log(formData);
		$.ajax({
			url : url,
			method : 'POST',
			dataType : 'json',
			processData : false,
			contentType : false,
			data : formData,
			success : function(datas){
				console.log(datas.result);
				let currentRow = btn.closest('tr');
				currentRow.find('.product_manufacturer').val(datas.result.product_manufacturer);
				currentRow.find('.product_category').val(datas.result.product_category);
				currentRow.find('.product_name').val(datas.result.product_name);
				currentRow.find('.product_description').val(datas.result.product_description);
				currentRow.find('.pboard_unit_price').val(datas.result.pboard_unit_price);
				alert(datas.result.num+"번 글이 수정되었습니다.");
			},
			error : function(errorThrown){
				console.log(errorThrown);
			}
		});
	}//
	
	//파일 업데이트
	function updateFileId(Formfile_pictureId, Formproduct_id, btn){
		let url = '/admin/productUpdate';
		let formData = new FormData();
		formData.append('product_id', Formproduct_id);
		formData.append('file_pictureId', Formfile_pictureId);
		console.log(formData);
		$.ajax({
			url : url,
			method : 'POST',
			dataType : 'json',
			processData : false,
			contentType : false,
			data : formData,
			success : function(datas){
				console.log(datas.result);
				console.log("up"+btn);
				viewFile(datas.result.file_pictureId, btn);
			},
			error : function(errorThrown){
				console.log(errorThrown);
			}
		});
	}//
	
	
		
	
</script>
    <!-- 페이징, 목록, 가격, 정렬 -->
    <section class="section__content">
        <!-- New -->
        <div class="section__wrapper">
        	<div class="section__admin-product">
        		<div class="table__wrapper">
			    	<table class=".table-product" >
			    		<thead>
			    			<tr class="tr__head">
			    				<th style="width: 30px;"></th>
			    				<th><input type="checkbox"></th>
			    				<th>제조사</th>
			    				<th>카테고리</th>
			    				<th>제품명</th>
			    				<th>설명</th>
			    				<th>색</th>
			    				<th></th>
			    				<th>생성일</th>
			    				<th>썸네일</th>
			    				<th class="file_column">사진변경</th>
			    			</tr>
			    			<c:forEach var="product" items="${productList}">
			    			<tr class="tr__desc">
			    				<td style="width: 30px;">${product.num}</td>
			    				<td><input type="checkbox" name="product_id" class="product_id" value="${product.product_id}"></td>
			    				<td><input type="text" name="product_manufacturer" class="product_manufacturer" value="${product.product_manufacturer}"></td>
			    				<td><input type="text" name="product_category" class="product_category" value="${product.product_category}"></td>
			    				<td><input type="text" name="product_name" class="product_name" value="${product.product_name}"></td>
			    				<td><input type="text" name="product_description" class="product_description" value="${product.product_description}"></td>
			    				<td><input type="text" name="product_color" class="product_color" value="${product.product_color}"></td>
			    				<td><button class="updateBtn" type="button">저장</button></td>
			    				<fmt:formatDate value="${product.product_regdate}" pattern="yy-MM-dd" var="regDate"/>
			    				<td>${regDate}</td>
			    				<c:forEach var="fileThum" items="${fileList}">
				    				<c:if test="${product.file_pictureId == fileThum.file_pictureId}">
					    				<c:url value="/fileDisplay" var="urlThum">
								    		<c:param name="file_name" value="${fileThum.file_savePath}"></c:param>
								    	</c:url>
				    					<td><img src="${urlThum}" style="width: 80px; height: 80px;"></td>
		    						<td class="file_column"><button class="updatePicBtn" type="button" style="display: block;">사진변경</button>
		    						<form name="uploadForm" action="/uploadFile" method="post" enctype="multipart/form-data">
			    						<input type="file" name="uploadFile" class="fileUpload" accept="image/*" style="display: block;">
			    						<input type="hidden" class="file_usingType" name="file_usingType" class="file_usingType" value="3">
										<input type="hidden" class="file_pictureId" name="file_pictureId" class="file_pictureId" value="${fileThum.file_pictureId}">
										<input type="hidden" class="file_uuid" name="file_uuid" value="${fileThum.file_uuid}">
										<button class="updateFileBtn" type="button">업로드</button>
									</form>
		    						</td>
				    				</c:if>
			    				</c:forEach>
			    			</tr>
			    			</c:forEach>
			    		</thead>
			    	</table>
			    	
			    	</div>
		    	</div>
		   	</div>
		   	<div class="pregister__popup" style="margin-bottom: 20px;">
				<div class="pregister__wrapper">
					<form action="/productRegister" name="productRegisterForm" id="fileRegis">
						<table class=".table-product" style="margin-bottom: 50px;">
				    		<thead>
				    			<tr class="tr__head">
				    				<th>제조사</th>
				    				<th>카테고리</th>
				    				<th>제품명</th>
				    				<th>설명</th>
				    				<th>색</th>
				    				<th>썸네일</th>
				    				<th class="file_column">사진</th>
				    				<th></th>
				    			</tr>
				    			<tr>
				    				<td><input type="text" name="product_manufacturer"></td>
				    				<td><input type="text" name="product_category"></td>
				    				<td><input type="text" name="product_name"></td>
				    				<td><input type="text" name="product_description"></td>
				    				<td><div class="colorPickSelector"></div><input type="hidden" name="product_color"></td>
				    				<td><img id="thum" src="#" style="width: 100px; height: 100px;"></td>
			    					<td><input type="file" name="uploadFile" id="imgUpload"><input id="file_pictureId" type="hidden" name="file_pictureId"><input type="hidden" name="file_usingType" value="3"></td>
				    				<td><button type="button" id="registerBtn">저장</button>
				    			</tr>
			    			</thead>
		    			</table>
					</form>
				</div>
			</div>
    		    	<!-- 페이징 소스 -->
			<div id="pagination-box">
				<nav aria-label="Page navigation example" style="background-color: white;">
					<ul class="pagination" style="text-align: center;">
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
			<form method=get action="/admin/productControl" name="listForm">
                 <!-- 상세보기 검색 유지용 -->
                 ${pageNavi.cri.type }
                 <input type=hidden name=pageNo value=${pageNavi.cri.pageNo }> 
                 <!-- 상세보기 검색 유지용 끝 -->
			</form>
			
   	</section>
<script type="text/javascript">
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#thum').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#imgUpload").change(function() {
    	$('#thum').show();
        readURL(this);
        let formData = new FormData($('#fileRegis')[0]);
        attachFile(formData, $(this));
    });
	$('#registerBtn').click(function(){
        let formData = new FormData($('#fileRegis')[0]);
		updateProduct(formData, $(this));
		Location.reload();
	});

</script>
<%@include file="../includes/footer.jsp" %>
