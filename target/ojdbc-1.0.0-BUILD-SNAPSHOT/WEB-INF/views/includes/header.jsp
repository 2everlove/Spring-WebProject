<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Portfolio for Web Project">
<meta name="autors" content="Baku(Azerbaijan-Baku), skqlgpdls, 2everlove(mika), pescatorio"> 
<title>쇼핑의 모든 것</title>
<!-- css link -->
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/colorPick.dark.theme.css">
<link rel="stylesheet" href="/resources/css/colorPick.css">
<link rel="stylesheet" href="/resources/css/include.css">
<script src="/resources/js/colorPick.js"></script>
<script src="/resources/js/colorPick.min.js"></script>
<!-- icon api -->
<script src="https://kit.fontawesome.com/e8e06f0e5f.js" crossorigin="anonymous"></script>
<!-- icon -->
<link rel="icon" type="image/png" href="/resources/images/favicon1.png">
<!-- google font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
<!-- prefix-free -->
<script src="/resources/js/prefix.js"></script>
<script src="/resources/js/main.js" defer></script>
<script>
	let url = "https://maps.googleapis.com/maps/api/js?key=AIzaSyDPW8y4NCtrRYMFsO3xFYEAFoGuPIILqWI&"
	let country = "region="+window.navigator.language.substring(3,5);
	let lang = "&language="+window.navigator.language.substring(0,2);
	let callback = "&callback=initMap&libraries=places,&v=weekly";
	var script = document.createElement("script");
	script.src = (url+country+lang+callback);
	document.head.appendChild(script);

	function initMap() {
	  // The location of Uluru
	  const lat1= 37.4851619;
	  const lng1= 126.8987031;
	  const zoom1= 18;
	  
	  const widele = { lat: lat1, lng: lng1 };
	  // The map, centered at Uluru
	  const map = new google.maps.Map(document.getElementById("map"), {
	    zoom: 15,
	    center: widele,
	    disableDefaultUI: true,
	  });
	  const contentString =
		    '<div id="content">' +
		    '<div id="siteNotice">' +
		    "</div>" +
		    '<h1 id="firstHeading" class="firstHeading">WorldJobFriend</h1>' +
		    '<div id="bodyContent">' +
		    "<p><b>ワールドジョブフレンド</b>, Springを利用したプロジェクト " +
		    '<p><span style="color:blue;"><b>プロジェクト名</b> : Widele</span>, <b><a href="https://google.co.kr/maps/@'+lat1+','+lng1+','+zoom1+'z" target="_blank">' +
		    "Our Location&lt;Link&gt;</a></b></p> " +
		    "</div>" +
		    "</div>";
		  const infowindow = new google.maps.InfoWindow({
		    content: contentString,
		  });
		  const marker = new google.maps.Marker({
		    position: widele, map,
		    title: "WorldJobFriend 4th (日本就職過程)",
		  });
		  marker.addListener("click", () => {
		    infowindow.open(map, marker);
		  });
		  map.addListener("mouseout", () => {
		    infowindow.close();
		  });
	}
</script>
<script id="googleMap">
</script>
<script type="text/javascript">

$(document).ready(function(){
	const pathName = window.location.pathname;

	//console.log(pathName);

	if(!pathName.match("main")){
		$(".navbar__menu__item").click(function(){
			let data = $(this).attr("data-link");
			let href = "/cond/";
			if(data.match("new")){
				location.href = href+"0";
			}
			if(data.match("sale")){
				location.href = href+"1";
			}
			if(data.match("event")){
				location.href = href+"2";
			}
			if(data.match("recommend")){
				location.href = href+"3";
			}
		});
	}
});

