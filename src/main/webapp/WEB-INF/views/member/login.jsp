<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/user.css">
<%@include file="../includes/header.jsp" %>
<script src="https://apis.google.com/js/platform.js" async defer></script>


<script type="text/javascript">

	$(document).ready(function(e){
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
	
	
	function checkEmailbyGoogle(email,id){
		console.log("email",email);
		var request = new XMLHttpRequest();
		$.ajax({
			url : '/googleLogin?email='+email ,// encodeURIComponent(email)+".com",
			method : 'GET' ,
			dataType: 'json' ,
			contentType: 'application/json;charset=UTF-8',
			success : function(data){
				if(data.user=="fail"){
					// 회원가입 페이지로 이동
					$("#User_id").val(id);
					$("#User_email").val(email);
					document.listForm.action="/member";
					document.listForm.submit();
				} else{
					$("input[name=User_email]").prop("dataValue",true);
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
<!-- 구글 로그인 api관련 javascript -->
<script>
//!!!!!!변경하지 마세요!!!!!!
//클릭시 google의 유저정보를 받아서 로그인하는 코드입니다. 
//변경하면 로그인 창에서 자동을 로그인 클릭 없이 자동으로 로그인됩니다.
let clicked=false;//Global Variable
function ClickLogin()
{
    clicked=true;
}
function onSignIn(googleUser) {
	if (clicked) {
		  let profile = googleUser.getBasicProfile();
		  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  console.log('Name: ' + profile.getName());
		  console.log('Image URL: ' + profile.getImageUrl());
		  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		checkEmailbyGoogle(profile.getEmail(),profile.getId());
			/* location.reload(); */
		}//onSignIn
	};
function signOut(){
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function(){
			console.log('User signed out.');
		});
	};

</script>

    <section class="section__content">
    <form method=get action="/admin/productControl" name="listForm">
		<input type="hidden" name ="User_email" id="User_email">
		<input type="hidden" name ="User_id" id="User_id">
	</form>
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
              		<div class="g-signin2" onclick="ClickLogin()" data-onsuccess="onSignIn"></div>
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