<%@page import="java.util.List"%>
<%@page import="kr.co.overclass.domain.UserVO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@include file="../include/header.jsp"%>
<!-- 헤더끝 -->
<% UserVO user = (UserVO)session.getAttribute("login"); %>
<% UserVO user2 = (UserVO)session.getAttribute("login"); %>
<!-- 내가쓴채팅 템플릿 -->
<script id="chatme" type="text/x-handlebars-template">
<li class="by-me">
	<div class="avatar pull-left">
		<img src="img/user.jpg" alt="">
	</div>

	<div class="chat-content">
		<div class="chat-meta">
			<span style="color: black;">라임</span> <span class="pull-right">3시간전</span>
		</div>
		ㅂㅇ
		<div class="clearfix"></div>
	</div>
</li>
</script>


<!-- 웹소켓부분 -->
<script>
	var sender = '<%=user2.getUser_id()%>';
	var receiver = '<%=user2.getUser_id()%>';
	
	// 소켓생성하기
	var ws = new WebSocket('ws://192.168.0.131/overclass/chat');
	
	// 서버로부터 메시지 전달 받을때
	ws.onmessage = function (event) {
		var data = JSON.parse(event.data);
		switch(data.protocol){
			case 210:{
				var text = data.sender+' : '+data.msg+'\n';
				$("#textout").append(text);
			}break;
		}
	};
	
	// 웹 소켓 서버가 열릴 때,
	ws.onopen = function() {
		
	};
	
	// 웹 소켓 서버가 닫힐 때,
	ws.onclose = function() {
		
	};

	// 채팅 입력부
	function chatEnter(event) {
		if(event.keyCode == 13){
			var text = JSON.stringify({
				sender:sender,
				receiver:'',
				protocol:200,
				msg:$("#sendtext").val()
			})
			ws.send(text);
			$("#textout").append(sender+' : '+$("#sendtext").val()+'\n');
			$("#sendtext").val('');
		}
	}
	
	$(document).ready(function() {
		$("#txtsubmit").click(function(){
			var text = JSON.stringify({
				sender:sender,
				receiver:'',
				protocol:200,
				msg:$("#sendtext").val()
			})
			ws.send(text);
			$("#textout").append(sender+' : '+$("#sendtext").val()+'\n');
		})
	});

</script>


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

</html>