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
<meta name = "google-signin-client_id" content = "528792888517-7i28jjcjf91j33gj5rtjfbn4fh7h671s.apps.googleusercontent.com">
<title>쇼핑의 모든 것</title>
<!-- css link -->
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/colorPick.dark.theme.css">
<link rel="stylesheet" href="/resources/css/colorPick.css">
<link rel="stylesheet" href="/resources/css/include.css">
<!--CDN 링크 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/star-rating-svg.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/jquery.star-rating-svg.js"></script>
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
<script defer>
	let u = "https://maps.googleapis.com/maps/api/js?key=AIzaSyDPW8y4NCtrRYMFsO3xFYEAFoGuPIILqWI&";
	let country = "region='"+window.navigator.language.substring(3,5)+"'";
	let lang = "&language='"+window.navigator.language.substring(0,2)+"'";
	//console.log(u);
	//console.log(country);
	//console.log(lang);
	let callback = "&callback=initMap&libraries=places";
	var script = document.createElement("script");
	script.src = (u+country+lang+callback);
	document.head.appendChild(script);
</script>
<script id="googleMap">
async function initMap() {
	  // The location of Uluru
	  const lat1= parseFloat(37.4851619);
	  const lng1= parseFloat(126.8987031);
	  const zoom1= parseInt(18);
	  
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
		    "<p><b>ワールドジョブフレンド</b>, Springを利用したプロジェクト </p>" +
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
	};
</script>
<script type="text/javascript">

	$(document).ready(function(){
		myStorage = window.localStorage;

		let history = "${sessionScope.history_product_no}";
		if(history!=""){
			localStorage.setItem('his', history);
		}
		let his = localStorage.getItem('his');
		
			
		window.onload = function(){
			if(his!=null || his!=undifined || history!=null){
				historyFunction(his);
			}
				
			if(document.getElementsByClassName('jq-stars').length>0){
				for (let i = 0; i < 30; i++) {
					$(".starGet_" + i).starRating({
						readOnly : true,
						starSize : 25,
						initialRating : $(".rated_star" + i).val()
					});
				}
			}
			
			
		};
		
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
			});
		}
	});
	function historyFunction(his){
		$.ajax({
			url : "/getProductByHistory/"+his,
			method : 'get',
			dataType : 'json',
			async:false,
			success : function(datas){
				let htmlContent = "";
				$.each(datas.histotyList, function(index, hdata) {
					//console.log("data"+index+": "+hdata.pboard_unit_no);
					$.ajax({
						url:'/fileUploadAjax/'+hdata.masterImg,
						method : 'get',
						dataType : 'json',
						async:false,
						success : function(datas){
							let result ="";
							$.each(datas, function(i, data){
								//console.log(data);
								//이미지 썸네일의 경로를 인코딩 처리해서 서버에 보냄
								
								let file_s_savePath = encodeURIComponent(data.file_s_savePath);
								//console.log(data.file_s_savePath);
								
								htmlContent +="<a href='/pDetail/"+hdata.pboard_unit_no+"'>"
									+"<img data-sort="+index+" src=/fileDisplay?file_name="+file_s_savePath+" style=' width: 100px; height: 100px; object-fit: cover;'>"
									+"</a>";
								$(".navbar__menu__item-history").html(htmlContent);
							
							});
						},
						error : function(errorThrown){
							console.log(errorThrown);
						}
					});
				
				});
				
			},
			error : function(errorThrown){
				console.log(errorThrown);
			}
		});
	}
	
	
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
			                <div class="navbar__menu__item-history" style="vertical-align: middle;">History</div>
		            	</c:when>
		            	<c:otherwise>
			            	<a href="/logout"><button class="navbar__menu__item-logout"><i class="fas fa-sign-in-alt"></i>  <b>[${sessionScope.user.user_id}]</b> 로그아웃</button></a>
			                <a href="/myPage"><button class="navbar__menu__item-member"><i class="fas fa-user-alt"></i> 마이페이지</button></a>
		                	<a href="/cartList"><button class="navbar__menu__item-member"><i class="fas fa-shopping-cart"></i> 장바구니  /  배송조회</button></a>
		                	<button class="navbar__menu__item active" data-link="#new"><i class="fas fa-hand-sparkles"></i> New</button>
			                <button class="navbar__menu__item" data-link="#sale"><i class="fas fa-dollar-sign"></i>  Sale</button>
			                <button class="navbar__menu__item" data-link="#event"><i class="far fa-smile"></i>  Event</button>
			                <div class="navbar__menu__item-history" style="vertical-align: middle;">History</div>
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
