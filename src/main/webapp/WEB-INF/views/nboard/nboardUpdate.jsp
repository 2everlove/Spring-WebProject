<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- nboard css -->
<link rel="stylesheet" href="../../../resources/css/nboard.css">
<jsp:include page="../includes/header.jsp" />
<script type="text/javascript">
	function updateSubmit() {
		document.updateForm.submit();
		$("select[nboard_category]").val();
		$("select[nboard_public]").val();
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
	<form action="nboardUpdate" method="post">
		<input type=hidden name=pageNo value=${criteria.pageNo}> <input
			type=hidden name=type value=${criteria.type}> <input
			type=hidden name=keyword value=${criteria.keyword}>

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
								<tr>
									<th class="nboardGet_th">글번호</th>
									<td><input type="hidden" name="nboard_no"
										value="${vo.nboard_no}">${vo.nboard_no}</td>
								</tr>
								<tr>
									<th class="nboardGet_th">카테고리</th>
									<td><select name="nboard_category">
											<option value="1">이벤트</option>
											<option value="0">공지</option>
											<option value="2">기타</option>
									</select></td>
								</tr>
								<tr>
									<th class="nboardGet_th">제목</th>
									<td><input name="nboard_title" value="${vo.nboard_title}"></td>
								</tr>
								<tr>
									<th class="nboardGet_th">작성자</th>
									<td><input type="hidden" name="file_pictureId"
										value="${vo.file_pictureId }"> <input type="hidden"
										name="user_id" value="${vo.user_id}">${vo.user_id}</td>
								</tr>
								<tr>
									<th class="nboardGet_th">작성일/수정일</th>
									<td><input type="hidden" name="nboard_regDate"
										value="${vo.nboard_regDate}"><input type="hidden"
										name="nboard_updateDate" value="${vo.nboard_updateDate}">
										${vo.nboard_regDate}/${vo.nboard_updateDate}</td>
								</tr>
								<tr style="min-height: 40vw;">
									<th class="vertical_t">내용
										<p id="nboard_content_wordcount">(0 / 500자)</p>
									</th>
									<td colspan="3"><textarea id="nboard_content"
											name="nboard_content" wrap="hard"
											style="width: 65vw; height: 30vh;">${vo.nboard_content}</textarea></td>
								</tr>
								<tr>
									<th class="vertical_t">공개/비공개</th>
									<td><select name="nboard_public">
											<option value='1'>공개</option>
											<option value='0'>잠긴글</option>
									</select></td>
								</tr>

							</tbody>
						</table>
						<input type="submit" onClick="updateSubmit()" value="수정">
						<a href="/nboard/nboardList"><input type="button" value="취소">
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- nboard-wrapper -->
	</form>
</section>
<jsp:include page="../includes/footer.jsp" />