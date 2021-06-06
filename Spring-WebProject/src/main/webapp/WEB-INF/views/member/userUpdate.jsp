<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="../../../resources/css/user.css">
<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<script type="text/javascript">
if('${updateErrorMsg}' != ''){
	alert('${updateErrorMsg}');	
}
$(document).ready(function(){
	 $("#userUpdateBtn").on("click", function(e){
		e.preventDefault();
		let User_gender=$("select[User_gender]").val();
		let User_type=$("select[User_type]").val();
		let User_enabled=$("select[User_enabled]").val();	
		let User_id=$("input[name=User_id]").val();
		let tmp_password = $("input[name=tmp_password]").val();
		let User_password=$("input[name=User_password]").val();
		let pwdCheck=$("input[name=pwdCheck]").val();
		let User_name=$("input[name=User_name]").val();
		let User_email=$("input[name=User_email]").val();
		let User_contact=$("input[name=User_contact]").val();
		let file_pictureId=$("input[name=file_pictureId]").val();
		if($.isEmptyObject(file_pictureId)){
			alert("썸네일을 입력해주세요.");
			return false;
		}
		if($.isEmptyObject(tmp_password)){
			alert("기존 패스워드를 입력해주세요."); //required tag로 작업 가능
			return;
		}
		if($.isEmptyObject(User_password)){
			alert("새로운 패스워드를 입력해주세요.");
			return;
		}
		if($.isEmptyObject(pwdCheck)){
			alert("비밀번호 확인란을 입력해주세요.");
			return false;
		}
		if(!($("input[name=User_password]").val() === $("input[name=pwdCheck]").val())){
			 alert("비밀번호가 일치하지 않습니다.");
			 return false;
		}
		
		if(!
			$("#User_password").val() === $("#pwdCheck").val()
				){
			 		alert("비밀번호가 일치하지 않습니다.");
			 		return false;
		}
		
		if(!$("input[name=file_pictureId]").prop("dataValue"))
		$("#userUpdateForm").submit();
	});//userUpdateBtn
});
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
                <div class="form-group">
                	<label>NAME<input type="text" name="User_name" value="${sessionScope.user.user_name}"readonly></label><br>
                </div>
                <div class="form-group">
                	<label>TMP PASSWORD</label>
                    <input placeholder="Password" name="tmp_password" type="password" minlength="4" maxlength="16"
                    pattern = "[0-9A-Za-z!@#$%^&*()]{4,}"><br>
                    <label>NEW PASSWORD</label><input type="password" placeholder="NewPassword" id="User_password" name="User_password" maxlength="16" pattern="[0-9A-Za-z!@#$%^&*()]{4,}"><br>
                    <label>NEW PASSCHECK</label><input placeholder="passwordCheck" name="pwdCheck" type="password" id="pwdCheck" maxlength="16"><br>
                </div>
                <div class="form-group">
                	<label>EMAIL</label>
                    <input class="form-control" placeholder="email" name="User_email" type="email" value="${sessionScope.user.user_email}" required>
                </div>
                <div class="form-group">
                	<label>CONTACT</label>
                    <input class="form-control" placeholder="contact" name="User_contact" type="text"  placeholder="000-0000-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13" value="${sessionScope.user.user_contact}" required>
                </div>
                <div class="form-group">
                	<label>GENDER</label>
                	<select name="User_gender">
                		<option value="M">남</option>
                		<option value="W">여</option>
                	</select>
                </div>
                	<label>유저타입:</label><input type="text"name=User_type value="${sessionScope.user.user_type }">
                	<label>유저이용상황(벤처리):</label><input type="text" name="User_enabled" value="${sessionScope.user.user_enabled}">
                <div class="form-group">
                	<label>BIRTH</label>
                	<input type="date" name="User_birth" value="${sessionScope.user.user_birth }">
                </div>
                <div>
                	<label>ADDRESS</label>
                	<input type="text" name="User_address" value="${sessionScope.user.user_address}">
                </div>
                <div>
                	<label>User_interesting</label>
                	<label><input type="checkbox" name="User_interesting" value="컴퓨터">컴퓨터</label>
                	<label><input type="checkbox" name="User_interesting" value="노트북">노트북</label>
                	<label><input type="checkbox" name="User_interesting" value="가전제품">가전제품</label>
               		<label><input type="checkbox" name="User_interesting" value="핸드폰">핸드폰</label>
	               	<label><input type="checkbox" name="User_interesting" value="태블릿">태블릿</label>
                </div>
                <div>
                	<label><input type="file" name="file_pictureId" value="${sessionScope.user.file_pictureId}" accept="images/*"></label>
                </div>
                <!-- Change this to a button or input when using this as a form -->
                <button type="button" id="userUpdateBtn" >회원 수정</button>
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