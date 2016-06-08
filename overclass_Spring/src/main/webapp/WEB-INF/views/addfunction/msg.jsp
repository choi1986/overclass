<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 메시지내용 시작 --%>
<div id="msg_scroll" class="padd scroll" style="height: 320px; overflow: auto;">
	<ul class="chats">
		<%-- <%
			int cnt = 0; // 최신글이 밑으로 내려와야되므로, 사이즈를 카운트로받아옴

			while (cnt < list.size() && cnt < 10) {
				if (list.get(cnt).getUser_id().equals(member.getUser_id())) { // 보낸이가 나면
		%> --%>
		<li class="by-other">
			<div class="avatar pull-right">
				<img src="<%-- <%=member.getId_img_path()%> --%>" width='45' height='45' />
			</div>

			<div class="chat-content">
				<!-- In the chat meta, first include "time" then "name" -->
				<div class="chat-meta">
					<%-- <%=list.get(cnt).getWrite_date()%> --%>전 <span class="pull-right"><%-- <%=list.get(cnt).getUser_id()%> --%></span>
				</div>
				<%-- <%=list.get(cnt).getContent()%> --%>
				<div class="clearfix"></div>
			</div>
		</li>
		<%-- <%
			} else { // 보낸이가 내가 아니면
		%> --%>
		<li class="by-me">
			<div class="avatar pull-left">
				<img src="<%-- <%=list.get(cnt).getId_img_path()%> --%>" width='45'
					height='45' />
			</div>

			<div class="chat-content">
				<div class="chat-meta">
					<div><%-- <%=list.get(cnt).getUser_id()%> --%></div>
					<span class="pull-right"><%-- <%=list.get(cnt).getWrite_date()%> --%>전</span>
				</div>
				<%-- <%=list.get(cnt).getContent()%> --%>
				<div class="clearfix"></div>
			</div>
		</li>
		<%-- <%
			} //if끝
				cnt++;
			} //while 끝
		%> --%>
		
		<%-- <% String from=null; 
		if(list.get(0).getUser_id().equals(member.getUser_id())) {
			from = list.get(0).getFriend_id(); 
			}else from=list.get(0).getUser_id();%> --%>
		<input type="hidden" value="<%-- <%=member.getUser_id() %> --%>" id="msg_write_to"> <%-- 나 --%>
		<input type="hidden" value="<%-- <%=from%> --%>" id="msg_write_from"> <%-- 상대방 --%>

	</ul>
</div>

<div class="widget-foot">

	<form class="form-inline" onsubmit="return false;">
		<div id="msg_write_content2" class="form-group">
			<input id="msg_write_content" type="text" class="form-control" size="18"
				placeholder="메시지 입력..." required onKeyDown="return enterKey(event);">
		</div>
		<button type="button" class="btn btn-info" onclick="msg_write()">보내기</button>
	</form>
</div>