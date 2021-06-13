<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="now" class="java.util.Date" />

<%-- <%@include file="../includes/header.jsp" %> --%>
<head>
<link rel="stylesheet" type="text/css" href="/resources/css/inquiry.css">
</head>
<script type="text/javascript">
	if ('${resMsg}' != '') {
		alert('${resMsg}');
	}
</script>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

<fmt:formatDate value="${inquiryList1.iboard_regdate_new}"
	pattern="yyyy-MM-dd" var="inquiryList1.iboard_regdate_new" />

<c:if test="${!empty inquiryList}">

	<section id="container">
		<h2 class="page_title">1:1 문의 게시판</h2>
		<div id="contents">
			<div class="default_cell">
				<div class="table_data">
					<table class="list">
						<colgroup>
							<col style="width: 200px">
							<col style="width: auto">
							<col style="width: 250px">
							<col style="width: 150px">
							<col style="width: 100px">
						</colgroup>
						<thead>
							<tr>
								<th>카테고리</th>
								<th>제목</th>
								<th>작성자</th>
								<th>문의일자</th>
								<th>답변여부</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="inquiryList1" items="${inquiryList}">
								<tr>
									<td style="display: none">${inquiryList1.iboard_no }</td>
									<td>${inquiryList1.iboard_category }</td>

									<td class="title"><a
										href="/inquiry_detail?iboard_no=${inquiryList1.iboard_no }">${inquiryList1.iboard_title }</a>
										<c:if test="${inquiryList1.iboard_public == 1}">(비공개)</c:if> <c:if
											test="${today <= inquiryList1.iboard_regdate_new}">(New)</c:if>
									</td>


									<td>${inquiryList1.user_id }</td>
									<td>${inquiryList1.iboard_regdate }</td>
									
									<td>답변대기</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- list -->

					<div class="paging_wrap">
						<div class="paging">
							<div>
								<ol class="pagination">
									<li>1 2 3 4 5 6 7 8 9</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
				<!-- table_data -->
				<p class="btn_pop_page">
					<button type="button" class="inquiry_button" onclick="location.href='/inquiry_register'">문의하기</button>
				<p>
			</div>
			<!-- default_cell  -->
		</div>
		<!-- contents -->
	</section>
	<!-- container -->

</c:if>
<c:if test="${empty inquiryList}">
	<p>데이터가 없습니다.
</c:if>




<%-- <%@include file="../includes/footer.jsp" %> --%>