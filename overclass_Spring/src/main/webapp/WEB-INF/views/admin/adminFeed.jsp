<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 헤더 -->
<%@include file="../admin/include/admin_header.jsp"%>
<!-- 헤더끝 -->
<section id="my_page" class="wrapper">
	<div class="row">
		<div class="col-xs-12">
		
			<!-- 마이페이지메인 폼  -->
			<div class="profile-widget profile-widget-info">
				<div class="panel-body">
					<div class="col-xs-2 col-xs-2">
						<h4>${user.user_name } </h4>
						<div class="follow-ava">
							<img src="${user.user_image }" width='70' height='70'>
						</div>
						<h4>${user.user_id } </h4>
					</div>
					<div class="col-xs-4 col-xs-4 follow-info">
						<p>
							<i class="fa fa-lg fa-github-alt">&nbsp;AdminPage</i>
						</p>
						<%-- <i class="fa fa-twitter"><span>&nbsp;</span><%=user.getBirth().substring(2, 4)%>월
							<%=user.getBirth().substring(4)%>일</i><br> <i
							class="fa fa-envelope-o"><span>&nbsp;</span><%=user.getEmail()%></i><br>
						<i class="icon_pin_alt"><i><%=user.getLoc()%></i></i> --%>
					</div>
				</div>
			</div>
			<!-- 마이페이지폼메인 끝  -->
			
		</div>
	</div>

	<div class="row">
		<div class="col-xs-12">
			<section class="panel">
			
				<!-- 마이페이지메뉴폼 -->
				<header class="panel-heading tab-bg-info">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" id="dropdown_1"
							href="#recent-activity"><span class="fa fa-comment-o">&nbsp;&nbsp;신고</span>
						</a></li>
						<li class=""><a id="dropdown_3" data-toggle="tab"
							href="#edit-profile"> <span class="fa fa-users">&nbsp;&nbsp;제재목록</span>
						</a></li>
					</ul>
				</header>
				<!-- 마이페이지메뉴폼 끝 -->

				<div class="panel-body">
					<div class="tab-content">
						<div id="recent-activity" class="tab-pane active">
							<div class="profile-activity">
								<div class="col-xs-offset-3 col-xs-5 portlets">

								</div>
								<div class="col-xs-4">
									<div class="row">
										<div class="col-md-offset-7 col-md-2 portlets">

										</div>
									</div>
								</div>

								<!-- 게시글시작 -->
								<%@ include file="../admin/include/admin_board.jsp"%>
								<!-- 게시글폼 끝 -->

							</div>
						</div>

						<div id="edit-profile" class="tab-pane">
							<section class="panel">

								<!-- 제제목록 -->
								<div class="panel-body bio-graph-info">
									<%-- <%
										for (int i = 0; i < friend_list.size(); i++) {
									%> --%>
									<div class="act-time">
										<div class="activity-body act-in">
											<span class="arrow"></span>
											<div class="text">
												<a
													href="friendfeed.do?action=friendfeed&friend=<%-- <%=friend_list.get(i).getUser_id()%> --%>"
													class="activity-img"><img class="avatar"
													src="<%-- <%=friend_list.get(i).getId_img_path()%> --%>" alt="">
												</a>
												<p class="attribution">
													<a
														href="friendfeed.do?action=friendfeed&friend=<%-- <%=friend_list.get(i).getUser_id()%> --%>"
														style="color: blue;"><%-- <%=friend_list.get(i).getName()%> --%></a>
												<p>
													<i class="icon_pin_alt" style="color: green"></i><i><%-- <%=friend_list.get(i).getLoc()%> --%></i>
												</p>
											</div>
										</div>
									</div>
									<%-- <%
										}
									%> --%>
								</div>
								<!-- 친구목록 끝 -->

							</section>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>


	<!-- page end-->


	<!-- 글쓰기전체 폼시작 -->


</section>
<!-- 라이트박스 스크립트 -->
<script src="/overclass/resources/js/lightbox.js"></script>
<script>
lightbox.option({
    'disableScrolling' : true,
    'showImageNumberLabel' : false,
    'fadeDuration' : 700
})
</script>
</body>
<script type="text/javascript">

	$(document).ready(function() {
		if (result == 'Write_SUCCESS') {
			BootstrapDialog.show({
	    		title: '', //알러트 타이틀 이름
	    		message: '글이 등록 되었습니다.', //알러트 내용
	    		buttons: [{ //알러트 버튼 정의
	    				icon: 'fa fa-check',
	    				label: '확인',
	    				cssClass: 'btn-primary',
	    				hotkey:13,
	    				action: function(cancel){
	    					cancel.close();
	   					}
	    			}]
	    	}) 
			
		} else if (result == 'Remove_SUCCESS') {
			BootstrapDialog.show({
	    		title: '', //알러트 타이틀 이름
	    		message: '글이 삭제 되었습니다.', //알러트 내용
	    		type: BootstrapDialog.TYPE_DANGER,
	    		buttons: [{ //알러트 버튼 정의
	    				icon: 'fa fa-check',
	    				label: '확인',
	    				cssClass: 'btn-danger',
	    				hotkey:13,
	    				action: function(cancel){
	    					cancel.close();
	   					}
	    			}]
	    	})
		}
	})
	
	function delDoc(dno) {
	BootstrapDialog.show({
		title: '', //알러트 타이틀 이름
		message: '글을 삭제 하시겠습니까?', //알러트 내용
		type: BootstrapDialog.TYPE_DANGER,
		buttons: [{ //알러트 버튼 정의
			icon: 'fa fa-check', //알러트버튼에 넣을 아이콘
			label: '삭제', //알러트 버튼 이름
			cssClass: 'btn-danger', //알러트 버튼 색바꾸기
			hotkey:13,
			action: function(confirm) {
				location.href="/overclass/main/removeDoc?dno="+dno;
				
				confirm.close()
			}
			},{
				label: '닫기',
				action: function(cancel){
					cancel.close();
					}
			}]
		})
	}
		
	var replyPage = 1;

	function replyDisplayPage(dno, replyPage) {
		var replydiv = '#reply_div' + dno;
		var reply_page = '#reply_div_page_'+dno
		$.ajax({
			url : '/overclass/reply/list/' + dno + '/' + replyPage,
			type : 'get',
			success : function(result) {
				var htmlTxt='';
				for(var i=0; i<result.list.length; i++){
					htmlTxt+=template(result.list[i]);
				}
				
				// 페이징추가해야됨.
				$(replydiv).html(htmlTxt);
				printPaging(result.pageMaker, dno, reply_page);
			}
		});
	}
	
	var printPaging = function(pageMaker, dno, reply_page){
		var pageStr = "";
		
		if(pageMaker.prev){
			pageStr += "<li><a href='"+(pageMaker.startPage-1)+"'>«</a></li>"
		}
		
		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			pageStr += "<li "+strClass+"><a href='javascript:replyDisplayPage("+dno+","+i+")'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			pageStr += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}
		
		$(reply_page).attr("style","display: show;")
		$(reply_page).html(pageStr);
	}
	
	
	
	var printPaging = function(pageMaker, dno, reply_page){
		var pageStr = "";
		
		if(pageMaker.prev){
			pageStr += "<li><a href='"+(pageMaker.startPage-1)+"'>«</a></li>"
		}
		
		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			pageStr += "<li "+strClass+"><a href='javascript:replyDisplayPage("+dno+","+i+")'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			pageStr += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}
		
		$(reply_page).attr("style","display: show;")
		$(reply_page).html(pageStr);
	}
		
</script>
</html>