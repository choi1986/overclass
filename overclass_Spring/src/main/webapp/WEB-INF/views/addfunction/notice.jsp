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
			%><br>요청자: <%=list.get(i).getSender() %><br>
			대상아이디: <%=list.get(i).getReceiver() %><br><%
		}
	}else{
		%>결과 없음<%
	}
%>