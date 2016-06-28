<%@page import="kr.co.overclass.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<!-- 헤더 -->
<%@include file="../include/header.jsp"%>
<!-- 헤더끝 -->
<% UserVO user = (UserVO)session.getAttribute("login"); %>
<section id="my_page" class="wrapper">
	<div class="row">
		<div class="col-sm-12">
		
			<!-- 마이페이지메인 폼  -->
			<div class="profile-widget profile-widget-info">
				<div class="panel-body">
					<div class="col-sm-2 col-sm-2">
						<h4> </h4>
						<div class="row">
							<div class="follow-ava" id="image_div">
								<img class="img-responsive img-circle" id="user_image" src="${user.user_image }" style="width: 90px; height: 90px;">
							</div>
						</div>
						<div class="row"><h4><b>${user.user_id }</b></h4></div>
						<div class="row">
						<div id="image_update_div" style="display: none;">
							<div id="change-transitions">
								<button type="button" data-value="fadeIn" id="image_update" class="btn btn-success">변경</button>
								<button type="button" data-value="shake" id="image_cancel" class="btn btn-danger">취소</button>
							</div>
						</div>
						</div>
						<!-- 파일 -->
						<form role="form" id="user_image_update" class="form-horizontal" action="/overclass/main/imageUp"
							method="post" enctype="multipart/form-data">
							<input type="hidden" name="user_id" value="${user.user_id }"> 
						<div class="form-group">
						<div class="fileboxImage control-label col-sm-offset-2 col-sm-9">
							<div id="change-transitions">
								<label for="imagefile" class="btn btn-success col-sm-9"><span class="fa fa-camera-retro"></span> 프로필사진 변경 </label>
								<button type="button" id="image_default" class="btn btn-danger fileboxImageBtn" data-value="fadeIn"><span class="fa fa-close"></span></button>
								<input type="file" id="imagefile" name="imagefile" accept="image/gif, image/jpeg, image/png, image/bmp#">
							</div>
						</div>
					</div>
					</form>
					
					</div>
					<div class="col-sm-4 col-sm-4 follow-info" style="margin-top: -30px;">
						<div class="row">
							<h3><span class="fa fa-lg fa-github-alt">&nbsp;MyPage</span></h3>
						</div>
						<div class="row">
							<h4><i class="fa fa-user">&nbsp;${user.user_name }</i></h4>
						</div>
						<div class="row">
							<h4><i class="fa fa-birthday-cake">&nbsp;${fn:substring(user.user_birth,2,4)}월
							${fn:substring(user.user_birth,4,6)}일</i></h4>
						</div>
						<div class="row">
							<h4><i class="fa fa-envelope-o">&nbsp;${user.user_email }</i></h4>
						</div>
						<div class="row">
							<h4><i class="icon_pin_alt">&nbsp;${user.user_loc }</i></h4>
						</div>
					</div>
				</div>
			</div>
			<!-- 마이페이지폼메인 끝  -->
			
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<section class="panel">
			
				<!-- 마이페이지메뉴폼 -->
				<header class="panel-heading tab-bg-info">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" id="dropdown_1"
							href="#recent-activity"><span class="fa fa-comment-o">&nbsp;&nbsp;글</span>
						</a></li>
						<li><a id="dropdown_2" data-toggle="tab" href="#profile"><span
								class="fa fa-user">&nbsp;&nbsp;개인정보 수정</span> </a></li>
						<li class=""><a id="dropdown_3" data-toggle="tab"
							href="#edit-profile"> <span class="fa fa-users">&nbsp;&nbsp;친구목록</span>
						</a></li>
					</ul>
				</header>
				<!-- 마이페이지메뉴폼 끝 -->

				<div class="panel-body">
					<div class="tab-content">
						<div id="recent-activity" class="tab-pane active">
							<div class="profile-activity">
								<div class="col-lg-offset-3 col-lg-5 portlets">

									<!-- 글쓰기폼 시작 -->
									<%@include file="../include/mywrite.jsp"%>
									<!-- 글쓰기폼 끝 -->

								</div>
								<div class="col-lg-4">
									<div class="row">
										<div class="col-md-offset-7 col-md-2 portlets">
										</div>
									</div>
								</div>

								<!-- 게시글시작 -->
								<%@ include file="../include/myboard.jsp"%>
								<!-- 게시글폼 끝 -->

							</div>
						</div>

						<div id="profile" class="tab-pane">
							<section class="panel">

								<!-- 마이페이지 수정폼끝 -->
								<div class="panel-body bio-graph-info">
								<form id="modify" method="post" action="/overclass/main/modifyUser">
									<div class="col-sm-13">
										<h1>개인정보 수정</h1>
										<div class="row">
											<div class="bio-row">
												<div class="form-group">
                                      		<input type="hidden" id="modifyErrorCk" name="modifyErrorCk"><!-- 에러났는지 카운트했던 것을 체크해서 프로필 수정 막음 -->
													<label class="col-lg-3 control-label">아이디</label>
													<div class="col-lg-3">
														<input type="text" id="user_id" name="user_id" class="form-control" readonly
															value="${user.user_id }">
													</div>
												</div>
											</div>
											<div class="bio-row">
												<div class="form-group">
													<label class="col-lg-3 control-label">이름</label>
													<div class="col-lg-3">
														<input type="text" id="user_name" name="user_name" class="form-control" readonly
															value="${user.user_name }">
													</div>
												</div>
											</div>
											<div class="bio-row">
												<div class="form-group">
													<label class="col-lg-3 control-label">이메일</label>
													<div class="col-lg-3">
														<input type="text" id="user_email" name="user_email" class="form-control"
															value="${user.user_email }" onblur="regCk(5, this)">
													</div>
                                          			<div id="span5" class="modifySpan"></div>
												</div>
											</div>
											<div class="bio-row">
												<div class="form-group">
													<label class="col-lg-3 control-label">새 비밀번호</label>
													<div class="col-lg-3">
														<input type="password" id="user_pwd" name="user_pwd" class="form-control" onblur="regCk(2, this)">
													</div>
                                          			<div id="span2" class="modifySpan"></div>
												</div>
											</div>
											<div class="bio-row">
												<div class="form-group">
													<label class="col-lg-3 col-sm-3 control-label">전화번호</label>
													<div class="col-lg-2 col-sm-3">
														<input type="text" id="user_tel1" name="user_tel1" class="form-control" value="${fn:split(user.user_tel, '-')[0]}" onblur="regCk(6, this)">
													</div><!-- ${fn:substring(user.user_tel, 0, 3)} -->
													<div class="col-lg-2 col-sm-3">
														<input type="text" id="user_tel2" name="user_tel2" class="form-control" value="${fn:split(user.user_tel, '-')[1]}" onblur="regCk(7, this)">
													</div><!-- ${fn:substring(user.user_tel, 4, 8)} -->
													<div class="col-lg-2 col-sm-3">
														<input type="text" id="user_tel3" name="user_tel3" class="form-control" value="${fn:split(user.user_tel, '-')[2]}" onblur="regCk(8, this)">
													</div><!-- ${fn:substring(user.user_tel, 9, 13)} -->
                                          	<div id="span6" class="modifySpan"></div>
												</div>
											</div>
											<div class="bio-row">
												<div class="form-group">
													<label class="col-lg-3 control-label">새 비밀번호 다시입력</label>
													<div class="col-lg-3">
														<input type="password" id="user_pwd_confirm" name="user_pwd_confirm" class="form-control" onblur="regCk(3, this)">
													</div>
                                          		<div id="span3" class="modifySpan"></div>
												</div>
											</div>
											<div class="bio-row">
												<div class="form-group">
													<label class="col-lg-3 control-label">주소</label>
													<div class="col-lg-3">
														<select class="form-control" id="user_loc" name="user_loc" onchange="" onblur="regCk(9, this)">
															<option>-- 선택 --</option>
															<option>경기도</option>
															<option>서울특별시</option>
															<option>인천광역시</option>
															<option>대구광역시</option>
															<option>대전광역시</option>
															<option>광주광역시</option>
															<option>부산광역시</option>
															<option>경상북도</option>
															<option>경상남도</option>
															<option>전라북도</option>
															<option>전라남도</option>
															<option>강원도</option>
															<option>제주도</option>
														</select>
													</div>
                                                <div id="span7" class="modifySpan"></div>
												</div>
											</div>
											<div class="bio-row">
												<div class="form-group">
													<label class="col-lg-3 control-label">비밀번호찾기 질문</label>
													<div class="col-lg-3">
														<select class="form-control" id="user_pwdq" name="user_pwdq" onblur="regCk(12, this)">
															<option>-- 선택 --</option>
															<option>나의 고향은?</option>
															<option>나의 친한 친구 이름은?</option>
															<option>나의 별명은?</option>
															<option>나의 출신학교는?</option>
															<option>부모님의 성함은?</option>
															<option>보물제1호</option>
														</select>
													</div>
                                                <div id="span10" class="modifySpan"></div>
												</div>
											</div>
											<div class="bio-row">
												<div class="form-group">
													<label class="col-lg-3 control-label">생일</label>
													<div class="col-lg-3">
														<input type="text" class="form-control" id="user_birth" name="user_birth"
															value="${user.user_birth }" readonly>
													</div>
												</div>
											</div>
											<div class="bio-row">
												<div class="form-group">
													<label class="col-lg-3 control-label">비밀번호찾기 답변</label>
													<div class="col-lg-3">
														<input type="text" class="form-control" id="user_pwda" name="user_pwda" value="${user.user_pwda }" onblur="regCk(13, this)">
													</div>
                                          		<div id="span11" class="modifySpan"></div>
												</div>
											</div>
											<div class="bio-row">
												<div class="form-group">
													<label id="test" class="col-lg-3 control-label">첫번째 취미</label>
													<div class="col-lg-3">
														<select class="form-control" id="user_hobby1" name="user_hobby1" onblur="regCk(10, this)">
															<option>-- 선택 --</option>
															<option>스포츠</option>
                                                 		 	<option>독서</option>
                                                  			<option>음악</option>
                                                  			<option>쇼핑</option>
                                                  			<option>게임</option>
                                                  			<option>여행</option>
                                                  			<option>요리</option>
														</select>
													</div>
                                                <div id="span8" class="modifySpan"></div>
												</div>
											</div>
											<div class="bio-row">
												<div class="form-group">
													<label id="test" class="col-lg-3 control-label">두번째 취미</label>
													<div class="col-lg-3">
														<select class="form-control" id="user_hobby2" name="user_hobby2" onblur="regCk(11, this)">
															<option>-- 선택 --</option>
															<option>스포츠</option>
                                                 		 	<option>독서</option>
                                                  			<option>음악</option>
                                                  			<option>쇼핑</option>
                                                  			<option>게임</option>
                                                  			<option>여행</option>
                                                  			<option>요리</option>
														</select>
													</div>
                                                <div id="span9" class="modifySpan"></div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-12"></label>
												<div class="col-sm-offset-4 col-sm-3">
													<span data-toggle="modal" data-target="#update">
														<button type="button" id="member_update" class="btn btn-success btn-block">수정</button>
													</span>
												</div>
											</div>
										</div>
										<div class="col-sm-offset-12">
											<a href="#" id="member_leave" style="color: red;" class="fa fa-ban">
												회원탈퇴
											</a>
										</div>
									</div>
									</form>
								</div>
								<!-- 마이페이지 수정폼끝 -->

							</section>
							<section>
								<div class="row"></div>
							</section>
						</div>

						<div id="edit-profile" class="tab-pane">
							<section class="panel">
								<!-- 친구목록 -->
								<div class="panel-body bio-graph-info">
									<%-- <%
										for (int i = 0; i < friend_list.size(); i++) {
									%> --%>
									<div class="act-time">
										<div class="activity-body act-in">
												<table class="table table-striped table-advance table-hover">
													<tbody>
														<tr>
															<th> 프로필</th>
															<th> 아이디</th>
															<th> 이름</th>
															<th> 지역</th>
															<th><div class="col-sm-offset-8 col-sm-4"> 친구삭제</div></th>
														</tr>
														<c:forEach var="i" items="${friend_rel}" begin="0">
														<tr id="friendlist_${i.user_id }">
															<td onclick="friendFeed('${i.user_id }')"><img class="img-rounded" src="${i.user_image}" width='70px' height='70px'></td>
															<td onclick="friendFeed('${i.user_id }')">${i.user_id }</td>
															<td onclick="friendFeed('${i.user_id }')">${ i.user_name }</td>
															<td onclick="friendFeed('${i.user_id }')"><i class="icon_pin_alt" style="color: limegreen;"></i>${i.user_loc }</td>
															<td>
																<div class="col-sm-offset-8 col-sm-4">
																	<button type="button" id="friendDel" onclick="friendDel('${i.user_id }')" class="btn btn-danger">  
																		<span class="fa fa-close"></span> 
																	</button>
																</div>
															</td>
														</tr>
														</c:forEach>
													</tbody>
												</table>
										</div>
									</div>
									<%-- <%
										}
									%> --%>
								</div>
								<!-- 친구목록 끝 -->

							</section>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
		<c:if test="${friCk=='fail'}"> <!-- 친구 페이지 이동 친구 검사 모달 -->
			<script type="text/javascript">
				$(document).ready(function() {
					BootstrapDialog.show({
						title : '', //알러트 타이틀 이름
						message : '친구의 페이지만 접속할 수 있습니다!', //알러트 내용
						type : BootstrapDialog.TYPE_DANGER,
						buttons : [ {
							label : '닫기',
							action : function(cancel) {
								cancel.close();
							}
						} ]
					})
				})
			</script>
		</c:if>
	<c:choose>
		<c:when test="${sessionScope.result=='success'}"> <!-- 친구 신청 성공 모달 -->
			<script type="text/javascript">
				$(document).ready(function() {
					BootstrapDialog.show({
						title : '', //알러트 타이틀 이름
						message : '친구신청 성공!', //알러트 내용
						type : BootstrapDialog.TYPE_PRIMARY,
						buttons : [ {
							label : '닫기',
							action : function(cancel) {
								cancel.close();
							}
						} ]
					})
				})
			</script>
		</c:when>
		<c:when test="${sessionScope.result=='fail'}"> <!-- 친구 신청 실패 모달 -->
			<script type="text/javascript">
				$(document).ready(function() {
					BootstrapDialog.show({
						title : '', //알러트 타이틀 이름
						message : '친구신청 실패!', //알러트 내용
						type : BootstrapDialog.TYPE_DANGER,
						buttons : [ {
							label : '닫기',
							action : function(cancel) {
								cancel.close();
							}
						} ]
					})
				})
			</script>
		</c:when>
	</c:choose>
	<c:remove var="result" scope="session" /> <!-- 친구 신청 메시지에 쓰인 세션들 닫기 -->


	<!-- page end-->


	<!-- 글쓰기전체 폼시작 -->


