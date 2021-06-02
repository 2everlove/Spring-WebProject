<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="../../../resources/css/user.css">
<%@include file="../includes/header.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		
		$("input[name=User_id]").on("change",function(){
			//중복체크 다시 진행
			$("input[name=User_id]").prop("dataValue",false);
		});//중복체크 초기화
			
		$("#registerBtn").on("click", function(){
			$("select[User_gender]").val();
			$("select[User_type]").val();
			$("select[file_pictureId]").val();	//썸네일 저장
			let User_id=$("input[name=User_id]").val();
			if($.isEmptyObject(User_id)){
				alert("id 입력해주세요.");
				return;
			}
			if(!$("input[name=User_id]").prop("dataValue")){
				alert("id 중복검사");
				return false;
			}
			
			$("#registerForm").submit();
		});//registerBtn
		
		$("#checkIdRepeat").click(function(){
			let User_id = $("input[name=User_id]").val();
			if($.isEmptyObject(User_id)){
				alert("id를 입력해주세요");
				return false;
			}//id입력란 공백시 alert'id를 입력해주세요'
			$("input[name=User_id]").prop("dataValue",false);	//User_id의 dataValue 값에 false 반환
			$.ajax({
				url : '/checkIdRepeat/' + User_id,
				method : 'get',
				dataType : 'text',
				success : function(data){
					if(data!="reduplication"){
						// 중복체크가 성공 처리 -> 회원가입 버튼 클릭시 dataValue값 확인
						alert("id가 중복되었습니다");
					} else{
						$("input[name=User_id]").prop("dataValue",true);
						alert("사용 가능한 아이디 입니다");
					}//else
				}//success
			});//ajax
		});	//checkIdRepaet
	});//function

	function pwdCheck(){
		if(!($("input[name=User_password]").val() === $("input[name=pwdCheck]").val())){
			 alert("비밀번호가 일치하지 않습니다.");
		} 
	}
</script>
    <section class="section__content">
    	<div id="user_upper"></div>
		<form role="form" id="registerForm" action="/registerMember" method="post">
            <fieldset>
                <div class="form-group">
                	<p id="errorMsgArea"></p>
                	<label>ID</label><br>
                    <input type="text" placeholder="id" name="User_id" 
                    pattern="[0-9A-Za-z]{6,20}"
                    autofocus required>
                    <button type="button" class="form-control" id="checkIdRepeat">중복 확인</button>
                </div>
                <div class="form-group">
                	<label>PASSWORD</label>
                    <input placeholder="Password" name="User_password" type="password" minlength="4" maxlength="16"
                    pattern = "[0-9A-Za-z!@#$%^&*()]{4,}"><br>
                    <label>PASSCHECK</label><input class="form-control" placeholder="PasswordCheck" name="pwdCheck" type="password"  minlength="4" maxlength="16">
                </div>
                <div class="form-group">
                	<label>이름</label>
                    <input class="form-control" placeholder="name" name="User_name" >
                </div>
                <div class="form-group">
                	<label>EMAIL</label>
                    <input class="form-control" placeholder="email" name="User_email" type="email">
                </div>
                <div class="form-group">
                	<label>CONTACT</label>
                    <input class="form-control" placeholder="contact" name="User_contact" type="text">
                </div>
                <div class="form-group">
                	<label>GENDER</label>
                	<select name="User_gender">
                		<option value="M">남</option>
                		<option value="W">여</option>
                	</select>
                </div>
                 <div class="form-group">
                	<label>BIRTH</label>
                	<select name="User_type">
                		<option value="C">고객</option>
                		<option value="E">기업</option>
                		<option value="A">어드민</option>
                	</select>
                </div>
                <div class="form-group">
                	<label>BIRTH</label>
                	<input type="date" name="User_birth">
                </div>
                <div class="form-group">
                	<label>ADDRESS</label>
                	<input type="text" name="User_address">
                </div>
                <div class="form-group">
                	<label>User_interesting</label>
                	<label><input type="checkbox" name="User_interesting" value="컴퓨터">컴퓨터</label>
                	<label><input type="checkbox" name="User_interesting" value="노트북">노트북</label>
                	<label><input type="checkbox" name="User_interesting" value="가전제품">가전제품</label>
               		<label><input type="checkbox" name="User_interesting" value="핸드폰">핸드폰</label>
	               	<label><input type="checkbox" name="User_interesting" value="태븦릿">태블릿</label>
                </div>
                <div>
                	<label><input type="file" name="file_pictureId">file_pictureId</label>
                </div>
                <!-- Change this to a button or input when using this as a form -->
                <button type="button" id="registerBtn" >회원가입</button>
            </fieldset>
        </form>
   	</section>

<%@include file="../includes/footer.jsp" %>