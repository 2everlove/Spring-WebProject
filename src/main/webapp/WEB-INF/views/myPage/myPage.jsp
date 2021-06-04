<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>
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
        	<div class="section__myPage">
		    	<a href="/product/productRegister"><button class="navbar__menu__item"><i class="far fa-plus-square"></i>상품 등록</button></a>
	    	</div>
    	</div>
    	<div class="section__wrapper">
        	<div class="section__myPage">
		    	<a href="/orderList"><button class="navbar__menu__item"><i class="fas fa-list-ol"></i>주문내역</button></a>
	    	</div>
    	</div>
    	
   	</section>

<%@include file="../includes/footer.jsp" %>