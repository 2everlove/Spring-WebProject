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
			let User_password=$("input[name=User_password]").val();
			let pwdCheck=$("input[name=pwdCheck]").val();
			let User_name=$("input[name=User_name]").val();
			let User_email=$("input[name=User_email]").val();
			let User_contact=$("input[name=User_contact]").val();
			let file_pictureId=$("input[name=file_pictureId]").val();
			if($.isEmptyObject(User_id)){
				alert("id 입력해주세요.");
				return;
			}
			if($.isEmptyObject(User_password)){
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			if($.isEmptyObject(pwdCheck)){
				alert("비밀번호 확인란을 입력해주세요.");
				return false;
			}
			if($.isEmptyObject(User_name)){
				alert("이름을 입력해주세요.");
				return false;
			}
			if($.isEmptyObject(User_email)){
				alert("이메일을 입력해주세요.");
				return false;
			}
			if($.isEmptyObject(User_contact)){
				alert("연락처를 입력해주세요.");
				return false;
			}
			if($.isEmptyObject(file_pictureId)){
				alert("썸네일을 입력해주세요.");
				return false;
			}
			if(!$("input[name=User_id]").prop("dataValue")){
				alert("id 중복검사");
				return false;
			}
			//비밀번호 체크
			if(!($("input[name=User_password]").val() === $("input[name=pwdCheck]").val())){
				 alert("비밀번호가 일치하지 않습니다.");
				 return false;
			} 
			//submit
			$("#registerForm").submit();
		});//registerBtn
		
		//중복체크 event
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
						alert("존재하는 ID입니다.");
					} else{
						$("input[name=User_id]").prop("dataValue",true);
						alert("사용 가능한 아이디 입니다");
					}//else
				}//success
			});//ajax
		});	//checkId Repeat
	});//function

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
                    <label>PASSCHECK</label><input class="form-control" placeholder="Check" name="pwdCheck" type="password"  minlength="4" maxlength="16">
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
                    <input class="form-control" name="User_contact" type="text"  placeholder="000-0000-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13">

                </div>
                <div class="form-group">
                	<label>GENDER</label>
                	<select name="User_gender">
                		<option value="M">남</option>
                		<option value="W">여</option>
                	</select>
                </div>
                 <div class="form-group">
                	<label>회원타입</label>
                	<select name="User_type">
                		<option value="2">고객</option>
                		<option value="1">기업</option>
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
                	<label>관심분야</label>
                	<label><input type="checkbox" name="User_interesting" value="컴퓨터">컴퓨터</label>
                	<label><input type="checkbox" name="User_interesting" value="노트북">노트북</label>
                	<label><input type="checkbox" name="User_interesting" value="가전제품">가전제품</label>
               		<label><input type="checkbox" name="User_interesting" value="핸드폰">핸드폰</label>
	               	<label><input type="checkbox" name="User_interesting" value="태블릿">태블릿</label>
                </div>
                <div>
                	<input type="file" name="file_pictureId" accept="image/* ">
                </div>
                <!-- Change this to a button or input when using this as a form -->
                <button type="button" id="registerBtn" >회원가입</button>
            </fieldset>
        </form>
   	</section>
<%@include file="../includes/footer.jsp" %>