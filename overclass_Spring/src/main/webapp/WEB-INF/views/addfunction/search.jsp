<%@page import="kr.co.overclass.domain.DocumentVO"%>
<%@page import="kr.co.overclass.domain.UserVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<script
	src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#user1").click(function() {
			var user_id=$("#user_id1").val();
			alert(user_id);
			$.ajax({
				type:'GET',
				url:'/overclass/friend/addReq?info='+user_id,
						success:function(data){
							$('div').html(data);
						}
			});
		});
		$("#user2").click(function() {
			var user_id=$("#user_id2").val();
			alert(user_id);
			$.ajax({
				type:'GET',
				url:'/overclass/friend/addReq?info='+user_id,
						success:function(data){
							$('div').html(data);
						}
			});
		});
		$("#user3").click(function() {
			var user_id=$("#user_id3").val();
			alert(user_id);
			$.ajax({
				type:'GET',
				url:'/overclass/friend/addReq?info='+user_id,
						success:function(data){
							$('div').html(data);
						}
			});
		});
		$("#user4").click(function() {
			var user_id=$("#user_id4").val();
			alert(user_id);
			$.ajax({
				type:'GET',
				url:'/overclass/friend/addReq?info='+user_id,
						success:function(data){
							$('div').html(data);
						}
			});
		});
		$("#user5").click(function() {
			var user_id=$("#user_id5").val();
			alert(user_id);
			$.ajax({
				type:'GET',
				url:'/overclass/friend/addReq?info='+user_id,
						success:function(data){
							$('div').html(data);
						}
			});
		});
		$("#user6").click(function() {
			var user_id=$("#user_id6").val();
			alert(user_id);
			$.ajax({
				type:'GET',
				url:'/overclass/friend/addReq?info='+user_id,
						success:function(data){
							$('div').html(data);
						}
			});
		});
		$("#user7").click(function() {
			var user_id=$("#user_id7").val();
			alert(user_id);
			$.ajax({
				type:'GET',
				url:'/overclass/friend/addReq?info='+user_id,
						success:function(data){
							$('div').html(data);
						}
			});
		});
		$("#user8").click(function() {
			var user_id=$("#user_id8").val();
			alert(user_id);
			$.ajax({
				type:'GET',
				url:'/overclass/friend/addReq?info='+user_id,
						success:function(data){
							$('div').html(data);
						}
			});
		});
		$("#user9").click(function() {
			var user_id=$("#user_id9").val();
			alert(user_id);
			$.ajax({
				type:'GET',
				url:'/overclass/friend/addReq?info='+user_id,
						success:function(data){
							$('div').html(data);
						}
			});
		});
		$("#user10").click(function() {
			var user_id=$("#user_id10").val();
			alert(user_id);
			$.ajax({
				type:'GET',
				url:'/overclass/friend/addReq?info='+user_id,
						success:function(data){
							$('div').html(data);
						}
			});
		});
		$("#doc1").click(function() {
			var gap = $("#doc_dno1").val()+','+$("#doc_writer1").val()+','+$("#doc_content1").val()+','+$("#doc_tag1").val();
			alert(gap);
		});
		$("#doc2").click(function() {
			var gap = $("#doc_dno2").val()+','+$("#doc_writer2").val()+','+$("#doc_content2").val()+','+$("#doc_tag2").val();
			alert(gap);
		});
		$("#doc3").click(function() {
			var gap = $("#doc_dno3").val()+','+$("#doc_writer3").val()+','+$("#doc_content3").val()+','+$("#doc_tag3").val();
			alert(gap);
		});
		$("#doc4").click(function() {
			var gap = $("#doc_dno4").val()+','+$("#doc_writer4").val()+','+$("#doc_content4").val()+','+$("#doc_tag4").val();
			alert(gap);
		});
		$("#doc5").click(function() {
			var gap = $("#doc_dno5").val()+','+$("#doc_writer5").val()+','+$("#doc_content5").val()+','+$("#doc_tag5").val();
			alert(gap);
		});
		$("#doc6").click(function() {
			var gap = $("#doc_dno6").val()+','+$("#doc_writer6").val()+','+$("#doc_content6").val()+','+$("#doc_tag6").val();
			alert(gap);
		});
		$("#doc7").click(function() {
			var gap = $("#doc_dno7").val()+','+$("#doc_writer7").val()+','+$("#doc_content7").val()+','+$("#doc_tag7").val();
			alert(gap);
		});
		$("#doc8").click(function() {
			var gap = $("#doc_dno8").val()+','+$("#doc_writer8").val()+','+$("#doc_content8").val()+','+$("#doc_tag8").val();
			alert(gap);
		});
		$("#doc9").click(function() {
			var gap = $("#doc_dno9").val()+','+$("#doc_writer9").val()+','+$("#doc_content9").val()+','+$("#doc_tag9").val();
			alert(gap);
		});
		$("#doc10").click(function() {
			var gap = $("#doc_dno10").val()+','+$("#doc_writer10").val()+','+$("#doc_content10").val()+','+$("#doc_tag10").val();
			alert(gap);
		});
	});
