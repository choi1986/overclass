<%@page import="java.util.List"%>
<%-- <%@page import="oc.model.beans.ContentDTO2"%>
<%@page import="oc.model.beans.TmpinfoDTO"%>
<%@page import="oc.model.beans.MemberDTO"%> --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%
	MemberDTO user = (MemberDTO) session.getAttribute("user");
	TmpinfoDTO tmpinfo = (TmpinfoDTO) session.getAttribute("tmpinfo");
	List<ContentDTO2> list = (List<ContentDTO2>) request.getAttribute("list");
	int msg_num = (int) request.getAttribute("msg_num");
	int f_req_num = (int) request.getAttribute("f_req_num");
%> --%>

<!-- 헤더 -->
<%@include file="../include/header.jsp"%>
<!-- 헤더끝 -->

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


</body>
<script type="text/javascript">

var timer;
var msgid;
$(document).ready(function() {

	   //   댓글div 열닫
	   $(".wminimize").click(function() {
	      
	      // dno
	      var divNum = this.firstChild.nextSibling.firstChild.nodeValue;
	      var divtemp = '#reply_div'+divNum;
	      var divtemp2 = '#reply_icon'+divNum+'_2'
	      
	      //var div = $("#reply_div")
	      var div = $(divtemp);
	      var div2 = $(divtemp2);
	      div.slideToggle("slow")
	      // 열고
	      if(div2.attr("class") == "fa fa-chevron-up"){
	         div2.attr("class","fa fa-chevron-down")
	         replyDisplay(divNum,divNum);
	      } else {
	         //닫고
	         div2.attr("class","fa fa-chevron-up")
	      }
	   })
	   // 좋아요클릭
	   $(".goodclass").click(function() {
	      
	      // 이게 dno
	      var goodtemp = this.firstChild.nextSibling.firstChild.nodeValue;
	      //var goodtemp = this.firstChild.nextSibling.nextSibling.nextSibling;
	      var goodtmp = '#good_icon'+goodtemp;
	      
	      //var div = $("#reply_div")
	      var goodspan = $(goodtmp);
	      if(goodspan.attr("class") == "fa fa-lg fa-thumbs-o-up"){
	         goodspan.attr("class","fa fa-lg fa-thumbs-up")
	         // 여기다가 좋아요 했다는 내용 서버전송
	      } else {
	         goodspan.attr("class","fa fa-lg fa-thumbs-o-up")
	         // 여기다가 좋아요 취소했다는 내용 서버전송
	      }
	   })
	//글등록 모달정의
	$("#docWriteSubmitBt").click(function() {
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
    				var formObj = $("form[role='form']");    				
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
	
	// 글쓰기
	/* $("#docWriteBt").click(function() {
		var formObj = $("form[role='form']");
		formObj.submit();
		//$("#temp_content").attr("content", $("#content").val());
		//$("#temp_user_id").attr("user_id", "<-%=user.getUser_id()%>");
		//$("#temp_tag").attr("tag", $("#tagsinput").val());
		//$("#temp_doc_img_path").attr("doc_img_path", $("#exampleInputFile").val());

		//var doc_content = {
		//		content : $("#content").val(),
		//		user_id : '<-%=user.getUser_id()%>',
		//		tag : $("#tagsinput").val(),
		//		doc_img_path : $("#exampleInputFile").val()
		//}
		//sessionStorage.setItem("doc_content", $("#content").val());
		//sessionStorage.setItem("doc_user_id", '<-%=user.getUser_id()%>');
		//sessionStorage.setItem("doc_tag", $("#tagsinput").val());
		//sessionStorage.setItem("doc_doc_img_path", $("#exampleInputFile").val());

		//sessionStorage.setItem("doc_content", doc_content);

		//localStorage.doc_content = JSON.stringify(doc_content);
		//alert(sessionStorage.getItem("doc_content").content);
		//alert(JSON.parse(localStorage.doc_content).content);
		//location.href="feedaction.do?action=contentInsert";
	}) */

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
	
	$("#dropdown_alr").click(function() {
		$("#dropdown_alr").slideToggle("slow")
	})

	//var timer = setTimeout("msg_open(msgidnum)", 3000);
	//clearTimeout(timer);

}); //ready

/* function msg_request(msgidnum){
	msgid = msgidnum;
	if(timer == null) {
	msg_open(msgid);
	timer = setTimeout("msg_open(msgid)", 3000);
	}else{
		clearTimeout(timer);
		timer = setTimeout("msg_open(msgid)",3000);
	}
} */

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

function friend_process(friend_id) {
	$.ajax({
		url : "addfunctionaction.do?action=friend_accept&friend_id="
				+ friend_id,
		success : function(result) {
			alert(friend_id + '님과 친구가 되었습니다.')
		},
		error : function(xhr) {
			alert(friend_id + '님과 친구가 되었습니다.')
		}
	})
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