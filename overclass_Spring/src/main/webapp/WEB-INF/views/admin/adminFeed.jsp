<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 헤더 -->
<%@include file="../admin/include/admin_header.jsp"%>
<!-- 헤더끝 -->
<section id="my_page" class="wrapper">
	<div class="row">
		<div class="col-lg-12">
		
			<!-- 마이페이지메인 폼  -->
			<div class="profile-widget profile-widget-info">
				<div class="panel-body">
					<div class="col-lg-2 col-lg-2">
						<h4>${user.user_name } </h4>
						<div class="follow-ava">
							<img src="${user.user_image }" width='70' height='70'>
						</div>
						<h4>${user.user_id } </h4>
					</div>
					<div class="col-lg-4 col-lg-4 follow-info">
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
		<div class="col-lg-12">
			<section class="panel">
			
				<!-- 마이페이지메뉴폼 -->
				<header class="panel-heading tab-bg-info">
					<ul class="nav nav-tabs">
						<li class="active">
							<a data-toggle="tab" id="dropdown_1" href="#recent-activity">
								<span class="fa fa-comment-o">&nbsp;&nbsp;신고</span>
							</a>
						</li>
						<li class="">
						<a id="dropdown_ban" data-toggle="tab" href="#edit-profile"> 
							<span class="fa fa-users">&nbsp;&nbsp;제재목록</span>
						</a>
						</li>
					</ul>
				</header>
				<!-- 마이페이지메뉴폼 끝 -->

				<div class="panel-body">
					<div class="tab-content">
						<div id="recent-activity" class="tab-pane active">
							<div class="profile-activity">
								<div class="col-lg-offset-3 col-lg-5 portlets">

								</div>
								<div class="col-lg-4">
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
								<c:forEach items="${ban_list}" var="reportDTO">
								<div class="panel-body bio-graph-info">
									<div class="act-time">
										<div class="activity-body act-in">
											<span class="arrow"></span>
											<div class="text">
												<a href="${reportDTO.writer }" class="activity-img">
												<img class="avatar" src="${reportDTO.user_image }">
												</a>
												<p class="attribution">
													<a href="${reportDTO.writer }" style="color: red;"><b>${reportDTO.writer }</b></a>
												</p>
												<p class="attribution">
													<a><b style="color: black;">신고사유: ${reportDTO.report_content }</b></a>
												</p>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
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
$("#")
var result = '${msg}';
	$(document).ready(function() {
		
		if (result == 'Ban_SUCCESS') {
			
			
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
		
		
		function adminMove(reportno, banId) {
			alert("파라미터확인!: "+reportno);
			location.href = "/overclass/admin/ban_list?reportno="+reportno+"&writer="+banId;
		}
		$(".report_ban").click(function() { //제제하기 버튼 클릭시
			var reportno = this.firstChild.nextSibling.firstChild.nodeValue;
			var banId = this.nextSibling.nextSibling.firstChild.nextSibling.firstChild.nodeValue;
			BootstrapDialog.show({
				title: '', //알러트 타이틀 이름
				message: '<b>'+banId+'</b>을 제재 하시겠습니까?', //알러트 내용
				type: BootstrapDialog.TYPE_DANGER,
				buttons: [{ //알러트 버튼 정의
					icon: 'fa fa-check', //알러트버튼에 넣을 아이콘
					label: '제제', //알러트 버튼 이름
					cssClass: 'btn-danger', //알러트 버튼 색바꾸기
					action: function(confirm) {
						/* var formObj = $("#reportForm");
						formObj.submit(); */
						alert(reportno)
						$.ajax({
							url:"/overclass/admin/banDoc",
							type:"post",
							data:{
								reportno:reportno
							},success:function(result){
								BootstrapDialog.show({
						    		title: '', //알러트 타이틀 이름
						    		message: banId+'님이 제재 되었습니다.', //알러트 내용
						    		buttons: [{ //알러트 버튼 정의
						    				icon: 'fa fa-check',
						    				label: '확인',
						    				cssClass: 'btn-primary',
						    				action: function(cancel){
						    					adminMove(reportno, banId)
						    					cancel.close();
						   					}
						    			}]
						    	}) 
							},error:function(error){
								alert(error.status+","+ error.statusText)
							}
						})
						confirm.close()
					}
					},{
						label: '닫기',
						action: function(cancel){
							cancel.close();
							}
					}]
			})
		})
		$("#calcel").click(function() { //철회하기 버튼 클릭시
			BootstrapDialog.show({
				title: '', //알러트 타이틀 이름
				message: '신고를 철회 하시겠습니까?', //알러트 내용
				type: BootstrapDialog.TYPE_DANGER,
				buttons: [{ //알러트 버튼 정의
					icon: 'fa fa-check', //알러트버튼에 넣을 아이콘
					label: '철회', //알러트 버튼 이름
					cssClass: 'btn-danger', //알러트 버튼 색바꾸기
					hotkey:13,
					action: function(confirm) {
						location.href="/overclass/admin/cancelDoc";
						confirm.close()
					}
					},{
						label: '닫기',
						action: function(cancel){
							cancel.close();
							}
					}]
			})
		})
	})//ready
		
</script>
</html>