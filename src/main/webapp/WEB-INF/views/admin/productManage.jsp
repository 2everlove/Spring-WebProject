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
</script>
    <!-- 페이징, 목록, 가격, 정렬 -->
    <section class="section__content">
        <!-- New -->
        <div class="section__wrapper">
        	<div class="section__admin">
        		<div class="table__wrapper">
			    	<table style="padding-top: 80px;text-align: center;">
			    		<thead>
			    			<tr class="tr__head">
			    				<th></th>
			    				<th><input type="checkbox"></th>
			    				<th>제조사</th>
			    				<th>카테고리</th>
			    				<th>제품명</th>
			    				<th>설명</th>
			    				<th>색</th>
			    				<th></th>
			    				<th>생성일</th>
			    				<th>썸네일</th>
			    			</tr>
			    			<c:forEach var="product" items="${productList}">
			    			<tr class="tr__desc">
			    				<td>${product.num}</td>
			    				<td><input type="checkbox" value="${product.product_id}"></td>
			    				<td><input type="text" name="" class="" value="${product.product_manufacturer}"></td>
			    				<td><input type="text" name="" class="" value="${product.product_category}"></td>
			    				<td><input type="text" name="" class="" value="${product.product_name}"></td>
			    				<td><input type="text" name="" class="" value="${product.product_description}"></td>
			    				<td><input type="text" name="" class="" value="${product.product_color}"></td>
			    				<td><button class="updateBtn" type="button">저장</button></td>
			    				<fmt:formatDate value="${product.product_regdate}" pattern="yy-MM-dd" var="regDate"/>
			    				<td>${regDate}</td>
			    				<td>${product.file_pictureId}</td>
			    			</tr>
			    			</c:forEach>
			    		</thead>
			    	</table>
			    	
			    	</div>
		    	</div>
		   	</div>
    	<!-- 페이징 소스 -->
			<div id="pagination-box">
				<nav>
					<ul class="pagination">
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
			<form method=get action="/admin/productControl" name="listForm">
                 <!-- 상세보기 검색 유지용 -->
                 ${pageNavi.cri.type }
                 <input type=hidden name=pageNo value=${pageNavi.cri.pageNo }> 
                 <!-- 상세보기 검색 유지용 끝 -->
			</form>
   	</section>

<%@include file="../includes/footer.jsp" %>