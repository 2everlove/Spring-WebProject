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
		
		$("#file_clone").change(function(){
			$('#file_pictureId').val($("#file_clone").val());
		});//
		
		$('#file_pictureId').on("change", function(){
			viewFile($('#file_pictureId').val());
		});//
		
		//파일 업로드
		$("#file_clone").on("change", function(){
			if($('#fileUpload').val()==""){
				alert("파일을 선택하세요.");
				$('#fileUpload').click();
				return false;
			}
			let formData = new FormData(document.uploadForm);
			console.log(formData.get("file_pictureId")+formData.get("uploadFile"));
			//파일업로드 컨트롤러 -> 서버에 저장
			$.ajax({
				url : '/fileUploadAjax',
				method : 'POST',
				dataType : 'json',
				processData : false,
				contentType : false,
				data : formData,
				success : function(datas){
					console.log("success");
					console.log(datas);
					alert(datas.count+"개가 업로드 되었습니다.");
					let file_pictureId = "";
					//$('#attachNo').val(datas.attachNo);
					/* $("") 태그 $("#") id $(".") class */
					$('input[name=file_pictureId]').val(datas.file_pictureId);
					//document.uploadForm.uploadFile.value="";
					$('#fileupload').val("");
					viewFile(datas.file_pictureId);
				},
				error : function(errorThrown){
					console.log(errorThrown);
				}
			});
		});
	});//function

	function pwdCheck(){
		if(!($("input[name=User_password]").val() === $("input[name=pwdCheck]").val())){
			 alert("비밀번호가 일치하지 않습니다.");
		} 
	}//
	
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
					//이미지 썸네일의 경로를 인코딩 처리해서 서버에 보냄
					
					var file_s_savePath = encodeURIComponent(data.file_s_savePath);
					var file_savePath = encodeURIComponent(data.file_savePath);
					console.log(file_s_savePath);
					console.log(data.file_s_savePath);
					
					console.log("인코딩 후 : "+file_savePath);
					let fName = data.file_name;
					//만약 이미지면 이미지 보여줌
					if(data.file_type=='Y'){
						result += "<li><div class='img_wrapper' style='position: relative;'>"
									+"<img src=/fileDisplay?file_name="+file_savePath+" style=' width: 100%; height: 100%; object-fit: cover;'><br>"
									+data.file_name
									+"<span onclick=attachFileDelete('"+data.file_uuid+"','"+data.file_pictureId+"'); data-type='image' style='cursor: pointer; position: absolute; right: 20px; top: 15px; font-size:20px;'>❌</span>"
									+"<p class='arrow_box'>close</p></div></li>";
					} else {
						//이미지가 아니면 파일이름을 출력
						result += "<li>"
									+"<a href=/fileDisplay?file_name="+file_savePath+" download='"+fName +"'><br>"
									+data.file_name+"</a>"
									+"  <span onclick=attachFileDelete('"+data.file_uuid+"','"+data.file_pictureId+"'); style='cursor: pointer; position: absolute; left: 80%; top: 10%;'>❌</span></li>";
					}
					
				});
				if(datas.length == 0){
					if(confirm(file_pictureId+'번에 해당하는 데이터가 없습니다. 다시 검색을 원하시면 확인, \n'+file_pictureId+'번에 데이터를 저장하시려면 취소를 눌러주세요')){
						$('#file_pictureId').val("");
						$('#file_pictureId').select();
					} else {
						$('#fileUpload').click();
					}
				}
				$('#fileList').html(result);
				if($(location).attr('pathname').match('/board/get')){
					$('span[data-type=image]').remove();
				}
			},
			error : function(){
				
			}
		});
	}//
	
	//file 삭제
	function attachFileDelete(file_uuid, file_pictureId){
		$.ajax({
			url:'/fileDelete/'+file_uuid+'/'+file_pictureId,
			method:'get',
			success: function(datas){
				console.log(datas);
				viewFile(file_pictureId);
			},
			error : function(errorThrown){
				console.log(errorThrown);
			}
		})
	}//
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
                		<option value="2">고객</option>
                		<option value="1">기업</option>
                		<option value="0">어드민</option>
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
	               	<label><input type="checkbox" name="User_interesting" value="태블릿">태블릿</label>
                </div>
                <div>
                	<label><input type="file" name="file_pictureId" id="fileupload">file_pictureId</label>
                	<label><input type="file" id="file_clone">file_pictureId</label>
                </div>
                <!-- Change this to a button or input when using this as a form -->
                <button type="button" id="registerBtn" >회원가입</button>
            </fieldset>
        </form>
        <form name="uploadForm" action="/uploadFile" method="post" enctype="multipart/form-data">
			<input type="text" class="form__file" name="file_usingType" id="file_usingType" value="3">
			<input type="text" class="form__file" name="file_pictureId" id="file_pictureId">
			<input type="file" name="uploadFile" id="fileUpload" multiple="multiple" accept="image/*">
			<br>
			<br>
			<button type="button" id="uploadBtn" style="border: 1px solid black; border-radius: 3px;">upload</button>
		</form>
   	</section>

<%@include file="../includes/footer.jsp" %>