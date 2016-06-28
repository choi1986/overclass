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
					<div class="col-sm-2 col-sm-2">
						<div class="row">
							<div class="follow-ava" id="image_div">
								<img class="img-responsive img-circle" id="user_image" src="${user.user_image }" style="width: 90px; height: 90px;">
							</div>
						</div>
						<div class="row"><h4><b>${user.user_id }</b></h4></div>
					</div>
					<div class="col-sm-4 col-sm-4 follow-info" style="margin-top: -30px;">
						<div class="row">
							<h3><span class="fa fa-lg fa-github-alt">&nbsp;AdminPage</span></h3>
						</div>
						<div class="row">
							<h4><i class="fa fa-user-md">&nbsp;${user.user_name }</i></h4>
						</div>
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
								
								<div class="panel-body bio-graph-info">
									<div class="act-time">
										<div class="activity-body act-in">
											<table class="table table-striped table-advance table-hover">
													<tbody>
														<tr>
															<th> 프로필</th>
															<th> 아이디</th>
															<th> 신고날짜</th>
															<th> 신고사유</th>
															<th><div class="col-sm-offset-8 col-sm-4"> 제재철회</div></th>
														</tr>
														<c:forEach items="${ban_list}" var="reportDTO">
														<tr >
															<td onclick=""><img class="img-rounded" src="${reportDTO.user_image }" width='70px' height='70px'></td>
															<td onclick="">${reportDTO.writer }</td>
															<td onclick="">${reportDTO.reportdate }</td>
															<td onclick="">${reportDTO.report_content }</td>
															<td>
																<div class="col-sm-offset-8 col-sm-4">
																	<button type="button" id="friendDel" onclick="" class="btn btn-danger">  
																		<span class="fa fa-close"></span> 
																	</button>
																</div>
															</td>
														</tr>
														</c:forEach>
													</tbody>
												</table>
										</div>
									</div>
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
		
		function adminMove(reportno) {
			location.href = "/overclass/admin/ban_list?reportno="+reportno;
		}
		
		$(".report_ban").click(function() { //제제하기 버튼 클릭시
			var reportno = this.firstChild.nextSibling.firstChild.nodeValue;
			var banId = this.nextSibling.nextSibling.firstChild.nextSibling.firstChild.nodeValue;
			var dno = this.nextSibling.nextSibling.nextSibling.nextSibling.firstChild.nextSibling.firstChild.nodeValue;
			BootstrapDialog.show({
				title: '', //알러트 타이틀 이름
				message: '<b>'+banId+'</b>을 제재 하시겠습니까?', //알러트 내용
				type: BootstrapDialog.TYPE_DANGER,
				buttons: [{ //알러트 버튼 정의
					icon: 'fa fa-check', //알러트버튼에 넣을 아이콘
					label: '제제', //알러트 버튼 이름
					cssClass: 'btn-danger', //알러트 버튼 색바꾸기
					action: function(confirm) {
						$.ajax({
							url:"/overclass/admin/banDoc",
							type:"post",
							data:{
								reportno:reportno,
								dno:dno
							},success:function(result){
								BootstrapDialog.show({
						    		title: '', //알러트 타이틀 이름
						    		message: banId+'님이 제재 되었습니다.', //알러트 내용
						    		buttons: [{ //알러트 버튼 정의
						    				icon: 'fa fa-check',
						    				label: '확인',
						    				cssClass: 'btn-primary',
						    				action: function(cancel){
						    					adminMove(reportno)
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
		
		$(".report_cancel").click(function() { //철회하기 버튼 클릭시
			var reportno = this.firstChild.nextSibling.firstChild.nodeValue;
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
						$.ajax({
							url:"/overclass/admin/cancelDoc",
							type:"post",
							data:{
								reportno:reportno
							},success:function(result){
								BootstrapDialog.show({
						    		title: '', //알러트 타이틀 이름
						    		message: '신고가 철회 되었습니다.', //알러트 내용
						    		buttons: [{ //알러트 버튼 정의
						    				icon: 'fa fa-check',
						    				label: '확인',
						    				cssClass: 'btn-primary',
						    				action: function(cancel){
						    					location.href = "/overclass/admin"
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
	})//ready
		
</script>
</html>