<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

<link rel="stylesheet" href="/resources/css/admin-product.css">
<script type="text/javascript">
	document.title='마이페이지 : widele';
	// 페이지로 이동
	if("${sessionScope.user.user_type}"==0){
		
		function page(page){
			document.listForm.action="/admin/pBoardControl";
			document.listForm.pageNo.value=page;
			document.listForm.submit();
		}
		
	} else {
		function page(page){
			document.listForm.action="/product/pBoardUpdate";
			document.listForm.pageNo.value=page;
			document.listForm.submit();
		}
		
		
	}
	$(document).ready(function(){
		$('.orderby').click(function(){
			let sortType = $(this).attr("data-type");
			let sort =""
			if($("input[name=orderby]").val().match('asc')==null){
				$(this).attr("data-sort", 'asc');
				sort = 'asc';
				console.log(sort);
			} else {
				$(this).attr("data-sort", 'desc');
				sort = 'desc';
				console.log(sort);
			}
			
			document.listForm.action="/product/pBoardUpdate";
			document.listForm.orderby.value=(sortType+"_"+sort);
			document.listForm.submit();
		});
		
		console.log($('select[name=pboard_unit_enabled]').find('option:selected').val());
		$('select[name=pboard_unit_enabled]').change(function() {
		    if($(this).find('option:selected').val()==0){
		    	console.log($(this).find('option:selected').val());
				$(this).css('color','green');
		    }else {
				$(this).css('color','red');
		    }
		});
		
		$('.updateBtn').click(function(){
			let currentRow = $(this).closest('tr');
			let Formpboard_unit_no = currentRow.find('.pboard_unit_no').val();
			let Formpboard_unit_enabled = currentRow.find('.pboard_unit_enabled').val();
			let Formpboard_unit_condition = currentRow.find('.pboard_unit_condition').val();
			let Formpboard_unit_stocks = currentRow.find('.pboard_unit_stocks').val();
			let Formpboard_unit_price = currentRow.find('.pboard_unit_price').val();
			updatePBoard(Formpboard_unit_no, Formpboard_unit_enabled, Formpboard_unit_condition, Formpboard_unit_stocks, Formpboard_unit_price, $(this));
		});
		
		
	});
	function updatePBoard(Formpboard_unit_no, Formpboard_unit_enabled, Formpboard_unit_condition, Formpboard_unit_stocks, Formpboard_unit_price, btn){
		let url = '/admin/pBoardUpdate';
		let formData = new FormData();
		formData.append('pboard_unit_no',Formpboard_unit_no);
		formData.append('pboard_unit_enabled',Formpboard_unit_enabled);
		formData.append('pboard_unit_condition',Formpboard_unit_condition);
		formData.append('pboard_unit_stocks',Formpboard_unit_stocks);
		formData.append('pboard_unit_price',Formpboard_unit_price);
		$.ajax({
			url : url,
			method : 'POST',
			dataType : 'json',
			processData : false,
			contentType : false,
			data : formData,
			success : function(datas){
				console.log(datas.result);
				let currentRow = btn.closest('tr');
				currentRow.find('.pboard_unit_enabled').val(datas.result.pboard_unit_enabled);
				currentRow.find('.pboard_unit_condition').val(datas.result.pboard_unit_condition);
				currentRow.find('.pboard_unit_stocks').val(datas.result.pboard_unit_stocks);
				currentRow.find('.pboard_unit_price').val(datas.result.pboard_unit_price);
				alert(datas.result.num+"번 글이 수정되었습니다.");
			},
			error : function(errorThrown){
				console.log(errorThrown);
			}
		});
	}
