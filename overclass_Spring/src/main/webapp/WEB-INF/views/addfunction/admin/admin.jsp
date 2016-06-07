<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Creative - Bootstrap 3 Responsive Admin Template">
<meta name="author" content="GeeksLabs">
<meta name="keyword"
	content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext'
	rel='stylesheet' type='text/css'>
<link rel="shortcut icon" href="../img/favicon.png">
<!-- start: CSS -->
<title>OVERCLASS</title>


<!-- Bootstrap CSS -->
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<link href="../../css/bootstrap-theme.css" rel="stylesheet">
<!--external css-->
<!-- font icon -->
<link href="../../css/elegant-icons-style.css" rel="stylesheet" />
<link href="../../css/font-awesome.min.css" rel="stylesheet" />
<!-- full calendar css-->
<link
	href="../../assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css"
	rel="stylesheet" />
<link href="../../assets/fullcalendar/fullcalendar/fullcalendar.css"
	rel="stylesheet" />
<!-- easy pie chart-->
<link
	href="../../assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css"
	rel="stylesheet" type="text/css" media="screen" />
<!-- owl carousel -->
<link rel="stylesheet" href="../../css/owl.carousel.css" type="text/css">
<link href="../../css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
<!-- Custom styles -->
<link rel="stylesheet" href="../../css/fullcalendar.css">
<link href="../../css/widgets.css" rel="stylesheet">
<link href="../../css/style.css" rel="stylesheet">
<link href="../../css/style-responsive.css" rel="stylesheet" />
<link href="../../css/jquery-ui-1.10.4.min.css" rel="stylesheet">

<!-- javascripts -->
<script src="../../js/js2/jquery.js"></script>
<script src="../../js/js2/bootstrap.min.js"></script>
<!-- nice scroll -->
<script src="../../js/js2/jquery.scrollTo.min.js"></script>
<script src="../../js/js2/jquery.nicescroll.js" type="text/javascript"></script>
<!-- jquery ui -->
<script src="../../js/js2/jquery-ui-1.9.2.custom.min.js"></script>
<!--custom checkbox & radio-->
<script type="text/javascript" src="../../js/js2/ga.js"></script>
<!--custom switch-->
<script src="../../js/js2/bootstrap-switch.js"></script>
<!--custom tagsinput-->
<script src="../../js/js2/jquery.tagsinput.js"></script>
<!-- bootstrap-wysiwyg -->
<script src="../../js/js2/jquery.hotkeys.js"></script>
<script src="../../js/js2/bootstrap-wysiwyg.js"></script>
<script src="../../js/js2/bootstrap-wysiwyg-custom.js"></script>
<!-- ck editor -->
<script type="text/javascript" src="../../assets/ckeditor/ckeditor.js"></script>
<!-- custom form component script for this page-->
<script src="../../js/js2/form-component.js"></script>
<!-- custome script for all page -->
<script src="../../js/js2/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#dropdown_2").click(function() {
			$("#page_div").hide()
		})
		$("#dropdown_1").click(function() {
			$("#page_div").show()
		})
		
		
		//메세지창 숨기기
		$("#msg_bar").hide()	
		
		//메세지아이콘 클릭시
		/* $("#msg_icon").click(function() { 
			$("#msg_bar").slideToggle(1000)
			$("#msg_icon").slideToggle(500)
		})
		$("#msg_icon2").click(function() {
			$("#msg_bar").slideToggle(500)
			$("#msg_icon").slideToggle(1000)
		}) */
		
		//글쓰기 아이콘 클릭시
		/* $("#content_bar").click(function() { 
			$("#content_body").slideToggle("slow"); //글쓰기아이콘 누르면 슬라이드 효과
			if ($("#content_icon").attr("class") == "fa fa-chevron-up") { //글쓰기아이콘 바꾸기
				$("#content_icon").attr("class", "fa fa-chevron-down")
			} else {
				$("#content_icon").attr("class", "fa fa-chevron-up")
			}
		}) */
		
		//좋아요 다이얼로그 좋아요 클릭시
		/* $("#dia_good").click(function() {
			if( $("#good_icon").attr("src") == "../../img/좋아요1.png" ) {
				$("#good_icon").attr("src","../../img/좋아요2.png")
			}
		}) */
		
		//좋아요 다이얼로그 좋아요취소 클릭시
		/* $("#dia_cancel").click(function() {
			if( $("#good_icon").attr("src") == "../../img/좋아요2.png" ) {
				$("#good_icon").attr("src","../../img/좋아요1.png")
			}
		}) */
		
		//페이징버튼 앞으로  클릭시
		$("#page_front").click(function() {
			alert(Number($("#page_1").text())+1)
		})
		
		//페이징버튼 뒤로  클릭시
		$("#page_back").click(function() {
			if( $("#page_1").val() !=1 ) {
				$("#page_1").val() -1
			}
		})
		
	})
