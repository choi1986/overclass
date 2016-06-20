<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>OVERCLASS</title>
<!-- CSS -->
	<!-- 부트스트랩 -->
	<link href="/overclass/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="/overclass/resources/css/bootstrap-theme.css" rel="stylesheet">
	<!-- 라이트박스 -->
	<link rel="stylesheet" href="/overclass/resources/css/lightbox.css">
	<!-- 부트스트랩모달 -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.9/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css">
	<!-- 아이콘 -->
	<link href="/overclass/resources/css/elegant-icons-style.css" rel="stylesheet">
	<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" >
	<!-- 스타일 -->
	<link href="/overclass/resources/css/style.css" rel="stylesheet">
	<link href="/overclass/resources/css/style-responsive.css" rel="stylesheet">
	<!-- 애니메이션 -->
	<link href="/overclass/resources/css/animate.css" type="text/css" rel="stylesheet">
<!-- CSS끝 -->

<!-- JS -->
	<!-- 지도API -->
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=3d4e4c724fafd5907ed9e9da045588fb"></script>
	<!-- 제이쿼리 -->
	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<!-- 부트스트랩 -->
	<script src="/overclass/resources/js/bootstrap.min.js"></script>
	<!-- 부트스스트랩모달 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.9/js/bootstrap-dialog.min.js"></script>
	<!-- 제이쿼리ui -->
	<script src="/overclass/resources/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="/overclass/resources/js/bootstrap-switch.js"></script>
	<!-- 태그 -->
	<script src="/overclass/resources/js/jquery.tagsinput.js"></script>
	<script src="/overclass/resources/js/form-component.js"></script>
	<!-- 애니메이션 -->
	<script src="/overclass/resources/js/animation.js"></script>
	<script src="/overclass/resources/js/jquery.cookie.js"></script>
	<!-- handlebars (댓글) -->
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- JS끝 -->
</head>
<body>
	<header class="header dark-bg">
		<!--로고 시작-->
		<a href="/overclass/main" class="logo">OVER <span
			class="lite">CLASS</span></a>
		<!-- 로고 끝-->
		<div class="nav search-row" id="top_menu">
			<!-- 검색폼 시작 -->
			<ul class="nav top-menu">
				<li>
					<form class="navbar-form">
						<input id="search_form" class="form-control" placeholder="Search"
							type="text" onKeyDown="onKeyDown()">
					</form>
				</li>
			</ul>
			<!--  검색폼 끝 -->
		</div>

		<div class="top-nav notification-row">
			<!-- 알림 드롭다운 -->
			<ul class="nav pull-right top-menu">

				<!-- 메세지알림 -->
				<li id="mail_notificatoin_bar" class="dropdown">
					<a data-toggle="dropdown" class="dropdown-toggle" href="#"> 
						<i class="icon-envelope-l"></i> 
						<span id='sitebarMsgCount' class="badge bg-important">0</span>
						<!-- 메세지온 개수 -->
					</a>
					<ul id="msg4" class="dropdown-menu extended inbox">
						<div class="notify-arrow notify-arrow-blue"></div>
						<li>
							<p class="blue">메시지 0개</p>
						</li>
					</ul>
				</li>
				<!-- 메시지알림 끝-->



				<!-- 새글알림 시작-->
			<li id="alert_notificatoin_bar" class="dropdown">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#"> 
					<i class="icon-bell-l"></i> 
					<span class="badge bg-important">2<%-- <%=f_req_num %> --%></span>
				</a>
					<ul id="notice" class="dropdown-menu extended notification">
						<div class="notify-arrow notify-arrow-blue"></div>
						<li>
							<p class="blue">새알림 n개</p>
						</li>
						<li>
							<a href="#"> 
								<span class="label label-primary">
									<i class="icon_profile"></i>
								</span>
								 홍길동님이 친구 요청 
								<span class="small italic pull-right">5분 전</span>
							</a>
						</li>
						<li>
							<a href="#"> 
								<span class="label label-warning">
									<i class="icon_pin"></i>
								</span>
								 땡땡 
								<span class="small italic pull-right">50분 전</span>
							</a>
						</li>
						<li>
							<a href="#"> 
								<span class="label label-danger">
									<i class="icon_book_alt"></i>
								</span> 
								 이순신님이 새글등록 
								<span class="small italic pull-right">1시간 전</span>
							</a>
						</li>
						<li>
							<a href="#"> 
								<span class="label label-success">
									<i class="icon_like"></i>
								</span>
								 김주원님 생일 
								<span class="small italic pull-right"> 오늘</span>
							</a>
						</li>
						<li>
							<a href="#">모든 알림 보기</a>
						</li>
					</ul>
				</li>
				<!-- 새글알림 끝-->

				<!-- 로그인한 유저정보 시작-->
				<li class="dropdown">
					<a data-toggle="dropdown" class="dropdown-toggle" href="#">
						<span class="avatar">
							<img src="${user.user_image }" width='30' height='30'>
						</span> 
						<span class="username">${user.user_id }</span> 
						<b class="caret"></b>
					</a>
					<ul class="dropdown-menu extended logout">
						<div class="log-arrow-up"></div>
						<li id="drop_myFeed" class="eborder-top">
							<a href="/overclass/main/myFeed">
								<i class="icon_profile"></i> 마이페이지
							</a>
						</li>
						<li>
							<a href="#">
								<i class="icon_mail_alt"></i> 메세지 함
							</a>
						</li>
						<li id="drop_main">
							<a href="/overclass/main">
								<i class="icon_clock_alt"></i> 메인페이지
							 </a>
						</li>
						<li>
							<a href="/overclass/logout">
								<i class="icon_key_alt"></i> 로그아웃
							</a>
						</li>
					</ul>
					</li>
				<!-- 로그인한 유저 정보 끝 -->
			</ul>
			<!-- 알림 드랍다운 끝-->
		</div>
	</header>
<script type="text/javascript">
function onKeyDown()
{
	if(event.keyCode == 13){
		var txtvar = $('#search_form').val();
		if(txtvar.substring(0,1)=='#'){
			var txt = txtvar.substring(1,txtvar.length);
				location.assign("searchTag?tag="+txt);
			}else{
				location.assign("searchIdName?info="+txtvar);
			}
	}
}
</script>	