<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="row">
<%-- 	<%
		for (int i = 0; i < list.size(); i++) {
	%> --%>
	<div class="col-lg-offset-3 col-lg-5 portlets">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="pull-left">
					<h4>
						<i class="fa fa-4x fa-list-alt"></i>
					</h4>
				</div>
				<div class="widget-icons pull-right">
					<a id="content_repot" class="wclose"><i style="color: red;"
						class="fa fa-warning" data-toggle="modal" data-target="#repot"></i></a>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="panel-body">
				<div class="padd">
					<div class="form quick-post">
						<!-- 글쓰기폼-->
						<form class="form-horizontal">
							<!-- 타이틀 -->
							<div class="form-group">
								<div class="photo col-lg-2" style="text-align: center;">
									<img alt="avatar" src='${user.user_image }' width='70'
										height='70'>
									<h4></h4>
									<p>
										<b>${user.user_name } <i>홍길동</i></b>
									</p>
								</div>
								<div class="col-lg-10">
									<div class="panel-content"
										style="width: 100%; height: 100px; overflow: hidden; word-break: break-all;">
										${DocumentDTO.content }
									</div>
								</div>
							</div>
							<!-- 태그 -->
							<div class="form-group">
								<label class="control-label col-lg-2" for="content">태그</label>
								<div class="col-lg-9">
									<%-- <%
										if (list.get(i).getTag() != null) {
												String tag[] = list.get(i).getTag().split(",");
												for (int j = 0; j < tag.length; j++) {
									%> --%>
									<button class="btn btn-info"> <i>태그</i></button>
									<%-- <%
										} // for j 끝
											} // if끝
									%> --%>
								</div>
							</div>
							
							<!-- 신고사유 -->
							<div class="form-group">
								<label class="control-label col-lg-2" for="content">신고사유</label>
								<div class="col-lg-9">
									<div class="panel-content" style="width: 100%; height: 100px; overflow: hidden; word-break: break-all;">
										${Report.content }
									</div>
								</div>
							</div>
							
							<!-- 신고누적 회수 -->
							<div class="form-group">
								<label class="control-label col-lg-2" for="content">신고누적회수</label>
								<div class="col-lg-9">
									<i class="fa fa-check">1회</i>
								</div>
							</div>

							<div class="form-group">
								<!-- Buttons -->
								<div class="col-lg-offset-4 col-lg-4">
									<button type="submit" id="s" class="btn btn-danger">제제</button>&nbsp;
									<button type="submit" id="s" class="btn btn-default">취소</button>
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

<footer>
	<!-- 페이징버튼 -->
	<div id="page_div" class="col-lg-offset-5 col-lg-5">
		<%-- <%
			int totalPage = (int) request.getAttribute("totalPage");
			int currentPage = (int) request.getAttribute("currentPage");
			int start;
			if (currentPage <= 5)
				start = 1;
			else
				start = (currentPage / 5) * 5 + 1;

			int end;
			if (start + 4 < totalPage) {
				end = start + 4;
			} else
				end = totalPage;
			int prev;
			if (start == 1)
				prev = 1;
			else
				prev = start - 1;
			int next;
			if (end == totalPage)
				next = totalPage;
			else
				next = end + 1;
		%> --%>
		<a href="feedaction.do?action=myfeed&page=<%-- <%=prev%> --%>" id="page_back"
			type="button" class="btn btn-default">«</a>
		<%-- <%
			for (int i = start; i < end + 1; i++) {
		%> --%>
		<a href="feedaction.do?action=myfeed&page=<%-- <%=i%> --%>"><button
				type="button" class="btn btn-primary"><%-- <%=i%> --%></button></a>
		<%-- <%
			}
		%> --%>
		<a href="feedaction.do?action=myfeed&page=<%-- <%=next%> --%>" id="page_front"
			type="button" class="btn btn-default">»</a>
	</div>
	<!--페이징버튼-->
</footer>