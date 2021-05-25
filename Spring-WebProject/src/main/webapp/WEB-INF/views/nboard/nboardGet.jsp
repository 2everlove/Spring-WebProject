<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../../../resources/css/nboard.css">
<jsp:include page="../includes/header.jsp"/>

	 <section class="section__content">
	  <div id="nboard-wrapper">
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <button type="button" onclick="" class="btn btn-default">등록</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" >
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성시간</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                             
                                
                                </tbody>
                            </table>
						</div>	<!-- panel-body -->
					</div>	<!-- panel panel-default -->
				</div><!-- col-lg-12 -->
			</div>	<!-- row -->
			<!-- Heading -->

		<!-- 페이징 소스 -->
		<ul class="pagination">
			<li><a href="#0">&lt;</a></li>
			<li><a class="active" href="#0">1</a></li>
			<li><a href="#0">2</a></li>
			<li><a href="#0">3</a></li>
			<li><a href="#0">4</a></li>
			<li><a href="#0">&gt;</a></li>
		</ul>
		<!-- 페이징 끝 -->
			
		</div>	<!-- nboard-wrapper -->
	</section>
<jsp:include page="../includes/footer.jsp"/>