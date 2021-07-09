<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>

<link rel="stylesheet" type="text/css"
	href="/resources/css/reviewproduct.css">

<script>
	
	var user_id = "${sessionScope.user.user_id}";
	
	
	$(document).ready(
			function() {
				
				$(".comment_section").show();
				$(".reviewed").hide();
				//keyup
				$('#text').on(
						'keyup',
						function() {
							//
							$('#u_cbox_write_count').html(
									"(" + $(this).val().length + " / 300)");
							//
							if ($(this).val().length > 300) {
								$(this).val($(this).val().substring(0, 300));
								$('#u_cbox_write_count').html("(300 / 300)");
								alert("글자수가 초과했습니다.");
							}
						});/* 글자수 제한 엔딩 태그 */
				//////
				$("#insertProductReview").on("click", function() {
					ajaxInsert();
				});ajaxInsert
				getAjaxList();
				//star
				$(".star").starRating({
					starSize : 25,
					disableAfterRate : false,
					hoverColor : 'gold',
					activeColor : 'gold',
					ratedColor : 'gold',
					useFullStars : true,
					callback : function(currentRating) {
						//현재 rating : currentRating
						$("#review_rate").val(currentRating);
					}
				});
				$(".list").on("change", function() {
					for (let i = 0; i < 20; i++) {
						$(".starGet_" + i).starRating({
							readOnly : true,
							initialRating : $(".rated_star" + i).val()
						});
					}
				});

			});
	//10개 가 최대
	window.onload = function() {
		for (let i = 0; i < 10; i++) {
			$(".starGet_" + i).starRating({
				readOnly : true,
				starSize : 25,
				initialRating : $(".rated_star" + i).val()
			});
		}
	};
	//10개 가 최대
	function star() {
		console.log("star");
		for (let i = 0; i < 10; i++) {
			$(".starGet_" + i).starRating({
				readOnly : true,
				starSize : 25,
				initialRating : $(".rated_star" + i).val()
			});
		}
	};

	/////////////////////////////////////////
	//지우기
	function deleteAjax(number) {

		if (confirm("리뷰를 삭제하시겠습니까?") == true) {
			console.log("number", number);

			$.ajax({
				url : '/product/reviewproduct/delete/' + number,
				method : 'get',
				dataType : 'json',

				success : function(data) {
					console.log(data);
					getAjaxList();
					
					$(".comment_section").show();
					$(".reviewed").hide();

				},

				error : function(error) {
					console.log(error);
				}

			});
		}
	}

	//읽기
	function getAjaxList() {
		console.log("pBoard.pboard_unit_no=" + $("#unit_no").val());
		let logUsInfo = "${sessionScope.user.user_id}";

		$
				.ajax({
					url : '/product/reviewproduct/' + $("#unit_no").val(),
					method : 'get',
					dataType : 'json',
					processData : false,
					contentType : false,

					success : function(data, status, xhr) {

						var htmlContent = "";
						
						// 리스트에 데이터가 0건 이면 
						if(data.list.length == 0){
							// '등록된 댓글이 없습니다.' 메세지 보여주기 
							htmlContent += "<div class='u_cbox_comment_box u_cbox_type_profile'>"
								+ "<div class='u_cbox_area'>"
								+ "<div class='u_cbox_info'>등록된 댓글이 없습니다."  
								+ "</div>"
								+ "</div>" + "</div>"
											
							
							$(".list").html(htmlContent);

						// 리스트 보여주기
						} else {

						$
								.each(
										data.list,
										function(index, item) {
											
											
								console.log("sessionscope_User", user_id);
								console.log("item_user_id", item.user_id);
								console.log(user_id == item.user_id);
								
											htmlContent += "<div class='u_cbox_comment_box u_cbox_type_profile'>"
													+ "<div class='u_cbox_area'>"
													+ "<div class='u_cbox_info'>"
													+ "<input type='hidden' class='rated_star"+index+"' value='" + item.review_rate + "'>"
													+ "<div class='c_cbox_rating' style='display:none;'>"
													+ item.review_rate
													+ "</div>"
													+ "<div class='jq-stars starGet_"+index+"'></div>" /* 여기가 별점 출력부분 */
													+ "<div class='c_cbox_rating_star'>"
													+ "<div class='u_cbox_info_main'>"
													+ "<div class='u_cbox_nick_area'>"
													+ item.user_id;
													
													if(logUsInfo != ""){
														if( "${sessionScope.user.user_type}" == 0 || user_id == item.user_id){
															htmlContent +=  "<button type='button' onclick='deleteAjax("
															+ item.review_num
															+ ")' class='trash'> <i class='fas fa-trash'></i> </button>";
														}
													}
													htmlContent += "</div>"
													+ "<span class='u_cbox_date'>"
													+ item.review_regdate
													+ "</span>"
													+ "<input type='hidden' class ='review_num' value='" + item.review_num + "'>"
													+ "<input type='hidden' value='" + item.pboard_unit_no + "'>"
													+ "</div>"
													+ "<div class='clear'>"
													+ "</div>"
													+ "<div class='u_cbox_text_wrap'>"
													+ "<div class='u_cbox_contents'>"
													+ item.review_content
													+ "</div>"
													+ "</div>"
													+ "</div>"
													+ "</div>"
													+ "</div>" + "</div>"

											$(".list").html(htmlContent);
											
											
											star();
											
											if(logUsInfo==item.user_id){
												$(".comment_section").hide();
												$(".reviewed").show();
											}
										})
						}
					},

					error : function(xhr, status, error) {

						console.log("error", error);
					}
				});

	}

	//추가
	function ajaxInsert() {
		if ($("#text").val() == '') {
			alert("내용을 입력해주세요");
			return false;
		}

		if ($("#review_rate").val() == '') {
			alert("별점을 선택해주세요");
			return false;
		}
		if (confirm("리뷰를 등록하시겠습니까? 등록 후 수정이 불가합니다.") == true) {

			

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
						star();
					} else {
						alert("입력 중 오류가 발생했습니다.");
					}
				},
				error : function(xhr, status, error) {
					console.log("error", error);
				}
			});
		} else {
			alert("취소하였습니다.");
			return false;
		}
	}
