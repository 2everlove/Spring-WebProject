<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<link rel="stylesheet" type="text/css" href="/resources/css/inquiry_reply.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<script>
	$(document).ready(function() {
		$("#replyInsertBtn").on("click", function() {
			ajaxInsert();
		});
		getAjaxList();
	});

	function ajaxInsert() {

		var replyData = {
			iboard_no : $("#iboard_no").val(),
			ireply_content : $("#ireply_content").val()
		};

		$.ajax({

			url : '/inquiry/insertReply',
			method : 'post',
			dataType : 'json',

			data : JSON.stringify(replyData),
			contentType : 'application/json; charset=UTF-8',

			success : function(data, status) {
				console.log(data);
				$("#ireply_content").val("");

				if (data.result == "success") {
					getAjaxList();
				} else {
					alert("입력 중 오류가 발생했습니다.");
				}
			},
			error : function(xhr, status, error) {
				console.log("error", error);
			}
		});

	}
	function getAjaxList() {

		$.ajax({
			url : '/inquiry/inquiry_reply/' + $("#iboard_no").val(),
			method : 'get',
			dataType : 'json',

			success : function(data, status, xhr) {

				console.log("data", data);

				var htmlContent = "";

				$.each(data.list, function(index, item) {

					htmlContent += "<p> 관리자 </p>" + "<p>" + item.ireply_content
							+ "</p>";

					$(".chat").html(htmlContent);
				})

			},

			error : function(xhr, status, error) {

				console.log("error", error);
			}
		});

	}
</script>

<body>
	<div id="comment-write-section">
		<c:if test="${inquiryReply.reply <= 0 }">
			<p>관리자 작성 영역</p>
			<textarea id="ireply_content" name="ireply_content"></textarea>
			<button id="replyInsertBtn">작성</button>
		</c:if>
	</div>
	<div id="comment-section">
		<p>댓글 출력 영역</p>
		<ul class="chat">
		</ul>
	</div>
	<input type="hidden" value="${inquiry_detail.iboard_no }"
		id="iboard_no">
		



</body>


