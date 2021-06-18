<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>

<link rel="stylesheet" type="text/css"
	href="/resources/css/reviewproduct.css">
	<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->

<script>

</script>
</head>
<body>
	<div>
		<c:forEach var="productReviewList" items="${productReviewList}">
			<p>${productReviewList.review_num}</p>
			<p>${productReviewList.review_content}</p>
			<p>${productReviewList.review_regdate}</p>
			<p>${productReviewList.review_rate}</p>
			<p>${productReviewList.pboard_unit_no}</p>
			<p>${productReviewList.user_id}</p>
		</c:forEach> 
	</div>
	<div class="review-wrap" style="display:block;">
	
	<span class="count_review">
	
	</span>
	
	
	</div>
	
	
	
</body>


