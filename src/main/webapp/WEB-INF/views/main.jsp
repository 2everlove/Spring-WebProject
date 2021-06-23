<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="./includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/main.css">
<script type="text/javascript">
	$(document).ready(function(){
		
		if("${sessionScope.noticeFlag.nboard_title}" != ""){
			var popupX = (window.screen.width / 2)-(200 / 2);
			var popupY= (window.screen.height / 2)-(300 / 2);
			window.open('/popup', '', 'status=no, height=500, width=700, left='+ popupX + ', top='+ popupY);
		}
	});
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
					<c:forEach var="pBoard" items="${pBoardList}" varStatus="status">
						<c:forEach var="product" items="${productList}">
							<c:forEach var="user" items="${userList}">
								<c:if test="${pBoard.pboard_unit_condition == 0}">
					    			<c:if test="${pBoard.product_id == product.product_id}">
						    			<c:if test="${user.user_id ==  pBoard.user_id}">
									    	<div class="new__product">
								    			<a href="/pDetail/${pBoard.pboard_unit_no}">
											    	<c:forEach var="file" items="${fileList}">
											    		<c:url value="/fileDisplay" var="url">
												    		<c:param name="file_name" value="${file.file_s_savePath}"></c:param>
												    	</c:url>
												    	<c:if test="${file.file_pictureId == product.file_pictureId }">
													        <img src="${url}" class="thumnail__products">
												    	</c:if>
											    	</c:forEach>
											        <h1 class="new__title">${product.product_name}</h1>
											        <h3 class="new__description">${product.product_description}</h3>
											        <fmt:formatNumber type="number" maxFractionDigits="3" value="${pBoard.pboard_unit_price}" var="price"></fmt:formatNumber>
											        <h2 class="new__price"><span>${price}</span>원</h2>
											        <input type='hidden' class='rated_star${status.index}' value='${pBoard.avg}'>
													<div class='c_cbox_rating' style="display: none;">
													${pBoard.avg}
													</div>
													<div class='jq-stars starGet_${status.index}'></div> 
											        <button class="new__shops">${user.user_name}</button>
									    		</a>
									        </div>
								        </c:if>
					    			</c:if>
								</c:if>
							</c:forEach>
						</c:forEach>
					</c:forEach>
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
	    			<c:forEach var="pBoard" items="${pBoardList}" varStatus="status">
						<c:forEach var="product" items="${productList}">
							<c:forEach var="user" items="${userList}">
								<c:if test="${pBoard.pboard_unit_condition == 1}">
					    			<c:if test="${pBoard.product_id == product.product_id}">
						    			<c:if test="${user.user_id ==  pBoard.user_id}">
									    	<div class="sale__product">
								    			<a href="/pDetail/${pBoard.pboard_unit_no}">
											    	<c:forEach var="file" items="${fileList}">
											    		<c:url value="/fileDisplay" var="url">
												    		<c:param name="file_name" value="${file.file_s_savePath}"></c:param>
												    	</c:url>
												    	<c:if test="${file.file_pictureId == product.file_pictureId }">
													        <img src="${url}" class="thumnail__products">
												    	</c:if>
											    	</c:forEach>
											        <h1 class="new__title">${product.product_name}</h1>
											        <h3 class="new__description">${product.product_description}</h3>
											        <fmt:formatNumber type="number" maxFractionDigits="3" value="${pBoard.pboard_unit_price}" var="price"></fmt:formatNumber>
											        <h2 class="new__price"><span>${price}</span>원</h2>
											         <input type='hidden' class='rated_star${status.index}' value='${pBoard.avg}'>
													<div class='c_cbox_rating' style="display: none;">
													${pBoard.avg}
													</div>
													<div class='jq-stars starGet_${status.index}'></div>
											        <button class="new__shops">${user.user_name}</button>
									    		</a>
									        </div>
								        </c:if>
					    			</c:if>
								</c:if>
							</c:forEach>
						</c:forEach>
					</c:forEach>
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
		    		<c:forEach var="pBoard" items="${pBoardList}" varStatus="status">
						<c:forEach var="product" items="${productList}">
							<c:forEach var="user" items="${userList}">
								<c:if test="${pBoard.pboard_unit_condition == 2}">
					    			<c:if test="${pBoard.product_id == product.product_id}">
						    			<c:if test="${user.user_id ==  pBoard.user_id}">
									    	<div class="event__product">
								    			<a href="/pDetail/${pBoard.pboard_unit_no}">
											    	<c:forEach var="file" items="${fileList}">
											    		<c:url value="/fileDisplay" var="url">
												    		<c:param name="file_name" value="${file.file_s_savePath}"></c:param>
												    	</c:url>
												    	<c:if test="${file.file_pictureId == product.file_pictureId }">
													        <img src="${url}" class="thumnail__products">
												    	</c:if>
											    	</c:forEach>
											        <h1 class="new__title">${product.product_name}</h1>
											        <h3 class="new__description">${product.product_description}</h3>
											        <fmt:formatNumber type="number" maxFractionDigits="3" value="${pBoard.pboard_unit_price}" var="price"></fmt:formatNumber>
											        <h2 class="new__price"><span>${price}</span>원</h2>
											         <input type='hidden' class='rated_star${status.index}' value='${pBoard.avg}'>
													<div class='c_cbox_rating' style="display: none;">
													${pBoard.avg}
													</div>
													<div class='jq-stars starGet_${status.index}'></div>
											        <button class="new__shops">${user.user_name}</button>
									    		</a>
									        </div>
								        </c:if>
					    			</c:if>
								</c:if>
							</c:forEach>
						</c:forEach>
					</c:forEach>
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
		    	<div class="product__wrapper">
		    		<c:forEach var="pBoard" items="${pBoardList}" varStatus="status">
						<c:forEach var="product" items="${productList}">
							<c:forEach var="user" items="${userList}">
								<c:if test="${pBoard.pboard_unit_condition == 3}">
					    			<c:if test="${pBoard.product_id == product.product_id}">
						    			<c:if test="${user.user_id ==  pBoard.user_id}">
									    	<div class="recommend__product">
								    			<a href="/pDetail/${pBoard.pboard_unit_no}">
											    	<c:forEach var="file" items="${fileList}">
											    		<c:url value="/fileDisplay" var="url">
												    		<c:param name="file_name" value="${file.file_s_savePath}"></c:param>
												    	</c:url>
												    	<c:if test="${file.file_pictureId == product.file_pictureId }">
													        <img src="${url}" class="thumnail__products">
												    	</c:if>
											    	</c:forEach>
											        <h1 class="new__title">${product.product_name}</h1>
											        <h3 class="new__description">${product.product_description}</h3>
											        <fmt:formatNumber type="number" maxFractionDigits="3" value="${pBoard.pboard_unit_price}" var="price"></fmt:formatNumber>
											        <h2 class="new__price"><span>${price}</span>원</h2>
											         <input type='hidden' class='rated_star${status.index}' value='${pBoard.avg}'>
													<div class='c_cbox_rating' style="display: none;">
													${pBoard.avg}
													</div>
													<div class='jq-stars starGet_${status.index}'></div>
											        <button class="new__shops">${user.user_name}</button>
									    		</a>
									        </div>
								        </c:if>
					    			</c:if>
								</c:if>
							</c:forEach>
						</c:forEach>
					</c:forEach>
		    	</div>
    		</div>

			</c:if>
			<c:if test="${empty pboardList}">
				
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