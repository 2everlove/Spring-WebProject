<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/admin-product.css">
<script type="text/javascript" >
	$(document).ready(function(){
		$(".updateBtn").click(function(){
			let formData = new FormData();
			let tr = $(this).closest("tbody");
			let formUser_id = tr.find(".user_id").val();
			let formUser_email = tr.find(".user_email").val();
			let formUser_contact = tr.find(".user_contact").val();
			let formUser_enabled = tr.find(".user_enabled").val();
			let formUser_type = tr.find(".user_type").val();
			let formUser_gender = tr.find(".user_gender").val();
			let formUser_birth = tr.find(".user_birth").val();
			let formUser_address = tr.find(".user_address").val();
			let formUser_interesting = tr.find(".user_interesting").val();
			let formUser_enabledContent = tr.find(".user_enabledContent").val();
			let formFile_pictureId = tr.find(".file_pictureId").val();
			formData.append('user_id', formUser_id);
			formData.append('user_email', formUser_email);
			formData.append('user_contact', formUser_contact);
			formData.append('user_enabled',formUser_enabled);
			formData.append('user_type',formUser_type);
			formData.append('user_gender',formUser_gender);
			formData.append('user_birth',formUser_birth);
			formData.append('user_address',formUser_address);
			formData.append('user_interesting',formUser_interesting);
			formData.append('user_enabledContent',formUser_enabledContent);
			formData.append('file_pictureId',formFile_pictureId);
			updateUser(formData, tr);
		});
	});
	
	function updateUser(formData, tr){
		let url = '/admin/userUpdate';
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
				if(datas.result=="success"){
					alert(formData.get('user_id')+"("+formData.get('user_email')+")님의 정보가 수정되었습니다.")
				} else {
					alert("실패");
				}
			},
			error : function(errorThrown){
				console.log(errorThrown);
			}
		});
	}
</script>
<script type="text/javascript">
	document.title='마이페이지 : widele';
</script>
    <!-- 페이징, 목록, 가격, 정렬 -->
    <section class="section__content">
        <!-- New -->
        <div class="section__wrapper">
        	<div class=".section__admin-product">
        		<div class="table__wrapper">
        			<table class=".table-product" >
			    		<thead>
			    			<tr class="tr__head">
			    				<th style="width: 30px;" rowspan="2"></th>
			    				<th rowspan="2"><input type="checkbox"></th>
			    				<th rowspan="2">비밀번호 변경</th>
			    				<th>ID</th>
			    				<th>email</th>
			    				<th>연락처</th>
			    				<th>활성화</th>
			    				<th>고객유형</th>
			    				<th>가입일</th>
			    				<th rowspan="2" class="file_column">사진변경</th>
			    			</tr>
			    			<tr style="border-bottom: 3px solid black;">
			    				
			    				<th>성별</th>
			    				<th>생일</th>
			    				<th>주소</th>
			    				<th>관심</th>
			    				<th>기타(사유)</th>
			    				<th>썸네일</th>
			    				
			    			</tr>
			    			<c:forEach var="user" items="${userList}">
			    				<tbody>
				    				<tr data-num="1">
				    					<td rowspan="2" style="width: 30px;">${user.num}</td>
					    				<td rowspan="2"><input type="checkbox" name="User_id" class="User_id" value="${user.user_id}"></td>
					    				<td rowspan="2"><button type="button" class="pwdChaBtn">비밀번호 변경</button></td>
					    				<td><input disabled="disabled" type="text" value="${user.user_id}"><input type="hidden" name="user_id" class="user_id" value="${user.user_id}"></td>
					    				<td><input type="text" name="user_email" class="user_email" value="${user.user_email}"></td>
					    				<td><input type="text" name="user_contact" class="user_contact" value="${user.user_contact}"></td>
					    				<td><input type="text" name="user_enabled" class="user_enabled" value="${user.user_enabled}"></td>
					    				<td><input type="text" name="user_type" class="user_type" value="${user.user_type}"></td>
					    				<td><input disabled type="text" name="user_regdate" class="user_regdate" value="${user.user_regdate}"><input type="hidden" name="user_regdate" class="user_regdate" value="${user.user_regdate}"></td>
					    				<td rowspan="2"><button class="updateBtn" type="button">저장</button></td>
					    			</tr>
					    			<tr data-num="2" style="border-bottom: 3px solid black;">
					    				<td><input type="text" name="user_gender" class="user_gender" value="${user.user_gender}"></td>
					    				<td><input type="text" name="user_birth" class="user_birth" value="${user.user_birth}"></td>
					    				<td><input type="text" name="user_address" class="user_address" value="${user.user_address}"></td>
					    				<td><input type="text" name="user_interesting" class="user_interesting" value="${user.user_interesting}"></td>
					    				<td><input type="text" name="user_enabledContent" class="user_enabledContent" value="${user.user_enabledContent}"></td>
					    				<td><img alt="" src=""><input type="text" name="file_pictureId" class="file_pictureId" value="${user.file_pictureId}"></td>
				    				</tr>
			    				</tbody>
			    			</c:forEach>
			    		</thead>
			    	</table>
		    	</div>
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

<%@include file="../includes/footer.jsp" %>