<%@page import="kr.co.overclass.domain.DocumentVO"%>
<%@page import="kr.co.overclass.domain.UserVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
검색페이지
<br>

<script
	src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#bt").click(function() {
			var txtvar = $('#txt').val();
			if(txtvar.substring(0,1)=='#'){
			var txt = txtvar.substring(1,txtvar.length);
			$.ajax({
				type:'GET',
				url:'/overclass/searchTag?tag='+txt,
						success:function(data){
							$('div').html(data);
						}
			});
			}else{
				$.ajax({
				type:'GET',
				url:'/overclass/searchIdName?info='+txtvar,
						success:function(data){
							$('div').html(data);
						}
				});
			}
		});
	});
</script>

<input type="text" id="txt">
<input type="button" id="bt" value="검색">
<br>
<a href="main" id="toMain">[ 메인페이지로 ]</a><br>
<div></div>

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

