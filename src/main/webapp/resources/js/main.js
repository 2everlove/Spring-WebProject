
$(document).ready(function(){
	//우측 사이드바 제어
	 $('.navbar__toggle-btn-right').click(function(){
	 	$('.navbar__menu-right').animate({right:'-100%'},{duratino:'100'});
	 	$('.navbar__toggle-btn-right').animate({right:'-100%'},{duratino:'300'});
		$('.navbar__toggle-btn-left').show(300,'swing');
	 });
	 $('.navbar__toggle-btn-left').click(function(){
		$('.navbar__menu-right').animate({right:0},{duratino:'300'});
		$('.navbar__toggle-btn-right').animate({right:'242px'},{duratino:'300'});
		$('.navbar__toggle-btn-left').hide(300,'swing');
	 })
	 //좌측 사이드바 제어
	$('#navbar__log-bar').click(function(){
		$('#navbar__log-bar').toggleClass('open');
		if($('#navbar__log-bar').hasClass('open')){
			$('.navbar__menu-left').show(300);
		} else {
			$('.navbar__menu-left').hide(300,'swing');
		}
	});
});
