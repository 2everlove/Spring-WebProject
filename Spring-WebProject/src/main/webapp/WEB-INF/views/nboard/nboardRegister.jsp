<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!-- nboard css -->
<link rel="stylesheet" href="../../../resources/css/nboard.css">
<jsp:include page="../includes/header.jsp"/>
<script type="text/javascript">
function registerSubmit(){
	document.registerForm.submit();
	$("select[nboard_category]").val();
}
</script>
	
	 <section class="section__content">
	<form action="/nboard/nboardRegister" name="registerForm" method="post">
	  <div id="nboard-wrapper">
            <!-- /.row -->
            <div id="nboard_upper"></div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            
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
                            	<input type="button" onClick="registerSubmit()" value="등록"> 
                            	<input type="hidden" name ="nboard_public" value="1" >
						</div>	<!-- panel-body -->
					</div>	<!-- panel panel-default -->
				</div><!-- col-lg-12 -->
			</div>	<!-- row -->
			<!-- Heading -->
			
		
			
		</div>	<!-- nboard-wrapper -->
		</form>
	</section>
<jsp:include page="../includes/footer.jsp"/>