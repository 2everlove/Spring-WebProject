<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>
<script type="text/javascript">
	document.title='${search} : widele';
	$(document).ready(function(){
		let searchValue = "${search}";
		
		if(searchValue!=""){
			$("#navbar__search__iput").val(searchValue);
		}
			
	});
</script>
    <!-- 페이징, 목록, 가격, 정렬 -->
    <section class="section__content">
    
        <!-- New -->
        <div class="section__wrapper">
        	<div class="section__productsList" id="new">
        	
        	<c:choose>
        		<c:when test="${!empty pList}">
		    		<c:forEach var="products" items="${pList}">
		    		<div class="product__wrapper">
				    	<div class="type__product">
				    	<c:forEach var="files" items="${fileList }">
				    	<c:if test="${products.file_pictureId == files.file_pictureId }">
				    	
				    	<c:url value="/fileDisplay" var="url">
				    		<c:param name="file_name" value="${files.file_s_savePath}"></c:param>
				    	</c:url>
					        <img src="${url}" class="thumnail__products-type" >
				    	</c:if>
				    	</c:forEach>
					        <div class="type__detail">
						        <h1 class="type__title">${products.product_name}</h1>
						        <c:if test="${!empty products.product_description}">
						        	<h3 class="type__description">${products.product_description}</h3>
						        </c:if>
						        <c:forEach var="productCost" items="${pBList}" varStatus="status">
						        	<c:if test="${productCost.each_rank == 1 && products.product_id==productCost.product_id}">
						        		<fmt:formatNumber type="number" maxFractionDigits="3" value="${productCost.pboard_unit_price}" var="minPrice"></fmt:formatNumber>
								        <h1 class="min__price"><span>${minPrice}</span>원</h1>
						        	</c:if>
						        </c:forEach>
					        </div>
					       
					        <c:if test="${!empty pBList }">
					        	<div class="seller__list">
							        <c:forEach var="productSellers" items="${pBList}">
								        <c:if test="${products.product_id == productSellers.product_id}">
								        	<fmt:formatNumber type="number" maxFractionDigits="3" value="${productSellers.pboard_unit_price}" var="commonPrice"></fmt:formatNumber>
									        <h2 class="type__price"><span>${commonPrice}</span>원</h2>
									        <a href="/pDetail/${productSellers.pboard_unit_no}" class="type__shops">판매처</a>
								        </c:if>
							        </c:forEach>
						        </div>
					        </c:if>
				        </div>
		    		</div>
		    		</c:forEach>
        		</c:when>
        		<c:otherwise>
        			<div class="product__wrapper" id="new">
				    	<div class="type__product">
					        <div class="type__detail">
			        			<h1> 준비된 상품이 없습니다.</h1><a href="javascript:history.back();">뒤로가기</a>
			        			
					        </div>
				        </div>
			        </div>
        		</c:otherwise>
        	</c:choose>
		    	
	    	</div>
	    	
    	</div>
   	</section>

<%@include file="../includes/footer.jsp" %>
<script type="text/javascript" src="/resources/js/typeList.js">
<!--

//-->
</script>