</section>
<script src="/overclass/resources/js/lightbox.js"></script>

<!-- 쪽지 리스트처리를 위한 템플릿 -->
<script id="msgtemp" type="text/x-handlebars-template">
<li>
	<a href='/overclass/chat/?sender={{sender}}'>
		<span class="photo">
			<img alt="avatar" width='30' height='30' src='{{user_image}}'></span>
		<span class="subject">
			<span class="from">{{sender}}</span>
			<span class="time">{{writedate}}전</span>
		</span>
		<span class="subject">{{content}}</span>
	</a>
</li>
</script>
<script id="msgtempNR" type="text/x-handlebars-template">
<li style="background-color: #e6e6e6;">
	<a href='/overclass/chat/?sender={{sender}}'>
		<span class="photo">
			<img alt="avatar" width='30' height='30' src='{{user_image}}'></span>
		<span class="subject">
			<span class="from">{{sender}}</span>
			<span class="time">{{writedate}}전</span>
		</span>
		<span class="subject">{{content}}</span>
	</a>
</li>
</script>
<script id="msgtoptemp" type="text/x-handlebars-template">
<div class="notify-arrow notify-arrow-blue"></div>
						<li>
							<p class="blue">새로운 메시지 {{count}}개</p>
						</li>
</script>

<script>
var msg_source = $("#msgtemp").html();
var msg_template = Handlebars.compile(msg_source);
var msgtop_source = $("#msgtoptemp").html();
var msgtop_template = Handlebars.compile(msgtop_source);
var msg_source_NR = $("#msgtempNR").html();
var msg_templateNR = Handlebars.compile(msg_source_NR);

