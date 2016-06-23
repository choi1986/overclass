<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script>

	// 소켓생성하기
	var ws = new WebSocket('ws://192.168.0.131/overclass/chata');
	
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
	
	var sender = 'test1';
	
	
	/* var test = JSON.stringify({
		sender:sender,
		receiver:'',
		protocol:100,
		msg:''
	}) */
	
	function enter(event) {
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
		$("#submit").click(function(){
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
<body>
	<textarea id="textout" rows="20" cols="80" readonly></textarea><br>
	<input type="text" id="sendtext" width="100px" onkeydown="return enter(event)"><button id="submit" value="전송">전송</button><br>
	<button id="test" value="test">테스트버튼</button>
</body>
</html>