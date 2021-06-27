<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- nboard css -->
<link rel="stylesheet" href="../../../resources/css/nboard.css">
<jsp:include page="../includes/header.jsp" />
<script type="text/javascript">
	if ('${resMsg}' != '') {
		alert('${resMsg}');
	}

	// 페이지로 이동
	function detailBtn(url) {
		document.detailForm.action = url;
		document.detailForm.submit();
	}
	$(document).ready(
			function() {
				$('#nboard_content').on(
						'keyup',
						function() {
							$('#nboard_content_wordcount').html(
									"(" + $(this).val().length + " / 500자)");

							if ($(this).val().length > 500) {
								$(this).val($(this).val().substring(0, 500));
								$('#nboard_content_wordcount').html(
										"(500 / 500자)");
								alert("글자수가 초과했습니다.");
							}
						});
			});
</script>
<section class="section__content">
	<div id="nboard_upper"></div>
	<div id="nboard-wrapper">
		<h2 class="page_title">공지사항</h2>
		<div class="contents">
			<div class="default_cell">
				<div class="table_data">
					<table class="view">
						<colgroup>
							<col style="width: 25vw;">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<c:choose>
								<c:when
									test="${vo.nboard_public=='0' && sessionScope.user.user_type!='0'}">
									<tr>
										<th class="nboardGet_th">글번호</th>
										<td>${vo.nboard_no}</td>
									</tr>
									<tr>
										<th>카테고리</th>
										<td><c:if test="${vo.nboard_category==0 }">공지</c:if> <c:if
												test="${vo.nboard_category==1 }">이벤트</c:if></td>
									</tr>
									<tr>
										<th class="nboardGet_th">제목</th>
										<td>비공개글</td>
									</tr>
									<tr>
										<th class="nboardGet_th">아이디</th>
										<td>${vo.user_id}</td>
									</tr>
									<tr>
										<th class="nboardGet_th">작성일/수정일</th>
										<td>${vo.nboard_regDate}/${nboard_updateDate}</td>
									</tr>
									<tr style="min-height: 40vw;">
										<th class="nboardGet_th">내용</th>
										<td>비공개글</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<th class="nboardGet_th">글번호</th>
										<td>${vo.nboard_no}</td>
									</tr>
									<tr>
										<th class="nboardGet_th">카테고리</th>
										<td><c:if test="${vo.nboard_category==0 }">공지</c:if> <c:if
												test="${vo.nboard_category==1 }">이벤트</c:if>
											<c:if test="${vo.nboard_category==2 }">기타</c:if>
												</td>
									</tr>
									<tr>
										<th class="nboardGet_th">제목</th>
										<td>${vo.nboard_title}</td>
									</tr>
									<tr>
										<th class="nboardGet_th">아이디</th>
										<td>${vo.user_id}</td>
									</tr>
									<tr>
										<th class="nboardGet_th">작성일/수정일</th>
										
										<fmt:parseDate value="${vo.nboard_regDate}" pattern="yyyy-MM-dd" var="nboard_regDate" />
										<fmt:parseDate value="${vo.nboard_updateDate}" pattern="yyyy-MM-dd" var="nboard_updateDate" />
										<fmt:formatDate value="${nboard_regDate}" pattern="yyyy-MM-dd" var="regDate"/>
										<fmt:formatDate value="${nboard_updateDate}" pattern="yyyy-MM-dd" var="updateDate"/>
										<td>${regDate} / ${updateDate}</td>
									</tr>
									<tr style="min-height: 40vw;">
										<th class="vertical_t">내용
											<p id="nboard_content_wordcount">(0 / 500자)</p>
										</th>
										<td colspan="3">
												<div class="request_data" style="white-space:pre;line-height: 32px;"><c:out value="${vo.nboard_content}"/></div>
												</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<p class="btn_pop_page">
						<c:if test="${user.user_type=='0'}">
						<button type="button" onClick="detailBtn('/nboard/nboardUpdate')"
							class="notice_button">수정</button></c:if>
						<c:if
							test="${user.user_type=='0'}">
							<button class="notice_button_green"
								onClick="detailBtn('/nboard/delete')">삭제</button>
						</c:if>
						<button class="notice_button_gray"
							onClick="detailBtn('/nboard/nboardList')">목록</button>
					</p>
					<form method="get" name="detailForm">
						<input type="hidden" name=nboard_no value=${vo.nboard_no}>
						<input type="hidden" name=pageNo value=${criteria.pageNo}>
						<input type="hidden" name=type value=${criteria.type}> <input
							type="hidden" name=keyword value=${criteria.keyword}>
					</form>

				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- col-lg-12 -->
	</div>
	<!-- row -->
	<!-- Heading -->

	</div>
	<!-- nboard-wrapper -->

</section>
<jsp:include page="../includes/footer.jsp" />