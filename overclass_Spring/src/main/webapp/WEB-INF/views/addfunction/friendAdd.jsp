<%@page import="kr.co.overclass.domain.UserVO"%>
<%@page import="kr.co.overclass.domain.FriendVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#bt1").click(function() {
			$.ajax({
				type:'GET',
				url:'/overclass/friend/SelectReq?info='+$("#t1").val(),
				success:function(data){
					$('div').html(data);
				}
				
			});
		});
	});
</script>

친구요청페이지<br>

대상아이디: <input type="text" id="t1"><br>
<input type="button" value="요청" id="bt1"><br>
<div></div>
<%
UserVO vo = new UserVO();
vo.setUser_id("test1");
session.setAttribute("userVO", vo);
System.out.print(vo.getUser_id());%>