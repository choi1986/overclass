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
		<a href="documentaction.do?action=list" class="logo">OVER <span
			class="lite">CLASS</span></a>
		<!-- 로고 끝-->
		<div class="nav search-row" id="top_menu">
			<!-- 검색폼 시작 -->
			<ul class="nav top-menu">
				<li>
					<form class="navbar-form">
						<input id="search_form" class="form-control" placeholder="Search"
							type="text" onKeyDown="return search(event)">
					</form>
				</li>
			</ul>
			<!--  검색폼 끝 -->
		</div>

		<div class="top-nav notification-row">
			<!-- 알림 드롭다운 -->
			<ul class="nav pull-right top-menu">
				<li id="task_notificatoin_bar" class="dropdown"></li>

				<!-- 로그인한 유저정보 시작-->
				<li class="dropdown"><a data-toggle="dropdown"
					class="dropdown-toggle" href="#"> <span class="profile-ava">
							<img src="${initParam.root}<%-- <%=user.getId_img_path()%> --%>" width='30'
							height='30'>
					</span> <span class="username"><%-- <%=user.getName()%> --%></span> <b class="caret"></b>
				</a>
					<ul class="dropdown-menu extended logout">
						<div class="log-arrow-up"></div>
						<li><a href="logout.do"><i class="icon_key_alt"></i> 로그아웃</a></li>
					</ul></li>
				<!-- 로그인한 유저 정보 끝 -->
			</ul>
			<!-- 알림 드랍다운 끝-->
		</div>
	</header>