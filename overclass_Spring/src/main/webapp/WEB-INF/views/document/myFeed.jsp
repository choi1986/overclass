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
		<div class="col-lg-12">
		
			<!-- 마이페이지메인 폼  -->
			<div class="profile-widget profile-widget-info">
				<div class="panel-body">
					<div class="col-lg-2 col-lg-2">
						<h4>${user.user_name }</h4>
						<div class="follow-ava">
							<img src="${user.user_image }" width='70' height='70'>
						</div>
						<h4>${user.user_id }</h4>
					</div>
					<div class="col-lg-4 col-lg-4 follow-info">
						<p>
							<i class="fa fa-lg fa-github-alt">&nbsp;MyPage</i>
						</p>
						<i class="fa fa-twitter"><span>&nbsp;</span>${fn:substring(user.user_birth,2,4)}월
							${fn:substring(user.user_birth,4,6)}일</i><br> <i
							class="fa fa-envelope-o"><span>&nbsp;</span>${user.user_email }</i><br>
						<i class="icon_pin_alt"><i>${user.user_loc }</i></i>
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
								class="fa fa-user">&nbsp;&nbsp;프로필수정</span> </a></li>
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

											<!-- 메세지폼 -->
											<%@ include file="../include/message.jsp"%>
											<!-- 메세지폼 끝 -->

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
									<div class="col-lg-10">
										<h1>프로필 수정</h1>
										<div class="row">
											<div class="bio-row">
												<div class="form-group">
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
													<div class="col-lg-4">
														<input type="text" id="user_email" name="user_email" class="form-control"
															value="${user.user_email }">
													</div>
                                          			<span id="span5" class="modifySpan"></span>
												</div>
											</div>
											<div class="bio-row">
												<div class="form-group">
													<label class="col-lg-3 control-label">새 비밀번호</label>
													<div class="col-lg-3">
														<input type="password" id="user_pwd" name="user_pwd" class="form-control">
													</div>
                                          			<span id="span2" class="modifySpan"></span>
												</div>
											</div>
											<div class="bio-row">
												<div class="form-group">
													<label class="col-lg-3 control-label">전화번호</label>
													<div class="col-lg-2">
														<input type="text" id="user_tel1" name="user_tel1" class="form-control" value="${fn:substring(user.user_tel, 0, 3)}">
													</div>
													<div class="col-lg-2">
														<input type="text" id="user_tel2" name="user_tel2" class="form-control" value="${fn:substring(user.user_tel, 4, 8)}">
														
													</div>
													<div class="col-lg-2">
														<input type="text" id="user_tel3" name="user_tel3" class="form-control" value="${fn:substring(user.user_tel, 9, 13)}">
														
													</div>
												</div>
                                          	<span id="span6" class="modifySpan"></span>
											</div>
											<div class="bio-row">
												<div class="form-group">
													<label class="col-lg-3 control-label">새 비밀번호 다시입력</label>
													<div class="col-lg-3">
														<input type="password" id="user_pwd_confirm" name="user_pwd_confirm" class="form-control">
													</div>
                                          		<span id="span3" class="modifySpan"></span>
												</div>
											</div>
											<div class="bio-row">
												<div class="form-group">
													<label class="col-lg-3 control-label">주소</label>
													<div class="col-lg-3">
														<select class="form-control" id="user_loc" name="user_loc" onchange="" >
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
                                                <span id="span7" class="modifySpan"></span>
												</div>
											</div>
											<div class="bio-row">
												<div class="form-group">
													<label class="col-lg-3 control-label">비밀번호찾기 질문</label>
													<div class="col-lg-3">
														<select class="form-control" id="user_pwdq" name="user_pwdq">
															<option>-- 선택 --</option>
															<option>나의 고향은?</option>
															<option>나의 친한 친구 이름은?</option>
															<option>나의 별명은?</option>
															<option>나의 출신학교는?</option>
															<option>부모님의 성함은?</option>
															<option>보물제1호</option>
														</select>
													</div>
                                                <span id="span10" class="modifySpan"></span>
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
														<input type="text" class="form-control" id="user_pwda" name="user_pwda" value="${user.user_pwda }">
													</div>
                                          		<span id="span11" class="modifySpan"></span>
												</div>
											</div>
											<div class="bio-row">
												<div class="form-group">
													<label id="test" class="col-lg-3 control-label">첫번째 취미</label>
													<div class="col-lg-3">
														<select class="form-control" id="user_hobby1" name="user_hobby1">
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
                                                <span id="span8" class="modifySpan"></span>
												</div>
											</div>
											<div class="bio-row">
												<div class="form-group">
													<label id="test" class="col-lg-3 control-label">두번째 취미</label>
													<div class="col-lg-3">
														<select class="form-control" id="user_hobby2" name="user_hobby2">
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
                                                <span id="span9" class="modifySpan"></span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-12"></label>
												<div class="col-lg-offset-3 col-lg-3">
													<span data-toggle="modal" data-target="#update">
														<button type="button" id="member_update" class="btn btn-success btn-block">수정</button>
													</span>
												</div>
											</div>
										</div>
										<div class="col-lg-offset-12">
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
											<span class="arrow"></span>
											<div class="text">
												<a href="friendfeed.do?action=friendfeed&friend=<%-- <%=friend_list.get(i).getUser_id()%> --%>"
													class="activity-img"><img class="avatar"
													src="<%-- <%=friend_list.get(i).getId_img_path()%> --%>" alt="">
												</a>
												<p class="attribution">
													<a
														href="friendfeed.do?action=friendfeed&friend=<%-- <%=friend_list.get(i).getUser_id()%> --%>"
														style="color: blue;"><%-- <%=friend_list.get(i).getName()%> --%></a>
												<p>
													<i class="icon_pin_alt" style="color: green"></i><i><%-- <%=friend_list.get(i).getLoc()%> --%></i>
												</p>
											</div>
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


	<!-- page end-->


	<!-- 글쓰기전체 폼시작 -->


