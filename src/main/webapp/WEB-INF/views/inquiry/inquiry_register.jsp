<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@include file="./includes/header.jsp" %> --%>
<head>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("button").click(function() {
			$("select[name=iboard_category]").val();
			$("input:radio[name=iboard_public]").is(':checked()');
			
		

			if ($("#iboard_title").val() == '') {
				alert("제목을 입력해주세요");
				return false;
			}

			if ($("#iboard_category").val() == '') {
				alert("카테고리를 선택해주세요");
				return false;
			}

			if ($("#iboard_content").val() == '') {
				alert("내용을 입력해주세요");
				return false;
			}

			$("#inquiryForm").submit();
		});
	});
	
	$(document).ready(function() {
	    $('#iboard_content').on('keyup', function() {
	        $('#iboard_content_wordcount').html("("+$(this).val().length+" / 500)");
	 
	        if($(this).val().length > 500) {
	            $(this).val($(this).val().substring(0, 500));
	            $('#iboard_content_wordcount').html("(500 / 500)");
	            alert("글자수가 초과했습니다.");
	        }
	    });
	});
	
</script>
</head>


<body>
	<h1>문의하기</h1>
	<div>
		<form method="post" action="/inquiryRegister" name="inquiryForm"
			id="inquiryForm">
			<p>
				<label>제목</label> <input type="text" name="iboard_title"
					id="iboard_title" maxlength="100"> <label>카테고리</label> <select
					name="iboard_category" id="iboard_category">
					<option value="">카테고리 선택</option>
					<option value="주문/배송">주문/배송</option>
					<option value="취소/반품/교환">취소/반품/교환</option>
					<option value="결제">결제</option>
					<option value="사업자신고">사업자신고</option>
					<option value="기타">기타</option>
				</select>
			</p>
			<label for="iboard_content">내용</label>
			<textarea cols="40" rows="8" name="iboard_content"
				id="iboard_content" maxlength="500"></textarea>
			<div id="iboard_content_wordcount">(0 / 500)</div>
			<p>공개설정</p>
			<label><input type="radio" name="iboard_public"
				id="iboard_public" value="0" checked>전체공개</label> <label><input
				type="radio" name="iboard_public" value="1">비공개</label>
			<!-- 1 비공개, 0 공개 -->



			<button type="button">등록</button>
		</form>
	</div>


</body>


<%-- <%@include file="./includes/footer.jsp" %> --%>