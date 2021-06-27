<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp" %>
<head>
<link rel="stylesheet" type="text/css"
	href="/resources/css/inquiry_register.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#button").click(function() {
			var result = confirm('게시글을 등록하시겠습니까? 등록 후 수정이 불가합니다.');
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
			
			if(result){
				$("#inquiryForm").submit();
			}
			else{
				alert("취소하였습니다.");
				return false;
			}
		});
	});

	$(document).ready(
			function() {
				$('#iboard_content').on(
						'keyup',
						function() {
							$('#iboard_content_wordcount').html(
									"(" + $(this).val().length + " / 500자)");

							if ($(this).val().length > 500) {
								$(this).val($(this).val().substring(0, 500));
								$('#iboard_content_wordcount').html(
										"(500 / 500자)");
								alert("글자수가 초과했습니다.");
							}
						});
			});
</script>
</head>

<html>
<body>
	<section id="container">
		<h2 class="page_title">1 : 1 문의하기</h2>
		<!-- contents -->
		<div id="contents">
			<!--customer_tab-->
			<!--//customer_tab-->
			<div class="default_cell">
				<form id="inquiryForm" name="inquiryForm" method="post"
					action="/inquiryRegister">
					<div class="table_data">
						<table class="view">
							<colgroup>
								<col style="width: 200px">
								<col style="width: auto">
								<col style="width: 200px">
								<col style="width: auto">
							</colgroup>
							<tbody>
								<tr>
									<th>카테고리</th>
									<td><select style="width: 250px" id="iboard_category"
										name="iboard_category">
											<option value="">카테고리 선택</option>
											<option value="주문/배송">주문/배송</option>
											<option value="취소/반품/교환">취소/반품/교환</option>
											<option value="결제">결제</option>
											<option value="사업자신고">사업자신고</option>
											<option value="기타">기타</option>
									</select></td>
								</tr>
								<tr>
									<th>아이디</th>
									<td><input type="hidden" name="user_id" id="user_id"
										value="${sessionScope.user.user_id}">${sessionScope.user.user_id}</td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="3"><input type="text" name="iboard_title"
										id="iboard_title" class="full" style=""></td>
								</tr>
								<tr><th class="vertical_t">내용 <p id="iboard_content_wordcount">(0 / 500자)</p></th><td colspan="3"><textarea id="iboard_content" name="iboard_content" wrap="hard" style="height: 210px"></textarea></td></tr>
								<tr>
									<th>전체 공개 여부</th>
									<td><span><input type="radio" name="iboard_public"
										id="iboard_public" value="0" checked>전체공개 </span><span><input
										type="radio" name="iboard_public" value="1">비공개</span></td>
								</tr>
							</tbody>
						</table>
					</div>
					<p class="btn_pop_page">
						<button type="button" class="inquiry_button" id="button">확인</button>
						<button type="button" class="cancel"
							onclick="location.href='/inquiry'">취소</button>
					</p>
				</form>
			</div>
		</div>
		<!-- //contents -->

	</section>

</body>
</html>

<%@include file="../includes/footer.jsp" %>