<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="../../../resources/css/user.css">
<%@include file="../includes/header.jsp" %>
    <section class="section__content">
    	<div id="user_upper"></div>
		<form role="form" action="/loginAction" method="get">
                   <p id="errorMsgArea"></p>
                   <fieldset id="login">
                       <div class="form-group">
                           <input class="form-control" placeholder="id" name="id" value="testuser" autofocus>
                       </div>
                       <div class="form-group">
                           <input class="form-control" placeholder="Password" name="pwd" type="password" value="1234">
                       </div>
                       <div class="checkbox">
                           <label>
                               <input name="useCookie" type="checkbox" value="Remember Me">Remember Me
                           </label>
                       </div>
                       <!-- Change this to a button or input when using this as a form -->
               <button type="submit" class="btn btn-lg btn-success btn-block" onClick="Login">Login</button>
           </fieldset>
           <p>
           <a href="/member">회원가입</a><br> 
           <a href="#" onclick="viewLogin()">로그인화면</a>&nbsp;&nbsp;
           <a href="#" onclick="viewSearchId()">ID찾기</a> &nbsp;&nbsp;
           <a href="#" onclick="viewSearchPwd()">Pwd찾기</a></p>
       </form>
   	</section>

<%@include file="../includes/footer.jsp" %>