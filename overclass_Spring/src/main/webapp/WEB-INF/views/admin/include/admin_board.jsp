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
						<!-- 드롭다운 -->
						<!-- <div class="btn-group">
							 <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
								<i class="fa fa-align-justify"></i> 
							</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#" style="color: red;" class="fa fa-exclamation-circle"> 제재하기</a></li>
							</ul>
						</div> -->
					</div>
				</div>
				<div class="panel-body">
					<div class="padd">
						<div class="form quick-post">
							<!-- 글쓰기폼-->
							<form class="form-horizontal" id="reportForm" method="post"
								action="/overclass/admin/banDoc">
								<!-- 타이틀 -->
								<div class="form-group">
									<div class="photo col-lg-2" style="text-align: center;">
										<img name="user_image" alt="avatar" src='${reportDTO.user_image }' width='70' height='70'>
										<h4></h4>
										<p>
											<b>${reportDTO.writer } </b>
											<input type="hidden" name="writer" value="${reportDTO.writer }">
											<input type="hidden" name="dno" value="${reportDTO.dno }">
										</p>
									</div>
									<div class="col-lg-10">
										<div class="panel-content" style="width: 100%; height: 100px; overflow: hidden; word-break: break-all;">
											${reportDTO.content }
										<input type="hidden" name="content" value="${reportDTO.content }">
										</div>
									</div>
								</div>

								<!-- 사진 -->
								<div class="form-group">
									<div class="control-label col-lg-2"></div>
									<div class="filebox col-lg-10">
										<div class="col-lg-12" id="photo_div">
											<c:if test="${reportDTO.image != '' }">
												<a href="${reportDTO.image }" data-lightbox="image-${reportDTO.dno }" data-title="사진">
													<img name="image" class="img-responsive img-thumbnail" src="${reportDTO.image }" width="500px" height="350px">
												</a>
											</c:if>
										</div>
									</div>
								</div>

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
										<div class="panel-content" width: 100%; height: 100px; overflow: hidden; word-break:break-all;">
											<input type="hidden" name="reporter" value="${reportDTO.reporter }">
											<b>${reportDTO.reporter }</b>
										</div>
									</div>
								</div>

								<!-- 신고사유 -->
								<div class="form-group">
									<label class="control-label col-lg-2" for="content">신고사유</label>
									<div class="col-lg-9">
										<div class="panel-content"
											width: 100%; height: 100px; overflow: hidden; word-break:break-all;">
											<b style="color: red;">${reportDTO.report_content }</b>
											<input type="hidden" name="report_content" value="${reportDTO.report_content }">
										</div>
									</div>
								</div>

								<!-- 신고날짜-->
								<div class="form-group">
									<label class="control-label col-lg-2" for="content">신고날짜</label>
									<div class="col-lg-9">
										<div class="panel-content"
											width: 100%; height: 100px; overflow: hidden; word-break:break-all;">
											<b id="reportdate">${reportDTO.reportdate }</b>
											<input type="hidden" name="reportdate" value="${reportDTO.reportdate }">
										</div>
									</div>
								</div>

								<!-- 신고누적 회수 -->
								<div class="form-group">
									<label class="control-label col-lg-2" for="content">신고누적회수</label>
									<div class="col-lg-9">
										<i class="fa fa-check" style="color: red;">1회</i>
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
										&nbsp;
										<button type="button" id="cancel" class="btn btn-default">철회하기</button>
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
							href="/overclass/main/mainFeed_Page?page=${pageMaker.startPage -1 }">
							<button class="btn btn-default" type="button">«</button>
						</a>
					</c:if>
				</div>
				<div class="btn-group">
					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">
						<a href="/overclass/main/mainFeed_Page?page=${idx }">

							<button
								class="<c:out value="${pageMaker.cri.page == idx?'btn btn-primary active':'btn btn-primary' }"/>">${idx }</button>
						</a>
					</c:forEach>
				</div>
				<div class="btn-group">
					<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
						<a
							href="/overclass/main/mainFeed_Page?page=${pageMaker.endPage +1 }">
							<button class="btn btn-default" type="button">»</button>
						</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!--페이징버튼-->
</footer>