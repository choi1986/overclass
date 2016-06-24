<%@page import="kr.co.overclass.domain.ReportVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:forEach items="${list }" var="reportDTO">
	<div class="row">
		<div class="col-lg-offset-3 col-lg-5 portlets">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="pull-right">
					</div>
				</div>
				<div class="panel-body">
					<div class="padd">
						<div class="form quick-post">
						<form class="form-horizontal" id="reportForm" method="post"
								action="/overclass/admin/banDoc">
									<!-- 프로필 -->
									<div class="form-group">
										<label class="col-sm-2">
											<img class="img-rounded" name="user_image" src='${reportDTO.user_image }' width='90px' height='90px'>
										</label>
										<div class="col-sm-10"> 
											<h4><b>${reportDTO.writer } </b></h4><br>
											<input type="hidden" name="writer" value="${reportDTO.writer }">
											<input type="hidden" name="dno" value="${reportDTO.dno }">
												 <h5>
												 <span class="mapXY">
												 	<span class="hidden">${reportDTO.mapXY}</span>
													<%-- <a href="/overclass/main/map?mapXY=${DocumentDTO.mapXY}&mapLoc=${DocumentDTO.mapLoc}" id="locDoc"> --%>
													<a href="#" onClick="window.open('/overclass/main/map?mapXY=${reportDTO.mapXY}&mapLoc=${reportDTO.mapLoc}','지도','width=900, height=600, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;" id="locDoc">
													<c:if test="${reportDTO.mapLoc != null}">
														<span class="fa fa-map-marker" style="color: green"> </span>
													</c:if> 
														${reportDTO.mapLoc}
													<c:if test="${reportDTO.mapLoc != null}">
														<span style="color: black;">에서</span>
													</c:if>
													</a>
												 </span>
													
												</h5>
										</div>
									</div>
									
									<!-- 글내용 -->
									<div class="form-group">
										<label class="control-label col-sm-2" for="content">내용</label>
										<div class="col-sm-10">
											<div class="panel-content" style="width: 100%; height: 100%; overflow: hidden; word-break: break-all;">
												${reportDTO.content }
												<input type="hidden" name="content" value="${reportDTO.content }">
											</div>
										</div>
									</div>

								<!-- 사진 -->
								<c:if test="${reportDTO.image != '' }">
									<div class="form-group">
										<div class="control-label col-lg-2"></div>
										<div class="filebox col-lg-10">
											<div class="col-lg-12" id="photo_div">
													<a href="${reportDTO.image }" data-lightbox="image-${reportDTO.dno }" data-title="사진">
														<img name="image" class="img-responsive img-thumbnail" src="${reportDTO.image }" width="500px" height="350px">
													</a>
											</div>
										</div>
									</div>
								</c:if>
			
								<div class="form-group">
									<div class="goodclass">
										<div style="display: none;">${reportDTO.dno }</div>
										<a class="control-label col-lg-2"> 좋아요&nbsp;&nbsp;
											<span id="good_icon${reportDTO.dno }" class="fa fa-lg fa-thumbs-o-up" style="color: blue;">
											</span>
										</a>
									</div>

									<div class="col-lg-8">
										<i class="fa fa-lg fa-heart" style="color: red;">
											<span id="good_count${reportDTO.dno }" style="color: black;">
												&nbsp;${reportDTO.goodcnt }
											</span>
										</i>
									</div>
								</div>



								<!-- 태그 -->
								<div class="form-group">
									<label class="control-label col-lg-2" for="content">태그</label>
									<div class="col-lg-9">
										<input type="hidden" name="tag" value="${reportDTO.tag}">
										<c:if test="${reportDTO.tag != null }">
											<c:set var="tags" value="${fn:split(reportDTO.tag,',' )}" />
											<c:forEach items="${tags }" var="tag">
												<button class="btn btn-info">${tag}</button>
											</c:forEach>
										</c:if>
									</div>
								</div>

								<!-- 신고자 -->
								<div class="form-group">
									<label class="control-label col-lg-2" for="content">신고자</label>
									<div class="col-lg-9">
										<div class="panel-content" style="width: 100%; height: 100%; overflow: hidden; word-break:break-all;">
											<input type="hidden" name="reporter" value="${reportDTO.reporter }">
											<b>${reportDTO.reporter }</b>
										</div>
									</div>
								</div>

								<!-- 신고사유 -->
								<div class="form-group">
									<label class="control-label col-lg-2" for="content">신고사유</label>
									<div class="col-lg-9">
										<div class="panel-content" style="width: 100%; height: 100%; overflow: hidden; word-break:break-all;">
											<b style="color: red;">${reportDTO.report_content }</b>
											<input type="hidden" name="report_content" value="${reportDTO.report_content }">
										</div>
									</div>
								</div>

								<!-- 신고날짜-->
								<div class="form-group">
									<label class="control-label col-lg-2" for="content">신고날짜</label>
									<div class="col-lg-9">
										<div class="panel-content" style="width: 100%; height: 100%; overflow: hidden; word-break:break-all;">
											<b id="reportdate">${reportDTO.reportdate }</b>
											<input type="hidden" name="reportdate" value="${reportDTO.reportdate }">
										</div>
									</div>
								</div>

								<!-- 신고누적 회수 -->
								<div class="form-group">
									<label class="control-label col-lg-2" for="content">신고누적회수</label>
									<div class="col-lg-9">
										<c:choose>
											<c:when test="${reportDTO.report_stack == 0 }">
												<i class="fa fa-check" style="color: red;">0회</i>
											</c:when>
											<c:otherwise>
												<i class="fa fa-check" style="color: red;">${reportDTO.report_stack}회</i>
											 </c:otherwise>
										</c:choose>
									</div>
								</div>

								<div class="form-group">
									<!-- Buttons -->
									<div class="col-lg-offset-4 col-lg-4">
										<span class="report_ban">
											<span id="reportno${reportDTO.reportno }" class="hidden">${reportDTO.reportno }</span>
											<button type="button" class="btn btn-danger">제재하기</button>
										</span>
										<span class=hidden>
											<span class="hidden">${reportDTO.writer }</span>
										</span>
										<span class=hidden>
											<span class="hidden">${reportDTO.dno }</span>
										</span>
										&nbsp;
										<span class="report_cancel">
											<span id="reportno${reportDTO.reportno }" class="hidden">${reportDTO.reportno }</span>
											<button type="button" id="cancel" class="btn btn-default">철회하기</button>
										</span>
									</div>
								</div>
							</form>
						</div>

					</div>
					<div class="widget-foot">
						<!-- Footer goes here -->
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
<footer>
	<!-- 페이징버튼 -->
	<div id="page_div" class="col-lg-offset-4 col-lg-4">
		<div class="col-lg-offset-1 col-lg-8">
			<div class="btn-toolbar">
				<div class="btn-group">
					<c:if test="${pageMaker.prev }">
						<a
							href="/overclass/admin/adminFeed_Page?page=${pageMaker.startPage -1 }">
							<button class="btn btn-default" type="button">«</button>
						</a>
					</c:if>
				</div>
				<div class="btn-group">
					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">
						<a href="/overclass/admin/adminFeed_Page?page=${idx }">

							<button
								class="<c:out value="${pageMaker.cri.page == idx?'btn btn-primary active':'btn btn-primary' }"/>">${idx }</button>
						</a>
					</c:forEach>
				</div>
				<div class="btn-group">
					<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
						<a
							href="/overclass/admin/adminFeed_Page?page=${pageMaker.endPage +1 }">
							<button class="btn btn-default" type="button">»</button>
						</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!--페이징버튼-->
</footer>