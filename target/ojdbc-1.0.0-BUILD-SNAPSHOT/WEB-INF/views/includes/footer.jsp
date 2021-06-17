<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- footer -->
    <footer class="footer"> 
    	<div class="footer__wrapper">
	    	<div class="footer__site">
	    		<a href="/nboard/nboardList">공지사항</a>
	    		<a href="/inquiry">고객센터</a>
	    	</div>
	    	<div class="footer__company">
	    		<p><strong>(주)Widele</strong>는 상품판매와 직접적인 관련이 없으며, 모든 상거래의 책임은 구매자와 판매자에게 있습니다.
	    		<br>
				이에 대해 <strong>(주)Widele</strong>는 일체의 책임을 지지 않습니다.
				<br>
				본사에 등록된 모든 광고와 저작권 및 법적책임은 자료제공사 (또는 글쓴이)에게 있으므로 본사는 광고에 대한 책임을 지지 않습니다.</p>
	    	</div>
	    	<div class="footer__map">
	    		 <div id="map"></div>
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
    <!-- Arrow up -->
    <button class="arrow-up">
        <i class="fas fa-arrow-up"></i>
    </button>
</body>
    <style>
      #map {
  display: block;
  text-align:center;
  margin:0 auto;
  margin-top:20px;
  height: 300px;
  /* The height is 400 pixels */
  width: 500px;
  /* The width is the width of the web page */
}

    </style>
<script type="text/javascript">
$(document).ready(function(){
/* 	$('#map').on('mouseover', function(){
		$('#map').animate({width:'800px',height:'500px'},300);
		$('.footer').animate({height:'750px'});
		//$('html, body').scrollTop(document.body.scrollHeight);
	});
	$('#map').on('mouseout', function(){
		$('#map').animate({width:'500px',height:'300px'},300);
		$('.footer').animate({height:'550px'});
	}); */
 		$('#map').on('mouseover', function(){
		$('#map').css({width:'800px', height:'500px'});
		$('.footer').css({height:'750px'});
	});
	$('#map').on('mouseout', function(){
		$('#map').css({width:'500px',height:'300px'});
		$('.footer').css({height:'550px'});
	});
	
});
</script>
</html>