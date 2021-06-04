<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="../../../resources/css/user.css">
<%@include file="../includes/header.jsp" %>

<script type="text/javascript">

</script>
	<c:if test="${!empty sessionScope.user}">
    <section class="section__content">
    	<div id="user_upper"></div>
		<form role="form" id="userUpdateForm" action="/userUpdate" method="post">
            <fieldset>
                <div class="form-group">
                	<p id="errorMsgArea"></p>
                	<label>ID<input type="text" name="User_id" value="${sessionScope.user.user_id}"readonly></label><br>
                </div>
                <div class="">
                	<label>EMAIL</label>
                    <input class="form-control" name="User_email" type="email" value="${sessionScope.user.user_email}" readonly>
                </div>
                <div class="">
                	<label>성함</label>
                    <input class="form-control" name="User_name" type="text" value="${sessionScope.user.user_name}" readonly>
                </div>
                <div class="form-group">
                	<label>CONTACT</label>
                    <input class="form-control" placeholder="contact" name="User_contact" type="text" value="${sessionScope.user.user_contact}" readonly>
                </div>
                <c:if test="${sessionScope.user.user_enabled}=='0'">
                	<label>벤처리 되었습니다.</label>
                	<label>사유 : ${sessionScope.user.user_enabledContent}</label>
                </c:if>
                <c:if test="${sessionScope.user.user_enabled}=='2'">
                	<label>탈퇴한 회원입니다. 관련 문의사항이 있다면 관리자에게 연락해주세요.</label>
                </c:if>
                <div class="form-group">
                	<label>GENDER</label>
                	<label>${sessionScope.user.user_gender}</label>
                </div>
                	<c:if test="${sessionScope.user.user_type}=='0'">
		                 <label>어드민</label>
                	</c:if>
                	<c:if test="${sessionScope.user.user_type}=='1'">
		                 <label>기업</label>
                	</c:if>
                	<c:if test="${sessionScope.user.user_type}=='2'">
		                 <label>고객</label>
                	</c:if>
                <div class="">
                	<label>BIRTH</label>
                	<input type="date"  value="${sessionScope.user.user_birth}">
                </div>
                <div class="">
                	<label>가입일</label>
                	<input type="date"  value="${sessionScope.user.user_regdate}">
                </div>
                <div>
                	<label>ADDRESS</label>
                	<label>${sessionScope.user.user_address}</label>
                </div>
                <div>
                	<label>User_interesting</label>
                	<label>${sessionScope.user.user_interesting}</label>
                </div>
                <div>
                	<label><input type="file" name="file_pictureId" value="${sessionScope.user.file_pictureId}"></label>
                </div>
                <!-- Change this to a button or input when using this as a form -->
                <a href="/userUpdate"><button type="button" >회원 수정</button></a>
            </fieldset>
        </form>
   	</section>
	</c:if>
	<c:if test="${empty sessionScope.user}">
		<div id="user_upper"></div>
		<p>로그인 되어있지 않습니다.</p>
		<a href="javascript:history.back()"><input type="button" value="뒤로"></a>
	</c:if>
<%@include file="../includes/footer.jsp" %>