</script>
    <!-- 페이징, 목록, 가격, 정렬 -->
    <section class="section__content">
        <div class="section__wrapper">
        	<div class="section__admin">
        		<div class="table__wrapper">
	        		<form action="/admin/pBoardUpdate" name="pBoardForm" method="post">
				    	<table class="table-pboard">
				    		<thead>
				    			<tr class="tr__head">
				    				<th></th>
				    				<th><input type="checkbox"></th>
				    				<th class="orderby" data-type="pboard_unit_enabled" data-sort=${pageNavi.cri.orderby }>활성화</th>
				    				<th class="orderby" data-type="pboard_unit_condition" data-sort=${pageNavi.cri.orderby }>new,sale,event</th>
				    				<th class="orderby" data-type="pboard_unit_stocks" data-sort=${pageNavi.cri.orderby }>재고</th>
				    				<th class="orderby" data-type="pboard_unit_price" data-sort=${pageNavi.cri.orderby }>가격</th>
				    				<th class="orderby" data-type="pboard_unit_regdate" data-sort=${pageNavi.cri.orderby }>게시일</th>
				    				<th class="orderby" data-type="pboard_unit_updateDate" data-sort=${pageNavi.cri.orderby }>수정일</th>
				    				<th>수정일</th>
				    				<th>제조사 > 카테고리 > 상품명</th>
				    				<th>저장</th>
				    				<th>보기</th>
				    			</tr>
				    			<c:set var="loop" value="false"/>
				    			<c:forEach var="pBoard" items="${PBoardList}" varStatus="status">
				    				<c:if test="${not loop}">
				    					<c:if test="${pBoard.user_id == sessionScope.user.user_id or sessionScope.user.user_type == 0 and !empty pBoard.no}">
							    			<tr class="tr__desc">
							    				<td>${pBoard.num }</td>
							    				<td><input type="checkbox" class='pboard_unit_no' name="pboard_unit_no" value="${pBoard.pboard_unit_no }"></td>
							    				<td>
						    						<c:if test="${pBoard.pboard_unit_enabled eq 0}">
								    					<select class="pboard_unit_enabled" name="pboard_unit_enabled" style="color: green;">
								    						<option value="0" selected style="color: green;">활성화</option>
								    						<option value="1" style="color: red;">비활성화</option>
						    							</select>
						    						</c:if>
						    						<c:if test="${pBoard.pboard_unit_enabled eq 1}">
							    						<select class="pboard_unit_enabled" name="pboard_unit_enabled" style="color: red;">
								    						<option value="0" selected style="color: green;">활성화</option>
								    						<option value="1" selected style="color: red;">비활성화</option>
								    					</select>
						    						</c:if>
							    				</td>
							    				<td>
							    					<select class="pboard_unit_condition" name="pboard_unit_condition">
							    						<c:if test="${pBoard.pboard_unit_condition eq 0}">
								    						<option value="0" selected>New</option>
								    						<option value="1">Sale</option>
								    						<option value="2">Event</option>
							    						</c:if>
							    						<c:if test="${pBoard.pboard_unit_condition eq 1}">
								    						<option value="0">New</option>
								    						<option value="1" selected>Sale</option>
								    						<option value="2">Event</option>
							    						</c:if>
							    						<c:if test="${pBoard.pboard_unit_condition eq 2}">
								    						<option value="0">New</option>
								    						<option value="1">Sale</option>
								    						<option value="2" selected>Event</option>
							    						</c:if>
							    					</select></td>
							    				<td><input type="number" class="pboard_unit_stocks" name="pboard_unit_stocks" value="${pBoard.pboard_unit_stocks}"></td>
							    				<td><input type="text" class="pboard_unit_price" name="pboard_unit_price" value="${pBoard.pboard_unit_price}"></td>
							    				<fmt:formatDate value="${pBoard.pboard_unit_regdate }" pattern="yy-MM-dd" var="regdate"/>
							    				<td>${regdate}</td>
							    				<fmt:formatDate value="${pBoard.pboard_unit_updateDate }" pattern="yy-MM-dd" var="updateDate"/>
							    				<td>${updateDate}</td>
								  				<c:forEach var="product" items="${productList}">
								    				<c:if test="${product.product_id == pBoard.product_id}">
								    					<td>${product.product_manufacturer } > ${product.product_category } > ${product.product_name }</td>
							    					</c:if>
									   			</c:forEach>
					    					
							    			
							    				<td>${pBoard.file_pictureId}</td>
							    				<td><button class="updateBtn" type="button">저장</button></td>
							    				<td><a href="/pDetail/${pBoard.pboard_unit_no }"><button class="viewBtn" type="button">보기</button></a></td>
							    			</tr>
					    				</c:if>
					    				<c:if test="${empty pBoard.num}">
						    				<tr>
						    					<td colspan="13">작성하신 내역이 없습니다.</td>
						    				</tr>	
						    				<tr>
						    					<td colspan="13" onclick="Javascript:history.back()">뒤로가기</td>
					    					</tr>
					    					<c:set var="loop" value="true"/>
					    				</c:if>
				    				</c:if>
			    				</c:forEach>
				    		</thead>
				    	</table>
	        		</form>
		    	</div>
	    	</div>
	    	<!-- 페이징 소스 -->
			<div id="pagination-box">
				<nav>
					<ul class="pagination" style="text-align: center; margin: 0 auto;">
						<c:if test="${pageNavi.prev}">
							<li onClick="javascript:page(${pageNavi.startPage-1});"><a href="#" tabindex="-1">&lt;</a></li>
						</c:if>
						<c:forEach begin="${pageNavi.startPage }" end="${pageNavi.endPage }" var="page">
							<c:choose>
								<c:when test="${page eq pageNavi.cri.pageNo }">
									<li onClick="page(${page })"><a href="#">${page }<span class="active"></span></a></li> <!-- 현재페이지 -->
								</c:when>
								<c:otherwise>
									<li onClick="page(${page })"><a href="#">${page }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pageNavi.next}">
							<li onClick="page(${pageNavi.endPage+1});"><a href="#">&gt;</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
			<!-- 페이징 끝 -->
			<form method=get action="/admin/pBoardControl" name="listForm">
                 <!-- 상세보기 검색 유지용 -->
                 ${pageNavi.cri.type }
                 <input type=hidden name=pageNo value=${pageNavi.cri.pageNo }>
                 <input type=hidden name=orderby value=${pageNavi.cri.orderby }> 
                 <!-- 상세보기 검색 유지용 끝 -->
			</form>
    	</div>
   	</section>

<%@include file="../includes/footer.jsp" %>