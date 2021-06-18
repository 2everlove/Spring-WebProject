<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>

<link rel="stylesheet" type="text/css"
	href="/resources/css/reviewproduct.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/star-rating-svg.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="/resources/js/jquery.star-rating-svg.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<!--CDN 링크 -->

<script>
	$(document).ready(
		function() {
			//keyup
			$('#text').on('keyup',function() {
				//
				$('#u_cbox_write_count').html(
					"&nbsp;&nbsp;&nbsp;(" + $(this).val().length + " / 300)");
				//
				if ($(this).val().length > 500) {
					$(this).val($(this).val().substring(0, 300));
					$('#iboard_content_wordcount').html(
						"&nbsp;&nbsp;&nbsp;(300 / 300)");
					alert("글자수가 초과했습니다.");
				}
			});
			//////
			
			getAjaxList();
			//star
			$(".star").starRating({
				starSize: 25,
				disableAfterRate: false,
		        callback: function(currentRating){
		        	//현재 rating : currentRating
		            $("#review_rate").val(currentRating);
		        }
			});
	}); /* 글자수 제한 엔딩 태그 */
			
	$(document).ready(function() {
		$("#insertProductReview").on("click", function() {
			ajaxInsert();
		});
		getAjaxList();
	});	/* 버튼 Function 태그 */
	
	function getAjaxList() {
		console.log("pBoard.pboard_unit_no="+$("#unit_no").val())
		$.ajax({
			url : '/product/reviewproduct/' + $("#unit_no").val(), 
			method : 'get',
			dataType : 'json',
			processData : false,
			contentType : false,

			success : function(data, status, xhr) {

				console.log("data", data);
				
				
				var htmlContent = "";

				$.each(data.list, function(index, item) {
					console.log(item);

					htmlContent += "<div class='u_cbox_comment_box u_cbox_type_profile'>"
								+ "<div class='u_cbox_area'>"
								+ "<div class='u_cbox_info'>"
								+ "<div class='c_cbox_rating'>" + item.review_rate + "</div>"
								+ "<div class='u_cbox_info_main'>"
								+ "<p class='u_cbox_nick_area'>"
								+ item.user_id
								+ "</p>"
								+ "<span class='u_cbox_date'>" + item.review_regdate + "</span>"
								+ "<input type='hidden' value='" + item.review_num + "'>"
								+ "<input type='hidden' value='" + item.pboard_unit_no + "'>"
								+ "</div>"
								+ "<div class='clear'>" + "</div>"
								+ "<div class='u_cbox_text_wrap'>"
								+ "<div class='u_cbox_contents'>"
								+ item.review_content
								+ "</div>"
								+ "</div>"
								+ "</div>"
								+ "</div>"
								+ "</div>"
								+ "</div>"
					
					$(".list").html(htmlContent);
				})

			},

			error : function(xhr, status, error) {

				console.log("error", error);
			}
		});

	}
	
	function ajaxInsert() {
		if (confirm("리뷰를 등록하시겠습니까? 등록 후 수정이 불가합니다.") == true){
			
			if ($("#text").val() == '') {
				alert("내용을 입력해주세요");
				return false;
			}
			
		var replyData = {
			pboard_unit_no : $("#unit_no").val(),
			review_content : $("#text").val(),
			review_rate : $("#review_rate").val(),
			user_id : $("#user_id").val(),
			
		};

		$.ajax({

			url : '/product/reviewproduct/insertProductReview',
			method : 'post',
			dataType : 'json',

			data : JSON.stringify(replyData),
			contentType : 'application/json; charset=UTF-8',

			success : function(data, status) {
				console.log(data);
				$("#text").val("");
				$("#review_rate").val("");

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
<input type="hidden" name="pboard_unit_no" value="${pBoard.pboard_unit_no}" id="unit_no">

<!-- 댓글 조회 삽입 장소 -->
<div class="comment-total">

</div>

<div class="list">

</div>


	<div class="comment_section">
		<div class="top-wrap">
			<input type="hidden" id="user_id" name ="user_id" class="comment_id" value="user01">user01
			<p class="product_rating">
				<div class="jq-stars star"></div>
				<input type="text" id="review_rate" name="review_rate" class="product_rating" value="5">
				<input type="hidden" name="pboard_unit_no" id="pboard_unit_no" value="${pBoard.pboard_unit_no}">
			<p>
		</div>
		<div class="middle-wrap">
			<div class="input_area">
				<textarea rows="20" class="text" id="text" name="review_content" placeholder="댓글을 입력해주세요" wrap="hard" style="white-space: pre;"></textarea>
			</div>
		</div>
		<div class="bottom-wrap">
			<div id="u_cbox_write_count">&nbsp;&nbsp;&nbsp;0/300</div>
			<div class="button-position">
				<button type="button" id="insertProductReview"
					class="u_cbox_btn_upload" style="display: inline;">등록</button>
				<div></div>

			</div>

</body>

<%-- 	<c:forEach var="productReviewList1" items="${productReviewList }">
		<div class="list">
		
			<div class="u_cbox_comment_box u_cbox_type_profile">
				<div class="u_cbox_area">
					<div class="u_cbox_info">
						<div class="c_cbox_rating">${productReviewList1.review_rate}</div>
						<div class="u_cbox_info_main">
							<p class="u_cbox_nick_area">
								<c:out value='${productReviewList1.user_id}' />
							</p>
							<span class="u_cbox_date">${productReviewList1.review_regdate}</span>
							<input type="text" value='${productReviewList1.review_num}'>
							<input type="text" value='${productReviewList1.pboard_unit_no}'>
						</div>
						<div class="clear"></div>
						<div class="u_cbox_text_wrap">
							<div class="u_cbox_contents">
								${productReviewList1.review_content}</div>
						</div>

					</div>
					<!-- info -->
				</div>
				<!-- area -->
			</div>
			<!-- u_cbox_comment_box u_cbox_type_profile -->
		</div>
	</c:forEach> --%>
	<!-- list -->