//***********************   소       켓      ****************************************
//소켓생성하기
var sender='<%=user.getUser_id()%>';

var ws = new WebSocket('ws://192.168.0.131/overclass/chatting');

//서버에서 메시지 날라올때
ws.onmessage = function (event) {
	var data = JSON.parse(event.data);
	var sitebarCount = document.getElementById('sitebarMsgCount');
		if(data.protocol == 130) {
			//msgtemp, msgtempNR
			var htmlTxt = msgtop_template(data);
			$("#sitebarMsgCount").text(data.count);
			for(var i=0; i<data.list.length; i++){
				if(data.list[i].read == 0){	// 안읽었으면
					htmlTxt+=msg_templateNR(data.list[i]);
				}else{	// 읽었으면
					htmlTxt+=msg_template(data.list[i]);
				}
			}// for
			$("#msg4").html(htmlTxt);
		}// if
}

//웹 소켓 서버 열릴 때
ws.onopen = function() {
	var connmsg = JSON.stringify({
		sender:sender,
		receiver:'allUser',
		protocol:100,
		content:'connected WS Server!'
	});
	ws.send(connmsg);
}

//웹 소켓 서버가 닫힐 때,
ws.onclose = function() {
	
}

//********************************************

lightbox.option({
    'disableScrolling' : true,
    'showImageNumberLabel' : false,
    'fadeDuration' : 700
})

// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(status, data, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data.places);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i], marker); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });
            
            daum.maps.event.addListener(marker, 'click', function() {
            	var markerPostion = marker.getPosition();
            	/* alert("좌표: "+markerPostion) */
	           	searchDetailAddrFromCoords(markerPostion, function(status, result) {
			        if (status === daum.maps.services.Status.OK) {
			            /* var detailAddr = !!result[0].roadAddress.name ? '<div>도로명주소 : ' + result[0].roadAddress.name + '</div>' : '';
			            
			            detailAddr += '<div>지번 주소 : ' + result[0].jibunAddress.name + '</div>';
			            
			            var content = '<div class="bAddr">' +
			                            '<span class="title">법정동 주소정보</span>' + 
			                            detailAddr + 
			                        '</div>'; */
			        	/* alert("도로명: "+result[0].roadAddress.name) */
			        	document.getElementById("loc_div").setAttribute("style","display:''")
			        	document.getElementById("map_div").setAttribute("style","display: none;")
			        	var addrName = result[0].roadAddress.name
			        	var locDiv = document.getElementById('loc');
			            var locInput = document.getElementById('mapLoc');
			            var mapXY = document.getElementById('mapXY');
			           	locInput.setAttribute("value",addrName+' ['+title+']')
			           	mapXY.setAttribute("value",markerPostion)
			            locDiv.innerHTML = '<span class="fa fa-map-marker" style="color: green"></span>'
			            +'<span> '+addrName+'</span>'
			            +'<span> <b>['+title+']</b></span><span style="color: black;"> 에서</span>';
			        }
       	    	})
            })

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
            
            itemEl.onclick = function() {
            	var markerPostion = marker.getPosition();
            	searchDetailAddrFromCoords(markerPostion, function(status, result) {
			        if (status === daum.maps.services.Status.OK) {
			            /* var detailAddr = !!result[0].roadAddress.name ? '<div>도로명주소 : ' + result[0].roadAddress.name + '</div>' : '';
			            
			            detailAddr += '<div>지번 주소 : ' + result[0].jibunAddress.name + '</div>';
			            
			            var content = '<div class="bAddr">' +
			                            '<span class="title">법정동 주소정보</span>' + 
			                            detailAddr + 
			                        '</div>'; */
			        	/* alert("도로명: "+result[0].roadAddress.name) */
			        	document.getElementById("loc_div").setAttribute("style","display:''")
			        	document.getElementById("map_div").setAttribute("style","display: none;")
			        	var addrName = result[0].roadAddress.name
			        	var locDiv = document.getElementById('loc');
			            var locInput = document.getElementById('mapLoc');
			            var mapXY = document.getElementById('mapXY');
			           	locInput.setAttribute("value",addrName+' ['+title+']')
			           	mapXY.setAttribute("value",markerPostion)
			            locDiv.innerHTML = '<span class="fa fa-map-marker" style="color: green"></span>'
			            +'<span> '+addrName+'</span>'
			            +'<span> <b>['+title+']</b></span><span style="color: black;"> 에서</span>';
			        }
       	    	})
			}
            
        })(marker, places[i].title);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.title + '</h5>';

    if (places.newAddress) {
        itemStr += '    <span>' + places.newAddress + '</span>' +
                    '   <span class="jibun gray">' +  places.address  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2detailaddr(coords, callback);
}
</script>