</section>
<script src="/overclass/resources/js/lightbox.js"></script>
</body>
<script type="text/javascript">
	/* 	document.onkeydown = cancelkey;


	 function cancelkey() {
	
	 if (event.keyCode == "116") { 
	 event.returnValue = false;
	 event.keyCode = 0;
	 alert("ㅗ");
	 } else if (event.keyCode == "8") { 
	 event.returnValue = false;
	 event.keyCode = 0;
	 alert("ㅗ");
	 }
	 } */
	$(document).ready(function() {
		//프로필수정에서 지역 selected
		$("#user_loc").val("${user.user_loc }");
		
		//프로필수정에서 취미1 selected
		$("#user_hobby1").val("${user.user_hobby1}");
		
		//프로필수정에서 취미2 selected
		$("#user_hobby2").val("${user.user_hobby2}");
		
		//프로필수정에서 비밀번호질문 selected
		$("#user_pwdq").val("${user.user_pwdq}");
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
				    $('#photo_div').hide();
			        $('#file').val('');
			    	return;
			    }
			    
				var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성d
				reader.onload = function(e) {
					//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
					$('#photo').attr('src', e.target.result);
					$('#photo_div').show()
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
				$('#photo_div').hide()
			}
		});
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
		                if($.trim(pwd.toLowerCase()) !== 'banana') {
		                	BootstrapDialog.show({
		                		title: '',
		                		message: '비밀번호 틀림 비번:banana',
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
		
		//프로필수정 모달정의
		$("#member_update").click(function() {
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
		
		$("#dropdown_2").click(function() {
			$("#page_div").hide()
		})
		$("#dropdown_3").click(function() {
			$("#page_div").hide()
		})
		$("#dropdown_1").click(function() {
			$("#page_div").show()
		})
		//메세지창 숨기기
		$("#msg_bar").hide()
		$("#content_body").hide()
		//메세지아이콘 클릭시
		$("#msg_icon").click(function() {
			$("#msg_bar").slideToggle(1000)
			$("#msg_icon").slideToggle(500)
			document
					.getElementById('msg_scroll').scrollTop = document
					.getElementById('msg_scroll').scrollHeight;
		})
		$("#msg_icon2").click(function() {
			$("#msg_bar").slideToggle(500)
			$("#msg_icon").slideToggle(1000)
		})

		//글쓰기 아이콘 클릭시
		/* $("#content_bar").click(function() { 
			$("#content_body").slideToggle("slow"); //글쓰기아이콘 누르면 슬라이드 효과
			if ($("#content_icon").attr("class") == "fa fa-chevron-up") { //글쓰기아이콘 바꾸기
				$("#content_icon").attr("class", "fa fa-chevron-down")
			} else {
				$("#content_icon").attr("class", "fa fa-chevron-up")
			}
		}) */

		//글쓰기 폼 클릭시
		$("#content_form").click(function() {
			$("#content_body").slideToggle(
					"slow"); //글쓰기아이콘 누르면 슬라이드 효과
			if ($("#content_icon")
					.attr("class") == "fa fa-chevron-up") { //글쓰기아이콘 바꾸기
				$("#content_icon").attr(
						"class",
						"fa fa-chevron-down")
			} else {
				$("#content_icon").attr(
						"class",
						"fa fa-chevron-up")
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

		$("#mail_notificatoin_bar").click(function() { // 알림바 메시지 클릭 이벤트
			$.ajax({
				url : "addfunctionaction.do?action=msg_list4",
				success : function(success) {
					$("#msg4").html(success);
				}
			});
			$.ajax({
				url : "addfunctionaction.do?action=msg_num",
				success : function(success) {
					$("#msg4num").html(success);
				}
			});
		});

		$("#alert_notificatoin_bar").click(function() { // 알림바 알림 클릭 이벤트
			$.ajax({
				url : "addfunctionaction.do?action=notice",
				success : function(success) {
					$("#alert_notificatoin_bar").html(success);
				}
			})
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
</script>
</html>