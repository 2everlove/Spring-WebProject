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
        		${pBoard}
        		<img src="/resources/images/Apple/Tablet/ipad4.png" class="thumnail__products-type">
		    	<div class="detail__wrapper">
		    		
		    	</div>
	    	</div>
	    	
    	</div>
   	</section>

<%@include file="../includes/footer.jsp" %>