<%@page import="oc.model.beans.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% List<MemberDTO> search_list = (List<MemberDTO>)request.getAttribute("search_list"); %>
<br><br>
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
</div>


