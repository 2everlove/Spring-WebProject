<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="/resources/css/main.css">
<!-- icon api -->
<script src="https://kit.fontawesome.com/e8e06f0e5f.js" crossorigin="anonymous"></script>
<!-- icon -->
<link rel="icon" type="image/png" href="/resources/images/favicon1.png">
<!-- google font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- prefix-free -->
<script src="/resources/js/prefix.js"></script>
<script src="/resources/js/main.js" defer></script>
<script type="text/javascript">

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
		                <button class="navbar__menu__item-login"><i class="fas fa-sign-in-alt"></i>  로그인</button>
		                <button class="navbar__menu__item-login"><i class="fas fa-users"></i>  회원가입</button>
		                <a href="/myPage"><button class="navbar__menu__item-member"><i class="fas fa-user-alt"></i> 마이페이지</button></a>
		                <button class="navbar__menu__item-member"><i class="fas fa-shopping-cart"></i> 장바구니  /  배송조회</button>
		                <button class="navbar__menu__item active" data-link="#new"><i class="fas fa-hand-sparkles"></i> New</button>
		                <button class="navbar__menu__item" data-link="#sale"><i class="fas fa-dollar-sign"></i>  Sale</button>
		                <button class="navbar__menu__item" data-link="#event"><i class="far fa-smile"></i>  Event</button>
		                <button class="navbar__menu__item" data-link="#recommend"><i class="far fa-thumbs-up"></i>  Recommend</button>
		                <button class="navbar__menu__item-history">History</button>
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
