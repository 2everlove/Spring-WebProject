<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@include file="./includes/header.jsp" %> --%>
<head>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function mainInquiry() {
		location.href = "/inquiry";
	}

	function inquiryDelete() {
		if (confirm("정말 삭제하시겠습니까?") == true) {
			document.getElementById('inquiry_delete').submit();
		} else {
			alert("취소하였습니다.")
			return false;

		}
	}
</script>
</head>


<body>
	<h1>문의하기</h1>
	<div>
		<form action="/inquiry_delete" method="post" name="inquiry_delete"
			id="inquiry_delete">
			<!-- 게시글 넘버 히든처리 -->
			<input type="text" name="iboard_no"
				value="${inquiry_detail.iboard_no}" readonly hidden>
			<p>
				<label>제목</label> <input type="text" name="iboard_title"
					id="iboard_title" maxlength="100"
					value="${inquiry_detail.iboard_title }" readonly> <label>카테고리</label><input
					type="text" name="iboard_category" id="iboard_category"
					value="${inquiry_detail.iboard_category}" readonly>
			</p>
			<label for="iboard_content">내용</label>
			<textarea cols="40" rows="8" name="iboard_content"
				id="iboard_content" maxlength="500" readonly>${inquiry_detail.iboard_content}</textarea>
			<p>
				<label>작성자</label> <input type="text" name="user_id" id="user_id"
					value="${inquiry_detail.user_id }" readonly> user01
			</p>
			<p>
				<label>작성일자</label><input type="text" name="inquiry_regdate"
					id="inquiry_regdate" value=${inquiry_detail.iboard_regdate }>
			</p>
		</form>
		<button onClick="inquiryDelete()">삭제</button>
		<button onclick="mainInquiry()">목록</button>
	</div>
</body>


<%-- <%@include file="./includes/footer.jsp" %> --%>