<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

	// 소켓생성하기
	var ws = new WebSocket('ws://192.168.0.131/overclass/chat');
	
	// 서버로부터 메시지 전달 받을때
	ws.onmessage = function (event) {
		
	};
	
	// 웹 소켓 서버가 열릴 때,
	ws.onopen = function() {
		
	};
	
	// 웹 소켓 서버가 닫힐 때,
	ws.onclose = function() {
		
	};
	
	var test = JSON.stringify({
		sender:'test1',
		receiver:'',
		protocol:100,
		msg:''
	})
	
	$(document).ready(function() {
		$("#test").click(function(){
			ws.send(test);
		})
	});

</script>
<body>
	<button id="test" value="test">테스트버튼</button>
</body>
</html>