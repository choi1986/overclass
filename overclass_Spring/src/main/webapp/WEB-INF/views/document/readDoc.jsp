<%@page import="kr.co.overclass.dto.DocumentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%
DocumentDTO dto = (DocumentDTO)request.getAttribute("doc");
if(dto!=null){
%>
<br><br><br><br><br>
글번호: <%=dto.getDno()%><br>
작성자: <%=dto.getWriter()%><br>
작성일: <%=dto.getWritedate()%><br>
태그: <%=dto.getTag()%><br>
글내용: <%=dto.getContent()%><br>
<%}; %>

<%-- <%=
dto.getContent()
dto.getDno()
dto.getGood()
dto.getGoodcnt()
dto.getImage()
dto.getReplycnt()
dto.getTag()
dto.getUser_image()
dto.getWritedate()
dto.getWriter()
%> --%>