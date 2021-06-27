<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/admin-product.css">


<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e6bac257a0b73cfaf15255dbb453d5f&libraries=services"></script>
<script src='//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js'></script>
<script type="text/javascript" >
	$(document).ready(function(){
		
		function page(page){
			document.listForm.action="/admin/userControl";
			document.listForm.pageNo.value=page;
			document.listForm.submit();
			
		}
		//지도 api
		$('.user_address_search').click(function(){
			let tr = $(this).closest("tbody");
			var mapContainer = tr.find('#kmap')[0], // 지도를 표시할 div
			mapOption = {
			    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
			    level: 5 // 지도의 확대 레벨
			};
			
			//지도를 미리 생성
			var map = new daum.maps.Map(mapContainer, mapOption);
			//주소-좌표 변환 객체를 생성
			var geocoder = new daum.maps.services.Geocoder();
			//마커를 미리 생성
			var marker = new daum.maps.Marker({
			    position: new daum.maps.LatLng(37.537187, 127.005476),
			    map: map
			});
			
			new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수
	                tr.find('#kmap').show();
	                // 주소 정보를 해당 필드에 넣는다.
	                tr.find('.user_address').val(addr+" ");
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {

	                        var result = results[0]; //첫번째 결과의 값을 활용

	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                    }
	                });
	            }
	        }).open();
			tr.find('.user_address').select();
		});

		
		//연락처 validation
		$(".user_contact_clone").keyup(function(){
			//console.log($(this).val().length);
			if($(this).closest("td").find(".user_contact_clone").val().length<10){
				$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3") );
			} else {
				$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3") );
			}
		});
		$(".user_contact_clone").change(function(){
			let str = $(this).val();
			let tmp = str.replace(/\-/g,'');
			$(this).closest("td").find(".user_contact").val(tmp);
		});
		
		//타입 색상
		$('select[name=user_type]').change(function() {
		    if($(this).find('option:selected').val()==0){
		    	console.log($(this).find('option:selected').val());
				$(this).css('color','red');
		    }else if($(this).find('option:selected').val()==1) {
		    	$(this).css('color','blue');
		    }else {
				$(this).css('color','green');
		    }
		});
		
		//활성화 색상
		$('select[name=user_enabled]').change(function() {
		    if($(this).find('option:selected').val()==0){
		    	console.log($(this).find('option:selected').val());
				$(this).css('color','black');
		    }else if($(this).find('option:selected').val()==1) {
		    	$(this).css('color','green');
		    }else {
				$(this).css('color','red');
		    }
		});
		
		//성별 css
		$('select[name=user_gender]').change(function() {
		    if($(this).find('option:selected').val()=='M'){
		    	console.log($(this).find('option:selected').val());
				$(this).css('color','blue');
		    }else {
				$(this).css('color','red');
		    }
		});
		
		//관심사 배열
		$(".user_interestingCB").click(function(){
			let send_array = Array();
			let send_cnt = 0;
			let chkbox = $(this).closest("td").find(".user_interestingCB");
			for(i=0;i<chkbox.length;i++) {
			    if (chkbox[i].checked == true){
			        send_array[send_cnt] = chkbox[i].value;
			        send_cnt++;
			    }
			}
			const str = send_array.join();
			console.log(str);
			$(this).closest("td").find(".user_interesting").val(str);
		});
		
		//저장 버튼
		$(".updateBtn").click(function(){
			let tr = $(this).closest("tbody");
			if(tr.find('.user_email').val()==""){
				tr.find('.user_email').select();
				return false;
			}
			if(tr.find('.user_contact').val().length<=10){
				tr.find('.user_contact_clone').select();
				return false;
			}
			if(tr.find('.user_enabled').val()==""){
				tr.find('.user_enabled').select();
				return false;
			}
			if(tr.find('.user_type').val()==""){
				tr.find('.user_type').select();
				return false;
			}
			if(tr.find('.user_birth').val()==""){
				tr.find('.user_birth').select();
				return false;
			}
			if(tr.find('.user_address').val()==""){
				tr.find('.user_address').select();
				return false;
			}
			
			let formData = new FormData();
			let formUser_id = tr.find(".user_id").val();
			let formUser_email = tr.find(".user_email").val();
			let formUser_contact = tr.find(".user_contact").val();
			let formUser_enabled = tr.find(".user_enabled").val();
			let formUser_type = tr.find(".user_type").val();
			let formUser_gender = tr.find(".user_gender").val();
			let formUser_birth = tr.find(".user_birth").val();
			let formUser_address = tr.find(".user_address").val();
			let formUser_interesting = tr.find(".user_interesting").val();
			let formUser_enabledContent = tr.find(".user_enabledContent").val();
			let formFile_pictureId = tr.find(".file_pictureId").val();
			formData.append('user_id', formUser_id);
			formData.append('user_email', formUser_email);
			formData.append('user_contact', formUser_contact);
			formData.append('user_enabled',formUser_enabled);
			formData.append('user_type',formUser_type);
			formData.append('user_gender',formUser_gender);
			formData.append('user_birth',formUser_birth);
			formData.append('user_address',formUser_address);
			formData.append('user_interesting',formUser_interesting);
			formData.append('user_enabledContent',formUser_enabledContent);
			formData.append('file_pictureId',formFile_pictureId);
			let emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//이메일 정규식
			 
			if(!emailRule.test(tr.find(".user_email").val())) {            
				alert("email 형식이 아닙니다.")
			            return false;
			}
			/* if(formData.get("user_type")==0){ //관리자일 경우?
				
			} */
			tr.find('#kmap').hide();
			updateUser(formData, tr);
		});
		
		
		//비번 변경 -> 메일
		$(".pwdChaBtn").click(function(){
			let formData = new FormData();
			let tr = $(this).closest("tbody");
			let formUser_id = tr.find(".user_id").val();
			let formUser_email = tr.find(".user_email").val();
			let formUser_contact = tr.find(".user_contact").val();
			let formUser_enabled = tr.find(".user_enabled").val();
			let formUser_type = tr.find(".user_type").val();
			let formUser_gender = tr.find(".user_gender").val();
			let formUser_birth = tr.find(".user_birth").val();
			let formUser_address = tr.find(".user_address").val();
			let formUser_interesting = tr.find(".user_interesting").val();
			let formUser_enabledContent = tr.find(".user_enabledContent").val();
			let formFile_pictureId = tr.find(".file_pictureId").val();
			formData.append('user_id', formUser_id);
			formData.append('user_email', formUser_email);
			formData.append('user_contact', formUser_contact);
			formData.append('user_enabled',formUser_enabled);
			formData.append('user_type',formUser_type);
			formData.append('user_gender',formUser_gender);
			formData.append('user_birth',formUser_birth);
			formData.append('user_address',formUser_address);
			formData.append('user_interesting',formUser_interesting);
			formData.append('user_enabledContent',formUser_enabledContent);
			formData.append('file_pictureId',formFile_pictureId);
			userPwdSend(formData, tr);
		});
		
		
	});
	
	
	//공백제거
	function blankCheck(str){
		if(str == null || str == "null"
			   || str == undefined || str == "undefined"
			   || str == '' || str == "" || str.length == 0
		   ){
			return null;
		}else{
			return str;
		}
	}
	
	//유저 정보 업뎃
	function updateUser(formData, tr){
		let url = '/admin/userUpdate';
		console.log(formData);
		$.ajax({
			url : url,
			method : 'POST',
			dataType : 'json',
			processData : false,
			contentType : false,
			data : formData,
			success : function(datas){
				console.log(datas.result);
				if(datas.result=="success"){
					alert(formData.get('user_id')+"("+formData.get('user_email')+")님의 정보가 수정되었습니다.")
				} else {
					alert("실패");
				}
			},
			error : function(errorThrown){
				console.log(errorThrown);
			}
		});
	}
	
	//pwd 변경 후 메일
	function userPwdSend(formData, tr){
		let url = '/admin/sendEmail';
		console.log(formData);
		$.ajax({
			url : url,
			method : 'POST',
			dataType : 'json',
			processData : false,
			contentType : false,
			data : formData,
			success : function(datas){
				console.log(datas.result);
				if(datas.result!="fail"){
					alert(formData.get('user_id')+"("+formData.get('user_email')+")님의 메일로 변경된 비밀번호를 발송했습니다.")
				} else {
					alert("실패");
				}
			},
			error : function(errorThrown){
				console.log(errorThrown);
			}
		});
	}
