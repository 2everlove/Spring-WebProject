<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/user.css">
<%@include file="../includes/header.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#searchId").hide();
		$("#searchPwd").hide();
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
			
			});
			
		});
		$("#btnSearchPwd").on("click",function(){
			console.log("btnSearchPwd","click");
			let data={
					user_id : $("#searchPwd_id").val(),
					user_email : $("#searchPwd_email").val()
				};
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
				}
			});
		});
	});
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
                <fieldset id="login">
                	<div style="display:inline; "><a href="/member"class="loginUpperBtn">&nbsp;회원가입</a></div><div style="float:right; "><a href="/getUser" class="loginUpperBtn" >회원상세보기&nbsp;</a></div>
                    <div class="login-group">
                    	<label>아이디</label>
                        <input class="login-box" placeholder="id" name="User_id" value="testuser" autofocus>
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
              		 <button type="submit" class="login-button" onClick="login">Login</button>
              		 
           		</fieldset>
     					<!-- 아이디 찾기 -->
                        <fieldset id="searchId">
                        	<div style="display:inline; "><a href="/member"class="loginUpperBtn">&nbsp;회원가입</a></div><div style="float:right; "><a href="/getUser" class="loginUpperBtn" >회원상세보기&nbsp;</a></div>
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
                           	<div style="display:inline; "><a href="/member"class="loginUpperBtn">&nbsp;회원가입</a></div><div style="float:right; "><a href="/getUser" class="loginUpperBtn" >회원상세보기&nbsp;</a></div>
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
	<a href="/logout"><button>로그아웃</button></a>
<%@include file="../includes/footer.jsp" %>