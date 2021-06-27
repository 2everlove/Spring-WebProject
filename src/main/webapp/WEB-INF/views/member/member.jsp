<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="../../../resources/css/user.css">
<%@include file="../includes/header.jsp" %>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e6bac257a0b73cfaf15255dbb453d5f&libraries=services"></script>
<script src='//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js'></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		//지도 api
		$('.user_address_search').click(function(){
			let tr = $(this).closest("div");
			var mapContainer = tr.find('#kmap')[0], // 지도를 표시할 div
			mapOption = {
			    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
			    level: 5 // 지도의 확대 레벨
			};
			
			//지도를 미리 생성
			var map = new daum.maps.Map(mapContainer, mapOption);
			//주소-좌표 변환 객체를 생성
			var geocoder = new daum.maps.services.Geocoder();
			//마커를 미리 생성
			var marker = new daum.maps.Marker({
			    position: new daum.maps.LatLng(37.537187, 127.005476),
			    map: map
			});
			
			new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수
	                tr.find('#kmap').show();
	                // 주소 정보를 해당 필드에 넣는다.
	                tr.find('.user_address').val(addr+" ");
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {

	                        var result = results[0]; //첫번째 결과의 값을 활용

	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                    }
	                });
	            }
	        }).open();
			tr.find('.user_address').select();
		});
		
		
		$("input[name=User_id]").on("change",function(){
			//중복체크 다시 진행
			$("input[name=User_id]").prop("dataValue",false);
		});//중복체크 초기화
		
		
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
											+"<input id='file_id' value='"+data.file_pictureId+"'>"
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
			
		$("#registerBtn").on("click", function(){
			let User_gender=$("select[User_gender]").val();
			let User_type=$("select[User_type]").val();
			let uploadFile=$("select[uploadFile]").val();	//썸네일 저장
			let file_pictureId=$("select[file_pictureId]").val();
			let User_id=$("input[name=User_id]").val();
			let User_password=$("input[name=User_password]").val();
			let pwdCheck=$("input[name=pwdCheck]").val();
			let User_name=$("input[name=User_name]").val();
			let User_email=$("input[name=User_email]").val();
			let User_contact=$("input[name=User_contact]").val();
			
			if(!$("input[name=User_id]").prop("dataValue")){
				alert("id 중복검사를 해주세요.");
				return false;
			}
			if($("input[name=User_password]").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("input[name=User_password]").select();
				return false;
			}
			if($("input[name=pwdCheck]").val()==""){
				alert("비밀번호 확인란을 입력해주세요.");
				$("input[name=pwdCheck]").select();
				return false;
			}
			if($("input[name=User_name]").val()==""){
				alert("이름을 입력해주세요.");
				$("input[name=User_name]").select();
				return false;
			}
			if($("input[name=User_email]").val()==""){
				alert("email을 입력해주세요.");
				$("input[name=User_email]").select();
				return false;
			}
			if($("input[name=User_contact").val()==""){
				alert("연락처를 입력해주세요.");
				$("input[name=User_contact]").select();
				return false;
			}
			if($("input[name=User_birth").val()==""){
				alert("생일을 입력해주세요.");
				$("input[name=User_birth]").select();
				return false;
			}
			//비밀번호 체크
			if(!($("input[name=User_password]").val() === $("input[name=pwdCheck]").val())){
				 alert("비밀번호가 일치하지 않습니다.");
				 return false;
			} 
			//submit
			console.log(file_pictureId);
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
    		<h2 style="text-align:center; font-size:20px;">회원가입</h2>
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
			<div class="member">
			<form role="form" id="registerForm" action="/registerMember" method="post">
            <fieldset class="parent">
               		<div class="register-group div1">
                	<p id="errorMsgArea"></p>
                	<label>ID</label><br>
                	<c:choose>
                		<c:when test="${!empty user }">
                			<input type="text" value="${user.user_id}" name="User_id"  pattern="[0-9A-Za-z]{6,20}"autofocus required>
                		</c:when>
                		<c:otherwise>
                			<input type="text" name="User_id"  pattern="[0-9A-Za-z]{6,20}"autofocus required>
                		</c:otherwise>
                	</c:choose>
                	            
                	
                    <button type="button" class="form-control" id="checkIdRepeat" style="margin: 0px 10px;">중복 확인</button>
                </div>
                <div class="register-group div2">
                	<label>PASSWORD</label>
                    <input placeholder="Password" name="User_password" type="password" minlength="4" maxlength="16"
                    pattern = "[0-9A-Za-z!@#$%^&*()]{4,}"><br>
                    <label>PASSCHECK</label><input class="form-control" placeholder="Check" name="pwdCheck" type="password"  minlength="4" maxlength="16">
                </div>
                <div class="register-group div3">
                	<label>이름</label><br>
                	<c:if test="${user!=null}">
                    <input class="form-control" value="${user.user_name}" name="User_name" required></c:if>
                    <c:if test="${user==null}"><input class="form-control" placeholder="name" name="User_name" required></c:if>
                </div>
                <div class="register-group div4">
                	<label>EMAIL</label><br>
                    <input class="form-control" placeholder="email" name="User_email" type="email" value="${user.user_email}" required>
                </div>
                <div class="register-group div5">
                	<label>CONTACT</label><br>
                    <input class="form-control" name="User_contact" type="text"  placeholder="000-0000-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13" required>

                </div>
                <div class="register-group div6">
                	<label>GENDER</label><br>
                	<select name="User_gender">
                		<option value="M">남</option>
                		<option value="W">여</option>
                	</select>
                </div>
                 <div class="register-group div7">
                	<label>회원타입</label><br>
                	<select name="User_type">
                		<option value="2">고객</option>
                		<option value="1">기업</option>
                	</select>
                </div>
                <div class="register-group div8">
                	<label>BIRTH</label><br>
                	<input type="date" name="User_birth">
                </div>
                <div class="register-group div9">
                	
                </div>
                <div class="register-group div10">
                	<label>관심분야</label>
                	<br>
                	<label class="interesting-label"><input type="checkbox" name="User_interesting" value="tablet">태블릿</label>
                	<label class="interesting-label"><input type="checkbox" name="User_interesting" value="desktop">컴퓨터</label>
                	<label class="interesting-label"><input type="checkbox" name="User_interesting" value="notebook">노트북</label>
               		<label class="interesting-label"><input type="checkbox" name="User_interesting" value="life">생활가전</label>
	               	<label class="interesting-label"><input type="checkbox" name="User_interesting" value="video">영상가전</label>
	               	<label class="interesting-label"><input type="checkbox" name="User_interesting" value="sound">음향가전</label>
	               	<label class="interesting-label"><input type="checkbox" name="User_interesting" value="software">소프트웨어</label>
                </div>
                <div class="register-group div11"><p style="text-align:center;color: var(--color-pink);line-height: 20px;font-size: 20px;">ADDRESS</p><br>
                	<input type="text" name="user_address" class="user_address">
					<input type="button" class="user_address_search" value="주소 검색"><br>
					<div id="kmap" style="width:200px;height:200px;margin-top:10px;display:none"></div>
                	<input type="hidden" class="file_pictureId" name="file_pictureId" id="file_pictureIdClone">
                	<input type="hidden" class="file_name" name="file_name" id="file_name"></div>
                <div class="register-group div12"><button type="button" class="login-button" id="registerBtn" >회원가입</button></div>
            </fieldset>
       		</form>
         </div>
   	</section>
<%@include file="../includes/footer.jsp" %>