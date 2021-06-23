<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/user.css">
<%@include file="../includes/header.jsp" %>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- 구글 로그인 api관련 javascript -->
<script>
function onSignIn(googleUser) {
	  let profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	  
		$("input[name=User_email]").prop("dataValue",false);	//User_email의 dataValue 값에 false 반환
		/* $.get("/googleLogin/" + profile.getEmail()+".com",) */
		checkEmailbyGoogle(profile.getEmail());
	}//onSignIn
	 
</script>
<script type="text/javascript">

	$(document).ready(function(){
		$("#searchId").hide();
		$("#searchPwd").hide();
		//메시지 처리
		if('${msg}'!=''){
			console.log('${msg}');
			//alert('${msg}');
			$("#errorMsgArea").html('${msg}');
		}
		$("#btnSearchId").on("click",function(){
			console.log("btnSearchId","click");
			let idVo={
				user_name : $("#searchId_name").val(),
				user_email : $("#searchId_email").val()
			};
			
			console.log("idVo",idVo);
			console.log("json형식",JSON.stringify(idVo));
			
			$.ajax({
				url: '/searchId',
				method: 'post',
				dataType: 'json',
				data: JSON.stringify(idVo),
				contentType: 'application/json;charset=UTF-8',
				success: function(res){
					console.log("결과",res);
					$("#errorMsgArea").html(res.msg);
				},
				error:function(){
					console.log("btnSearchId","ajax error");
				}
			
			});//ajax
			
		});//btnSearchId
		$("#btnSearchPwd").on("click",function(){
			console.log("btnSearchPwd","click");
			let data={
					user_id : $("#searchPwd_id").val(),
					user_email : $("#searchPwd_email").val()
				};
			console.log("data",data);
			$.ajax({
				url: '/searchPwd',
				method: 'post',
				dataType: 'json',
				data: JSON.stringify(data),
				contentType: 'application/json;charset=UTF-8',
				success: function(res){
					console.log("searchPwd.res",res);
					$("#errorMsgArea").html(res.msg);
				},
				error:function(){ 
					console.log("btnSearchPwd","ajax error");
				}//error
			});//ajax
		});//btnSearchPwd
		
	});
	
	function checkEmailbyGoogle(email){
		console.log("email",email);
		$.ajax({
			url : '/googleLogin/'+email ,// encodeURIComponent(email)+".com",
			method : 'GET' ,
			dataType: 'text' ,
			contentType: 'application/json;charset=UTF-8',
			 success : function(data){
				if(data!="fail"){
					// 회원가입 페이지로 이동
					alert("존재하지 않는 Email입니다. 회원가입 페이지로 넘어갑니다.");
					$("input[name= User_id]").val(profile.getId());
					$("input[name= User_email]").val(profile.getEmail());
					$("input[name= User_name]").val(profile.getName());
				} else{
					$("input[name= User_id]").val(profile.getId());
					$("input[name= User_email]").val(profile.getEmail());
					$("input[name= User_name]").val(profile.getName());
					$("input[name=User_email]").prop("dataValue",true);
					$("#loginBtn").trigger("click");
					console.log(data.user);
				}//else
			},
			error:function(err,status){
				console.log("error : "+err);
			}//error
		});//ajax
	}
	
	//아이디 찾기 클릭 시 화면에 아이디 찾기 영역을 보여줍니다.
	function viewSearchId(){
		console.log("viewSearchId","실행");
		
		
		$("#login").hide();
		$("#searchPwd").hide();
		$("#searchId").show();
	}
	function viewSearchPwd(){
		console.log("viewSearchPwd","실행");
		$("#login").hide();
		$("#searchId").hide();
		$("#searchPwd").show();
	}
	function viewLogin(){
		console.log("viewLogin","실행");
		$("#login").show();
		$("#searchPwd").hide();
		$("#searchId").hide();
	}


