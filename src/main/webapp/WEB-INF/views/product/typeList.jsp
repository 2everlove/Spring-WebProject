<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>
    <!-- 페이징, 목록, 가격, 정렬 -->
    <section class="section__content">
        <!-- New -->
        <div class="section__wrapper">
        	<div class="section__productsList">
        	<c:choose>
        		<c:when test="${!empty pList}">
		    		<c:forEach var="products" items="${pList}">
		    		<div class="product__wrapper" id="new">
				    	<div class="new__product">
					        <img src="/resources/images/Apple/Tablet/ipad4.png" class="thumnail__products">
					        <div class="new__detail">
						        <h1 class="new__title">${products.product_name}</h1>
						        <c:if test="${!empty products.product_description}">
						        	<h3 class="new__description">${products.product_description}</h3>
						        </c:if>
   						        <c:if test="${!empty pBList }">
						        	<div class="seller_list">
								        <c:forEach var="productSellers" items="${pBList}">
									        <c:if test="${products.product_id == productSellers.product_id}">
									        	<fmt:formatNumber type="number" maxFractionDigits="3" value="${productSellers.pboard_unit_price}" var="commonPrice"></fmt:formatNumber>
										        <h2 class="new__price"><span>${commonPrice}</span>원</h2>
										        <a href="pDetail?no=${productSellers.pboard_unit_no}" class="new__shops">판매처</a>
									        </c:if>
								        </c:forEach>
							        </div>
						        </c:if>
					        </div>
				        </div>
		    		</div>
		    		</c:forEach>
        		</c:when>
        		<c:otherwise>
        			<div class="product__wrapper" id="new">
				    	<div class="new__product">
					        <div class="new__detail">
			        			<h1> 준비된 상품이 없습니다. </h1>
					        </div>
				        </div>
			        </div>
        		</c:otherwise>
        	</c:choose>
		    	
	    	</div>
	    	
    	</div>
   	</section>

<%@include file="../includes/footer.jsp" %>