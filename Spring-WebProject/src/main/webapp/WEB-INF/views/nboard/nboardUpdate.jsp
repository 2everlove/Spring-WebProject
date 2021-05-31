<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!-- nboard css -->
<link rel="stylesheet" href="../../../resources/css/nboard.css">
<jsp:include page="../includes/header.jsp"/>
<script type="text/javascript">
function updateSubmit(){
	document.updateForm.submit();
	$("select[nboard_category]").val();
	$("select[nboard_public]").val();
}
</script>

	 <section class="section__content">
	<form action="update" method="post">
			<input type=hidden name=pageNo value=${criteria.pageNo}>
			<input type=hidden name=type value=${criteria.type}>
			<input type=hidden name=keyword value=${criteria.keyword}>
	
	  <div id="nboard-wrapper">
            <!-- /.row -->
            <div id="nboard_upper"></div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<p><label><input type=text name=nboard_no value=${vo.nboard_no }></label>
                           		<p><label>nboard_title</label>
                            		<input name="nboard_title" value="${vo.nboard_title}"></p>
                            	<p><label>nboard_content</label>
                            		<textarea name=nboard_content>${vo.nboard_content }</textarea></p>
                            	<p><label>user_id</label>
                            		<input name="user_id" value="${vo.user_id }">
                            	<p><label>category</label>
                            		<select name="nboard_category" >
                            			<option value="E">이벤트</option>
                            			<option value="N">공지</option>
                           				<option value="O">기타</option>
									</select></p>
                            	<p><label>file_pictureId</label>
                            	<input name="file_pictureId" value="${vo.file_pictureId }"></p>
                            	<p><label>file_public</label>
                            		<select name="nboard_public">
                            			<option value='N'>공개</option>
                            			<option value='Y'>잠긴글</option>
                            		</select></p>
                            	<input type="submit" onClick="updateSubmit()" value="수정"> 
                            	<a href="/nboard/nboardList"><input type="button" value="취소"> </a>
						</div>	<!-- panel-body -->
					</div>	<!-- panel panel-default -->
				</div><!-- col-lg-12 -->
			</div>	<!-- row -->
			<!-- Heading -->
			
		</div>	<!-- nboard-wrapper -->
		</form>
	</section>
<jsp:include page="../includes/footer.jsp"/>