</script>
</head>
<body>
    <header id="header">
        <!-- Navbar -->
        <nav id="navbar">
        <div style="position: static; width: 100%">
	        <div id="navbar__wrapper">
	           	<i class="fas fa-bars" id="navbar__log-bar"></i>
	            <div class="navbar__log">
	                <a href="/main"><i class="fab fa-slideshare"></i>widele</a>
	            </div>
	            <form action="/search" method="get">
		            <div class="navbar__search">
		                <input type="text" name="product_search" id="navbar__search__iput">
		                <button type="submit" id="navbar__search__button"><i class="fas fa-search"></i></button>
		            </div>
	            </form>
	            <!-- <div class="navbar__relatedTags">
	            	추천 검색어
	            	<ul>
	            		<li data-wclick="a:rel.keyword"><a href="#">아이패드프로3</a></li>
	            	</ul>
	            </div> -->
   	             
	            <div class="navbar__wrapper-right">
		            <div class="navbar__menu-right">
		            <c:choose>
		            	<c:when test="${empty sessionScope.user}">
			            	<a href="/login"><button class="navbar__menu__item-login"><i class="fas fa-sign-in-alt"></i>  로그인</button></a>
			                <a href="/member"><button class="navbar__menu__item-login"><i class="fas fa-users"></i>  회원가입</button></a>
			                <a href="/myPage"><button class="navbar__menu__item-member"><i class="fas fa-user-alt"></i> 마이페이지</button></a>
		                	<a href="/cart"><button class="navbar__menu__item-member"><i class="fas fa-shopping-cart"></i> 장바구니  /  배송조회</button></a>
		                	<button class="navbar__menu__item active" data-link="#new"><i class="fas fa-hand-sparkles"></i> New</button>
			                <button class="navbar__menu__item" data-link="#sale"><i class="fas fa-dollar-sign"></i>  Sale</button>
			                <button class="navbar__menu__item" data-link="#event"><i class="far fa-smile"></i>  Event</button>
			                <button class="navbar__menu__item" data-link="#recommend"><i class="far fa-thumbs-up"></i>  Recommend</button>
			                <button class="navbar__menu__item-history">History</button>
		            	</c:when>
		            	<c:otherwise>
			            	<a href="/logout"><button class="navbar__menu__item-logout"><i class="fas fa-sign-in-alt"></i>  <b>[${sessionScope.user.user_id}]</b> 로그아웃</button></a>
			                <a href="/myPage"><button class="navbar__menu__item-member"><i class="fas fa-user-alt"></i> 마이페이지</button></a>
		                	<a href="/cartList"><button class="navbar__menu__item-member"><i class="fas fa-shopping-cart"></i> 장바구니  /  배송조회</button></a>
		                	<button class="navbar__menu__item active" data-link="#new"><i class="fas fa-hand-sparkles"></i> New</button>
			                <button class="navbar__menu__item" data-link="#sale"><i class="fas fa-dollar-sign"></i>  Sale</button>
			                <button class="navbar__menu__item" data-link="#event"><i class="far fa-smile"></i>  Event</button>
			                <button class="navbar__menu__item" data-link="#recommend"><i class="far fa-thumbs-up"></i>  Recommend</button>
			                <button class="navbar__menu__item-history">History</button>
		            	</c:otherwise>
		            </c:choose>
		            </div>
		            <!-- Toggle button -->
		<!--             	<i class="fas fa-arrow-left"></i> -->
		            <button class="navbar__toggle-btn-right">
		            	<i class="fas fa-arrow-right"></i>
		            </button>
		            <button class="navbar__toggle-btn-left">
		            	<i class="fas fa-arrow-left"></i>
		            </button>
	            </div>	   
	                    
            </div>
            <div class="navbar__wrapper-letf">
	             	<div class="navbar__menu-left">
	             		<ul class="category__list">
	             			<li class="list"><a href="/type/tablet" >태블릿</a></li>
	             			<li class="list"><a href="/type/computer">컴퓨터</a></li>
	             			<li class="list"><a href="/type/notebook">노트북</a></li>
	             			<li class="list"><a href="/type/life">생활가전</a></li>
	             			<li class="list"><a href="/type/video">영상가전</a></li>
	             			<li class="list"><a href="/type/sound">음향가전</a></li>
	             			<li class="list"><a href="/type/software">소프트웨어</a></li>
             			</ul>
		            </div>
	             </div> 
            </div>
        </nav>
    </header>
