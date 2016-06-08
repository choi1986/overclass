<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 메인-메시지아이콘 클릭했을때 불러올 jsp --%>
	<!-- 메시지확장하면 뜨는 부분 -->
<%-- <% MemberDTO member = (MemberDTO)session.getAttribute("user");
List<MsgDTO> list = (List<MsgDTO>)request.getAttribute("msglist4");%> --%>
<div class="notify-arrow notify-arrow-blue"></div>
<li>
	<p class="blue">새로운 메시지 <%= request.getAttribute("msg_num") %>개</p>
</li>
<%-- <% for(int i=0;i<list.size();i++) { %> --%>
<li>
	<a href='javascript:msg_open("msgid<%-- <%=i%> --%>")'>
		<span class="photo">
			<img alt="avatar" width='30' height='30' src='<%-- <%=list.get(i).getId_img_path()%> --%>'></span> <!-- 프사 -->
		<span class="subject">
			<span id="msgid<%-- <%=i%> --%>" class="from"><%-- <%=list.get(i).getUser_id() %> --%></span> <!-- 이름 -->
			<span class="time"><%-- <%= list.get(i).getWrite_date() %> --%>전</span> <!-- 시간 -->
		</span>
		<span class="subject"><%-- <%=list.get(i).getContent() %> --%></span> <!-- 메시지 -->
	</a>
</li>
<%-- <% } %> --%>
<li><a href="#">모든메시지 보기</a></li>