</script>
    <section class="section__content">
    	<div id="user_upper"></div>
		<form class="login-form" role="form" action="/loginAction" method="post">
            <p id="errorMsgArea"></p>
            	<h2>회원수정</h2>
                <fieldset id="login">
                	<div style="display:inline; "><a href="/member"class="loginUpperBtn">&nbsp;회원가입</a></div><div style="float:right; "><c:if test="${!empty sessionScope.user}"><a href="/getUser" class="loginUpperBtn" >회원상세보기&nbsp;</a></c:if></div>
                    <div class="login-group">
                    	<label>아이디</label>
                        <input class="login-box" placeholder="id" name="User_id" value="testuser01" autofocus>
                    </div>
                   
                    <div class="login-group">
                    	<label>비밀번호</label>
                        <input class="login-box" placeholder="Password" name="User_password" type="password" value="1234">
                    </div>
                    
                    <!-- Change this to a button or input when using this as a form -->
              		 <div class="loginCheckbox">
                        <label>
                            <input name="useCookie" type="checkbox" value="Remember Me">Remember Me
                        </label>
              		  <div class="viewLogin">
				          <a href="#" onclick="viewSearchId()" class="viewLoginFont">ID찾기</a> &nbsp;&nbsp;
				          <a href="#" onclick="viewSearchPwd()" class="viewLoginFont">Pwd찾기</a></div>
              		  <br>
                    </div>
              		<button type="submit" class="login-button" id="loginBtn" onClick="login">Login</button>
              		<div class="g-signin2" data-onsuccess="onSignIn"></div>
              		 
           		</fieldset>
     					<!-- 아이디 찾기 -->
                        <fieldset id="searchId">
                        	<div style="display:inline; "><a href="/member"class="loginUpperBtn">&nbsp;회원가입</a></div><div style="float:right; "><c:if test="${!empty sessionScope.user}"><a href="/getUser" class="loginUpperBtn" >회원상세보기&nbsp;</a></c:if></div>
                           <div class="login-group">
                           		<label>이름</label>
                               <input class="login-box" placeholder="name" id="searchId_name" autofocus>
                           </div>
                           <div class="login-group">
                           		<label>이메일</label>
                               <input class="login-box" placeholder="email" id="searchId_email" type="text">
                           </div>
                           <!-- Change this to a button or input when using this as a form -->
                           <br>
                           <div class="viewLogin">
                           <a href="#" onclick="viewLogin()" class="viewLoginFont">로그인화면</a>&nbsp;&nbsp;
				           <a href="#" onclick="viewSearchPwd()" class="viewLoginFont">Pwd찾기</a>
				           </div>
                           <button id="btnSearchId" class="login-button" type="button">아이디찾기</button>
                       </fieldset>
                       
                       <!-- 비밀번호찾기 -->
                        <fieldset id="searchPwd">
                           	<div style="display:inline; "><a href="/member"class="loginUpperBtn">&nbsp;회원가입</a></div><c:if test="${!empty sessionScope.user}"><div style="float:right; "><a href="/getUser" class="loginUpperBtn" >회원상세보기&nbsp;</a></div></c:if>
                           <div class="login-group">
                           		<label>아이디</label>
                               <input class="login-box" placeholder="id" id="searchPwd_id" autofocus>
                           </div>
                           <div class="login-group">
                           		<label>이메일</label>
                               <input class="login-box" placeholder="email" id="searchPwd_email" type="text">
                               
                           </div>
                           <!-- Change this to a button or input when using this as a form -->
                           <br>
                           <div class="viewLogin">
	                          <a href="#" onclick="viewLogin()" class="viewLoginFont">로그인화면</a>&nbsp;&nbsp;
					          <a href="#" onclick="viewSearchId()" class="viewLoginFont">ID찾기</a>
				          </div>
                           <button id="btnSearchPwd"class="login-button" type="button">비밀번호찾기</button>
                       </fieldset>
           		
       </form>
       
   	</section>
<%@include file="../includes/footer.jsp" %>