</body>
<script type="text/javascript">
var result = '${msg}';
	$(document).ready(function() {
		modifyError = {
				user_pwdCk : true,
				user_pwd_confirmCk : true,
				user_emailCk : false,
				user_tel1Ck : false,
				user_tel2Ck : false,
				user_tel3Ck : false,
				user_locCk : false,
				user_hobby1Ck : false,
				user_hobby2Ck : false,
				user_pwdqCk : false,
				user_pwdaCk : false
		};
		//프로필수정에서 지역 selected
		$("#user_loc").val("${user.user_loc }");
		
		//프로필수정에서 취미1 selected
		$("#user_hobby1").val("${user.user_hobby1}");
		
		//프로필수정에서 취미2 selected
		$("#user_hobby2").val("${user.user_hobby2}");
		
		//프로필수정에서 비밀번호질문 selected
		$("#user_pwdq").val("${user.user_pwdq}");
		
		//지도버튼 show hide
		$("#map_div").hide()
		$("#mapbtn").click(function() {
			$("#map_div").slideToggle(1000)
			/* alert($("#map_div").height()) */
		})
		
		//지도 닫기버튼
		$('#mapDel').click(function() {
	        $('#map_div').slideUp(1000)
		})
		
		//프로필사진 디폴트이미지로 바꾸기
		$("#image_default").click(function() {
			BootstrapDialog.show({
	    		title: '', //알러트 타이틀 이름
	    		message: '프로필사진을 기본이미지로 변경하시겠습니까?', //알러트 내용
	    		buttons: [{ //알러트 버튼 정의
	    			id: 'btn1', //알러트 버튼의 아이디
	    			icon: 'fa fa-check', //알러트버튼에 넣을 아이콘
	    			label: '확인', //알러트 버튼 이름
	    			cssClass: 'btn-primary', //알러트 버튼 색바꾸기
	    			hotkey:13,
	    			action: function(confirm) {
	    				var formObj = $("#user_image_update");
	    				formObj.attr("action","/overclass/main/imageDefault")
	    				formObj.submit();
	    				confirm.close()
					}
	    			},{
	    				label: '닫기',
	    				action: function(cancel){
	    					cancel.close();
	    					}
	    			}]
	    	})
		})
		
		//프로필사진바꾸기
		function userReadURL(input) {
			if (input.files && input.files[0]) {
				var file = input.files[0].name;
				var img_format = "\.(bmp|gif|jpg|jpeg|png)$"; 
				
			    if(!(new RegExp(img_format, "i")).test(file)){
			    	BootstrapDialog.show({
			    		title: '', //알러트 타이틀 이름
			    		message: '이미지 파일만 첨부 가능합니다..', //알러트 내용
			    		type: BootstrapDialog.TYPE_DANGER,
			    		buttons: [{ //알러트 버튼 정의
			    				icon: 'fa fa-check',
			    				label: '확인',
			    				cssClass: 'btn-danger',
			    				action: function(cancel){
			    					cancel.close();
			   					}
			    			}]
			    	})
				    /* $('#photo_div').slideUp(1000) */
			        $('#imagefile').val('');
			    	return;
			    }
			    
				var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성d
				reader.onload = function(e) {
					//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
					$('#user_image').attr('src', e.target.result);
					/* $('#photo_div').slideDown(1000) */
					$('#image_update_div').slideDown(1000); 
					//이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
					//(아래 코드에서 읽어들인 dataURL형식)
				}
					reader.readAsDataURL(input.files[0]);
				//File내용을 읽어 dataURL형식의 문자열로 저장
			}
		}//readURL()

		//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
		$("#imagefile").change(function() {
			//alert(this.value); //선택한 이미지 경로 표시
			if(this.value != "") {
				userReadURL(this);
			} else {
				var cancel = $('#cancel_image').attr("src")
				$('#user_image').attr('src', cancel)
			}
		});
		
		$("#image_update").click(function() {
			var formObj = $("#user_image_update");			
			formObj.submit();
		})
		
		$("#image_cancel").click(function() {
			$('#image_update_div').slideUp(1000)
			$('#imagefile').val('');
			var cancel = $('#cancel_image').attr("src")
			$('#user_image').attr('src', cancel)
			/* location.href = "/overclass/main/myFeed" */
		})
		
		//사진미리보기
		function readURL(input) {
			if (input.files && input.files[0]) {
				var file = input.files[0].name;
				var img_format = "\.(bmp|gif|jpg|jpeg|png)$"; 
				
			    if(!(new RegExp(img_format, "i")).test(file)){
			    	BootstrapDialog.show({
			    		title: '', //알러트 타이틀 이름
			    		message: '이미지 파일만 첨부 가능합니다..', //알러트 내용
			    		type: BootstrapDialog.TYPE_DANGER,
			    		buttons: [{ //알러트 버튼 정의
			    				icon: 'fa fa-check',
			    				label: '확인',
			    				cssClass: 'btn-danger',
			    				action: function(cancel){
			    					cancel.close();
			   					}
			    			}]
			    	})
				    $('#photo_div').slideUp(1000)
			        $('#file').val('');
			    	return;
			    }
			    
				var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성d
				reader.onload = function(e) {
					//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
					$('#photo').attr('src', e.target.result);
					$('#photoview').attr('href', e.target.result);
					$('#photo_div').slideDown(1000)
					$('#photo_div a').attr("class","")
					//이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
					//(아래 코드에서 읽어들인 dataURL형식)
				}
					reader.readAsDataURL(input.files[0]);
				//File내용을 읽어 dataURL형식의 문자열로 저장
			}
		}//readURL()

		//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
		$("#file").change(function() {
			//alert(this.value); //선택한 이미지 경로 표시
			if(this.value != "") {
				readURL(this);
			} else {
				$('#photo_div').slideUp(1000)
			}
		});
		
		//사진 삭제버튼
		$('#photoDel').click(function() {
	        $('#photo_div').slideUp(1000)
	        $('#file').val(""); //전달한 양식 초기화
		})
		
		
		 //   댓글div 열닫
		   $(".wminimize").click(function() {
		      
		      // dno
		      var divNum = this.firstChild.nextSibling.firstChild.nodeValue;
		      var divtemp = '#reply_div'+divNum;
		      var divtemp2 = '#reply_icon'+divNum+'_2'
		      var divtemp3 = '#reply_div_page_'+divNum
		      
		      //var div = $("#reply_div")
		      var div = $(divtemp);
		      var div2 = $(divtemp2);
		      var div3 = $(divtemp3);
		      div.slideToggle("slow")
		      // 열고
		      if(div2.attr("class") == "fa fa-chevron-up"){
		         div2.attr("class","fa fa-chevron-down")
		         replyDisplayPage(divNum,1);
		      } else {
		         //닫고
		         div2.attr("class","fa fa-chevron-up")
				div3.attr("style","display: none;")
		      }
		   })
		   $(".goodclass").click(function() {
	      
	      // 이게 dno
	      var goodtemp = this.firstChild.nextSibling.firstChild.nodeValue;
	      //var goodtemp = this.firstChild.nextSibling.nextSibling.nextSibling;
	      var goodtmp = '#good_icon'+goodtemp;
	      var goodcount = '#good_count'+goodtemp;
	      
	      //var div = $("#reply_div")
	      var goodspan = $(goodtmp);
	      if(goodspan.attr("class") == "fa fa-lg fa-thumbs-o-up"){
	    	// 여기가 좋아요
	         $.ajax({
	        	 url:'/overclass/good/',
	        	 type:'post',
				headers:{
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"POST"
				},
				data:JSON.stringify({
					good_user:'<%=user.getUser_id()%>',
					dno:goodtemp
				}),
				success:function(result){
					//$(goodcount).val(result);
					$(goodcount).html('&nbsp'+result);
			        goodspan.attr("class","fa fa-lg fa-thumbs-up");
				}
	         });
	      } else {
	         // 여기가 좋아요 취소
	         $.ajax({
	        	 url:'/overclass/good/delete',
	        	 type:'post',
				headers:{
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"POST"
				},
				data:JSON.stringify({
					good_user:'<%=user.getUser_id()%>',
					dno:goodtemp
				}),
				success:function(result){
					$(goodcount).html('&nbsp'+result);
					goodspan.attr("class","fa fa-lg fa-thumbs-o-up");
				}
	         });
	      }
		   })
		   
		//글등록 모달정의
		$("#docWriteSubmitBt").click(function() {
			if($("#content").val().trim() == "") {
				BootstrapDialog.show({
		    		title: '', //알러트 타이틀 이름
		    		message: '글을 입력해주세요', //알러트 내용
		    		buttons: [{ //알러트 버튼 정의
		    			icon: 'fa fa-check', //알러트버튼에 넣을 아이콘
		    			label: '확인', //알러트 버튼 이름
		    			cssClass: 'btn-primary', //알러트 버튼 색바꾸기
		    			hotkey:13,
		    			action: function(confirm) {
		    				confirm.close()
						}
	    			}]
		    	})
			} else {
				BootstrapDialog.show({
		    		title: '', //알러트 타이틀 이름
		    		message: '글을 등록 하시겠습니까?', //알러트 내용
		    		buttons: [{ //알러트 버튼 정의
		    			id: 'docWriteBt', //알러트 버튼의 아이디
		    			icon: 'fa fa-check', //알러트버튼에 넣을 아이콘
		    			label: '버튼', //알러트 버튼 이름
		    			cssClass: 'btn-primary', //알러트 버튼 색바꾸기
		    			hotkey:13,
		    			action: function(confirm) {
		    				var formObj = $("#writeDoc");
		    				formObj.attr({action:'/overclass/main/mywriteDoc',method:'post',onsubmit:''});
		    				formObj.submit();
		    				confirm.close()
						}
		    			},{
		    				label: '닫기',
		    				action: function(cancel){
		    					cancel.close();
		    					}
		    			}]
		    	})
			}
		})
		
	    //프로필사진 변경 성공시
		if (result == 'Update_SUCCESS') {
			BootstrapDialog.show({
	    		title: '', //알러트 타이틀 이름
	    		message: '프로필이 수정 되었습니다.', //알러트 내용
	    		type: BootstrapDialog.TYPE_DANGER,
	    		buttons: [{ //알러트 버튼 정의
	    				icon: 'fa fa-check',
	    				label: '확인',
	    				cssClass: 'btn-danger',
	    				hotkey:13,
	    				action: function(cancel){
	    					cancel.close();
	   					}
	    			}]
	    	})
		}
		
		//신고모달정의
		$("#content_repot").click(function() {
			BootstrapDialog.show({
	    		title: '', //알러트 타이틀 이름
	    		message: '이 글을 신고 하시겠습니까?', //알러트 내용
	    		type: BootstrapDialog.TYPE_DANGER,
	    		buttons: [{ //알러트 버튼 정의
	    			id: 'btn1', //알러트 버튼의 아이디
	    			icon: 'fa fa-check', //알러트버튼에 넣을 아이콘
	    			label: '신고', //알러트 버튼 이름
	    			cssClass: 'btn-danger', //알러트 버튼 색바꾸기
	    			hotkey:13,
	    			action: function(confirm) {
	    				confirm.close()
					}
	    			},{
	    				label: '닫기',
	    				action: function(cancel){
	    					cancel.close();
	    					}
	    			}]
	    	})
		})
		
		//회원탈퇴 모달정의
		$("#member_leave").click(function() {
			BootstrapDialog.show({
				title: '',
	            message: '비밀번호 입력: <input id="pwd" type="password" class="form-control">',
	            size:BootstrapDialog.SIZE_SMALL,
	            type: BootstrapDialog.TYPE_DANGER,
	            buttons: [{
	                icon: 'fa fa-check',
	                label: '확인',
	                hotkey: 13,
	                cssClass: 'btn-danger',
	                action: function(dialogRef){
	                    var pwd = dialogRef.getModalBody().find('#pwd').val();
		                if($.trim(pwd.toLowerCase()) !== '${user.user_pwd }') {
		                	BootstrapDialog.show({
		                		title: '',
		                		message: '비밀번호 틀림',
		                		type: BootstrapDialog.TYPE_primary,
		                		buttons: [{
		                			label:'닫기',
		                			hotkey:13,
		                			cssClass:'btn-primary',
		                			action: function(alert) {
										alert.close()
									}
		                		}]
		                	})
		                    $("#pwd").focus()
		                } else {
		                	BootstrapDialog.show({
		                		title: '',
		                		message: '회원탈퇴가 완료되었습니다',
		                		type: BootstrapDialog.TYPE_primary,
		                		buttons: [{
		                			label:'닫기',
		                			hotkey:13,
		                			cssClass:'btn-primary',
		                			action: function(alert) {
										alert.close();
										location.href("/overclass/main/leave?user_id=${user.user_id }");
									}
		                		}]
		                	})
	                  		dialogRef.close();
		                }
	                }
	            }, {
	                label: '닫기',
	                action: function(dialogRef){
	                	dialogRef.close();
	                }
	            }]
	        });	
		})
		
		//프로필수정 모달정의
		$("#member_update").click(function() {
			modifyErrorCk=modifyError.user_pwdCk||modifyError.user_pwd_confirmCk||
			modifyError.user_emailCk||modifyError.user_tel1Ck||modifyError.user_tel2Ck||modifyError.user_tel3Ck||
			modifyError.user_locCk||modifyError.user_hobby1Ck||modifyError.user_hobby2Ck||modifyError.user_pwdqCk||
			modifyError.user_pwdaCk;
			$("#modifyErrorCk").val(modifyErrorCk); // 에러 항목들 체크해서 에러가 하나라도 있는지 검사
			
			if($("#modifyErrorCk").val()=="true") { // 에러가 있으면 리턴
				BootstrapDialog.show({
		    		title: '', //알러트 타이틀 이름
		    		message: '부적합한 프로필 수정 항목을 다시 확인해주세요.', //알러트 내용
		    		type: BootstrapDialog.TYPE_DANGER,
		    		buttons: [{
		    				label: '닫기',
		    				action: function(cancel){
		    					cancel.close();
		    					}
		    			}]
		    	})
		    	return;
			}
			BootstrapDialog.show({
				title: '',
	            message: '비밀번호 입력: <input id="pwd" type="password" class="form-control">',
	            size:BootstrapDialog.SIZE_SMALL,
	            type: BootstrapDialog.TYPE_SUCCESS,
	            buttons: [{
	                icon: 'fa fa-check',
	                label: '확인',
	                hotkey: 13,
	                cssClass: 'btn-success',
	                action: function(dialogRef){
	                    var pwd = dialogRef.getModalBody().find('#pwd').val();
		                if($.trim(pwd.toLowerCase()) !== '${user.user_pwd }') {
		                	BootstrapDialog.show({
		                		title: '',
		                		message: '비밀번호 틀림',
		                		type: BootstrapDialog.TYPE_primary,
		                		buttons: [{
		                			label:'닫기',
		                			hotkey:13,
		                			cssClass:'btn-primary',
		                			action: function(alert) {
										alert.close()
									}
		                		}]
		                	})
		                    $("#pwd").focus()
		                } else {
		                	BootstrapDialog.show({
		                		title: '',
		                		message: '프로필이 수정되었습니다',
		                		type: BootstrapDialog.TYPE_primary,
		                		buttons: [{
		                			label:'닫기',
		                			hotkey:13,
		                			cssClass:'btn-primary',
		                			action: function(alert) {
		                				var formObj = $("#modify")
		                				formObj.submit();
										alert.close()
									}
		                		}]
		                	})
	                  		dialogRef.close();
		                }
	                }
	            }, {
	                label: '닫기',
	                action: function(dialogRef){
	                	dialogRef.close();
	                }
	            }]
	        });	
		})
		
		//글쓰기 폼 클릭시
		$("#content_body").hide()
		$("#content_form").click(function() {
			$("#content_body").slideToggle(1000); //글쓰기아이콘 누르면 슬라이드 효과
			if ($("#content_icon").attr("class") == "fa fa-chevron-up") { //글쓰기아이콘 바꾸기
				$("#content_icon").attr("class","fa fa-chevron-down")
			} else {
				$("#content_icon").attr("class","fa fa-chevron-up")
			}
		})
		//페이징버튼 앞으로  클릭시
		$("#page_front").click(function() {
			alert(Number($("#page_1").val()) + 1)
		})

		//페이징버튼 뒤로  클릭시
		$("#page_back").click(function() {
			if ($("#page_1").val() != 1) {
				$("#page_1").val() - 1
			}
		})

		$("#alert_notificatoin_bar").click(function() { // 알림바 알림 클릭 이벤트
			friendlist('<%=user.getUser_id()%>');
		})
	}) // ready

	function msg_open(msgidnum) {
		var msg = document.getElementById(msgidnum);
		$.ajax({
			url : "addfunctionaction.do?action=msg_open",
			data : {
				user_id : msg.firstChild.nodeValue
			},
			success : function(success) {
				$("#msg_body").html(success);
				document.getElementById('msg_scroll').scrollTop = document
						.getElementById('msg_scroll').scrollHeight;
			},
			error : function(xhr) {
				alert("에러:" + xhr.status)
			}
		})//ajax()
	}

	function msg_write() {
		var msg_content = document.getElementById('msg_write_content').value;
		var msg_to_user = document.getElementById('msg_write_to').value;
		var msg_from_user = document.getElementById('msg_write_from').value;
		$.ajax({
			url : "addfunctionaction.do?action=msg_write",
			data : {
				msg_to : msg_to_user,
				msg_from : msg_from_user,
				content : msg_content
			},
			success : function(result) {
				$("#msg_body").html(result);
				document.getElementById('msg_scroll').scrollTop = document
						.getElementById('msg_scroll').scrollHeight;
			}
		})
	}

	function enterKey(e) {
		if (e.keyCode == 13) { /* IE기준으로 설명 */
			msg_write();
			return false;
		} else
			return true;
	}

	function msg_open(msgidnum) {
		var msg = document.getElementById(msgidnum);
		$.ajax({
			url : "addfunctionaction.do?action=msg_open",
			data : {
				user_id : msg.firstChild.nodeValue
			},
			success : function(success) {
				$("#msg_body").html(success);
				document.getElementById('msg_scroll').scrollTop = document
						.getElementById('msg_scroll').scrollHeight;
			},
			error : function(xhr) {
				alert("에러:" + xhr.status)
			}
		})//ajax()
	}

	function msg_write() {
		var msg_content = document.getElementById('msg_write_content').value;
		var msg_to_user = document.getElementById('msg_write_to').value;
		var msg_from_user = document.getElementById('msg_write_from').value;
		$.ajax({
			url : "addfunctionaction.do?action=msg_write",
			data : {
				msg_to : msg_to_user,
				msg_from : msg_from_user,
				content : msg_content
			},
			success : function(result) {
				$("#msg_body").html(result);
				document.getElementById('msg_scroll').scrollTop = document
						.getElementById('msg_scroll').scrollHeight;
			}
		})
	}

	function enterKey(e) {
		if (e.keyCode == 13) { /* IE기준으로 설명 */
			msg_write();
			return false;
		} else
			return true;
	}

	function search(event) {
		if (event.keyCode == 13) {
			$.ajax({
				url : "addfunctionaction.do?action=search",
				data : {
					s_keyword : $("#search_form").val()
				},
				success : function(result) {
					$("#my_page").html(result);
				},
				error : function(xhr) {
					alert('에러' + xhr.status)
				}
			})
			return false;
		}
	}

	function friend_request(friend_id) {
		$.ajax({
			url : 'addfunctionaction.do?action=friend_req_insert&friend_id='
					+ friend_id,
			success : function(result) {
				alert('친구요청이 완료되었습니다.')
			},
			error : function(xhr) {
				alert('친구요청이 완료되었습니다.')
			}
		})

	}
	function regCk(num, data) { // 프로필 수정 유효성 검사
		var msg="";
		$(".modifySpan").css("color","red");
		$(".modifySpan").css("font-size","11px");
		
		switch (num) {
		case 2: // 비밀번호
			if(data.value.length<3) { msg='비밀번호를 3자리 이상 입력해주세요.'; modifyError.user_pwdCk=true; }
			else modifyError.user_pwdCk=false;
			$("#span2").text(msg);
			break;
		case 3: // 비밀번호 확인
			if(data.value!=$("#user_pwd").val()) { msg='확인 비밀번호가 같지 않습니다!'; modifyError.user_pwd_confirmCk=true; }
			else modifyError.user_pwd_confirmCk=false;
			$("#span3").text(msg);
			break;
		case 5: // 이메일
			if(!data.value.match(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,6}$/i)) { msg='메일을 다시 확인해주세요.'; modifyError.user_emailCk=true; }
			else modifyError.user_emailCk=false;
			$("#span5").text(msg);
			break;
		case 6: // 전화번호_1
			if(data.value.length<2||data.value.length>4||isNaN(data.value)) { msg='전화번호를 다시 확인 해주세요.'; modifyError.user_tel1Ck=true; }
			else modifyError.user_tel1Ck=false;
			$("#span6").text(msg);
			break;
		case 7: // 전화번호_2
			if(data.value.length<3||data.value.length>5||isNaN(data.value)) { msg='전화번호를 다시 확인 해주세요.'; modifyError.user_tel2Ck=true; }
			else modifyError.user_tel2Ck=false;
			$("#span6").text(msg);
			break;
		case 8: // 전화번호_3
			if(data.value.length<2||data.value.length>4||isNaN(data.value)) { msg='전화번호를 다시 확인 해주세요.'; modifyError.user_tel3Ck=true; }
			else modifyError.user_tel3Ck=false;
			$("#span6").text(msg);
			break;
		case 9: // 주소
			if(data.value=="-- 선택 --") { msg='주소를 입력해주세요.'; modifyError.user_locCk; }
			else modifyError.user_locCk=false;
			$("#span7").text(msg);
			break;
		case 10: // 취미1
			if(data.value=="-- 선택 --") { msg='취미를 선택해주세요.'; modifyError.user_hobby1Ck=true; }
			else modifyError.user_hobby1Ck=false;
			$("#span8").text(msg);
			break;
		case 11: // 취미2
			if(data.value=="-- 선택 --") { msg='취미를 선택해주세요.'; modifyError.user_hobby2Ck=true; }
			else if(data.value==$("#user_hobby1").val()) { msg='첫번째 취미와 다르게 선택해주세요!'; modifyError.user_hobby2Ck=true; }
			else modifyError.user_hobby2Ck=false;
			$("#span9").text(msg);
			break;
		case 12: // 비밀번호 찾기 질문
			if(data.value=="-- 선택 --") { msg='질문을 입력해주세요.'; modifyError.user_pwdqCk=true; }
			else modifyError.user_pwdqCk=false;
			$("#span10").text(msg);
			break;
		case 13: // 비밀번호 찾기 답변
			if(data.value.length<1) { msg='답변을 입력해주세요.'; modifyError.user_pwdaCk=true; }
			else modifyError.user_pwdaCk=false;
			$("#span11").text(msg);
			break;

		default:
			break;
		}
	}
	//스크롤업
	function enterKey(e) {
		if (e.keyCode == 13) { /* IE기준으로 설명 */
			msg_write();
			return false;
		} else
			return true;
	}

	$(function () {
	    $.scrollUp({
	        animation: 'fade',
	        scrollImg: {
	            active: true,
	            type: 'background',
	            src: 'img/top.png'
	        }
	    });
	});
	$('#scrollUpTheme').attr('href', '/overclass/resources/css/image.css?1.1');
	$('.image-switch').addClass('active');
	
	function friendFeed(user) {
		location.href = "/overclass/main/friendFeed?user_id="+user;
	}
	function friendDel(user) {
		BootstrapDialog.show({
    		title: '', //알러트 타이틀 이름
    		message: '['+user+'] 친구를 삭제 하시겠습니까?', //알러트 내용
    		type: BootstrapDialog.TYPE_DANGER,
    		buttons: [{ //알러트 버튼 정의
    			id: 'btn1', //알러트 버튼의 아이디
    			icon: 'fa fa-check', //알러트버튼에 넣을 아이콘
    			label: '삭제', //알러트 버튼 이름
    			cssClass: 'btn-danger', //알러트 버튼 색바꾸기
    			hotkey:13,
    			action: function(confirm) {
    				var hidefriend = '#friendlist_'+user;
    				$.ajax({
						url:'/overclass/friend/delrel',
						type:'post',
						headers:{
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"POST"
						},
						data:JSON.stringify({
							sender:'<%=user3.getUser_id()%>',
							receiver:user
						}),
						success:function(result){
							if(result == 'SUCCESS') {
								BootstrapDialog.show({
									title: '', //알러트 타이틀 이름
									message: '친구를 삭제 했습니다.', //알러트 내용
									buttons: [{ //알러트 버튼 정의
										icon: 'fa fa-check', //알러트버튼에 넣을 아이콘
										label: '확인', //알러트 버튼 이름
										cssClass: 'btn-primary', //알러트 버튼 색바꾸기
										action: function(confirm) {
											$(hidefriend).hide();
											confirm.close();
										}
										}]
								})// BootstrapDialog
							}						
						}
					}); // ajax
    				confirm.close()
				}
    			},{
    				label: '닫기',
    				action: function(cancel){
    					cancel.close();
    					}
    			}]
    	})
	}
</script>
</html>