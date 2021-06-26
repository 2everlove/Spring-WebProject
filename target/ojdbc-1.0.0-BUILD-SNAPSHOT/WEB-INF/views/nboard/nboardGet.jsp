<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!-- nboard css -->
<link rel="stylesheet" href="../../../resources/css/nboard.css">
<jsp:include page="../includes/header.jsp"/>
<script type="text/javascript">
if('${resMsg}' != ''){
	alert('${resMsg}');	
}

// 페이지로 이동
function detailBtn(url){
	document.detailForm.action=url;
	document.detailForm.submit();
}
</script>

	 <section class="section__content">
	
	  <div id="nboard-wrapper">
            <!-- /.row -->
            <div id="nboard_upper"></div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            상세글보기
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<!-- 잠긴글처리 -->
                        	<c:choose>
                        		<c:when test="${vo.nboard_public=='Y'}">
		                            <div class="form-group">
		                                <label>제목</label>
		                                <input readonly class="form-control" value="잠긴글입니다.">
		                            </div>
		                            <div class="form-group">
		                                <label>분류</label>
		                                <input readonly class="form-control" value="${vo.nboard_category }">
		                            </div>
		                            <div class="form-group">
		                                <label>내용</label>
		                                <textarea readonly class="form-control" rows="3">잠긴글입니다.</textarea>
		                            </div>
		                            <div class="form-group">
		                                <label>작성자</label>
		                                <input readonly class="form-control" value="${vo.user_id}">
		                            </div>
		                            <div class="form-group">
		                                <label>등록시간</label>
		                                <input readonly class="form-control" value="${vo.nboard_regDate}">
		                            </div>
	                            </c:when>
	                            <c:otherwise>
	                            	<div class="form-group">
		                                <label>제목</label>
		                                <input readonly class="form-control" value="${vo.nboard_title}">
		                            </div>
		                            <div class="form-group">
		                                <label>분류</label>
		                                <input readonly class="form-control" value="${vo.nboard_category }">
		                            </div>
		                            <div class="form-group">
		                                <label>내용</label>
		                                <textarea readonly class="form-control" rows="3">${vo.nboard_content}</textarea>
		                            </div>
		                            <div class="form-group">
		                                <label>작성자</label>
		                                <input readonly class="form-control" value="${vo.user_id}">
		                            </div>
		                            <div class="form-group">
		                                <label>등록시간</label>
		                                <input readonly class="form-control" value="${vo.nboard_regDate}">
		                            </div>
	                            </c:otherwise>
                            </c:choose>
                            <button type="button" onClick="detailBtn('/nboard/update')" class="btn btn-default">수정</button>
							<button class="btn btn-default" onClick="detailBtn('/nboard/delete')">삭제</button>
							<button class="btn btn-default" onClick="detailBtn('/nboard/nboardList')">목록</button>
	
						<form method="get" name="detailForm">
							<input type="hidden" name=nboard_no value=${vo.nboard_no}>
							<input type="hidden" name=pageNo value=${criteria.pageNo}>
							<input type="hidden" name=type value=${criteria.type}>
							<input type="hidden" name=keyword value=${criteria.keyword}>
						</form>
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
				</div><!-- col-lg-12 -->
			</div>	<!-- row -->
			<!-- Heading -->
	
		</div>	<!-- nboard-wrapper -->
		
	</section>
<jsp:include page="../includes/footer.jsp"/>