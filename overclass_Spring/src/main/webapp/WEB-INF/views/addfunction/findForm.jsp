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

							<!-- 게시글시작 -->
							<c:choose>
							<c:when test="${taglist != null}">
							<%@ include file="../include/tagfindboard.jsp"%>
							</c:when>
							<c:otherwise>
							<%@ include file="../include/friendfindboard.jsp"%>
							</c:otherwise>
							</c:choose>
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

<script type="text/javascript">
var msg_source = $("#msgtemp").html();
var msg_template = Handlebars.compile(msg_source);
var msgtop_source = $("#msgtoptemp").html();
var msgtop_template = Handlebars.compile(msgtop_source);
var msg_source_NR = $("#msgtempNR").html();
var msg_templateNR = Handlebars.compile(msg_source_NR);

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
	    				formObj.attr({action:'/overclass/main/writeDoc',method:'post',onsubmit:''});
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
		friendlist('<%=user.getUser_id()%>');
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

//***********************   소       켓      ****************************************
//소켓생성하기
var sender='<%=user.getUser_id()%>';

var ws = new WebSocket('ws://192.168.0.131/overclass/chatting');

//서버에서 메시지 날라올때
ws.onmessage = function (event) {
	var data = JSON.parse(event.data);
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
</script>
</html>