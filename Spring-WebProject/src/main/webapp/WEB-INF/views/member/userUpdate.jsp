<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="../../../resources/css/user.css">
<%@include file="../includes/header.jsp" %>
<script type="text/javascript">
if('${updateErrorMsg}' != ''){
	alert('${updateErrorMsg}');	
}
$(document).ready(function(){
	//사진 id
	let file_pictureId = ${sessionScope.user.file_pictureId};
	/*object 중 13번째 값  */
	viewFile(file_pictureId);
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
		
		if(!
			$("#User_password").val() === $("#pwdCheck").val()
				){
			 		alert("비밀번호가 일치하지 않습니다.");
			 		return false;
		}
		
		$("#userUpdateForm").submit();
	});//userUpdateBtn
	
	 $("#uploadBtn").on("click",function(){
			
			let formData = new FormData(document.uploadForm);
			console.log("file_pictureId:"+formData.get("file_pictureId")+"/uploadFile : "+formData.get("uploadFile"));
			
			$.ajax({
				url : '/fileUploadAjax',
				method:'POST',
				dataType:'json',
				processData:false,
				contentType:false,
				data:formData,
				success:function(result){
					console.log("uploadAjax result",result);
					$('input[name=file_pictureId]').val(result.file_pictureId);
					console.log($("uploadFile"));
					$("#uploadFile").val("");
					let file_pictureId = "";
					console.log("result.file_pictureId"+result.file_pictureId);
					viewFile(result.file_pictureId);
				}
			})
		}); //uploadBtn
		
		//파일view
		function viewFile(file_pictureId){
			$.ajax({
				url:'/fileUploadAjax/'+file_pictureId,
				method : 'get',
				dataType : 'json',
				success : function(datas){
					let result ="";
					$.each(datas, function(i, data){
						console.log(data);
						console.log(data.file_s_savePath);
						//이미지 썸네일의 경로를 인코딩 처리해서 서버에 보냄
						let file_s_savePath = encodeURIComponent(data.file_s_savePath);
						let file_savePath = encodeURIComponent(data.file_savePath);
						console.log(file_s_savePath);
						console.log(file_savePath);
						
						console.log("인코딩 후 : "+file_savePath);
						let fName = data.file_name;
						//만약 이미지면 이미지 보여줌
						if(data.file_type=='Y'){
							result = "<li>"
										+"<img src=/fileDisplay?file_name="+file_savePath+" style=' width: 100px; height: 100px; object-fit: cover;'>"
										+"<input type='hidden' id='file_id' value='"+data.file_pictureId+"'>"
										+"</li>";
						} else {
							//이미지가 아니면 파일이름을 출력
							result = "<p>이미지 파일이 아닙니다.</p>"
						}
						$("#file_pictureIdClone").val(data.file_pictureId);
					});
					$('#fileList').html(result);
					if($(location).attr('pathname').match('/board/get')){
						$('span[data-type=image]').remove();
					}
				},
					
				error : function(){
					
				}//error
			});//ajax
		}//viewFile
		$('#file_pictureId').on("change", function(){
			viewFile($('#file_pictureId').val());
		});
});
</script>
	<c:if test="${!empty sessionScope.user}">
    <section class="section__content">
    	<div id="user_upper"></div>
    	<fieldset class="uploadField">
    		<form id="uploadForm" name="uploadForm" action="/uploadFile" method="post" enctype="multipart/form-data">
		   		<div contentEditable="true" id="upload__view" style="border: 1px solid black; border-radius: 3px; min-height: 50px; width: 100px;">
		   		<!-- 파일을 보여주기 -->
		   		<ul id="fileList">
				</ul></div>
		       	<input type="file" name="uploadFile" id="uploadFile" accept="image/*" multiple="multiple">
		       	<!-- <input type="hidden" name="file_pictureId" id="file_pictureId"> -->
		       	<input type="hidden" name="file_usingType" id="file_usingType" value="3">
		       	<button type="button" name="uploadBtn" id="uploadBtn">업로드</button>
		   	</form>
		   	</fieldset>
		<form role="form" id="userUpdateForm" action="/userUpdate" method="post">
			<div class="member">
            <fieldset class="parent">
                <div class="register-group div1">
                	<p id="errorMsgArea"></p>
                	<label>ID<br><input type="text" name="User_id" value="${sessionScope.user.user_id}"readonly></label>
                </div>
                <div class="register-group div2">
                	<p></p>
                	<label>NAME<br><input type="text" name="User_name" value="${sessionScope.user.user_name}"readonly></label>
                </div>
                <div class="register-group div3">
                	<label>TMP PASSWORD</label>
                    <input placeholder="Password" name="tmp_password" type="password"  minlength="4" maxlength="16"
                    pattern = "[0-9A-Za-z!@#$%^&*()]{4,}"><br>
                    <label>NEW PASSWORD</label><input type="password" placeholder="NewPassword" id="User_password" name="User_password" maxlength="16" pattern="[0-9A-Za-z!@#$%^&*()]{4,}"><br>
                    <label>NEW PASSCHECK</label><input placeholder="passwordCheck" name="pwdCheck" type="password" id="pwdCheck" maxlength="16"><br>
                </div>
                <div class="register-group div4">
                	<label>EMAIL</label><br>
                    <input class="form-control" placeholder="email" name="User_email" type="email" value="${sessionScope.user.user_email}" required>
                </div>
                <div class="register-group div5">
                	<label>CONTACT</label><br>
                    <input class="form-control" placeholder="contact" name="User_contact" type="text"  placeholder="000-0000-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13" value="${sessionScope.user.user_contact}" required>
                </div>
                <div class="register-group div6">
                	<label>GENDER</label><br>
                	<select name="User_gender">
                		<option value="M">남</option>
                		<option value="W">여</option>
                	</select>
                </div >
                <div class="register-group div7">
                	<label>유저타입:</label><input type="text"name=User_type value="${sessionScope.user.user_type }"><br>
                	<label>유저이용상황(벤처리):</label><input type="text" name="User_enabled" value="${sessionScope.user.user_enabled}">
                </div>
                <div class="register-group div8">
                	<label>BIRTH</label><br>
                	<input type="date" name="User_birth" value="${sessionScope.user.user_birth }">
                </div>
                <div class="register-group div9">
                	<label>ADDRESS</label><br>
                	<input type="text" name="User_address" value="${sessionScope.user.user_address}">
                	<!-- 파일관련 hidden -->
					<input type="hidden" class="file_pictureId" name="file_pictureId" id="file_pictureIdClone">
					<input type="hidden" class="file_name" name="file_name" id="file_name">
                </div>
                <div class="register-group div10">
                	<label>User_interesting</label><br>
                	<label class="interenting-label"><input type="checkbox" name="User_interesting" value="컴퓨터" >컴퓨터</label>
                	<label class="interenting-label"><input type="checkbox" name="User_interesting" value="노트북" >노트북</label>
                	<label class="interenting-label"><input type="checkbox" name="User_interesting" value="가전제품" >가전제품</label>
               		<label class="interenting-label"><input type="checkbox" name="User_interesting" value="핸드폰">핸드폰</label>
	               	<label class="interenting-label"><input type="checkbox" name="User_interesting" value="태블릿" >태블릿</label>
                </div>
                <div class="register-group div11">
                </div>
                <!-- Change this to a button or input when using this as a form -->
                <div class="register-group div12">
                	<button type="button" id="userUpdateBtn" class="login-button">회원 수정</button>
                </div>
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