<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>

<link rel="stylesheet" type="text/css"
	href="/resources/css/reviewproduct.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<!--CDN 링크 -->

<script>
	$(document).ready(
			function() {
				$('#text').on(
						'keyup',
						function() {
							$('#u_cbox_write_count').html(
									"(" + $(this).val().length + " / 300)");

							if ($(this).val().length > 500) {
								$(this).val($(this).val().substring(0, 300));
								$('#iboard_content_wordcount').html(
										"(300 / 300)");
								alert("글자수가 초과했습니다.");
							}
						});
			}); /* 글자수 제한 엔딩 태그 */
			
	$(document).ready(function() {
		$("#insertProductReview").on("click", function() {
			ajaxInsert();
		});
		getAjaxList();
	});	/* 버튼 Function 태그 */
	
	function ajaxInsert() {
		if (confirm("답변을 등록하시겠습니까? 등록 후 수정 및 삭제가 불가합니다.") == true){
			
			if ($("#ireply_content").val() == '') {
				alert("내용을 입력해주세요");
				return false;
			}
			
		var replyData = {
			iboard_no : $("#iboard_no").val(),
			ireply_content : $("#ireply_content").val()
			review_rate : $("#ireply_content").val()
			ireply_content : $("#ireply_content").val()
		};

		$.ajax({

			url : '/inquiry/insertReply',
			method : 'post',
			dataType : 'json',

			data : JSON.stringify(replyData),
			contentType : 'application/json; charset=UTF-8',

			success : function(data, status) {
				console.log(data);
				$("#ireply_content").val("");

				if (data.result == "success") {
					getAjaxList();
					
				} else {
					alert("입력 중 오류가 발생했습니다.");
				}
			},
			error : function(xhr, status, error) {
				console.log("error", error);
			}
		});
		}else {
			alert("취소하였습니다.");
			return false;
		}
	}

</script>
</head>
<body>



	<c:forEach var="productReviewList" items="${productReviewList }">
		<div class="list">
			<div class="u_cbox_comment_box u_cbox_type_profile">
				<div class="u_cbox_area">
					<div class="u_cbox_info">
						<div class="c_cbox_rating">${productReviewList.review_rate}</div>
						<div class="u_cbox_info_main">
							<p class="u_cbox_nick_area">
								<c:out value='${productReviewList.user_id}' />
							</p>
							<span class="u_cbox_date">${productReviewList.review_regdate}</span>
							<input type="text" value='${productReviewList.review_num}'>
						</div>
						<div class="clear"></div>
						<div class="u_cbox_text_wrap">
							<div class="u_cbox_contents">
								${productReviewList.review_content}</div>
						</div>

					</div>
					<!-- info -->
				</div>
				<!-- area -->
			</div>
			<!-- u_cbox_comment_box u_cbox_type_profile -->
		</div>
	</c:forEach>
	<!-- list -->
	<div class="comment_section">
		<div class="top-wrap">
			<input type="hidden" name ="user_id" class="comment_id">user_id
			<p class="product_raiting">
				<input type="text" name="review_rate"class="product_rating">
				<input type="text" name="pboard_unit_no">
			<p>
		</div>
		<div class="middle-wrap">
			<div class="input_area">
				<textarea class="text" id="text" name="review_content" placeholder="댓글을 입력해주세요"></textarea>
			</div>
		</div>
		<div class="bottom-wrap">
			<div id="u_cbox_write_count">0/300</div>
			<div class="button-position">
				<button type="button" id="insertProductReview"
					class="u_cbox_btn_upload" style="display: inline;">등록</button>
				<div></div>

			</div>


			<%-- 			<p>${productReviewList.review_num}</p>
			<p>${productReviewList.review_content}</p>
			<p>${productReviewList.review_regdate}</p>
			<p>${productReviewList.review_rate}</p>
			<p>${productReviewList.pboard_unit_no}</p>
			<p>${productReviewList.user_id}</p> --%>
</body>


