<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">

	// 소켓생성하기
	var ws = new WebSocket('ws://localhost:9999/');
	
	// 서버로부터 메시지 전달 받을때
	ws.onmessage = function (event) {
		
	};
	
	// 웹 소켓 서버가 열릴 때,
	ws.onopen = function() {
		
	};
	
	// 웹 소켓 서버가 닫힐 때,
	ws.onclose = function() {
		
	};

</script>
<body>

</body>
</html>