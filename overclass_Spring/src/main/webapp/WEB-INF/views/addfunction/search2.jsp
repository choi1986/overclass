<%@page import="kr.co.overclass.domain.DocumentVO"%>
<%@page import="kr.co.overclass.domain.UserVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	if (request.getAttribute("selectIdName") != null) {
%>
<%
	List<UserVO> list = (List<UserVO>) request.getAttribute("selectIdName");
%>
<%
	for (int i = 0; i < list.size(); i++) {
%>
<hr>
생일:
<%=list.get(i).getUser_birth()%><br>
성별:
<%=list.get(i).getUser_gender()%><br>
아이디:
<%=list.get(i).getUser_id()%><br>
사진:
<%=list.get(i).getUser_image()%><br>
지역:
<%=list.get(i).getUser_loc()%><br>
이름:
<%=list.get(i).getUser_name()%><br>
전화:
<%=list.get(i).getUser_tel()%><br>
<%
	}
		;
%>

<%
	} else if (request.getAttribute("selectTag") != null) {
%>
<%
	List<DocumentVO> doclist = (List<DocumentVO>) request.getAttribute("selectTag");
%>
<%
	for (int i = 0; i < doclist.size(); i++) {
%>
<hr>
글번호:
<%=doclist.get(i).getDno()%><br>
작성자:
<%=doclist.get(i).getWriter()%><br>
글내용:
<%=doclist.get(i).getContent()%><br>
태그:
<%=doclist.get(i).getTag()%><br>
<%
	}
		;
	}
	;
%>


