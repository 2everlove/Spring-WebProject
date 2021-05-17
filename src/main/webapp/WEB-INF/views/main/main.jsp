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
	        <div id="navbar__wrapper">
	           	<i class="fas fa-bars" id="navbar__log-bar"></i>
	            <div class="navbar__log">
	                <a href="#"><i class="fab fa-slideshare"></i>widele</a>
	            </div>
	            <div class="navbar__search">
	                <input type="text" name="search" id="navbar__search__iput">
	                <button type="button" id="navbar__search__button"><i class="fas fa-search"></i></button>
	            </div>
	            <!-- <div class="navbar__relatedTags">
	            	추천 검색어
	            	<ul>
	            		<li data-wclick="a:rel.keyword"><a href="#">아이패드프로3</a></li>
	            	</ul>
	            </div> -->
   	             <div class="navbar__wrapper-letf">
	             	<div class="navbar__menu-left">
	             		<ul class="category__list">
	             			<li class="list"><a href="">휴대폰</a></li>
	             			<li class="list"><a href="">컴퓨터</a></li>
	             			<li class="list"><a href="">노트북</a></li>
	             			<li class="list"><a href="">생활가전</a></li>
	             			<li class="list"><a href="">영상가전</a></li>
	             			<li class="list"><a href="">음향가전</a></li>
	             			<li class="list"><a href="">소프트웨어</a></li>
             			</ul>
		            </div>
	             </div>
	            <div class="navbar__wrapper-right">
		            <div class="navbar__menu-right">
		                <button class="navbar__menu__item-login"><i class="fas fa-sign-in-alt"></i>  로그인</button>
		                <button class="navbar__menu__item-login"><i class="fas fa-users"></i>  회원가입</button>
		                <button class="navbar__menu__item-member"><i class="fas fa-user-alt"></i> 마이페이지</button>
		                <button class="navbar__menu__item-member"><i class="fas fa-shopping-cart"></i> 장바구니  /  배송조회</button>
		                <button class="navbar__menu__item active"><i class="fas fa-hand-sparkles"></i> New</button>
		                <button class="navbar__menu__item"><i class="fas fa-dollar-sign"></i>  Sale</button>
		                <button class="navbar__menu__item"><i class="far fa-smile"></i>  Event</button>
		                <button class="navbar__menu__item"><i class="far fa-thumbs-up"></i>  Recommend</button>
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
        </nav>
    </header>
    
    <section class="section__content">
        <!-- New -->
        <div class="section__wrapper">
        	<div class="section__productsList">
	    		<div class="section__title">
	    			<h1>New</h1>
	    		</div>
	    		<div class="section__title-icon">
		   			<h2><i class="fas fa-plus"></i></h2>
		   		</div>
		    	<div class="product__wrapper" id="new">
			    	<div class="new__product">
				        <img src="/resources/images/Apple/Tablet/ipad4.png" class="thumnail__products">
				        <h1 class="new__title">아이패드4</h1>
				        <h3 class="new__description">매우 빠른 A14 바이오닉(Bionic) 프로세서, Usb-c 타입</h3>
				        <h2 class="new__price"><span>40000</span>원</h2>
				        <button class="new__shops">판매처</button>
			        </div>
			    	<div class="new__product">
				        <img src="/resources/images/Apple/Tablet/ipad4.png" class="thumnail__products">
				        <h1 class="new__title">아이패드4</h1>
				        <h3 class="new__description">매우 빠른 A14 바이오닉(Bionic) 프로세서, Usb-c 타입</h3>
				        <h2 class="new__price"><span>40000</span>원</h2>
				        <button class="new__shops">판매처</button>
			        </div>
			    	<div class="new__product">
				        <img src="/resources/images/Apple/Tablet/ipad4.png" class="thumnail__products">
				        <h1 class="new__title">아이패드4</h1>
				        <h3 class="new__description">매우 빠른 A14 바이오닉(Bionic) 프로세서, Usb-c 타입</h3>
				        <h2 class="new__price"><span>40000</span>원</h2>
				        <button class="new__shops">판매처</button>
			        </div>
			    	<div class="new__product">
				        <img src="/resources/images/Apple/Tablet/ipad4.png" class="thumnail__products">
				        <h1 class="new__title">아이패드4</h1>
				        <h3 class="new__description">매우 빠른 A14 바이오닉(Bionic) 프로세서, Usb-c 타입</h3>
				        <h2 class="new__price"><span>40000</span>원</h2>
				        <button class="new__shops">판매처</button>
			        </div>
			    	<div class="new__product">
				        <img src="/resources/images/Apple/Tablet/ipad4.png" class="thumnail__products">
				        <h1 class="new__title">아이패드4</h1>
				        <h3 class="new__description">매우 빠른 A14 바이오닉(Bionic) 프로세서, Usb-c 타입</h3>
				        <h2 class="new__price"><span>40000</span>원</h2>
				        <button class="new__shops">판매처</button>
			        </div>
		    	</div>
	    	</div>
	    	
	   	    <!-- Sale -->
	   	    <div class="section__productsList">
		    	<div class="section__title">
		   			<h1>Sale</h1>
		   		</div>
		   		<div class="section__title-icon">
		   			<h2><i class="fas fa-plus"></i></h2>
		   		</div>
		    	<div class="product__wrapper" id="sale">
		    		<div class="sale__product">
				        <img src="/resources/images/Apple/Tablet/ipad4.png" class="thumnail__products">
				        <h1 class="new__title">아이패드4</h1>
				        <h3 class="new__description">매우 빠른 A14 바이오닉(Bionic) 프로세서, Usb-c 타입</h3>
				        <h2 class="new__price"><span>40000</span>원</h2>
				        <button class="new__shops">판매처</button>
			        </div>
		    	</div>
	    	</div>
	    	<!-- Event -->
	    	<div class="section__productsList">
	    		<div class="section__title">
	    			<h1>Event</h1>
	    		</div>
	    		<div class="section__title-icon">
		   			<h2><i class="fas fa-plus"></i></h2>
		   		</div>
		    	<div class="product__wrapper" id="event">
		    		<div class="event__product">
				        <img src="/resources/images/Apple/Tablet/ipad4.png" class="thumnail__products">
				        <h1 class="new__title">아이패드4</h1>
				        <h3 class="new__description">매우 빠른 A14 바이오닉(Bionic) 프로세서, Usb-c 타입</h3>
				        <h2 class="new__price"><span>40000</span>원</h2>
				        <button class="new__shops">판매처</button>
		        	</div>
		    	</div>
	    	</div>
	    	
	    	<!-- Recommend -->
	    	<div class="section__productsList">
	   			<div class="section__title">
	    			<h1>Recommend</h1>
	    		</div>
	    		<div class="section__title-icon">
		   			<h2><i class="fas fa-plus"></i></h2>
		   		</div>
		    	<div class="product__wrapper" id="recommend">
		    		<div class="recommend__product">
				    	<img src="/resources/images/Apple/Tablet/ipad4.png" class="thumnail__products">
				        <h1 class="new__title">아이패드4</h1>
				        <h3 class="new__description">매우 빠른 A14 바이오닉(Bionic) 프로세서, Usb-c 타입</h3>
				        <h2 class="new__price"><span>40000</span>원</h2>
				        <button class="new__shops">판매처</button>
			        </div>
		    	</div>
    		</div>
    	</div>
   	</section>

    <!-- footer -->
    <footer class="footer"> 
    	<div class="footer__wrapper">
	    	<div class="footer__site">
	    		<a href="#">이용약관</a>
	    		<a href="#">입점안내</a>
	    		<a href="#">쇼핑윈도 노출안내</a>
	    		<a href="#">쇼핑파트너 센터</a>
	    		<a href="#">고객센터</a>
	    	</div>
	    	<div class="footer__company">
	    		<p><strong>(주)Widele</strong>는 상품판매와 직접적인 관련이 없으며, 모든 상거래의 책임은 구매자와 판매자에게 있습니다.
	    		<br>
				이에 대해 <strong>(주)Widele</strong>는 일체의 책임을 지지 않습니다.
				<br>
				본사에 등록된 모든 광고와 저작권 및 법적책임은 자료제공사 (또는 글쓴이)에게 있으므로 본사는 광고에 대한 책임을 지지 않습니다.</p>
	    	</div>
	    	<div class="footer__language">
	    		<label><i class="fas fa-globe"></i>
		    		<select aria-label="원하시는 언어를 선택하세요.">
	                    <option value="korean">한국어</option>
	                    <option value="english">English</option>
	                    <option value="japanese">Japanese</option>
	                </select>
                </label>
	    	</div>
	    	<div class="footer__copyright">
		    	Copyright © <strong>Widele</strong> Co., Ltd. All Rights
				Reserved.
	    	</div>
    	</div>
    </footer>
</body>
</html>