</script>
</head>
<body>

	<!-- 컨테이너 시작 -->
	<section id="container" class="">
		<header class="header dark-bg">
			<!--로고 시작-->
			<a href="mainForm2.jsp" class="logo">OVER <span class="lite">CLASS</span></a>
			<!-- 로고 끝-->
			<div class="nav search-row" id="top_menu">
				<!-- 검색폼 시작 -->
				<ul class="nav top-menu">
					<li>
						<form class="navbar-form">
							<input class="form-control" placeholder="Search" type="text">
						</form>
					</li>
				</ul>
				<!--  검색폼 끝 -->
			</div>

			<div class="top-nav notification-row">
				<!-- 알림 드롭다운 -->
				<ul class="nav pull-right top-menu">
					<li id="task_notificatoin_bar" class="dropdown"></li>


					<!-- 메세지알림 -->
					<li id="mail_notificatoin_bar" class="dropdown"><a
						data-toggle="" class="" href="#"> <i
							class="icon-envelope-l"></i> <span class="badge bg-important"></span>
							<!-- 메세지온 개수 -->
					</a>
						<ul class="dropdown-menu extended inbox">
							<div class="notify-arrow notify-arrow-blue"></div>
							<li>
								<p class="blue">메시지 5개</p>
							</li>
							<li><a href="#"> <span class="photo"><img
										alt="avatar" src="../../img/avatar-mini.jpg"></span> <!-- 프사 -->
									<span class="subject"> <span class="from">홍길동</span> <!-- 이름 -->
										<span class="time">5분 전</span> <!-- 시간 -->
								</span> <span id="msg" class="subject">안녕안녕안녕안ㄴ</span> <!-- 메시지 -->
							</a></li>
							<li><a href="#"> <span class="photo"><img
										alt="avatar" src="../../img/avatar-mini2.jpg"></span> <!-- 프사 -->
									<span class="subject"> <span class="from">길라임</span> <!-- 이름 -->
										<span class="time">5분 전</span> <!-- 시간 -->
								</span> <span id="msg" class="subject">안녕안녕안녕안ㄴ</span> <!-- 메시지 -->
							</a></li>
							<li><a href="#"> <span class="photo"><img
										alt="avatar" src="../../img/avatar-mini3.jpg"></span> <!-- 프사 -->
									<span class="subject"> <span class="from">김주원</span> <!-- 이름 -->
										<span class="time">2시간 전</span> <!-- 시간 -->
								</span> <span id="msg" class="subject">안녕안녕안녕안ㄴ</span> <!-- 메시지 -->
							</a></li>
							<li><a href="#"> <span class="photo"><img
										alt="avatar" src="../../img/avatar-mini4.jpg"></span> <!-- 프사 -->
									<span class="subject"> <span class="from">이순신</span> <!-- 이름 -->
										<span class="time">1일 전</span> <!-- 시간 -->
								</span> <span id="msg" class="subject">안녕안녕안녕안ㄴ</span> <!-- 메시지 -->
							</a></li>
							<li><a href="#">모든메시지 보기</a></li>
						</ul></li>
					<!-- 메시지알림 끝-->



					<!-- 새글알림 시작-->
					<li id="alert_notificatoin_bar" class="dropdown"><a
						data-toggle="" class="" href="#"> <i
							class="icon-bell-l"></i> <span class="badge bg-important"></span>
					</a>
						<ul class="dropdown-menu extended notification">
							<div class="notify-arrow notify-arrow-blue"></div>
							<li>
								<p class="blue">새알림 4개</p>
							</li>
							<li><a href="#"> <span class="label label-primary"><i
										class="icon_profile"></i></span> 홍길동님이 친구 요청 <span
									class="small italic pull-right">5분 전</span>
							</a></li>
							<li><a href="#"> <span class="label label-warning"><i
										class="icon_pin"></i></span> 땡땡 <span class="small italic pull-right">50분
										전</span>
							</a></li>
							<li><a href="#"> <span class="label label-danger"><i
										class="icon_book_alt"></i></span> 이순신님이 새글등록 <span
									class="small italic pull-right">1시간 전</span>
							</a></li>
							<li><a href="#"> <span class="label label-success"><i
										class="icon_like"></i></span> 김주원님 생일 <span
									class="small italic pull-right"> 오늘</span>
							</a></li>
							<li><a href="#">모든 알림 보기</a></li>
						</ul></li>
					<!-- 새글알림 끝-->

					<!-- 로그인한 유저정보 시작-->
					<li class="dropdown"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <span class="profile-ava">
								<img alt="" src="../../img/avatar1_small.jpg">
						</span> <span class="username">한지민</span> <b class="caret"></b>
					</a>
						<ul class="dropdown-menu extended logout">
							<div class="log-arrow-up"></div>
							<!-- <li class="eborder-top"><a href="#"><i
									class="icon_profile"></i> 내 프로필</a></li> -->
							<!-- <li><a href="#"><i class="icon_mail_alt"></i> 메세지 함</a></li> -->
							<!-- <li><a href="#"><i class="icon_clock_alt"></i> 타임라인</a></li> -->
							<li><a href="login.html"><i class="icon_key_alt"></i>
									로그아웃</a></li>
						</ul></li>
					<!-- 로그인한 유저 정보 끝 -->
				</ul>
				<!-- 알림 드랍다운 끝-->
			</div>
		</header>


		<!-- <div class="row">
			<div class="col-md-12"></div>
		</div> -->
		<!-- 메인페이지 컨텐트 시작 -->
		<!-- <section id="main-content"> -->
		<section class="wrapper">
			<!-- overview start -->
			<!-- <div class="row">
					<div class="col-lg-2"></div>
					<div class="col-lg-12">
						<h3 class="page-header"></h3>
					</div>
				</div> -->



			<div class="row">
				<!-- profile-widget -->
				<div class="col-lg-12">
					<div class="profile-widget profile-widget-info">
						<div class="panel-body">
							<div class="col-lg-2 col-sm-2">
								<h4>홍길동</h4>
								<div class="follow-ava">
									<img src="../../img/피드_프사_디폴트.png">
								</div>
								<h6>관리자</h6>
							</div>
							<div class="col-lg-4 col-sm-4 follow-info">
								<p>
									<i class="fa fa-lg fa-github-alt">&nbsp;AdminPage</i>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- page start-->
			<div class="row">
				<div class="col-lg-12">
					<section class="panel">
						<header class="panel-heading tab-bg-info">
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" id="dropdown_1"
									href="#recent-activity"><span class="fa fa-warning">&nbsp;&nbsp;신고된 글</span>
								</a></li>
								<li><a id="dropdown_2" data-toggle="tab" href="#profile"><span
										class="fa fa-ban">&nbsp;&nbsp;차단목록</span> </a></li>
							</ul>
						</header>

						<div class="panel-body">
							<div class="tab-content">
								<div id="recent-activity" class="tab-pane active">
									<div class="profile-activity">



										<!-- 게시글시작 -->
										<div class="row">
											<div class="col-sm-offset-3 col-sm-5 portlets">
												<div class="panel panel-default">
													<div class="panel-heading">
														<div class="pull-left">
															<i class="fa fa-4x fa-warning" style="color: red;"></i><span>신고된 글</span>
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
																		<div class="photo col-lg-2">
																			<img alt="avatar" src="../../img/avatar1.jpg">
																			<span>아이디</span>
																		</div>
																		<div class="col-lg-10">
																			<textarea class="form-control" id="content" rows="5"
																				disabled="disabled"></textarea>
																			<!-- <div class="panel-content" style="width: 100%; height: 100px;">글내용DB</div> -->
																		</div>
																	</div>
																	
																	<!-- 좋아요 -->
																	<div class="form-group">
																		<p>
																			<a href="" class="control-label col-lg-2">좋아요&nbsp;&nbsp;
																				<span id="good_icon" class="fa fa-lg fa-thumbs-o-up"
																				style="color: blue;"></span> <!-- <img id="good_icon" src="../../img/좋아요1.png"> -->
																			</a>
																		</p>

																		<div class="col-lg-8"><i class="fa fa-lg fa-heart" style="color: red;"><span style="color: black;">1</span></i></div>
																	</div>
																	<!-- 태그 -->
																	<div class="form-group">
																		<label class="control-label col-lg-2" for="content">태그</label>
																		<div class="col-lg-9">
																			<button class="btn btn-info">태그DB</button>
																			<button class="btn btn-info">태그DB</button>
																		</div>
																	</div>
																	
																	<div class="form-group">
																		<div class="col-lg-offset-4 col-lg-8">
																				<button type="button" class="btn btn-danger" data-toggle="modal"
																			data-target="#btn_repot">차단하기</button>
																				<button type="button" class="btn btn-success" data-toggle="modal"
																			data-target="#btn_del">글삭제</button>
																				<button type="button" class="btn btn-dafault" data-toggle="modal"
																			data-target="#btn_back">접수취소</button>
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
										<!-- 게시글폼 끝 -->
									</div>
								</div>
								
								<!-- profile -->
								<!-- <div id="profile" class="tab-pane">
									<section class="panel">
										<div class="panel-body bio-graph-info">
											<div class="col-lg-10">
												<h1>프로필 수정</h1>
												<div class="row">
													<div class="bio-row">
														<div class="form-group">
															<label class="col-lg-3 control-label">아이디</label>
															<div class="col-lg-3">
																<input type="text" class="form-control" readonly>
															</div>
														</div>
													</div>
													<div class="bio-row">
														<div class="form-group">
															<label class="col-lg-3 control-label">이름</label>
															<div class="col-lg-3">
																<input type="text" class="form-control" readonly>
															</div>
														</div>
													</div>
													<div class="bio-row">
														<div class="form-group">
															<label class="col-lg-3 control-label">현재 비밀번호</label>
															<div class="col-lg-3">
																<input type="text" class="form-control">
															</div>
														</div>
													</div>
													<div class="bio-row">
														<div class="form-group">
															<label class="col-lg-3 control-label">이메일</label>
															<div class="col-lg-3">
																<input type="text" class="form-control">
															</div>
														</div>
													</div>
													<div class="bio-row">
														<div class="form-group">
															<label class="col-lg-3 control-label">새 비밀번호</label>
															<div class="col-lg-3">
																<input type="text" class="form-control">
															</div>
														</div>
													</div>
													<div class="bio-row">
														<div class="form-group">
															<label class="col-lg-3 control-label">전화번호</label>
															<div class="col-lg-2">
																<input type="text" class="form-control">
															</div>
															<div class="col-lg-2">
																<input type="text" class="form-control">
															</div>
															<div class="col-lg-2">
																<input type="text" class="form-control">
															</div>
														</div>
													</div>
													<div class="bio-row">
														<div class="form-group">
															<label class="col-lg-3 control-label">새 비밀번호 다시입력</label>
															<div class="col-lg-3">
																<input type="text" class="form-control">
															</div>
														</div>
													</div>
													<div class="bio-row">
														<div class="form-group">
															<label class="col-lg-3 control-label">주소</label>
															<div class="col-lg-3">
																<select class="form-control" id="loc" name="address">
																	<option>-- 선택 --</option>
																	<option>경기도</option>
																	<option>서울특별시</option>
																	<option>인천광역시</option>
																	<option>대구광역시</option>
																	<option>대전광역시</option>
																	<option>광주광역시</option>
																	<option>부산광역시</option>
																	<option>경상북도</option>
																	<option>경상남도</option>
																	<option>전라북도</option>
																	<option>전라남도</option>
																	<option>강원도</option>
																	<option>제주도</option>
																</select>
															</div>
														</div>
													</div>
													<div class="bio-row">
														<div class="form-group">
															<label class="col-lg-3 control-label">비밀번호찾기 질문</label>
															<div class="col-lg-3">
																<select class="form-control" id="pwd_q" name="pwd_q">
																	<option>-- 선택 --</option>
																	<option>나의 고향은?</option>
																	<option>나의 취미는?</option>
																	<option>나의 특기는?</option>
																	<option>나의 출신학교는?</option>
																	<option>부모님의 성함은?</option>
																	<option>보물제1호</option>
																</select>
															</div>
														</div>
													</div>
													<div class="bio-row">
														<div class="form-group">
															<label class="col-lg-3 control-label">생일</label>
															<div class="col-lg-3">
																<input type="text" class="form-control">
															</div>
														</div>
													</div>
													<div class="bio-row">
														<div class="form-group">
															<label class="col-lg-3 control-label">비밀번호찾기 답변</label>
															<div class="col-lg-3">
																<input type="text" class="form-control">
															</div>
														</div>
													</div>
													<div class="bio-row">
														<div class="form-group">
															<label class="col-lg-3 control-label">성별</label>
															<div class="col-lg-3">
																<input type="text" class="form-control">
															</div>
														</div>
													</div>
													<div class="form-group">
														<div class="col-lg-offset-4 col-lg-10">
															<button type="submit" class="btn btn-primary">수정</button>
															<button type="button" class="btn btn-default">취소</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</section>
									<section>
										<div class="row"></div>
									</section>
								</div> -->
								
