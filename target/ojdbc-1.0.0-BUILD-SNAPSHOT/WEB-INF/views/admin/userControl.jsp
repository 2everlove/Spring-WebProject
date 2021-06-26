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
			    				<th rowspan="2"><input type="checkbox"></th>\
			    				<th rowspan="2">비밀번호 변경</th>
			    				<th>ID</th>
			    				<th>email</th>
			    				<th>연락처</th>
			    				<th>활성화</th>
			    				<th>고객유형</th>
			    				<th>가입일</th>
			    				<th rowspan="2" class="file_column">사진변경</th>
			    			</tr>
			    			<tr>
			    				
			    				<th>성별</th>
			    				<th>생일</th>
			    				<th>주소</th>
			    				<th>관심</th>
			    				<th>기타(사유)</th>
			    				<th>썸네일</th>
			    				
			    			</tr>
			    			<c:forEach var="user" items="${userList}">
			    				<tr>
			    					<td rowspan="2" style="width: 30px;">${user.num}</td>
				    				<td rowspan="2"><input type="checkbox" name="User_id" class="User_id" value="${user.user_id}"></td>
				    				<td rowspan="2"><button type="button" id="pwdChaBtn">비밀번호 변경</button></td>
				    				<td><input type="text" name="user_id" class="user_id" value="${user.user_id}"></td>
				    				<td><input type="text" name="user_email" class="user_email" value="${user.user_email}"></td>
				    				<td><input type="text" name="user_contact" class="user_contact" value="${user.user_contact}"></td>
				    				<td><input type="text" name="user_enabled" class="user_enabled" value="${user.user_enabled}"></td>
				    				<td><input type="text" name="user_type" class="user_type" value="${user.user_type}"></td>
				    				<td><input disabled type="text" name="user_regdate" class="user_regdate" value="${user.user_regdate}"><input type="hidden" name="user_regdate" class="user_regdate" value="${user.user_regdate}"></td>
				    				<td rowspan="2"><button class="updateBtn" type="button">저장</button></td>
				    			</tr>
				    			<tr>
				    				
				    				<td><input type="text" name="user_gender" class="user_gender" value="${user.user_gender}"></td>
				    				<td><input type="text" name="user_birth" class="user_birth" value="${user.user_birth}"></td>
				    				<td><input type="text" name="user_address" class="user_address" value="${user.user_address}"></td>
				    				<td><input type="text" name="user_interesting" class="user_interesting" value="${user.user_interesting}"></td>
				    				<td><input type="text" name="user_enabledContent" class="user_enabledContent" value="${user.user_enabledContent}"></td>
				    				<td><img alt="" src=""><input type="text" name="file_pictureId" class="file_pictureId" value="${user.file_pictureId}"></td>
				    				
			    				</tr>
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