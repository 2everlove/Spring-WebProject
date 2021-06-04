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
		<form role="form" action="/loginAction" method="post">
            <p id="errorMsgArea"></p>
                <fieldset id="login">
                    <div class="form-group">
                        <input  placeholder="id" name="User_id" value="testuser" autofocus>
                    </div>
                    <div class="form-group">
                        <input  placeholder="Password" name="User_password" type="password" value="1234">
                    </div>
                    <div class="checkbox">
                        <label>
                            <input name="useCookie" type="checkbox" value="Remember Me">Remember Me
                        </label>
                    </div>
                    <!-- Change this to a button or input when using this as a form -->
              		 <button type="submit" onClick="login">Login</button>
           		</fieldset>
     					<!-- 아이디 찾기 -->
                        <fieldset id="searchId">
                           <div class="">
                               <input class="" placeholder="name" id="searchId_name" value="" autofocus>
                           </div>
                           <div class="">
                               <input class="" placeholder="email" id="searchId_email" type="text" value="">
                           </div>
                           <!-- Change this to a button or input when using this as a form -->
                           <button id="btnSearchId" class="" type="button">아이디찾기</button>
                       </fieldset>
                       
                       <!-- 비밀번호찾기 -->
                        <fieldset id="searchPwd">
                           <div class="">
                               <input class="" placeholder="id" id="searchPwd_id" value="" autofocus>
                           </div>
                           <div class="">
                               <input class="" placeholder="email" id="searchPwd_email" type="text" value="">
                           </div>
                           <!-- Change this to a button or input when using this as a form -->
                           <button id="btnSearchPwd"class="" type="button">비밀번호찾기</button>
                       </fieldset>
           		
           <p>
           <a href="/member">회원가입</a><br> 
           <a href="#" onclick="viewLogin()">로그인화면</a>&nbsp;&nbsp;
           <a href="#" onclick="viewSearchId()">ID찾기</a> &nbsp;&nbsp;
           <a href="#" onclick="viewSearchPwd()">Pwd찾기</a></p>
           <p><a href="/getUser">회원상세보기</a></p>
       </form>
       
   	</section>
	<a href="/logout"><button>로그아웃</button></a>
<%@include file="../includes/footer.jsp" %>