</script>
<%
	if (request.getAttribute("selectIdName") != null) {
%>
<%
	List<UserVO> list = (List<UserVO>) request.getAttribute("selectIdName");
	int resultCount = (int)request.getAttribute("resultCount");
%>
아이디/이름 검색결과: <%=resultCount %><br>
<a href="search" id="newsearch">[ 다시검색 ]</a><br>
<%
	for (int i = 0; i < list.size(); i++) {
%>
<hr>
생일: 
<input type="text" value="<%=list.get(i).getUser_birth()%>" readonly="readonly" size="10" id="user_birth<%=i+1%>">
<br>
성별: 
<input type="text" value="<%=list.get(i).getUser_gender()%>" readonly="readonly" size="10" id="user_gender<%=i+1%>">
<br>
아이디: 
<input type="text" value="<%=list.get(i).getUser_id()%>" readonly="readonly" size="10" id="user_id<%=i+1%>">
<br>
사진: 
<input type="text" value="<%=list.get(i).getUser_image()%>" readonly="readonly" size="10" id="user_image<%=i+1%>">
<br>
지역: 
<input type="text" value="<%=list.get(i).getUser_loc()%>" readonly="readonly" size="10" id="user_loc<%=i+1%>">
<br>
이름: 
<input type="text" value="<%=list.get(i).getUser_name()%>" readonly="readonly" size="10" id="user_name<%=i+1%>">
<br>
전화: 
<input type="text" value="<%=list.get(i).getUser_tel()%>" readonly="readonly" size="10" id="user_tel<%=i+1%>">
<br>
<input type="button" value="친구요청" id=user<%=i+1 %>><br>
<%
	};
	if(resultCount<11){
		%><a href="main" id="toMain">[ 메인페이지로 ]</a><br><%
	}else{
		int pageNum=0;
		int lastPage = resultCount/10+1;
		if(resultCount/10==0){
			pageNum = resultCount/10;
		}else{
			pageNum = resultCount/10+1;
		};
		%><a href="main" id="toMain">[ 메인페이지로 ]</a><br><a href="searchTagPage?page=1" id="firstPage">[ 첫페이지 ]</a><%
		for(int i=0;i<pageNum;i++){
		%><a href="searchIdNamePage?page=<%=i+1%>">[ <%=i+1%> ]</a><%
		}%><a href="searchIdNamePage?page=<%=lastPage%>" id="lastPage">[ 마지막페이지 ]</a><%
	};
%>

<%
	} else if (request.getAttribute("selectTag") != null) {
%>
<%
	List<DocumentVO> doclist = (List<DocumentVO>) request.getAttribute("selectTag");
	int resultCount = (int)request.getAttribute("resultCount");
%>
태그 검색결과: <%=resultCount %><br>
<a href="search" id="newsearch">[ 다시검색 ]</a><br>
<%
	for (int i = 0; i < doclist.size(); i++) {
%>
<hr>
글번호: 
<input type="text" value="<%=doclist.get(i).getDno()%>" readonly="readonly" size="10" id="doc_dno<%=i+1%>"><br>
작성자: 
<input type="text" value="<%=doclist.get(i).getWriter()%>" readonly="readonly" size="10" id="doc_writer<%=i+1%>"><br>
글내용: 
<input type="text" value="<%=doclist.get(i).getContent()%>" readonly="readonly" size="10" id="doc_content<%=i+1%>"><br>
태그: 
<input type="text" value="<%=doclist.get(i).getTag()%>" readonly="readonly" size="10" id="doc_tag<%=i+1%>"><br>
<input type="button" value="글 조회" id=doc<%=i+1 %>><br>
<%
	};
	if(resultCount<11){
		%><a href="main" id="toMain">[ 메인페이지로 ]</a><br><%
	}else{
		int pageNum=0;
		int lastPage = resultCount/10+1;
		if(resultCount/10==0){
			pageNum = resultCount/10;
		}else{
			pageNum = resultCount/10+1;
		};
		%><a href="main" id="toMain">[ 메인페이지로 ]</a><br><a href="searchTagPage?page=1" id="firstPage">[ 첫페이지 ]</a><%
		for(int i=0;i<pageNum;i++){
		%><a href="searchTagPage?page=<%=i+1%>">[ <%=i+1%> ]</a><%
		}%><a href="searchTagPage?page=<%=lastPage%>" id="lastPage">[ 마지막페이지 ]</a><%
	};
};
%>

