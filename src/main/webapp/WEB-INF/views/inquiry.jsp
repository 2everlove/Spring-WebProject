<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- <%@include file="./includes/header.jsp" %> --%>
<head>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">

</head>
<script type="text/javascript">
// 상세보기 이동
function detail(iboard_no){
	document.listForm.action="/inquiryDetail";
	document.listForm.iboard_no.value=iboard_no;
	document.listForm.submit();
}

</script>
<h1>게시판</h1>
<div>
	<div>
		<div>
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>카테고리</th>
						<th>작성자</th>
						<th>작성일시</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="inquiryList1" items="${inquiryList}">
						<tr>
							<td>${inquiryList1.iboard_no }</td>
							
							<td onClick=detail(${inquiryList1.iboard_no})><a href="#">${inquiryList1.iboard_title }<c:if test="${inquiryList1.iboard_public == 1}">(비공개)</c:if></a></td>
							
							<td>${inquiryList1.iboard_category }</td>
							<td>${inquiryList1.user_id }</td>
							<td>${inquiryList1.iboard_regdate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<button type="button" onclick="location.href='/inquiry_register'">문의하기</button>
<%-- 
<table border=1>
	<c:forEach items="${inquiryList}" var="inquiryList2">
		<tr>
			<td>${inquiryList2.iboard_no }</td>
			<td><a href="/board/get?bno=${inquiryList2.iboard_no }"><c:out
						value="${inquiryList2.iboard_title }" /></a></td>
			<td><c:out value="${inquiryList2.iboard_category}" /></td>
			<td><c:out value="${inquiryList2.user_id }" /></td>
			<td><c:out value="${inquiryList2.iboard_regdate }" /></td>
		</tr>
	</c:forEach>
</table> --%>




<%-- <%@include file="./includes/footer.jsp" %> --%>