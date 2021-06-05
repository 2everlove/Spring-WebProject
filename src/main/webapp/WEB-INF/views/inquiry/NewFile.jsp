<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
			<div id="iboard_content_wordcount">(0 / 500자)</div>
			<p>공개설정</p>
			<label><input type="radio" name="iboard_public"
				id="iboard_public" value="0" checked>전체공개</label> <label><input
				type="radio" name="iboard_public" value="1">비공개</label>
				1 비공개, 0 공개
				
				user-id 히든 처리
			<input type="hidden" name="user_id" id="user_id" value="user01">
			



			<button type="button">등록</button>
		</form>
	</div>

</body>
</html>