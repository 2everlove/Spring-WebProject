<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- nboard css -->
<link rel="stylesheet" href="../../../resources/css/nboard.css">
<jsp:include page="../includes/header.jsp" />
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
		<h2 class="page_title">공지 게시판</h2>
		<div id="nboard_upper"></div>
		<div id="contents">
			<div class="default_cell">
				<div class="">
					<c:if test="${ user.user_type==0}">
						<button type="button" class="registerBtn"
							onclick="location.href='/nboard/nboardRegister'">등록</button>
					</c:if>
				</div>
				<div class="table_data">
					<table class="list">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 10%;">
							<col style="width: 20%;">
							<col style="width: 20%;">
							<col style="width: 10%;">
							<col style="width: auto;">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>카테고리</th>
								<th>제목</th>
								<th>내용</th>
								<th>작성자</th>
								<th>작성시간</th>
							</tr>
						</thead>
						<tbody>
								<c:forEach var="vo" items="${list}">
								<c:choose>
									<c:when test="${vo.nboard_public=='1' }">
										<tr>
											<td>${vo.nboard_no }</td>
											<td><c:if test="${vo.nboard_category=='0' }"><label>공지</label></c:if>
											<c:if test="${vo.nboard_category=='1' }"><label>이벤트</label></c:if>
											<c:if test="${vo.nboard_category=='2' }"><label>기타</label></c:if></td>
											<td onClick=detail(${vo.nboard_no})><a href="#">${vo.nboard_title }
											</a></td>
											<td>${vo.nboard_content}</td>
											<td>${vo.user_id }</td>
											<td class="center">${vo.nboard_regDate }</td>
										</tr>
									</c:when>
									<c:when test="${vo.nboard_public=='0' && user.user_type=='0'}">
										<tr>
											<td>${vo.nboard_no }</td>
											<td><c:if test="${vo.nboard_category=='0' }"><label>공지</label></c:if>
											<c:if test="${vo.nboard_category=='1' }"><label>이벤트</label></c:if>
											<c:if test="${vo.nboard_category=='2' }"><label>기타</label></c:if></td>
											<td onClick=detail(${vo.nboard_no})><a href="#">${vo.nboard_title }
											</a><p style="font-weight:bold;">(잠긴글)</p></td>
											<td>${vo.nboard_content}</td>
											<td>${vo.user_id }</td>
											<td class="center">${vo.nboard_regDate }</td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${list.size() == 0 }">
								<tr class="odd gradeX">
									<td colspan='6' align="center" style="width:80vw;">게시글이 존재하지 않습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>

			<!-- 페이징 소스 -->
			<div id="pagination-box">
				<nav style="display: table-cell; vertical-align: middle;">
					<ul class="pagination centered">
						<c:if test="${pageNavi.prev}">
							<li onClick="javascript:page(${pageNavi.startPage-1});"><a
								href="#" tabindex="-1">&lt;</a></li>
						</c:if>
						<c:forEach begin="${pageNavi.startPage }"
							end="${pageNavi.endPage }" var="page">
							<c:choose>
								<c:when test="${page eq pageNavi.cri.pageNo }">
									<li onClick="page(${page })"><a href="#">${page }<span
											class="active"></span></a></li>
									<!-- 현재페이지 -->
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
			</div>
			<!-- 페이징 끝 -->

			<!-- 검색 -->
			<form method=get action=/nboard/nboardList name=listForm>
				<!-- 상세보기 검색 유지용 -->
				<input type=hidden name=nboard_no> <input type=hidden
					name=pageNo value=${pageNavi.cri.pageNo }>
				<!-- 상세보기 검색 유지용 끝 -->
				<div class="form-inline">
					<select class="form-control" name=type>
						<option value=nboard_title
							<c:if test="${pageNavi.cri.type == 'nboard_title'}">selected</c:if>>제목</option>
						<option value=nboard_content
							<c:if test="${pageNavi.cri.type == 'nboard_content'}">selected</c:if>>내용</option>
						<option value=user_id
							<c:if test="${pageNavi.cri.type == 'user_id'}">selected</c:if>>작성자</option>
					</select> <input class="form-control" name=keyword
						value=${pageNavi.cri.keyword }>
					<button type="submit" onClick="page(1)">검색</button>
				</div>
			</form>
			<!-- 검색 끝 -->
		</div>
	</div>
	<!-- Heading -->
</section>
<jsp:include page="../includes/footer.jsp" />