</script>
</head>
<body>
	<div id="review">
	<input type="hidden" name="pboard_unit_no"
		value="${pBoard.pboard_unit_no}" id="unit_no">

	<!-- 댓글 조회 삽입 장소 -->
	<div>
	
	<div class="list">
	
	</div>
	
	<hr style="width:60%;">
	</div>
	</div>
	
	



	<c:if test="${empty sessionScope.user.user_id}">
		<div class="comment_section_login">
			<div class="login_text">
				<p>리뷰를 작성하시려면 로그인 해주세요</p>
				<div>
					<button class="login_needed" onclick="location.href='/login'">
						<p style="color: #a29bfe; font-weight: bold;">로그인 하기</p>
					</button>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${not empty sessionScope.user.user_id}">
				<div class="comment_section">
					<div class="top-wrap">
						<input type="hidden" id="user_id" name="user_id"
							class="comment_id" value="${sessionScope.user.user_id}">
						<div id="output_userid">
							<c:out value="${sessionScope.user.user_id}"></c:out>
						</div>
						<p class="product_rating">
						<div class="jq-stars star stardiv"></div>
						<input type="hidden" id="review_rate" name="review_rate"
							class="product_rating" value=""> <input type="hidden"
							name="pboard_unit_no" id="pboard_unit_no"
							value="${pBoard.pboard_unit_no}">
						<p>
					</div>
					<div class="middle-wrap">
						<div class="input_area">
							<textarea rows="10" class="text" id="text" name="review_content"
								placeholder="댓글을 입력해주세요" wrap="hard"></textarea>
						</div>
					</div>
					<div class="bottom-wrap">
						<div id="u_cbox_write_count">0/300</div>
						<div class="button-position">
							<button type="button" id="insertProductReview"
								class="u_cbox_btn_upload" style="display: inline;">등록</button>
						</div>
					</div>
				</div>
				<div class="comment_section_login reviewed">
					<div class="login_text">
						<p>이미 리뷰를 작성하셨습니다.</p>
					</div>
				</div>
	</c:if>


</body>
