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
			alert("취소하였습니다.");
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
					<input type="hidden" name="iboard_no" id="iboard_no"
						value="${inquiry_detail.iboard_no }">
					<div class="table_data">
						<table class="view">
							<colgroup>
								<col style="width: 200px">
								<col style="width: auto">
								<col style="width: 200px">
								<col style="width: auto">
							</colgroup>
							<tbody>
								<!-- 게시글 번호 -->
								<tr>
									<th style="font-weight: bold;">카테고리</th>
									<td><input type="hidden" name="iboard_category"
										id="iboard_category" value="${inquiry_detail.iboard_category}">${inquiry_detail.iboard_category}
									</td>

								</tr>
								<tr>
									<th style="font-weight: bold;">아이디</th>
									<td><input type="hidden" name="user_id" id="user_id"
										value="user01">user01</td>
								</tr>
								<tr>
									<th style="font-weight: bold;">제목</th>
									<td colspan="3"><input type="hidden" name="iboard_title"
										id="iboard_title" class="full"
										value="${inquiry_detail.iboard_title }">${inquiry_detail.iboard_title }</td>
								</tr>
								<tr><th class="vertical_t" style="font-weight: bold;">내용</th><td colspan="3"><div class="request_data" style="white-space:pre;"><c:out value="${inquiry_detail.iboard_content}"/></div>
								<div class="request_answer">
								<c:if test="${replyService.getInquiryReply(iboard_no) eq null }"><span id="no_comment">아직 답변이 등록되지 않았습니다.</span></c:if>
								</div>
								
								</td></tr>

								<tr>
									<th style="font-weight: bold;">전체 공개 여부</th>
											<td>
											<c:if test="${inquiry_detail.iboard_public eq 1 }">비공개</c:if>
											<c:if test="${inquiry_detail.iboard_public eq 0 }">공개</c:if>
											</td>

								</tr>
							</tbody>
						</table>
					</div>
					<p class="btn_pop_page">
						<button type="button" class="inquiry_button"
							onclick="inquiryDelete()">삭제</button>
						<button type="button" class="cancel"
							onclick="location.href='/inquiry'">취소</button>
					</p>
				</form>
			</div>
			<hr class="ng-margin point-another">
			<br>
			<br>
			<br>
			<%@include file="../inquiry/inquiry_reply.jsp"%>
			
		</div>
		<!-- //contents -->
		
	</section>
</body>
</html>



<%-- <%@include file="../includes/footer.jsp" %> --%>