<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!-- nboard css -->
<link rel="stylesheet" href="../../../resources/css/nboard.css">
<jsp:include page="../includes/header.jsp"/>
<script type="text/javascript">
function registerSubmit(){
	
	if($("input[name=nboard_title]").val()==""){
		alert("제목을 입력해주세요.");
		$("input[name=nboard_title]").select();
		return false;
	}
	if($("input[name=nboard_content]").val()==""){
		alert("내용을 입력해주세요.");
		$("input[name=nboard_content]").select();
		return false;
	}
	
	
	document.registerForm.submit();
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
	<form action="/nboard/nboardRegister" name="registerForm" method="post">
	  <div id="nboard-wrapper">
            <!-- /.row -->
            <div id="nboard_upper"></div>
            <div id="nboard-wrapper">
                <h2 class="page_title">공지사항/신규등록</h2>
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
									<th class="nboardGet_th">카테고리</th>
									<td><select name="nboard_category">
											<option value="1">이벤트</option>
											<option value="0">공지</option>
											<option value="2">기타</option>
									</select></td>
								</tr>
								<tr>
									<th class="nboardGet_th">제목</th>
									<td><input name="nboard_title" value="${vo.nboard_title}" style="width:40vw;"></td>
								</tr>
								<tr>
									<th class="nboardGet_th">작성자</th>
									<td><input type="hidden" name="file_pictureId"
										value="${sessionScope.user.file_pictureId }"> 
										<input name="user_id" value="${sessionScope.user.user_id }" readonly></td>
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
									<td>
									<select name="nboard_public">
											<option value='1'>공개</option>
											<option value='0'>잠긴글</option>
									</select>
									</td>
								</tr>

							</tbody>
						</table>
                            	<input type="button" onClick="registerSubmit()" value="등록"> 
						</div>	
					</div>	
				</div>
			</div>	
			
		</div>	<!-- nboard-wrapper -->
		</form>
	</section>
<jsp:include page="../includes/footer.jsp"/>