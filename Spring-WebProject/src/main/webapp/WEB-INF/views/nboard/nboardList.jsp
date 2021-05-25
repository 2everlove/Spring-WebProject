<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../../../resources/css/nboard.css">
<jsp:include page="../includes/header.jsp"/>
<script type="text/javascript">
if('${resMsg}' != ''){
	alert('${resMsg}');	
}

// 페이지로 이동
function page(page){
	document.listForm.action="/nboard/nboardList";
	document.listForm.pageNo.value=page;
	document.listForm.submit();
	
}

// 상세보기 이동
function detail(nboard_no){
	document.listForm.action="/nboard/nboardGet";
	document.listForm.nboard_no.value=nboard_no;
	document.listForm.submit();
}
</script>

	 <section class="section__content">
	  <div id="nboard-wrapper">
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <button type="button" onclick="" class="btn btn-default">등록</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" >
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성시간</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="vo" items="${list}">
                                	<tr class="odd gradeX">
                             			<td>${vo.nboard_no }</td>
                                        <td onClick=detail(${vo.nboard_no})><a href="#">${vo.nboard_title }</a></td>
                                        <td>${vo.user_id }</td>
                                        <td class="center">${vo.nboard_regDate }</td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${list.size() == 0 }">
                                <tr class="odd gradeX">
                                	<td colspan='4' align="center">
                                	게시글이 존재하지 않습니다.
                                	</td>
                                </tr>
                                </c:if>
                                </tbody>
                            </table>
						</div>	<!-- panel-body -->
					</div>	<!-- panel panel-default -->
				</div><!-- col-lg-12 -->
			</div>	<!-- row -->
			<!-- Heading -->

		<!-- 페이징 소스 -->
		<nav>
			<ul class="pagination">
				<c:if test="${pageNavi.prv}">
					<li onClick="javascript:page(${pageNavi.startPage-1});"><a href="#">&lt;</a></li>
				</c:if>
				<c:forEach begin="${pageNavi.startPage }" end="${pageNavi.endPage }" var="page">
					<c:choose>
						<c:when test="${page eq pageNavi.cri.pageNo }">
							<li onClick="page(${page })"><a href="#">${page }<span class="active">(current)</span></a></li> <!-- 현재페이지 -->
						</c:when>
						<c:otherwise>
							<li onClick="page(${page })"><a href="#">${page }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageNavi.next}">
					<li onClick="page(${pageNavi.endPage+1});"><a href="#">&gt;</a></li>
				</c:if>
			</ul>
		</nav>
		<!-- 페이징 끝 -->
			
		</div>	<!-- nboard-wrapper -->
	</section>
<jsp:include page="../includes/footer.jsp"/>