<!-- edit-profile -->
								<div id="edit-profile" class="tab-pane">
									<section class="panel">
										<div class="panel-body bio-graph-info">
											<!-- 친구목록 시작 -->
											<div class="act-time">
												<div class="activity-body act-in">
													<span class="arrow"></span>
													<div class="text">
														<a href="#" class="activity-img"><img class="avatar"
															src="../../img/chat-avatar.jpg" alt=""></a>
														<p class="attribution">
															<a href="#" style="color: blue;">홍길동</a>
														<p>
															<i class="icon_pin_alt" style="color: green"></i><i>경기도</i>
														</p>
													</div>
												</div>
											</div>
											<!-- 친구목록 끝 -->

											<!-- 친구목록 시작 -->
											<div class="act-time">
												<div class="activity-body act-in">
													<span class="arrow"></span>
													<div class="text">
														<a href="#" class="activity-img"><img class="avatar"
															src="../../img/chat-avatar.jpg" alt=""></a>
														<p class="attribution">
															<a href="#" style="color: blue;">길라임</a>
														<p>
															<i class="icon_pin_alt" style="color: green"></i><i>서울특별시</i>
														</p>
													</div>
												</div>
											</div>
											<!-- 친구목록 끝 -->
										</div>
									</section>

								</div>
								<footer>
									<!-- 페이징버튼 -->
									<div id="page_div" class="col-lg-offset-5 col-lg-5">
											<a id="page_back" type="button" class="btn btn-default">«</a>
											<button id="page_1" type="button" class="btn btn-primary">1</button>
											<button id="page_2" type="button" class="btn btn-success">2</button>
											<button id="page_3" type="button" class="btn btn-warning">3</button>
											<button id="page_4" type="button" class="btn btn-danger">4</button>
											<button id="page_5" type="button" class="btn btn-info">5</button>
											<a id="page_front" type="button" class="btn btn-default">»</a>
									</div>
									<!--페이징버튼-->
								</footer>
							</div>
						</div>

					</section>

				</div>
			</div>


			<!-- page end-->


			<!-- 글쓰기전체 폼시작 -->


		</section>
	</section>
	<!-- </section> -->

	<!-- 모달정의(다이얼로그) -->
	<div class="modal fade" id="btn_repot" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<i style="color: red;" class="fa fa-lg fa-warning"></i>
					</h4>
				</div>
				<div class="modal-body">
					차단하시겠습니까?<br> <br>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">차단</button>
					<button type="button" class="btn btn-defult" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 모달정의(다이얼로그) -->
	<div class="modal fade" id="btn_back" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<i style="color: gray;" class="fa fa-lg fa-warning"></i>
					</h4>
				</div>
				<div class="modal-body">
					신고받은 접수를 취소하시겠습니까?<br> <br>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">확인</button>
					<button type="button" class="btn btn-defult" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달정의(다이얼로그) -->
	<div class="modal fade" id="btn_del" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<i style="color: limegreen;" class="fa fa-lg fa-warning"></i>
					</h4>
				</div>
				<div class="modal-body">
					글을 삭제 하시겠습니까?<br> <br>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal">삭제</button>
					<button type="button" class="btn btn-defult" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>



</body>
</html>