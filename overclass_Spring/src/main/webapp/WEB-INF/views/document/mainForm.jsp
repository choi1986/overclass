<%@page import="java.util.List"%>
<%@page import="kr.co.overclass.domain.UserVO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@include file="../include/header.jsp"%>
<!-- 헤더끝 -->
<% UserVO user = (UserVO)session.getAttribute("login"); %>
<section id="my_page" class="wrapper">

	<div class="row">
		<div class="col-lg-12">
			<section class="panel">
				<div class="panel-body">
					<div id="recent-activity" class="tab-pane active">
						<div class="profile-activity">
							<div class="col-lg-offset-3 col-lg-5 portlets">
							
								<!-- 글쓰기폼 시작 -->
								<%@include file="../include/write.jsp"%>
								<!-- 글쓰기폼 끝 -->
								
							</div>

							<div class="col-lg-4">
								<div class="row">
									<div class="col-md-offset-7 col-md-2 portlets">
									<!-- 메세지폼 -->
										<%@ include file="../include/message.jsp" %>
									<!-- 메세지폼 끝 -->
									</div>
								</div>
							</div>

							<!-- 게시글시작 -->
							<%@ include file="../include/board.jsp"%>
							<!-- 게시글폼 끝 -->

						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</section>

<!-- 라이트박스 스크립트 -->
<script src="/overclass/resources/js/lightbox.js"></script>
<script>
lightbox.option({
    'disableScrolling' : true,
    'showImageNumberLabel' : false,
    'fadeDuration' : 700
})
</script>
</body>

<!-- 지도 -->
<script type="text/javascript">
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
</script>

<!-- 쪽지 리스트처리를 위한 템플릿 -->
<script id="msgtemp" type="text/x-handlebars-template">
<li>
	<a href=''>
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
							<p class="blue">새로운 쪽지 {{count}}개</p>
						</li>
</script>

<script type="text/javascript">
var msg_source = $("#msgtemp").html();
var msg_template = Handlebars.compile(msg_source);
var msgtop_source = $("#msgtoptemp").html();
var msgtop_template = Handlebars.compile(msgtop_source);

var timer;
var msgid;
$(document).ready(function() {
	
	$.ajax({
		url : "/overclass/msg/sitebarCount",
		type:'POST',
		data:{
			user_id:'<%=user.getUser_id()%>'
		},
		success : function(success) {
			$("#sitebarMsgCount").html(success);
		}
	});
	
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
		    
			var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
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
	
	//게시글삭제
	$("#boardDel").click(function() {
		BootstrapDialog.show({
    		title: '', //알러트 타이틀 이름
    		message: '글을 삭제 하시겠습니까?', //알러트 내용
    		buttons: [{ //알러트 버튼 정의
    			id: 'dd', //알러트 버튼의 아이디
    			icon: 'fa fa-check', //알러트버튼에 넣을 아이콘
    			label: '삭제', //알러트 버튼 이름
    			cssClass: 'btn-primary', //알러트 버튼 색바꾸기
    			hotkey:13,
    			action: function(confirm) {
    				/* var formObj = $("form[role='form']");  */   				
    				/* formObj.submit(); */
    				confirm.close()
				}
    			},{
    				label: '취소',
    				action: function(cancel){
    					cancel.close();
    					}
    			}]
    	})
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
	   // 좋아요클릭
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
	    			label: '등록', //알러트 버튼 이름
	    			cssClass: 'btn-primary', //알러트 버튼 색바꾸기
	    			action: function(confirm) {
	    				var formObj = $("#writeDoc");    				
	    				formObj.submit();
	    				confirm.close()
					}
	    			},{
	    				label: '취소',
	    				action: function(cancel){
	    					cancel.close();
	    					}
	    			}]
	    	})
		}
	})
	
	
	//메세지창 숨기기
	$("#msg_bar,#content_body").hide()

	//메세지아이콘 클릭시
	$("#msg_icon").click(function() {
		$("#msg_bar").slideToggle(1000)
		$("#msg_icon").slideToggle(500)
		document.getElementById('msg_scroll').scrollTop = document.getElementById('msg_scroll').scrollHeight;
	})
	$("#msg_icon2").click(function() {
		$("#msg_bar").slideToggle(500)
		$("#msg_icon").slideToggle(1000)
	})

	//글쓰기 폼 클릭시
	$("#content_form").click(function() {
		$("#content_body").slideToggle(
				"slow"); //글쓰기아이콘 누르면 슬라이드 효과
		if ($("#content_icon").attr("class") == "fa fa-chevron-up") { //글쓰기아이콘 바꾸기
			$("#content_icon").attr("class","fa fa-chevron-down")
		} else {
			$("#content_icon").attr("class","fa fa-chevron-up")
		}
	})
	
	
	
	// 사이트바 쪽지 클릭 이벤트
	$("#mail_notificatoin_bar").click(function() { 
		$.ajax({
			url : "/overclass/msg/sitebar",
			type:'POST',
			data:{
				user_id:'<%=user.getUser_id()%>'
			},
			success : function(success) {
				var htmlTxt = msgtop_template(success);
				for(var i=0; i<success.list.length; i++){
					htmlTxt+=msg_template(success.list[i]);
				}
				$("#msg4").html(htmlTxt);
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
	
	$("#dropdown_alr").click(function() {
		$("#dropdown_alr").slideToggle("slow")
	})
}); //ready


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
</script>
</html>