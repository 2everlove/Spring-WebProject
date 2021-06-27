<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="./includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/main.css">
<style>
	.slider { 
		width: 980px; 
		text-align: center; 
		border-radius: 10px; overflow: hidden; 
	} 
	.slides { 
		display: flex; 
		overflow-x: auto; 
		/* overflow: hidden; */ 
		scroll-snap-type: x mandatory; 
		scroll-behavior: smooth; 
		-webkit-overflow-scrolling: touch; 
	} 
	.slides::-webkit-scrollbar { width: 10px; height: 10px; } 
	.slides::-webkit-scrollbar-thumb { 
		background: black; 
		border-radius: 10px; } 
	.slides::-webkit-scrollbar-track { 
		background-color: grey;
	    border-radius: 10px;
	    box-shadow: inset 0px 0px 5px white;} 
	.slides > div { 
		scroll-snap-align: start; 
		flex-shrink: 0; 
		width: 180px; 
		height: 300px; 
		overflow: hidden; 
		transform-origin: center center; 
		transform: scale(1); 
		transition: transform 0.5s;
		position: relative; 
		display: flex; 
		justify-content: center; 
		align-items: center; 
	}
	.slides > a { 
		display: inline-flex; 
		width: 1.5rem; 
		height: 1.5rem; 
		text-decoration: none; 
		align-items: center; 
		justify-content: center; 
		border-radius: 50%; 
		margin: 0 0 0.5rem 0; 
		position: relative; 
	  } 
	.slides > a:active { top: 1px; } 
	.slides > a:focus { background: #000; }
</style>
<script type="text/javascript">
	$(document).ready(function(){
		
		if("${sessionScope.noticeFlag.nboard_title}" != ""){
			var popupX = (window.screen.width / 2)-(200 / 2);
			var popupY= (window.screen.height / 2)-(300 / 2);
			window.open('/popup', '', 'status=no, height=500, width=700, left='+ popupX + ', top='+ popupY);
		}
		moveScrollLeft = function() {
			  var _scrollX = $('.slides').scrollLeft();
			  $('.slides').scrollLeft(_scrollX + 100);
		};
	});
	
	
	
</script>
<script type="text/javascript">
</script>
    <section class="section__content">
    
		<div class="section__wrapper">
			<c:if test="${!empty pBoardList}">
				<!-- New -->
	        	<div class="section__productsList" id="new">
		        	<div class="section__typoWrapper">
			    		<div class="section__title">
			    			<h1>New</h1>
			    		</div>
			    		<div class="section__title-icon">
				   			<h2><a href="/cond/0"><i class="fas fa-plus"></i></a></h2>
		        		</div>
			   		</div>
			   		
			    	<div class="product__wrapper">
				    	<div class="slider"> 
				    		<div class="slides">
				    		<!-- <button><span style="font-size: 80px;"><i class="fas fa-chevron-left"></i></span></button> -->
								<c:forEach var="pBoard" items="${pBoardList}" varStatus="status">
									<c:forEach var="product" items="${productList}">
										<c:forEach var="user" items="${userList}">
											<c:if test="${pBoard.pboard_unit_condition == 0}">
								    			<c:if test="${pBoard.product_id == product.product_id}">
									    			<c:if test="${user.user_id ==  pBoard.user_id}">
										    			<div id="slide-${pBoard.num }">
													    	<div class="new__product" style="display: flex;flex-direction: column;align-items: center;justify-content: space-around;align-content: stretch;">
												    			<a href="/pDetail/${pBoard.pboard_unit_no}">
															    	<c:forEach var="file" items="${fileList}">
															    		<c:url value="/fileDisplay" var="url">
																    		<c:param name="file_name" value="${file.file_s_savePath}"></c:param>
																    	</c:url>
																    	<c:if test="${file.file_pictureId == product.file_pictureId }">
																    	<div style="align-items: center;">
																	        <img src="${url}" class="thumnail__products">
																        </div>
																    	</c:if>
															    	</c:forEach>
															    	<div style="display: flex;align-items: center;flex-direction: column;align-content: stretch;">
																        <h1 class="new__title">${product.product_name}</h1>
																        <h3 class="new__description">${product.product_description}</h3>
																        <fmt:formatNumber type="number" maxFractionDigits="3" value="${pBoard.pboard_unit_price}" var="price"></fmt:formatNumber>
																        <h2 class="new__price"><span>${price}</span>원</h2>
																        <input type='hidden' class='rated_star${status.index}' value='${pBoard.avg}'>
															        </div>
															        <div style="display: flex;align-items: center;flex-direction: column;justify-content: flex-end;align-content: stretch;">
																		<div class='c_cbox_rating' style="display: none;">
																		${pBoard.avg}
																		</div>
																		<div class='jq-stars starGet_${status.index}'></div> 
																        <button class="new__shops">${user.user_name}(${user.user_id})</button>
															        </div>
													    		</a>
													        </div>
												        </div>
											        </c:if>
								    			</c:if>
											</c:if>
										</c:forEach>
									</c:forEach>
								</c:forEach>
	<!-- 		    		<button><span style="font-size: 80px;"><i class="fas fa-chevron-right"></i></span></button>
	 -->					</div>
				    	</div>
			    	</div>
		    	</div>
		    	
		    	
				<!-- Sale -->
		   	    <div class="section__productsList" id="sale">
			   	    <div class="section__typoWrapper">
				    	<div class="section__title">
				   			<h1>Sale</h1>
				   		</div>
				   		<div class="section__title-icon">
				   			<h2><a href="/cond/1"><i class="fas fa-plus"></i></a></h2>
				   		</div>
			   		</div>
			    	<div class="product__wrapper">
			    		<div class="slider"> 
				    		<div class="slides">
				    			<c:forEach var="pBoard" items="${pBoardList}" varStatus="status">
									<c:forEach var="product" items="${productList}">
										<c:forEach var="user" items="${userList}">
											<c:if test="${pBoard.pboard_unit_condition == 1}">
								    			<c:if test="${pBoard.product_id == product.product_id}">
									    			<c:if test="${user.user_id ==  pBoard.user_id}">
										    			<div id="slide-${pBoard.num }">
													    	<div class="sale__product" style="display: flex;flex-direction: column;align-items: center;justify-content: space-around;align-content: stretch;">
												    			<a href="/pDetail/${pBoard.pboard_unit_no}">
															    	<c:forEach var="file" items="${fileList}">
															    		<c:url value="/fileDisplay" var="url">
																    		<c:param name="file_name" value="${file.file_s_savePath}"></c:param>
																    	</c:url>
																    	<c:if test="${file.file_pictureId == product.file_pictureId }">
																    	<div style="align-items: center;">
																	        <img src="${url}" class="thumnail__products">
																        </div>
																    	</c:if>
															    	</c:forEach>
															    	<div style="display: flex;align-items: center;flex-direction: column;align-content: stretch;">
																        <h1 class="new__title">${product.product_name}</h1>
																        <h3 class="new__description">${product.product_description}</h3>
																        <fmt:formatNumber type="number" maxFractionDigits="3" value="${pBoard.pboard_unit_price}" var="price"></fmt:formatNumber>
																        <h2 class="new__price"><span>${price}</span>원</h2>
																        <input type='hidden' class='rated_star${status.index}' value='${pBoard.avg}'>
															        </div>
															        <div style="display: flex;align-items: center;flex-direction: column;justify-content: flex-end;align-content: stretch;">
																		<div class='c_cbox_rating' style="display: none;">
																		${pBoard.avg}
																		</div>
																		<div class='jq-stars starGet_${status.index}'></div> 
																        <button class="new__shops">${user.user_name}(${user.user_id})</button>
															        </div>
													    		</a>
													        </div>
												        </div>
											        </c:if>
								    			</c:if>
											</c:if>
										</c:forEach>
									</c:forEach>
								</c:forEach>
							</div>
						</div>
			    	</div>
		    	</div>
				<!-- Event -->
		    	<div class="section__productsList" id="event">
			    	<div class="section__typoWrapper">
			    		<div class="section__title">
			    			<h1>Event</h1>
			    		</div>
			    		<div class="section__title-icon">
				   			<h2><a href="/cond/2"><i class="fas fa-plus"></i></a></h2>
				   		</div>
			   		</div>
			    	<div class="product__wrapper">
			    	<div class="slider"> 
				    		<div class="slides">
									<c:forEach var="product" items="${productList}">
					    		<c:forEach var="pBoard" items="${pBoardList}" varStatus="status">
										<c:forEach var="user" items="${userList}">
											<c:if test="${pBoard.pboard_unit_condition == 2}">
								    			<c:if test="${pBoard.product_id == product.product_id}">
									    			<c:if test="${user.user_id ==  pBoard.user_id}">
										    			<div id="slide-${pBoard.num }">
													    	<div class="event__product" style="display: flex;flex-direction: column;align-items: center;justify-content: space-around;align-content: stretch;">
												    			<a href="/pDetail/${pBoard.pboard_unit_no}">
															    	<c:forEach var="file" items="${fileList}">
															    		<c:url value="/fileDisplay" var="url">
																    		<c:param name="file_name" value="${file.file_s_savePath}"></c:param>
																    	</c:url>
																    	<c:if test="${file.file_pictureId == product.file_pictureId }">
																    	<div style="align-items: center;">
																	        <img src="${url}" class="thumnail__products">
																        </div>
																    	</c:if>
															    	</c:forEach>
															    	<div style="display: flex;align-items: center;flex-direction: column;align-content: stretch;">
																        <h1 class="new__title">${product.product_name}</h1>
																        <h3 class="new__description">${product.product_description}</h3>
																        <fmt:formatNumber type="number" maxFractionDigits="3" value="${pBoard.pboard_unit_price}" var="price"></fmt:formatNumber>
																        <h2 class="new__price"><span>${price}</span>원</h2>
																        <input type='hidden' class='rated_star${status.index}' value='${pBoard.avg}'>
															        </div>
															        <div style="display: flex;align-items: center;flex-direction: column;justify-content: flex-end;align-content: stretch;">
																		<div class='c_cbox_rating' style="display: none;">
																		${pBoard.avg}
																		</div>
																		<div class='jq-stars starGet_${status.index}'></div> 
																        <button class="new__shops">${user.user_name}(${user.user_id})</button>
															        </div>
													    		</a>
													        </div>
												        </div>
											        </c:if>
								    			</c:if>
											</c:if>
										</c:forEach>
									</c:forEach>
								</c:forEach>
							</div>
						</div>
			    	</div>
		    	</div>
		    	
				<!-- Recommend -->
		    	<div class="section__productsList"  id="recommend">
		    	<div class="section__typoWrapper">
				   			<div class="section__title">
				    			<h1>Recommend</h1>
				    		</div>
				    		<div class="section__title-icon">
					   			<h2><a href="/cond/3"><i class="fas fa-plus"></i></a></h2>
					   		</div>
				   		</div>
		    	<c:choose>
		    		<c:when test="${!empty recommendList }">
				    	
				    	<div class="product__wrapper">
				    		<div class="slider"> 
					    		<div class="slides">
									<c:forEach var="product" items="${recommendList}">
							    		<c:forEach var="pBoard" items="${pBoardRecommendList}" varStatus="status">
											<c:forEach var="user" items="${userList}">
												<c:if test="${pBoard.pboard_unit_condition == 0 || pBoard.pboard_unit_condition == 1 || pBoard.pboard_unit_condition == 2}">
									    			<c:if test="${pBoard.product_id == product.product_id}">
										    			<c:if test="${user.user_id ==  pBoard.user_id}">
											    			<div id="slide-${pBoard.num }">
														    	<div class="recommend__product" style="display: flex;flex-direction: column;align-items: center;justify-content: space-around;align-content: stretch;">
													    			<a href="/pDetail/${pBoard.pboard_unit_no}">
																    	<c:forEach var="file" items="${fileList}">
																    		<c:url value="/fileDisplay" var="url">
																	    		<c:param name="file_name" value="${file.file_s_savePath}"></c:param>
																	    	</c:url>
																	    	<c:if test="${file.file_pictureId == product.file_pictureId }">
																	    	<div style="align-items: center;">
																		        <img src="${url}" class="thumnail__products">
																	        </div>
																	    	</c:if>
																    	</c:forEach>
																    	<div style="display: flex;align-items: center;flex-direction: column;align-content: stretch;">
																	        <h1 class="new__title">${product.product_name}</h1>
																	        <h3 class="new__description">${product.product_description}</h3>
																	        <fmt:formatNumber type="number" maxFractionDigits="3" value="${pBoard.pboard_unit_price}" var="price"></fmt:formatNumber>
																	        <h2 class="new__price"><span>${price}</span>원</h2>
																	        <input type='hidden' class='rated_star${status.index}' value='${pBoard.avg}'>
																        </div>
																        <div style="display: flex;align-items: center;flex-direction: column;justify-content: flex-end;align-content: stretch;">
																			<div class='c_cbox_rating' style="display: none;">
																			${pBoard.avg}
																			</div>
																			<div class='jq-stars starGet_${status.index}'></div> 
																	        <button class="new__shops">${user.user_name}(${user.user_id})</button>
																        </div>
														    		</a>
														        </div>
													        </div>
												        </c:if>
									    			</c:if>
												</c:if>
											</c:forEach>
										</c:forEach>
									</c:forEach>
								</div>
							</div>
				    	</div>
		    		</c:when>
		    		<c:otherwise>
		    			<c:choose>
		    				<c:when test="${!empty sessionScope.user}">
		    					<div class="product__wrapper" id="new">
							    	<div class="type__product">
								        <div class="type__detail">
						        			<h1>관심목록을 더 추가해주세요.</h1><a onclick="location.href='/userUpdate'">내정보 수정하기</a>
								        </div>
							        </div>
						        </div>
		    				</c:when>
		    				<c:otherwise>
			    				<div class="product__wrapper" id="new">
							    	<div class="type__product">
								        <div class="type__detail">
						        			<h1>로그인 하시면 추천상품을 보여드릴게요.</h1><a onclick="location.href='/login'">로그인</a>
								        </div>
							        </div>
						        </div>
		    				</c:otherwise>
		    			</c:choose>
			    		
		    		</c:otherwise>
		    	</c:choose>
    		</div>

			</c:if>
    	</div>
   	</section>
   	
   	   	    <!-- Arrow up -->
    <button class="arrow-up">
        <i class="fas fa-arrow-up"></i>
    </button>
</body>

<%@include file="./includes/footer.jsp" %>
<script type="text/javascript" src="/resources/js/main-page.js">
</script>