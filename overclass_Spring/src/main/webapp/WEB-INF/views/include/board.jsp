<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="main_Board">
<%-- 	<%
		for (int i = 0; i < list.size(); i++) {
	%> --%>
	<c:forEach items="${list }" var="DocumentVO">
	<div class="row">
		<div class="col-lg-offset-3 col-lg-5 portlets">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="pull-left">
						<h4>
							<i class="fa fa-4x fa-list-alt"></i>
						</h4>
					</div>
					<div class="widget-icons pull-right">
						<!-- 신고 -->
						<a id="content_repot" class="wclose">
							<i style="color: red;" class="fa fa-warning" data-toggle="modal" data-target="#repot"></i>
						</a>
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
										<img alt="avatar" src="<%-- <%=list.get(i).getId_img_path()%> --%>${DocumentVO.image}" width='70' height='70'>
										<h4></h4>
										<p>
											<b><%-- <%=list.get(i).getName()%> --%>${DocumentVO.writer }</b>
										</p>
									</div>
									<!-- 글내용 -->
									<div class="col-lg-10">
										<div class="panel-content" style="width: 100%; height: 100px; overflow: hidden; word-break: break-all;">
											<%-- <%=list.get(i).getContent()%> --%>${DocumentVO.content }
										</div>
									</div>
								</div>

								<!-- 좋아요 -->
								<div class="form-group">
									<p data-toggle="modal" data-target="#good">
										<a href="" class="control-label col-lg-2">
											좋아요&nbsp;&nbsp;
											<span id="good_icon" class="fa fa-lg fa-thumbs-o-up" style="color: blue;"></span>
											<img id="good_icon" src="${initParam.root}img/좋아요1.png">
										</a>
									</p>

									<div class="col-lg-8">
										<i class="fa fa-lg fa-heart" style="color: red;">
											<span style="color: black;">&nbsp;${DocumentVO.goodcnt }</span>
										</i>
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
										<c:if test="${DocumentVO.tag != null }">
										<c:set var="tags" value="${DocumentVO.tag }"/>
										<c:forEach items="${tags }" var="tag">
										<button class="btn btn-info">${tag}<%-- <%=tag[j]%> --%></button>
									<%-- 	<%
											} // for j 끝
												} // if끝
										%> --%>
										</c:forEach>
										</c:if>
									</div>
								</div>
								
								<!-- 댓글쓰기 -->
								<div class="form-group">
									<label class="control-label col-lg-2" for="reply_write">댓글</label>
									<div class="col-lg-10">
										<input id="reply_write" type="text" class="form-control" size="18" placeholder="댓글을 입력하세요...">
									</div>
								</div>
								
								<div class="form-group">
								<div class="widget-icons pull-right">
									<a id="reply_icon" class="wminimize"><i id="reply_icon2" class="fa fa-chevron-up">댓글&nbsp;&nbsp;&nbsp;&nbsp;</i></a>
								</div><br>
								<!-- 댓글 -->
								<div id="reply_div">
								<c:forEach items="">
									<div class="act-time">
										<div class="activity-body act-in">
										
											<div class="text">
												<a href="#" class="activity-img"><img class="avatar" src="img/chat-avatar.jpg"></a>
												<p class="attribution">
													<a href="#" style="color: blue;">아이디</a>
												<p>댓글ㅇㅇㅇㅇㅇㅇ</p>
											</div>
										</div>
									</div>
								</c:forEach>
									
									<div class="act-time">
										<div class="activity-body act-in">
										
											<div class="text">
												<a href="#" class="activity-img"><img class="avatar" src="img/chat-avatar.jpg"></a>
												<p class="attribution">
													<a href="#" style="color: blue;">아이디222</a>
												<p>댓글22ㅇ</p>
											</div>
										</div>
										
									</div>
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
<%-- 	<%
		}
	%> --%>
</div>
<footer>
	<!-- 페이징버튼 -->
	<div id="page_div" class="col-lg-offset-4 col-lg-4">
		<div class="col-lg-offset-1 col-lg-8">
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
		<%-- <a href="documentaction.do?action=list&page=<%=prev%>" id="page_back"
			type="button" class="btn btn-default">«</a>
		<%
			for (int i = start; i < end + 1; i++) {
		%>
		<a href="documentaction.do?action=list&page=<%=i%>"><button
				type="button" class="btn btn-primary"><%=i%></button></a>
		<%
			}
		%>
		<a href="documentaction.do?action=list&page=<%=next%>" id="page_front"
			type="button" class="btn btn-default">»</a> --%>
			
			<div class="btn-toolbar">
				<div class="btn-group">
					<c:if test="${pageMaker.prev }">
					<a href="mainFeed_Page?page=${pageMaker.startPage -1 }">
						<button class="btn btn-default" type="button">«</button>
					</a>
					</c:if>
				</div>
				<div class="btn-group">
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					<a href="mainFeed_Page?page=${idx }">
						<input type="text" <c:out value="${pageMaker.cri.page == idx?'class =btn btn-primary active':'' }" /> >
						${idx }
					</a>
					</c:forEach>
				</div>
				<div class="btn-group">
					<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
					<a href="mainFeed_Page?page=${pageMaker.endPage +1 }">
						<button class="btn btn-default" type="button">»</button>
					</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!--페이징버튼-->
</footer>