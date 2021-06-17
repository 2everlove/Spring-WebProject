<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>
<<script type="text/javascript" >
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
        	<div class="section__pBoard" style="margin: 0 auto; text-align: center;">
		    				${pBoardList}
		    	<table style="padding-top: 80px;text-align: center;">
		    		<thead>
		    			<tr>
		    				<th><input type="checkbox"></th>
		    				<th>제조사</th>
		    				<th>카테고리</th>
		    				<th>제품명</th>
		    				<th>설명</th>
		    				<th>색</th>
		    				<th>생성일</th>
		    				<th>썸네일</th>
		    			</tr>
		    			<c:forEach var="product" items="${pBoardList}">
		    			<tr>
		    			</tr>
		    			</c:forEach>
		    		</thead>
		    	</table>
	    	</div>
    	</div>
   	</section>

<%@include file="../includes/footer.jsp" %>