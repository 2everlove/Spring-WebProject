<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@include file="../includes/header.jsp" %> --%>
<head>
<link rel="stylesheet" type="text/css"
	href="/resources/css/inquiry_detail.css">
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



<html>
<body>
	<section id="container">
		<h2 class="page_title">1 : 1 문의하기</h2>
		<!-- contents -->
		<div id="contents">
			<!--customer_tab-->
			<!--//customer_tab-->
			<div class="default_cell">
				<form action="/inquiry_delete" method="post" name="inquiry_delete"
					id="inquiry_delete">
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
									<td><input type="hidden" name="iboard_category"
										id="iboard_category" value="${inquiry_detail.iboard_category}">${inquiry_detail.iboard_category}
									</td>
								</tr>
								<tr>
									<th>아이디</th>
									<td><input type="hidden" name="user_id" id="user_id"
										value="user01">user01</td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="3"><input type="hidden" name="iboard_title"
										id="iboard_title" class="full"
										value="${inquiry_detail.iboard_title }">${inquiry_detail.iboard_title }</td>
								</tr>
								<tr>
									<th class="vertical_t">내용
									</th>
									<td colspan="3"><textarea id="iboard_content"
											name="iboard_content" style="height: 210px">${inquiry_detail.iboard_content}</textarea></td>
								</tr>

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
						<button type="button" class="inquiry_button" onclick="inquiryDelete()">삭제</button>
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

<%@include file="../inquiry/inquiry_reply.jsp"%>

<%-- <%@include file="../includes/footer.jsp" %> --%>