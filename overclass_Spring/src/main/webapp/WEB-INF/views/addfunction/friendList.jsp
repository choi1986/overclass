<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.overclass.domain.FriendVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구 목록 페이지</title>
<%
FriendVO friend;
	String result = (String)session.getAttribute("result");
	//result키값으로 저장된 문자열
	FriendVO friend_bean = (FriendVO)session.getAttribute("result_bean");
	//result_bean키로 저장된 friendDTO
	List<FriendVO> friend_list = (ArrayList<FriendVO>)session.getAttribute("result_list");
	//result_list키로 저장된 friendDTO 리스트
	if(result!=null){
		//친구 삭제 성공 메시지 출력
	}else if(friend_bean!=null){
		//친구 1명 정보 페이지에 출력
	}else if(friend_list!=null){
		//친구 목록 페이지에 출력
		for(int i=0;i<friend_list.size();i++){
			friend = new FriendVO();
			friend = friend_list.get(i);
			String friend_id = friend.getReceiver();//리스트 목록에서 뽑아낸 친구 아이디
			//나중에 친구 아이디로 친구 정보 검색? 필요??
		}
	}
		
%>
</head>
<body>

</body>
</html>