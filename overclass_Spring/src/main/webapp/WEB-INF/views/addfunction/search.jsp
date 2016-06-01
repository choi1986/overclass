<%@page import="kr.co.overclass.domain.DocumentVO"%>
<%@page import="kr.co.overclass.domain.UserVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	검색페이지<br>
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js">
</script>	
<script type="text/javascript">
$(document).ready(function() {
	$("#bt").click(function() {
		$("#div").text($("#txt").val());
	})
});
</script>	
<input id="txt" type="text"><br>
<input type="button" id="bt" value="검색">
<div id="div"></div> -->

<% 
if(request.getAttribute("selectId")!=null){
UserVO user = (UserVO)request.getAttribute("selectId"); %>
아이디검색
생일: <%=user.getUser_birth() %><br>
성별: <%=user.getUser_gender() %><br>
아이디: <%=user.getUser_id() %><br>
이미지: <%=user.getUser_image() %><br>
지역: <%=user.getUser_loc() %><br>
이름: <%=user.getUser_name() %><br>
전화번호: <%=user.getUser_tel() %><br>

<%}else if(request.getAttribute("selectName")!=null){ %>
<% List<UserVO> list = (List<UserVO>)request.getAttribute("selectName"); %>
이름검색
<%for(int i=0;i<list.size();i++){ %>
생일: <%=list.get(i).getUser_birth() %><br>
성별: <%=list.get(i).getUser_gender() %><br>
아이디: <%=list.get(i).getUser_id() %><br>
사진: <%=list.get(i).getUser_image() %><br>
지역: <%=list.get(i).getUser_loc() %><br>
이름: <%=list.get(i).getUser_name() %><br>
전화: <%=list.get(i).getUser_tel() %><br><br>
<%}; %>

<%}else if(request.getAttribute("selectTag")!=null){ %> 
<% List<DocumentVO> doclist = (List<DocumentVO>)request.getAttribute("selectTag"); %>
태그검색
<%for(int i=0;i<doclist.size();i++){ %>
글번호: <%=doclist.get(i).getDno() %><br>
작성자: <%=doclist.get(i).getWriter() %><br>
글내용: <%=doclist.get(i).getContent() %><br>
태그: <%=doclist.get(i).getTag() %><br><br>
<%};};%>
 <%-- <br><br>
<div id="edit-profile" class="tab-pane">
	<section class="panel">
		<div class="panel-body bio-graph-info">
			<%
				for (int i = 0; i < search_list.size(); i++) {
			%>
			<!-- 친구목록 시작 -->
			<div class="act-time">
				<div class="activity-body act-in">
					<span class="arrow"></span>
					<div class="text">
						<a href="javascript:friend_request('<%=search_list.get(i).getUser_id() %>')" class="activity-img"><img id="friend_img" class="avatar"
							src="<%=search_list.get(i).getId_img_path()%>" alt=""></a>
						<p class="attribution">
							<a href="javascript:friend_request('<%=search_list.get(i).getUser_id() %>')" ata-toggle="modal" data-target="#addfriend" data-whatever="<%=search_list.get(i).getUser_id() %>"
							 style="color: blue;"><%=search_list.get(i).getName()%></a>
						<p>
							<i class="icon_pin_alt" style="color: green"></i><i><%=search_list.get(i).getLoc()%></i>
						</p>
					</div>
				</div>
			</div>
			<!-- 친구목록 끝 -->
			<%
				}
			%>

		</div>
	</section>
</div> --%>

