<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="../../../resources/css/user.css">
<%@include file="../includes/header.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
	
	
});

</script>
	<c:if test="${!empty sessionScope.user}">
    <section class="section__content">
    	<div id="user_upper"></div>
		<form role="form" id="userUpdateForm" action="/userUpdate" method="post">
		<div class="member">
            <fieldset class="parent">
                <div class="register-group div1">
                	<p id="errorMsgArea"></p>
                	<label>ID<input type="text" name="User_id" value="${user.user_id}"readonly></label><br>
                </div>
                <div class="register-group div2">
                	<label>EMAIL</label>
                    <input class="form-control" name="User_email" type="email" value="${user.user_email}" readonly>
                </div>
                <div class="register-group div3">
                	<label>성함</label>
                    <input class="form-control" name="User_name" type="text" value="${sessionScope.user.user_name}" readonly>
                </div>
                <div class="register-group div4">
                	<label>CONTACT</label>
                    <input class="form-control" placeholder="contact" name="User_contact" type="text" value="${sessionScope.user.user_contact}" readonly>
                </div>
                <div class="register-group div5">
                <label>벤</label>
                <c:if test="${user.user_enabled==0}">
                	<label>벤처리 되었습니다.</label>
                	<label>사유 : ${user.user_enabledContent}</label>
                </c:if>
                <c:if test="${user.user_enabled==2}">
                	<label>탈퇴한 회원입니다. 관련 문의사항이 있다면 관리자에게 연락해주세요.</label>
                </c:if>
                </div>
                <div class="register-group div6">
                	<label>GENDER</label>
                	<label>${user.user_gender}</label>
                </div>
                <div class="register-group div7">
                	<label>회원 등급</label><br>
                	<c:if test="${user.user_type == 0 }">
		                 <P>어드민</P>
                	</c:if>
                	<c:if test="${user.user_type == 1 }">
		                 <P>기업</P>
                	</c:if>
                	<c:if test="${user.user_type == 2 }">
		                 <P>고객</P>
                	</c:if>
                </div>
                <div class="register-group div8">
                	<label>BIRTH</label>
                	<input type="date"  value="${sessionScope.user.user_birth}">
                	<br><label>가입일</label>
                	<input type="date"  value="${sessionScope.user.user_regdate}">
                </div>
                <div class="register-group div9">
                	<label>ADDRESS</label>
                	<label><input type="text" readonly value="${sessionScope.user.user_address}"></label>
                </div>
                <div class="register-group div10">
                	<label>User_interesting</label>
                	<label>${sessionScope.user.user_interesting}</label>
                </div>
                <div class="register-group div11">
                	<c:url value="/fileDisplay" var="urlDesc">
							<c:param name="file_name" value="${fileVO.file_savePath}"></c:param>
						</c:url>
                	<img name="file_pictureId" src="${urlDesc}">
                </div>
                <!-- Change this to a button or input when using this as a form -->
                <div class="register-group div12"><a href="/userUpdate"><button type="button" >회원 수정</button></a></div>
            </fieldset>
        </div>
        </form>
		
   	</section>
	</c:if>
	<c:if test="${empty sessionScope.user}">
		<div id="user_upper"></div>
		<p>로그인 되어있지 않습니다.</p>
		<a href="javascript:history.back()"><input type="button" value="뒤로"></a>
	</c:if>
<%@include file="../includes/footer.jsp" %>