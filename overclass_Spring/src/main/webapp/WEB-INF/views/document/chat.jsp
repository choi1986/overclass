<%@page import="java.util.List"%>
<%@page import="kr.co.overclass.domain.UserVO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% UserVO user = (UserVO)session.getAttribute("login"); %>

<!-- 헤더 -->
<%@include file="../include/header.jsp"%>
<!-- 헤더끝 -->
<section class="wrapper">
	<div class="row">
		<section class="panel">
			<div class="panel-body">
				<div id="recent-activity" class="tab-pane active">
					<div class="profile-activity">
						<div class="col-sm-offset-2">
							<%@include file="../include/chatting.jsp"%>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</section>


<!-- 상대가 쓴채팅 템플릿 -->
<script id="chatother" type="text/x-handlebars-template">
<li class="by-me">
	<div class="avatar pull-left">
		<img src="img/user.jpg" alt="">
	</div>

	<div class="chat-content">
		<div class="chat-meta">
			<span style="color: black;">{{sender}}</span> <span class="pull-right">{{writedate}}</span>
		</div>
		{{content}}
		<div class="clearfix"></div>
	</div>
</li>
</script>

<!-- 내가쓴채팅 템플릿 -->
<script id="chatme" type="text/x-handlebars-template">
<li class="by-other">
	<div class="avatar pull-right">
		<img src="img/user22.png" alt="">
	</div>

	<div class="chat-content" style="border-color: #ffd700;">
		<div class="chat-meta">{{writedate}} 
			<span class="pull-right" style="color: black;">나</span>
		</div>
		{{content}}
		<div class="clearfix"></div>
	</div>
</li>
</script>

<!-- 웹소켓부분 -->
<script>
	var sender = '<%=user.getUser_id()%>';
	var receiver = '<%=user.getUser_id()%>';
	
	var sourceme = $("#chatme").html();
	var sourceother = $("#chatother").html();
	var templateme = Handlebars.compile(sourceme);
	var templateother = Handlebars.compile(sourceother);
	
	// 소켓생성하기
	var ws = new WebSocket('ws://192.168.0.131/overclass/chatting');
	
	// 주의!!!
	// 웹브라우저에서 localhost/overclass 로 접속했을땐 소켓이 localhost 으로만 접속됨.
	// 나중에는 서버 아이피로 변경해야됨.
	
	var htmltxt = '';
	
	// 서버로부터 메시지 전달 받을때
	ws.onmessage = function (event) {
		// 내가 지금 대화하고있는 상대
		var clickUser = document.getElementById('chatTo').firstChild.nodeValue;
		
		var data = JSON.parse(event.data);
		switch(data.protocol){
			case 120:{
				// data.chatlist  -> 채팅리스트
				// console.log(data.chatlist[0].sender);
				for(var i=0;i<data.chatlist.length;i++){
					// 보낸이가 나면
					if(data.chatlist[i].sender == sender){
						htmltxt = templateme(data.chatlist[i]);
						$("#textout").append(htmltxt);
					}else{
						htmltxt = templateother(data.chatlist[i]);
						$("#textout").append(htmltxt);
					}
				}
			}break;
			case 210:{
				// 내가 지금 대화를 하고있는 상대한태서 온 메시지이면 화면에 표출
				if(data.receiver == sender){
					htmltxt = templateother(data);
					$("#textout").append(htmltxt);
					var window = document.getElementById('chatwindow');
					window.scrollTop = window.scrollHeight; 
				}else{	// 그게아니라면 아이디리스트에 숫자추가
					
				}
			}break;
			// 유저로그인 프로토콜, sender가 친구리스트에있는 친구라면 점등
			case 300:{
				var loginID = '#cl_'+data.protocol.sender;
				// 해당유저의 불 점등
				$(loginID);
			}break;
			// 유저로그아웃 프로토콜 (현재는 페이지 이동해도 전달됨), sender가 친구리스트에 있는 친구라면 멸등
			case 310:{
				var logoutID = '#cl_'+data.protocol.sender;
				// 해당유저의 불 멸등
				$(logoutID);
			}break;
		}
	};
	
	// 웹 소켓 서버가 열릴 때,
	ws.onopen = function() {
		var connmsg = JSON.stringify({
			sender:sender,
			receiver:'allUser',
			protocol:100,
			content:'connected WS Server!'
		});
		// 접속했다는 메시지 서버전송
		ws.send(connmsg);
	};
	
	// 웹 소켓 서버가 닫힐 때,
	ws.onclose = function() {
		
	};
	
	// 채팅 입력부
	function chatEnter(event) {
		if(event.keyCode == 13){
			var text = '';
			this.receiver = document.getElementById('chatTo').firstChild.nodeValue;
			text = JSON.stringify({
				sender:sender,
				receiver:receiver,
				protocol:200,
				content:$("#sendtext").val()
			})
			// 서버전송
			ws.send(text);
			var htmltxt = templateme(JSON.parse(text));
			$("#textout").append(htmltxt);
			$("#sendtext").val('');
			var window = document.getElementById('chatwindow');
			window.scrollTop = window.scrollHeight; 
			return false;
		}
	}
	
	// 채팅상대변경
	function chatChange(user_id) {
		//document.getElementById('chatTo').firstChild.value = user_id;
		this.receiver = user_id;
		$("#textout").html('');
		$("#chatTo").text(user_id);
		var changeMsg = JSON.stringify({
			sender:sender,
			receiver:user_id,
			protocol:110,
			content:'CHANGE CHATTING USER'
		});
		// 접속했다는 메시지 서버전송
		ws.send(changeMsg);
	}
	
</script>
</html>