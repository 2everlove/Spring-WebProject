/**
 * 리플 Ajax 
 */
function getAjaxList(){
	
	$.ajax({
		url : '/reply/list/' + $("#bno").val()+'/'+$("#replyPageNo").val(),
		method : 'get',
		dataType : 'json',
		
		success :function(data, status, xhr){
			console.log("data", data);
			debugger;
			var htmlContent="";

			// 리스트에 데이터가 0건 이면 
			if(data.list.length == 0){
				// '등록된 댓글이 없습니다.' 메세지 보여주기 
				htmlContent +=   "<li class='left clearfix'>"
								+"<div>"
								+		"<p> 등록된 댓글이 없습니다. </p>"
								+	"</div>"
								+"</li>";
				
				$(".chat").html(htmlContent);

			// 리스트 보여주기
			} else {
				
				$.each(data.list, function(index, item){
					
					htmlContent += 
						"<li onclick=replyDetail('" + item.rno + "') class='left clearfix' data-rno=''>"
						+"<div>"
						+	"<div class='header'><strong class='primary-font'>["+ item.rno +"] "+ item.replyer +"</strong>" 
						+		"<small class='pull-right text-muted'>"+ item.updatedate +"</small>"
						+	"</div>"
						+		"<p>"+ item.reply +"</p>"
						+	"</div>"
						+"</li>";
					
				});
				
				// 리스트 생성
				$(".chat").html(htmlContent);
				
				// 페이지 생성
				replyPage(data.pageNavi);
				
			}
			
			
			
		}, 
		error : function(xhr, status, error){
			console.log("error", error);	
		}
	});
	
}


/*
 * Reply Insert
 */
function ajaxInsert(){
	
	// 입력할 파라메터를 javascript Object로 만들어 줍니다 
	var replyData = {
			bno : $("#bno").val(),
			reply : $("#reply").val(),
			replyer : $("#replyer").val()
	};
	
	console.log("obj", replyData);
	console.log("json", JSON.stringify(replyData));
	
	$.ajax({
		
		url : '/reply/insert',
		method : 'post',
		dataType : 'json',
		
		// JSON 형식으로 변환
		data : JSON.stringify(replyData),
		contentType : 'application/json; charset=UTF-8',
		
		success: function(data, status){
			
			console.log(data);
			
			if(data.result == "success"){
				// 모달창을 닫기
				$("#myModal").modal("hide");
				
				$("#replyPageNo").val("1");
				// 리스트 조회하기
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

/**
 * 리플 업데이트
 * @returns
 */
function updateAjax(){
	console.log("updateAjax 시작");
	
	// 입력할 파라메터를 javascript Object로 만들어 줍니다 
	var replyData = {
			bno : $("#bno").val(),
			reply : $("#reply").val(),
			replyer : $("#replyer").val(),
			rno : $("#rno").val()
	};
	
	console.log("obj", replyData);
	console.log("json", JSON.stringify(replyData));
	
	$.ajax({
		
		url : '/reply/update',
		method : 'post',
		dataType : 'json',
		
		// JSON 형식으로 변환
		data : JSON.stringify(replyData),
		contentType : 'application/json; charset=UTF-8',
		
		success: function(data, status){
			
			console.log(data);
			
			if(data.result == "success"){
				// 모달창을 닫기
				$("#myModal").modal("hide");
				// 리스트 조회하기
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

/**
 * 댓글 삭제
 * @returns
 */
function deleteAjax(){
	console.log("deleteAjax 시작");
	$.ajax({
		url : '/reply/delete/'+$("#rno").val() ,
		method : 'get',
		dataType : 'json',
			
		success :function(data){
			console.log(data);
			// 리플 리스트 조회
			getAjaxList();
		},
			
		error : function(error){
			console.log(error);
		}
		
		
	});
}

/**
 * 1건의 리플을 조회 
 * @returns
 */
function getAjax(){
	
	$.ajax({
		url : '/reply/get/' + $("#rno").val(),
		method : 'get',
		dataType : 'json',
		
		success : function(data, status){
			console.log(data);

			$("#reply").val(data.reply);
			$("#replyer").val(data.replyer);
			
		},
		error : function(xhr, status, error){
			console.log(data);
		}
		
		
	});
}

function commAjax(url, method, data, callback, error){
	
	$.ajax({
			
			url : url,
			method : method,
			dataType : 'json',
			
			// JSON 형식으로 변환
			data : JSON.stringify(data),
			contentType : 'application/json; charset=UTF-8',
			
			success: function(data, status){
				console.log(data);
				if(callback){
					callback(data);
				}
			},
			error : function(xhr, status, error){
				console.log(error);
				if(error){
					error(errorThrown);
				}
			}
				
		});
}



