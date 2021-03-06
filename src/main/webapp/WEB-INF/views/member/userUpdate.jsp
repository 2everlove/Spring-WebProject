<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="../../../resources/css/user.css">
<%@include file="../includes/header.jsp" %>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e6bac257a0b73cfaf15255dbb453d5f&libraries=services"></script>
<script src='//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js'></script>
<script type="text/javascript">
if('${updateErrorMsg}' != ''){
	$("#errorMsgArea").text('${updateErrorMsg}');	
}
$(document).ready(function(){
	
	//숫자 하이픈(-)
	$(".user_contact_clone").keyup(function(){
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3") );
	});
	$(".user_contact_clone").change(function(){
		let str = $(this).val();
		let tmp = str.replace(/\-/g,'');
		$(this).closest("div").find(".user_contact").val(tmp);
	});
	
	let resMsg = "${resMsg}";
	if(resMsg!="" && resMsg!=" "){
		alert(resMsg);
	}
	
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

	
	
	//사진 id
	let file_pictureId = ${sessionScope.user.file_pictureId};
	/*object 중 13번째 값  */
	viewFile(file_pictureId);
		
		
	 $("#userUpdateBtn").on("click", function(e){
		e.preventDefault();
		console.log("${updateResultMsg}");
		
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
			return false;
		}
		if($.isEmptyObject(User_password)){
			alert("새로운 패스워드를 입력해주세요.");
			return false;
		}
		if($.isEmptyObject(pwdCheck)){
			alert("비밀번호 확인란을 입력해주세요.");
			return false;
		}
		
		if(pwdCheck!=User_password){
	 		alert("새로운 비밀번호가 일치하지 않습니다.");
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
                	<label>ID<br><input type="text" name="User_id" value="${user.user_id}"readonly></label>
                </div>
                <div class="register-group div2">
                	<p></p>
                	<label>NAME<br><input type="text" name="User_name" value="${user.user_name}"readonly></label>
                </div>
                <div class="register-group div3">
                	<label>TMP PASSWORD</label>
                    <input placeholder="Password" id="tmp_password" name="tmp_password" type="password"  minlength="4" maxlength="16"
                    pattern = "[0-9A-Za-z!@#$%^&*()]{4,}"><br>
                </div>
                <div class="register-group div4">
                	<label>EMAIL</label><br>
                    <input class="form-control" placeholder="email" name="User_email" type="email" value="${user.user_email}" required>
                </div>
                <div class="register-group div5">
                	
                    <label>NEW PASSWORD</label><input type="password" placeholder="NewPassword" id="User_password" name="User_password" maxlength="16" pattern="[0-9A-Za-z!@#$%^&*()]{4,}"><br>
                    <label>NEW PASSCHECK</label><input placeholder="passwordCheck" name="pwdCheck" type="password" id="pwdCheck" maxlength="16"><br>
                </div>
                <div class="register-group div6">
                	<label>GENDER</label><br>
                	<select name="User_gender">
                		<option value="M">남</option>
                		<option value="W">여</option>
                	</select>
                </div >
                <div class="register-group div7">
                	<label>유저타입:</label><input type="hidden" name="User_type" value="${user.user_type}"><br>
                	<c:if test="${user.user_type ==2}">
                	<input type="text"placeholder="고객회원" readonly><br>
                	</c:if>
                	<c:if test="${user.user_type ==1}">
                	<input type="text" placeholder="기업회원" readonly><br>
                	</c:if>
                	<c:if test="${user.user_type ==0}">
                	<input type="text" placeholder="어드민" readonly><br>
                	</c:if>
                	<!-- 유저이용상황(벤처리): --><input type="hidden" name="User_enabled" value="${user.user_enabled}">
                </div>
                <div class="register-group div8">
                	<label>BIRTH</label><br>
                	<fmt:parseDate value = "${user.user_birth}"  pattern="yyyy-MM-dd" var="date"/>
                	<fmt:formatDate value="${date}" pattern="yyyy-MM-dd" var="birth"/>
                	<input type="date" name="User_birth" value="${birth }">
                	<input type="hidden" name="User_regdate" value="${user.user_regdate }">
                </div>
                <div class="register-group div9">
                	<label>CONTACT</label><br>
                	<fmt:formatNumber var="contact" value="${user.user_contact}" pattern="###,####,####"  type="number" minIntegerDigits="11"/>
   					<input type="text" class="user_contact_clone" value="<c:out value="${fn:replace(contact, ',', '-')}" />" placeholder="000-0000-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13">
   					<input type="hidden" name="user_contact" class="user_contact" value="${user.user_contact}" placeholder="000-0000-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13">
                </div>
                <div class="register-group div10">
	                <label>관심분야</label>
	                	<br>
   					<label class="interesting-label">
	               		<input class="user_interestingCB" type="checkbox" name="User_interesting" value="tablet" 
	               			<c:forTokens items="${user.user_interesting}" delims="," var="item"><c:if test="${item == 'tablet'}">checked</c:if></c:forTokens>>태블릿
	               	</label>
    				<label class="interesting-label">
    					<input class="user_interestingCB" type="checkbox" name="User_interesting" value="desktop" 
    						<c:forTokens items="${user.user_interesting}" delims="," var="item"><c:if test="${item == 'desktop'}">checked</c:if></c:forTokens>>컴퓨터
    				</label>
                	<label class="interesting-label">
                		<input class="user_interestingCB" type="checkbox" name="User_interesting" value="notebook" 
                			<c:forTokens items="${user.user_interesting}" delims="," var="item"><c:if test="${item == 'notebook'}">checked</c:if></c:forTokens>>노트북
                	</label>
               	
                	<label class="interesting-label">
                		<input class="user_interestingCB" type="checkbox" name="User_interesting" value="life" 
                			<c:forTokens items="${user.user_interesting}" delims="," var="item"><c:if test="${item == 'life'}">checked</c:if></c:forTokens>>생활가전
                	</label>
                	<label class="interesting-label">
                		<input class="user_interestingCB" type="checkbox" name="User_interesting" value="video" 
                			<c:forTokens items="${user.user_interesting}" delims="," var="item"><c:if test="${item == 'video'}">checked</c:if></c:forTokens>>영상가전
                	</label>
                	
                	<label class="interesting-label">
               			<input class="user_interestingCB" type="checkbox" name="User_interesting" value="sound" 
               				<c:forTokens items="${user.user_interesting}" delims="," var="item"><c:if test="${item == 'sound'}">checked</c:if></c:forTokens>>음향가전
               		</label>
                	<label class="interesting-label">
               			<input class="user_interestingCB" type="checkbox" name="User_interesting" value="software" 
               				<c:forTokens items="${user.user_interesting}" delims="," var="item"><c:if test="${item == 'software'}">checked</c:if></c:forTokens>>소프트웨어
               		</label>
                </div>
                <div class="register-group div11">
                <label>ADDRESS</label><br>
                	<input type="text" name="user_address" class="user_address" value="${user.user_address}">
					<input type="button" class="user_address_search" value="주소 검색"><br>
					<div id="kmap" style="width:200px;height:200px;margin-top:10px;display:none"></div>
                	<!-- 파일관련 hidden -->
					<input type="hidden" class="file_pictureId" name="file_pictureId" id="file_pictureIdClone">
					<input type="hidden" class="file_name" name="file_name" id="file_name">
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