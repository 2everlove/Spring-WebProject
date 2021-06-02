<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../inquiry/inquiry_reply.js" type="text/javascript"></script>
</head>
<script>
	$(document).ready(function() {

		/* 답변 삽입 */
		$("#replyInsertBtn").on("click", function() {
			// 리플 작성
			ajaxInsert();

		});

	getAjaxList(); 
	});
</script>

<body>

	<div>
		<p>관리자 작성 영역</p>
		<textarea id="ireply_content" name="ireply_content"></textarea>
		<button id="replyInsertBtn">작성</button>
	</div>

	<div>
	
	
	
	</div>




</body>


