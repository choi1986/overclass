<%@page import="kr.co.overclass.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% UserVO user3 = (UserVO)session.getAttribute("login"); %>
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
	<!-- 파일버튼숨기기 -->
	<link href="/overclass/resources/css/fileboxcss.css" rel="stylesheet">
	<!-- 지도 -->
	<link href="/overclass/resources/css/map.css" rel="stylesheet">
	<!-- 스크롤업 -->
	<link id="scrollUpTheme" rel="stylesheet" href="/overclass/resources/css/image.css">
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
  	<!-- 스크롤업 -->
  	<script src="/overclass/resources/js/jquery.scrollUp.js"></script>
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
					<input id="search_form" class="form-control" placeholder="#태그 / 아이디 / 이름" type="text" onKeyDown="find()">
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
					<span id="noticebar_count" class="badge bg-important">0</span>
				</a>
					<ul id="notice" class="dropdown-menu extended notification">
						<div class="notify-arrow notify-arrow-blue"></div>
						<li>
							<p class="blue">새알림 0개</p>
						</li>
						<%-- <li>
							<a href="/overclass/notice/req?user_id=${login.user_id}"> 
								<span class="label label-primary">
									<i class="icon_profile"></i>
								</span>
								<input type="text" id="reqCount" size="1">건의 친구요청
								<span class="small italic pull-right">5분 전</span>
							</a>
						</li> --%>
					</ul>
				</li>
				<!-- 새글알림 끝-->

				<!-- 로그인한 유저정보 시작-->
				<li class="dropdown">
					<a data-toggle="dropdown" class="dropdown-toggle" href="#">
						<span class="avatar">
							<img id="cancel_image" class="img-circle" src="${user.user_image }" width='30' height='30'>
						</span> 
						<span id="useridspan" class="username">${user.user_id }</span> 
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
							<a href="/overclass/chat">
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

<!-- 알림처리를 위한 템플릿. -->
<script id="alarm" type="text/x-handlebars-template">
<li>
	<a href="javascript:friendapply('{{sender }}');"> 
	<span class="label label-primary">
		<i class="icon_profile"></i>
	</span>
		&nbsp;{{sender }} 님의 친구요청
	</a>
</li>
</script>
<script id="alarmCount" type="text/x-handlebars-template">
<div class="notify-arrow notify-arrow-blue"></div>
						<li>
							<p class="blue">새알림 {{count }}개</p>
						</li>
</script>

<script>
var alarm = $("#alarm").html();
var countsource = $("#alarmCount").html();
var alarmtemp = Handlebars.compile(alarm);
var counttemp = Handlebars.compile(countsource);

function find() {
	   if(event.keyCode == 13){
	      var formObj = $("#find_form");
	      var txtvar = $('#search_form').val().toLowerCase();
	      if(txtvar.substring(0,1)=='#'){ //태그검색
	         var txt = txtvar.substring(1,txtvar.length);
	         location.href="/overclass/find/tagfind?tag="+txt;
	      } else { //친구검색
	         location.href="/overclass/find/friendfind?friend="+txtvar;
	      }
	      return false;
	   }
	}

function friendlist(receiver){
	var htmltxt='';
	$.ajax({
		url : "/overclass/friend/searchreq",
		type:"POST",
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"
		},
		data:JSON.stringify({
			receiver:receiver
		}),
		success : function(success) {
			if(success.count != 0){
				htmltxt = counttemp(success);
				for(var i=0;i<success.list.length;i++){
					htmltxt += alarmtemp(success.list[i]);
				}
				$("#notice").html(htmltxt);
			}// if
			$("#noticebar_count").text(success.count);
		},// success
		error:function(xhr){
			console.log(xhr);
		}
	})
}

function friendapply(applyfriendid) {
	BootstrapDialog.show({
		title: '', //알러트 타이틀 이름
		message: '['+applyfriendid+'] 님과 친구가 되시겠습니까?', //알러트 내용
		buttons: [{ //알러트 버튼 정의
			icon: 'fa fa-check', //알러트버튼에 넣을 아이콘
			label: '확인', //알러트 버튼 이름
			cssClass: 'btn-primary', //알러트 버튼 색바꾸기
			action: function(confirm) {
				$.ajax({
					url:'/overclass/friend/applyfriend',
					type:'post',
					headers:{
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"POST"
					},
					data:JSON.stringify({
						sender:applyfriendid,
						receiver:'<%=user3.getUser_id()%>'
					}),
					success:function(result){
						if(result == 'SUCCESS') {
							BootstrapDialog.show({
								title: '', //알러트 타이틀 이름
								message: '['+applyfriendid+'] 님과 친구가 되었습니다!', //알러트 내용
								buttons: [{ //알러트 버튼 정의
									icon: 'fa fa-check', //알러트버튼에 넣을 아이콘
									label: '확인', //알러트 버튼 이름
									cssClass: 'btn-primary', //알러트 버튼 색바꾸기
									action: function(confirm) {
										confirm.close();
									}
									}]
							})// BootstrapDialog
						}else{
							BootstrapDialog.show({
								title: '', //알러트 타이틀 이름
								message: '친구수락실패!', //알러트 내용
								buttons: [{ //알러트 버튼 정의
									icon: 'fa fa-check', //알러트버튼에 넣을 아이콘
									label: '확인', //알러트 버튼 이름
									cssClass: 'btn-primary', //알러트 버튼 색바꾸기
									action: function(confirm) {
										confirm.close();
									}
									}]
							})// BootstrapDialog
						}// if success
					}
				}); // ajax
				confirm.close();
			}
			},{
				label: '거절',
				action: function(cancel){
					$.ajax({
						url:'/overclass/friend/applyfriend',
						type:'post',
						headers:{
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"POST"
						},
						data:JSON.stringify({
							sender:applyfriendid,
							receiver:'<%=user3.getUser_id()%>'
						}),
						success:function(result){
							if(result == 'SUCCESS') {
								BootstrapDialog.show({
									title: '', //알러트 타이틀 이름
									message: '친구관계를 거절했습니다.', //알러트 내용
									buttons: [{ //알러트 버튼 정의
										icon: 'fa fa-check', //알러트버튼에 넣을 아이콘
										label: '확인', //알러트 버튼 이름
										cssClass: 'btn-primary', //알러트 버튼 색바꾸기
										action: function(confirm) {
											confirm.close();
										}
										}]
								})// BootstrapDialog
							}						
						}
					}); // ajax
					cancel.close();
					}
			}]
	})// BootstrapDialog
}


friendlist('<%=user3.getUser_id()%>');
</script>	