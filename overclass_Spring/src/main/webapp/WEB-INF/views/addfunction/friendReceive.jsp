<%@page import="kr.co.overclass.domain.FriendVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<FriendVO> list = (List<FriendVO>) request.getAttribute("friend_req_result");
%>
<%-- 상단바 친구요청 알림생성하는 페이지 --%>
<a data-toggle="dropdown" class="dropdown-toggle" href="#"> <i
	class="icon-bell-l"></i> <span class="badge bg-important"><%=list.size() %></span>
</a>
<ul id="notice" class="dropdown-menu extended notification">
<div class="notify-arrow notify-arrow-blue"></div>
<li>
	<p class="blue">
		새알림 <%=list.size()%>개
	</p>
</li>
<%
	if (list != null) {
		for (int i = 0; i < list.size(); i++) {
%>
<li><a
	href="javascript:friend_process('<%=list.get(i).getReceiver()%>')">
		<span class="label label-primary"> <i class="icon_profile"></i></span>
		<%=list.get(i).getSender()%> 님이 친구 요청
</a></li>
<%--<li><a href="#"> <span class="label label-warning"><i
			class="icon_pin"></i></span> 땡땡 <span class="small italic pull-right">50분
			전</span>
</a></li>
<li><a href="#"> <span class="label label-danger"><i
			class="icon_book_alt"></i></span> 이순신님이 새글등록 <span
		class="small italic pull-right">1시간 전</span>
</a></li>
<li><a href="#"> <span class="label label-success"><i
			class="icon_like"></i></span> 김주원님 생일 <span class="small italic pull-right">
			오늘</span>
</a></li>
<li><a href="#">모든 알림 보기</a></li>--%>
<%
	}
}
%>
</ul>