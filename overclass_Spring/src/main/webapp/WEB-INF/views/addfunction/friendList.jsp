<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.overclass.domain.FriendVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
친구 목록 페이지<br>

<%
if(request.getAttribute("list")==null){
	%>결과없음.....<%
}else{
	List<FriendVO> list = (List<FriendVO>)request.getAttribute("list");
	for(int i=0;i<list.size();i++){%>
	요청아이디: <%=list.get(i).getSender() %><br>
	대상아이디: <%=list.get(i).getReceiver() %><br>
<%
	};
};
%> 
 
<%-- <%
if(request.getAttribute("result").equals("success")){
%>	
	요청성공!!
<%
}else{%>
	요청실패!!
<%
}
%>
 --%>