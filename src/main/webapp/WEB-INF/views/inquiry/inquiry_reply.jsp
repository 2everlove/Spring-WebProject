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
		if (confirm("답변을 등록하시겠습니까? 등록 후 수정 및 삭제가 불가합니다.") == true){
			
			if ($("#ireply_content").val() == '') {
				alert("내용을 입력해주세요");
				return false;
			}
			
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
		}else {
			alert("취소하였습니다.");
			return false;
		}
	}
	function getAjaxList() {

		$.ajax({
			url : '/inquiry/inquiry_reply/' + $("#iboard_no").val(),
			method : 'get',
			dataType : 'json',

			success : function(data, status, xhr) {

				console.log("data", data);
				console.log("replycount", data.replyCount);
				
				if(data.replyCount > 0 ){
					$(".comment_write_section").hide();
					$("#replyInsertBtn").hide();
					$(".point-another").hide();
				}
				
				var htmlContent = "";

				$.each(data.list, function(index, item) {

					htmlContent += "<p class='cate'>" + "답변" + "</p>"
								+ "<textarea id='answer' rows='20' disabled	>" + item.ireply_content + "</textarea>";
								

					$(".request_answer").html(htmlContent);
				})

			},

			error : function(xhr, status, error) {

				console.log("error", error);
			}
		});

	}
</script>

<body>
	<c:if test="${sessionScope.user.user_type eq 0}">
		<hr class="ng-margin point-another">
			<br>
			<br>
			<br>
		<div class="comment_write_section"><span class="comment_admin">관리자 영역 댓글</span><textarea id="ireply_content" name="ireply_content" rows="20" class="ireply_content" wrap="hard" style="white-space: pre;"></textarea></div>
		<div>
			<button id="replyInsertBtn">작성</button>
		</div>
	</c:if>
		
	<input type="hidden" value="${inquiry_detail.iboard_no }"
		name="iboard_no" id="iboard_no">
	<input type="hidden" value="${sessionScope.user.user_id}"
		name="iboard_no" id="iboard_no">
	<input type="hidden" value="${sessionScope.user.user_type}"
		name="iboard_no" id="iboard_no">
		
	





</body>


