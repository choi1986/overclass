<%@page import="com.sun.org.apache.xpath.internal.operations.Variable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구 추가 페이지</title>
<%
	String result = (String)session.getAttribute("result");
	if(result.equals("success_rel_insert")){
		//result키값으로 success_rel_insert 전달됬을 경우 친구 추가 성공 메시지 보여주기
	}
%>
</head>
<body>

</body>
</html>