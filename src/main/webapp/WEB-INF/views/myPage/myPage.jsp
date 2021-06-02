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
    <section class="section__content">
        <div class="section__wrapper">
        	<div class="section__myPage">
        		<!-- 고객 -->
		    	<a href="/member"><button class="navbar__menu__item"><i class="fas fa-user-cog"></i> 회원정보 수정</button></a>
		    	<a href="#"><button class="navbar__menu__item"><i class="fas fa-cart-arrow-down"></i> 주문 내역</button></a>
		    	<c:if test="${sessionScope.user.user_type<=1}">
			    	<!-- 기업,관리자 -->
			    	<a href="/product/productRegister"><button class="navbar__menu__item"><i class="fas fa-server"></i> 상품 등록</button></a>
			    	<a href="/product/productRegister"><button class="navbar__menu__item"><i class="fas fa-server"></i> 상품 수정</button></a>
		    	</c:if>
	    	</div>
	    	<!-- 관리자 -->
    		<c:if test="${sessionScope.user.user_type==0}">
		    	<div class="section__myPage">
			    	<a href="/product/productRegister"><button class="navbar__menu__item"><i class="fas fa-chalkboard"></i> 상품 관리</button></a>
			    	<a href="/product/productRegister"><button class="navbar__menu__item"><i class="fas fa-chalkboard-teacher"></i> 회원 관리</button></a>
		    	</div>
    		</c:if>
    	</div>
   	</section>

<%@include file="../includes/footer.jsp" %>