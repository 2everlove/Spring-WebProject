/**
 * 리플 Ajax 
 */
/*function getAjaxList(){
	
	$.ajax({
		url : '/inquiry/inquiry_reply' + $("#iboard_no").val(),
		method : 'get',
		dataType : 'json',
		
		success :function(data, status, xhr){
			console.log("data", data);
			var htmlContent="";
				
				$.each(data.list, function(index, item){
					
	
}

*/
/*
 * Reply Insert
 */
function ajaxInsert(){
	
	// 입력할 파라메터를 javascript Object로 만들어 줍니다 
	var replyData = {
			ireply_content : $("#ireply_content").val(),
			iboard_no : $("#iboard_no").val()
	};
	
	console.log("obj", replyData);
	console.log("json", JSON.stringify(replyData));
	
	$.ajax({
		
		url : '/inquiry/insertReply',
		method : 'post',
		dataType : 'json',
		
		// JSON 형식으로 변환
		data : JSON.stringify(replyData),
		contentType : 'application/json; charset=UTF-8',
		
		success: function(data, status){
			
			console.log(data);
			
			if(data.result == "success"){
				getAjaxList();				
			} else {
				alert("입력중 오류가 발생했습니다.");	
			}
			
		},
		error : function(xhr, status, error){
			console.log(error);
		}
			
			
		
	});
	
}

