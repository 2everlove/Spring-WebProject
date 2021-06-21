<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="now" class="java.util.Date" />

<%@include file="../includes/header.jsp" %>
<head>
<link rel="stylesheet" type="text/css" href="/resources/css/inquiry.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
	if ('${resMsg}' != '') {
		alert('${resMsg}');
	}
/* 	window.onpageshow = function(event) {
	    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
	       history.pushState(null, document.title, location.href);

	    }
	    

	} */
	$(document).ready(function(){
		
		$(".check").click(function(){
			let pub = $(this).closest("td").find(".iboard_public").val();
			let num = $(this).closest("td").find(".iboard_no").val();
			let type = "${sessionScope.user.user_type}";
			let loginId = "${sessionScope.user.user_id}";
			let writer = $(this).closest("td").find(".user_id").val();
			console.log(pub);
			console.log(type);
			console.log(loginId);
			console.log(writer);
			if(pub==0){
				location.href="/inquiry_detail?iboard_no="+num+"";				
			} else {
				if(loginId == null || loginId== ""){
					alert("비밀 글입니다. 게시자나 관리자만 볼 수 있습니다.");
					return false;
				} else {
					if(type != 0 && !loginId.match(writer)){
						alert("비밀 글입니다. 게시자나 관리자만 볼 수 있습니다.");
						return false;
					} else {
						location.href="/inquiry_detail?iboard_no="+num+"";
					}
				}
			}
		}); //.check function 끝
		$(".inquiry_button").click(function(){
			$(this).preventDefault;
			let loginId = "${sessionScope.user.user_id}";
			if(loginId == null || loginId==""){
				alert("로그인 해주세요");
				location.href='/login';
				return false;
			}
			location.href='/inquiry_register';
		}); //.check function 끝
	});
	
</script>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

<fmt:formatDate value="${inquiryList1.iboard_regdate_new}"
	pattern="yyyy-MM-dd" var="inquiryList1.iboard_regdate_new" />


	<section id="container">
		<h2 class="page_title">1:1 문의 게시판</h2>
		<div id="contents">
			<div class="default_cell">
				<div class="table_data">
					<table class="list">
						<colgroup>
							<col style="width: 200px">
							<col style="width: 400px">
							<col style="width: 250px">
							<col style="width: 150px">
							<col style="width: auto">
						</colgroup>
						<thead>
							<tr>
								<th style="font-weight: bold;">카테고리</th>
								<th style="font-weight: bold;">제목</th>
								<th style="font-weight: bold;">작성자</th>
								<th style="font-weight: bold;">문의일자</th>
								<th style="font-weight: bold;">답변여부</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="inquiryList1" items="${inquiryList}">
								<tr>
									<td style="display: none" >${inquiryList1.iboard_no }</td>
									<td>${inquiryList1.iboard_category }</td>

									<td class="title">
											 <%-- <a href="/inquiry_detail?iboard_no=${inquiryList1.iboard_no }" onclick="not_public_auth();">${inquiryList1.iboard_title }</a> --%>
											 <a href="javascript:void(0)" class="check">${inquiryList1.iboard_title }</a>
											 <input type="hidden" class="iboard_no" value="${inquiryList1.iboard_no }">
											 <input type="hidden" class="iboard_public" value="${inquiryList1.iboard_public }">
											 <input type="hidden" class="user_id" value="${inquiryList1.user_id }">
											 
											 <c:if test="${today <= inquiryList1.iboard_regdate_new}"><i class="fas fa-plus-square" style="color:#272b2b;"></i></c:if>
											 <c:if test="${inquiryList1.iboard_public == 1}"><i class="fas fa-lock" style="color:#272b2b;"></i></c:if>
									</td>


									<td>${inquiryList1.user_id }</td>
									<td>${inquiryList1.iboard_regdate }</td>
									
									<c:if test="${inquiryList1.replycount eq 0 }">
										<td id="not_answered">답변대기</td>
									</c:if>
									<c:if test="${inquiryList1.replycount eq 1 }">
										<td id="answered">답변완료</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- list -->
				<span style="display: none">${sessionScope.user.user_id}</span> <!-- 유저 아이디 히든처리 -->
				 <nav aria-label="...">
							  
							  <ul class="pagination">
							  
							  <!-- prev 표시 -->
							  <c:if test="${pageNavi.prev }">
							    <li class="page-item" onClick="javascript:page(${pageNavi.startPage-1});">
							      <a class="page-link" href="#" tabindex="-1">Previous</a>
							    </li>
							  </c:if>
							  <c:forEach begin="${pageNavi.startPage }" end="${pageNavi.endPage }" var="page">
							  
							  	<c:choose>
							  		<c:when test="${page eq pageNavi.cri.pageNo }">
									  	<li class="page-item active" onClick="page(${page})">
									      <a class="page-link" href="#" >${page } <span class="sr-only">(current)</span></a>
									    </li>
								    </c:when>
								  	<c:otherwise>
								    	<li class="page-item" onClick="page(${page})"><a class="page-link" href="#">${page }</a></li>
								    </c:otherwise>
							  	</c:choose>
							  
							  </c:forEach>
							  <!-- next 표시 -->
							  <c:if test="${pageNavi.next }">
							    <li class="page-item" onClick="page(${pageNavi.endPage + 1})">
							      <a class="page-link" href="#">Next</a>
							    </li>
							  </c:if>
							  </ul>
							  
							</nav>
						    <!-- 페이지끝 -->
<!-- 					<div class="paging_wrap">
						<div class="paging">
							<div>
								<ol class="pagination">
									<li>1 2 3 4 5 6 7 8 9</li>
								</ol>
							</div>
						</div>
					</div>
				</div> -->
				<!-- table_data -->
				<p class="btn_pop_page">
					 <button type="button" class="inquiry_button">문의하기</button> 
				</p>
			</div>
			<!-- default_cell  -->
		</div>
		<!-- contents -->
	</section>
	<!-- container -->





<%@include file="../includes/footer.jsp" %>