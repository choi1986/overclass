<%@page import="kr.co.overclass.domain.FriendVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%
	if(request.getAttribute("reqlist")!=null){
		List<FriendVO> list = (List<FriendVO>)request.getAttribute("reqlist");
		%><br><br><br>요청 수: <%=(int)request.getAttribute("countReq")%><br><%
		for(int i=0;i<list.size();i++){
			%><br>요청자: 
			<input type="text" id="sen<%=i+1 %>" value="<%=list.get(i).getSender() %>" size="6">
			<br>
			대상아이디: 
			<input type="text" id="rec<%=i+1 %>" value="<%=list.get(i).getReceiver() %>" size="6">
			<br>
			<input class="sub" type="button" value="요청수락<%=i+1 %>" id="req<%=i+1%>"><br><%
		}
	}else if(request.getAttribute("submit").equals("submit")){
		%><br><br><br><br><br>친구 등록 성공<br>
		<a href="/overclass/notice/req?user_id=test1">요청목록으로</a>
		<a href="main">메인으로</a><%
	}
%>

<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script>
	$(document).ready(function() {
		$(".sub").click(function() {
			var numtxt = $(this).val();
			num = numtxt.substring(2,5);
			var sender = $("#sen"+num).val();
			//alert("요청자"+sender)
			var receiver = $("#rec"+num).val();
			//alert("대상"+receiver)
			location.assign("/overclass/notice/friendSubmit?sender="+sender+"&receiver="+receiver)
		})
	})
</script>