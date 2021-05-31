<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header.jsp" %>
    <script type="text/javascript">
	document.title='${search} : widele';
	$(document).ready(function(){
		$("#product_category-btn").click(function(){
			checkProductName();
		});
	});
	
	function checkProductName(){
		let code_type = $("input[name=code_type]:checked").val();
		let code_value = $("#code_value").val();
		$.ajax({
			url:'/checkProduct/'+code_type+"/"+code_value,
			method: 'get',
			dataType:'json',
			success: function(datas, status){
				let result ="";
				console.log(datas);
				if(datas.result != "error"){
					$.each(datas.result, function(i, data){
						result += "<option value="+data+">"+data+"</option>"
					});
				} else{
					if(confirm("조회하는 값이 없습니다. ["+code_type+"] "+code_value+"의 추가를 원하시면 문의해주세요.")){
						window.location.href = "/inquiry";
					} else {
						$("#code_value").select();
					}
					
				}
				$("#search__select").html(result);
			},
			error: function(errorThorwon){
				console.log(errorThorwon);
			}
			
		});
	}
</script>

<%@include file="../includes/footer.jsp" %>