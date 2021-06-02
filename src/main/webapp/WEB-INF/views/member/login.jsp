<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="../../../resources/css/user.css">
<%@include file="../includes/header.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		
	});


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
           <p>
           <a href="/member">회원가입</a><br> 
           <a href="#" onclick="viewLogin()">로그인화면</a>&nbsp;&nbsp;
           <a href="#" onclick="viewSearchId()">ID찾기</a> &nbsp;&nbsp;
           <a href="#" onclick="viewSearchPwd()">Pwd찾기</a></p>
           <a href="/userUpdate">회원정보수정</a></p>
       </form>
   	</section>
	<a href="/logout"><button>로그아웃</button></a>
<%@include file="../includes/footer.jsp" %>