</script>
<script type="text/javascript">
	document.title='마이페이지 : widele';
</script>
    <!-- 페이징, 목록, 가격, 정렬 -->
    <section class="section__content">
        <!-- New -->
        <div class="section__wrapper">
        	<div class=".section__admin-product">
        		<div class="table__wrapper">
        			<table class=".table-product" >
			    		<thead>
			    			<tr class="tr__head">
			    				<th style="width: 30px;" rowspan="2"></th>
			    				<th rowspan="2">비밀번호 변경</th>
			    				<th>ID</th>
			    				<th>email</th>
			    				<th>연락처</th>
			    				<th>활성화</th>
			    				<th>고객유형</th>
			    				<th>가입일</th>
			    				<th rowspan="2" class="file_column">변경</th>
			    			</tr>
			    			<tr style="border-bottom: 3px solid black;" class="tr__head">
			    				
			    				<th>성별</th>
			    				<th>생일</th>
			    				<th>주소</th>
			    				<th>관심</th>
			    				<th>기타(사유)</th>
			    				<th>썸네일</th>
			    				
			    			</tr>
			    			<c:forEach var="user" items="${userList}">
			    				
			    				<tbody>
				    				<tr data-num="1">
				    					<td rowspan="2" style="width: 30px;">${user.num}</td>
					    				<td rowspan="2"><button type="button" class="pwdChaBtn">비밀번호 변경</button></td>
					    				<td><input disabled="disabled" type="text" value="${user.user_id}" style="width: 80px;"><input type="hidden" name="user_id" class="user_id" value="${user.user_id}"></td>
					    				<td><input type="email" name="user_email" class="user_email" value="${user.user_email}"></td>
					    				<td>
					    					<fmt:formatNumber var="contact" value="${user.user_contact}" pattern="###,####,####"  type="number" minIntegerDigits="11"/>
					    					<input type="text" class="user_contact_clone" value="<c:out value="${fn:replace(contact, ',', '-')}" />" placeholder="000-0000-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13">
					    					<input type="hidden" name="user_contact" class="user_contact"  class="user_contact" value="${user.user_contact}" placeholder="000-0000-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13">
					    				
					    				</td>
					    				<td>
					    					<select class="user_enabled" name="user_enabled" 
					    						<c:if test="${user.user_enabled==2}">style="color: red;"</c:if>
					    						<c:if test="${user.user_enabled==1}">style="color: green;"</c:if>
					    						<c:if test="${user.user_enabled==0}">style="color: black;"</c:if>
					    						>
					    						<option value="0" <c:if test="${user.user_enabled==0}">selected</c:if>style="color: black;">블럭</option>
					    						<option value="1" <c:if test="${user.user_enabled==1}">selected</c:if> style="color: green;">활성</option>
					    						<option value="2" <c:if test="${user.user_enabled==2}"> selected </c:if> style="color: red;">탈퇴</option>
			    							</select>
				    						
					    				</td>
					    				<td>
					    					
				    						<c:if test="${user.user_type==0}">
					    					<select class="user_type" name="user_type" style="color: red;">
					    						<option value="0" selected style="color: red;">관리자</option>
					    						<option value="1" style="color: blue;">기업회원</option>
					    						<option value="2" style="color: green;">회원</option>
			    							</select>
				    						</c:if>
				    						<c:if test="${user.user_type==1}">
				    						<select class="user_type" name="user_type" style="color: blue;">
					    						<option value="0" style="color: red;">관리자</option>
					    						<option value="1" selected style="color: blue;">기업회원</option>
					    						<option value="2" style="color: green;">회원</option>
			    							</select>
				    						</c:if>
				    						<c:if test="${user.user_type==2}">
				    						<select class="user_type" name="user_type" style="color: green;">
					    						<option value="0" style="color: red;">관리자</option>
					    						<option value="1" style="color: blue;">기업회원</option>
					    						<option value="2" selected style="color: green;">회원</option>
			    							</select>
				    						</c:if>
					    				</td>
					    				<td><input disabled type="text" name="user_regdate" class="user_regdate" value="${user.user_regdate}"><input type="hidden" name="user_regdate" class="user_regdate" value="${user.user_regdate}"></td>
					    				<td rowspan="2"><button class="updateBtn" type="button">저장</button></td>
					    			</tr>
					    			<tr data-num="2" style="border-bottom: 3px solid black;">
					    				<td>
					    					<c:if test="${user.user_gender=='M'}">
						    					<select class="user_gender" name="user_gender" style="color: blue;">
						    						<option value="M" selected style="color: blue;">Male</option>
						    						<option value="F" style="color: red;">Female</option>
				    							</select>
				    						</c:if>
					    					<c:if test="${user.user_gender=='F'}">
						    					<select class="user_gender" name="user_gender" style="color: red;">
						    						<option value="M" style="color: blue;">Male</option>
						    						<option value="F" selected style="color: red;">Female</option>
				    							</select>
				    						</c:if>
					    				</td>
					    				<td><input type="date" name="user_birth" class="user_birth" value="${user.user_birth}"></td>
					    				<td><input type="text" name="user_address" class="user_address" value="${user.user_address}">
													<input type="button" class="user_address_search" value="주소 검색"><br>
													<div id="kmap" style="width:300px;height:300px;margin-top:10px;display:none"></div>
					    				</td>
					    				<td>
										    <div style="display: flex;flex-direction: row;align-items: flex-start;">
						    					<label class="interesting-label">
								               		<input class="user_interestingCB" type="checkbox" name="user_interesting" value="tablet" 
								               			<c:forTokens items="${user.user_interesting}" delims="," var="item"><c:if test="${item == 'tablet'}">checked</c:if></c:forTokens>>태블릿
								               	</label>
							    				<label class="interesting-label">
							    					<input class="user_interestingCB" type="checkbox" name="user_interesting" value="desktop" 
							    						<c:forTokens items="${user.user_interesting}" delims="," var="item"><c:if test="${item == 'desktop'}">checked</c:if></c:forTokens>>컴퓨터
							    				</label>
							                	<label class="interesting-label">
							                		<input class="user_interestingCB" type="checkbox" name="user_interesting" value="notebook" 
							                			<c:forTokens items="${user.user_interesting}" delims="," var="item"><c:if test="${item == 'notebook'}">checked</c:if></c:forTokens>>노트북
							                	</label>
						                	
							                	<label class="interesting-label">
							                		<input class="user_interestingCB" type="checkbox" name="user_interesting" value="life" 
							                			<c:forTokens items="${user.user_interesting}" delims="," var="item"><c:if test="${item == 'life'}">checked</c:if></c:forTokens>>생활가전
							                	</label>
						                	</div>
					                		<div style="display: flex;flex-direction: row;align-items: flex-start;">
							                	<label class="interesting-label">
							                		<input class="user_interestingCB" type="checkbox" name="user_interesting" value="video" 
							                			<c:forTokens items="${user.user_interesting}" delims="," var="item"><c:if test="${item == 'video'}">checked</c:if></c:forTokens>>영상가전
							                	</label>
							                	
							                	<label class="interesting-label">
							               			<input class="user_interestingCB" type="checkbox" name="user_interesting" value="sound" 
							               				<c:forTokens items="${user.user_interesting}" delims="," var="item"><c:if test="${item == 'sound'}">checked</c:if></c:forTokens>>음향가전
							               		</label>
							                	<label class="interesting-label">
							               			<input class="user_interestingCB" type="checkbox" name="user_interesting" value="software" 
							               				<c:forTokens items="${user.user_interesting}" delims="," var="item"><c:if test="${item == 'software'}">checked</c:if></c:forTokens>>소프트웨어
							               		</label>
						               		</div>
								               
											
							    					<input type="hidden" class="user_interesting" name="user_interesting" value="${user.user_interesting}" onload="interesting(${user.user_interesting})">
							    				
							    				</td>
					    				<td><input type="text" name="user_enabledContent" class="user_enabledContent" value="${user.user_enabledContent}" style="width: 70px; height: 50px;"></td>
					    				<c:forEach var="file" items="${fileList}">
				    						<c:if test="${user.file_pictureId eq file.file_pictureId}">
				    							<c:url value="/fileDisplay" var="urlThum">
										    		<c:param name="file_name" value="${file.file_savePath}"></c:param>
										    	</c:url>
							    				<td><img src="${urlThum}" style="width: 80px; height: 50px;"><input type="hidden" name="file_pictureId" class="file_pictureId" value="${user.file_pictureId}"></td>
				    						</c:if>
					    				</c:forEach>
				    				</tr>
			    				</tbody>
			    			</c:forEach>
			    		</thead>
			    	</table>
		    	</div>
	    	</div>
    	</div>
		<form method=get action="/admin/userControl" name="listForm">
                 <!-- 상세보기 검색 유지용 -->
                 <input type=hidden name=pageNo value=${pageNavi.cri.pageNo }> 
                 <!-- 상세보기 검색 유지용 끝 -->
                 <div class="form-inline">
					<select class="form-control" name=type>
						<option value="user_id" <c:if test="${pageNavi.cri.type == 'user_id'}">selected</c:if>>ID</option>
						<option value="user_email" <c:if test="${pageNavi.cri.type == 'user_email'}">selected</c:if>>E-mail</option>
											</select> 
					<input class="form-control" name=keyword
						value=${pageNavi.cri.keyword }>
					<button type="submit" onClick="page(1)">검색</button>
				</div>
			</form>
    	    		    	<!-- 페이징 소스 -->
			<div id="pagination-box">
				<nav aria-label="Page navigation example" style="background-color: white;">
					<ul class="pagination" style="text-align: center;">
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
			
   	</section>

<%@include file="../includes/footer.jsp" %>