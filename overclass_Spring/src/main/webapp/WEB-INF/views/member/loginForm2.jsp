<%@page import="kr.co.overclass.dto.JoinDTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/resources/img/favicon.png"> <!-- 페이지아이콘 -->

    <title>Welcome to OVERCLASS</title>

   <!-- CSS -->
	<!-- 부트스트랩 -->
	<link href="/overclass/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="/overclass/resources/css/bootstrap-theme.css" rel="stylesheet">
	<!-- 부트스트랩모달 -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.9/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css">
	<!-- 아이콘 -->
	<link href="/overclass/resources/css/elegant-icons-style.css" rel="stylesheet">
	<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" >
	<!-- 스타일 -->
	<link href="/overclass/resources/css/style.css" rel="stylesheet">
	<link href="/overclass/resources/css/style-responsive.css" rel="stylesheet">
	<!-- 애니메이션 -->
	<link href="/overclass/resources/css/animate.css" type="text/css" rel="stylesheet">
<!-- CSS끝 -->

<!-- JS -->
	<!-- 제이쿼리 -->
	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<!-- 부트스트랩 -->
	<script src="/overclass/resources/js/bootstrap.min.js"></script>
	<!-- 부트스스트랩모달 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.9/js/bootstrap-dialog.min.js"></script>
	<!-- 제이쿼리ui -->
	<script src="/overclass/resources/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="/overclass/resources/js/bootstrap-switch.js"></script>
	<!-- 태그 -->
	<script src="/overclass/resources/js/jquery.tagsinput.js"></script>
	<script src="/overclass/resources/js/form-component.js"></script>
	<!-- 애니메이션 -->
	<script src="/overclass/resources/js/animation.js"></script>
	<script src="/overclass/resources/js/jquery.cookie.js"></script>
	
	<script src="/overclass/resources/js/jquery.ripples.js"></script>
<!-- JS끝 -->
    <script type="text/javascript">

		//joinForm JQuery
		$(document).ready(function(){
			var cnt = 0; //birth 공백으로 바꾸는이벤트 1번만 하기위해 선언
			duplCk = 0; // 중복검사 성공 or 실패 체크
			duplID = ""; // 중복검사 아이디 임시 저장
			joinError = { // 회원가입 메시지용 변수
					user_idCk : true,
					user_pwdCk : true,
					user_pwd_confirmCk : true,
					user_nameCk : true,
					user_emailCk : true,
					user_tel1Ck : true,
					user_tel2Ck : true,
					user_tel3Ck : true,
					user_locCk : true,
					user_hobby1Ck : true,
					user_hobby2Ck : true,
					user_pwdqCk : true,
					user_pwdaCk : true,
					user_birthCk : true
			};
			pwdError = { // 비밀번호 찾기 비밀번호 에러체크 메시지용 변수
					user_pwdCk : true,
					user_pwd_confirmCk : true,
			};
			
		$('body').ripples({
			   resolution: 512,
			   dropRadius: 20,	
			   perturbance: 0.04,
			});
			
		$("#join").click(function() { //로그인 화면에서 회원가입버튼 눌렀을시
			$("#panel").hide(); //로그인하는 아이디,비밀번호 감춤
			$("#joinForm").show(); //회원가입폼 보여줌
			$("#birth").click(function() { //예)900317이 입력된 텍스트클릭시 공백으로 바꿈
				if (cnt == 0) {
					$("#birth").val("").css("color", "black"); //예)900317글씨색을 검정으로 바꿈
					cnt++
				}
			});
		}) //join click 
		$("#searchID").click(function() {
			$("#panel").hide(); //회원가입폼 감춤
			$("#searchIDForm").show();
			$("#searchPwdForm").show();
		})
		$("#searchID_post").click(function() {
			//
		})
		$("#searchPwd_post").click(function() {
			pwdErrorCk=pwdError.user_pwdCk||pwdError.user_pwd_confirmCk;
			$("#pwdErrorCk").val(pwdErrorCk);
			
			if($("#pwdErrorCk").val()=="true") {
				BootstrapDialog.show({
		    		title: '', //알러트 타이틀 이름
		    		message: '변경 비밀번호를 다시 확인해주세요.', //알러트 내용
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
	    	$("#register_form_forPwd").submit();
		})
		$("#back_join").click(function() {
			$("#joinForm").hide(); //회원가입폼 감춤
			$("#panel").show();
		})
		$("#back_searchIDPwd").click(function() {
			$("#searchIDForm").hide(); //아이디 찾기 폼 감춤
			$("#searchPwdForm").hide(); //비밀번호 찾기 폼 감춤
			$("#panel").show();
		})
		var email_op = $("email_op").val()
		var em = "직접입력"
		if (email_op == em) {
			$("#email2").show()
		}
		$("#join_join").click(function() { //회원가입폼에서 가입버튼 눌렀을시
			if($("#joinErrorCk").val()=="true") {
				BootstrapDialog.show({
		    		title: '', //알러트 타이틀 이름
		    		message: '부적합한 회원가입 항목을 다시 확인해주세요.', //알러트 내용
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
			if (duplID!=$("#user_id").val()&&duplCk==1) { 
				BootstrapDialog.show({
		    		title: '', //알러트 타이틀 이름
		    		message: '중복검사된 아이디가 변경되었습니다! 다시 중복검사합니다.', //알러트 내용
		    		type: BootstrapDialog.TYPE_DANGER,
		    		buttons: [{
		    				label: '닫기',
		    				action: function(cancel){
		    					cancel.close();
		    			    	$("#register_form_join").attr('action','/overclass/dupl');
		    			    	$("#dupl").click();
		    					}
		    			}]
		    	})
		    	duplCk==0;
			}
			else if(duplCk==0) { 
				BootstrapDialog.show({
		    		title: '', //알러트 타이틀 이름
		    		message: '아직 ID 중복이 검사되지 않았습니다! \n자동으로 중복 검사됩니다.', //알러트 내용
		    		type: BootstrapDialog.TYPE_DANGER,
		    		buttons: [{
		    				label: '닫기',
		    				action: function(cancel){
		    					cancel.close();
		    			    	$("#register_form_join").attr('action','/overclass/dupl');
		    			    	$("#dupl").click();
		    					}
		    			}]
		    	})
			}
			else {
		    	$("#register_form_join").attr('action','/overclass/join');
		    	$("#register_form_join").submit();
			}
		}) //join_join click 
		$("#dupl").click(function() { //회원가입폼에서 중복검사버튼 눌렀을시
			$("#register_form_join").attr('action','/overclass/dupl');
		}) //dupl click 

		$("#que").click(function() {
			$("#panel").hide()
			$("#queForm").show()
		})
		$("#check").click(function() {
			alert("h");
		})
		$("#id").click(function() {
			$("#check").click()
		})
	});
	function regCk(num, data) { // 유효성 검사
		var msg="";
		$(".joinSpan").css("color","red");
		$(".joinSpan").css("font-size","11px");
		$(".pwdSpan").css("color","red");
		$(".pwdSpan").css("font-size","11px");
		
		switch (num) { // 회원가입
		case 1: // 아이디
			if(data.value.length<5) { msg='아이디를 5자리 이상 입력해주세요.'; joinError.user_idCk=true; }
			else joinError.user_idCk=false;
			$("#span1").text(msg);
			break;
		case 2: // 비밀번호
			if(data.value.length<3) { msg='비밀번호를 3자리 이상 입력해주세요.'; joinError.user_pwdCk=true;}
			else joinError.user_pwdCk=false;
			$("#span2").text(msg);
			break;
		case 3: // 비밀번호 확인
			if(data.value!=$("#user_pwd").val()) { msg='확인 비밀번호가 같지 않습니다!'; joinError.user_pwd_confirmCk=true;}
			else joinError.user_pwd_confirmCk=false;
			$("#span3").text(msg);
			break;
		case 4: // 이름
			if(data.value.length<2) { msg='이름을 2자리 이상 입력해주세요.'; joinError.user_nameCk=true; }
			else joinError.user_nameCk=false;
			$("#span4").text(msg);
			break;
		case 5: // 이메일
			if(!data.value.match(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,6}$/i)) { msg='메일을 다시 확인해주세요.'; joinError.user_emailCk=true; }
			else joinError.user_emailCk=false;
			$("#span5").text(msg);
			break;
		case 6: // 전화번호_1
			if(data.value.length<2||data.value.length>4||isNaN(data.value)) { msg='전화번호를 다시 확인 해주세요.'; joinError.user_tel1Ck=true; }
			else joinError.user_tel1Ck=false;
			$("#span6").text(msg);
			break;
		case 7: // 전화번호_2
			if(data.value.length<3||data.value.length>5||isNaN(data.value)) { msg='전화번호를 다시 확인 해주세요.'; joinError.user_tel2Ck=true; }
			else joinError.user_tel2Ck=false;
			$("#span6").text(msg);
			break;
		case 8: // 전화번호_3
			if(data.value.length<2||data.value.length>4||isNaN(data.value)) { msg='전화번호를 다시 확인 해주세요.'; joinError.user_tel3Ck=true; }
			else joinError.user_tel3Ck=false;
			$("#span6").text(msg);
			break;
		case 9: // 주소
			if(data.value=="-- 선택 --") { msg='주소를 입력해주세요.'; joinError.user_locCk; }
			else joinError.user_locCk=false;
			$("#span7").text(msg);
			break;
		case 10: // 취미1
			if(data.value=="-- 선택 --") { msg='취미를 선택해주세요.'; joinError.user_hobby1Ck=true; }
			else joinError.user_hobby1Ck=false;
			$("#span8").text(msg);
			break;
		case 11: // 취미2
			if(data.value=="-- 선택 --") { msg='취미를 선택해주세요.'; joinError.user_hobby2Ck=true; }
			else joinError.user_hobby2Ck=false;
			$("#span9").text(msg);
			break;
		case 12: // 비밀번호 찾기 질문
			if(data.value=="-- 선택 --") { msg='질문을 입력해주세요.'; joinError.user_pwdqCk=true; }
			else joinError.user_pwdqCk=false;
			$("#span10").text(msg);
			break;
		case 13: // 비밀번호 찾기 답변
			if(data.value.length<1) { msg='답변을 입력해주세요.'; joinError.user_pwdaCk=true; }
			else joinError.user_pwdaCk=false;
			$("#span11").text(msg);
			break;
		case 14: // 생일
			if(data.value.length!=6||isNaN(data.value)) { msg='생일을 6자리 숫자로 입력해주세요.'; joinError.user_birthCk=true; }
			else joinError.user_birthCk=false;
			$("#span12").text(msg);
			break;
		case 15: // 비밀번호
			if(data.value.length<3) { msg='비밀번호를 3자리 이상 입력해주세요.'; pwdError.user_pwdCk=true;}
			else pwdError.user_pwdCk=false;
			$("#pwd_span2").text(msg);
			break;
		case 16: // 비밀번호 확인-비밀번호 찾기
			if(data.value!=$('input[onblur="regCk(15, this)"]').val()) { msg='확인 비밀번호가 같지 않습니다!'; pwdError.user_pwd_confirmCk=true;}
			else pwdError.user_pwd_confirmCk=false;
			$("#pwd_span3").text(msg);
			break;
			/*
		case 3: // 비밀번호 확인
			if(data.value!=$("#user_pwd").val()) { msg='확인 비밀번호가 같지 않습니다!'; joinError.user_pwd_confirmCk=true;}
			else joinError.user_pwd_confirmCk=false;
			$("#span3").text(msg);
			break;
			*/

		default:
			break;
		}
		joinErrorCk=joinError.user_idCk||joinError.user_pwdCk||joinError.user_pwd_confirmCk||joinError.user_nameCk||
						joinError.user_emailCk||joinError.user_tel1Ck||joinError.user_tel2Ck||joinError.user_tel3Ck||
						joinError.user_locCk||joinError.user_hobby1Ck||joinError.user_hobby2Ck||joinError.user_pwdqCk||
						joinError.user_pwdaCk||joinError.user_birthCk;
		$("#joinErrorCk").val(joinErrorCk);
	}
</script>
</head>


<body class="login-img3-body">

	<c:if test="${sessionScope.joinDupl.user_id!=null}"> <!-- 중복 검사 후 페이지에 기존의 데이터 뿌려주는 부분 -->
		<script type="text/javascript">
			$(document).ready(function(){
				$("#panel").hide(); //로그인하는 아이디,비밀번호 감춤
				$("#joinForm").show(); //회원가입폼 보여줌
			
				$("#user_id").val("${sessionScope.joinDupl.user_id}");
				duplID=$("#user_id").val();
				$("#user_pwd").val("${sessionScope.joinDupl.user_pwd}");
				$("#user_pwd_confirm").val("${sessionScope.joinDupl.user_pwd_confirm}");
				$("#user_name").val("${sessionScope.joinDupl.user_name}");
				$("#user_email").val("${sessionScope.joinDupl.user_email}");
				$("#user_tel1").val("${sessionScope.joinDupl.user_tel1}");
				$("#user_tel2").val("${sessionScope.joinDupl.user_tel2}");
				$("#user_tel3").val("${sessionScope.joinDupl.user_tel3}");
				$("#user_loc").val("${sessionScope.joinDupl.user_loc}");
				$("#user_hobby1").val("${sessionScope.joinDupl.user_hobby1}");
				$("#user_hobby2").val("${sessionScope.joinDupl.user_hobby2}");
				$("#user_birth").val("${sessionScope.joinDupl.user_birth}"); cnt=1;
				$("#radio[value='${sessionScope.joinDupl.radio}']").attr("checked","checked");
				$("#user_pwdq").val("${sessionScope.joinDupl.user_pwdq}");
				$("#user_pwda").val("${sessionScope.joinDupl.user_pwda}");
				$("#joinErrorCk").val("${sessionScope.joinDupl.joinErrorCk}");
				
				if ($("#user_id").val()!="") $("#user_id").focus();
				if ($("#user_pwd").val()!="") $("#user_pwd").focus();
				if ($("#user_pwd_confirm").val()!="") $("#user_pwd_confirm").focus();
				if ($("#user_name").val()!="") $("#user_name").focus();
				if ($("#user_email").val()!="") $("#user_email").focus();
				if ($("#user_tel1").val()!="") $("#user_tel1").focus();
				if ($("#user_tel2").val()!="") $("#user_tel2").focus();
				if ($("#user_tel3").val()!="") $("#user_tel3").focus();
				if ($("#user_loc").val()!="-- 선택 --") $("#user_loc").focus();
				if ($("#user_hobby1").val()!="-- 선택 --") $("#user_hobby1").focus();
				if ($("#user_hobby2").val()!="-- 선택 --") $("#user_hobby2").focus();
				if ($("#user_birth").val()!="") $("#user_birth").focus();
				if ($("#user_pwdq").val()!="-- 선택 --") $("#user_pwdq").focus();
				if ($("#user_pwda").val()!="") $("#user_pwda").focus();
				
				joinErrorCk=joinError.user_idCk||joinError.user_pwdCk||joinError.user_pwd_confirmCk||joinError.user_nameCk||
				joinError.user_emailCk||joinError.user_tel1Ck||joinError.user_tel2Ck||joinError.user_tel3Ck||
				joinError.user_locCk||joinError.user_hobby1Ck||joinError.user_hobby2Ck||joinError.user_pwdqCk||
				joinError.user_pwdaCk||joinError.user_birthCk;
				$("#joinErrorCk").val(joinErrorCk);
			})
		</script>
	</c:if>
	
	<c:choose>
		<c:when test="${sessionScope.joinDuplCk==''}"> <!-- 중복 검사 성공 모달 -->
			<script type="text/javascript">
				$(document).ready(function(){
					BootstrapDialog.show({
    					title: '', //알러트 타이틀 이름
    					message: '중복검사 성공!', //알러트 내용
    					type: BootstrapDialog.TYPE_PRIMARY,
    					buttons: [{
    							label: '닫기',
    							action: function(cancel){
    								cancel.close();
    								}
    						}]
    				})
					duplCk=1;
				})
			</script>
		</c:when>
		<c:when test="${sessionScope.joinDuplCk!=null}"> <!-- 중복 검사 실패 모달 -->
			<script type="text/javascript">
				$(document).ready(function(){
					BootstrapDialog.show({
	    				title: '', //알러트 타이틀 이름
	    				message: '중복검사 실패!', //알러트 내용
	    				type: BootstrapDialog.TYPE_DANGER,
	    				buttons: [{
	    						label: '닫기',
	    						action: function(cancel){
	    							cancel.close();
	    							}
	    					}]
	    			})
					duplCk=0;
				})
				</script>
		</c:when>
	</c:choose>
	<c:remove var="joinDupl" scope="session" /> <!-- 중복에 쓰인 세션들 닫기 -->
	<c:remove var="joinDuplCk" scope="session" />
	
	<c:choose>
		<c:when test="${sessionScope.joinCk=='1'}"> <!-- 회원가입 성공 모달 -->
			<script type="text/javascript">
					BootstrapDialog.show({
    					title: '', //알러트 타이틀 이름
    					message: '회원가입 성공!', //알러트 내용
    					type: BootstrapDialog.TYPE_PRIMARY,
    					buttons: [{
    							label: '닫기',
    							action: function(cancel){
    								cancel.close();
    								}
    						}]
    				})
			</script>
		</c:when>
		<c:when test="${sessionScope.joinCk=='0'}"> <!-- 회원가입 실패 모달 -->
			<script type="text/javascript">
					BootstrapDialog.show({
	    				title: '', //알러트 타이틀 이름
	    				message: '회원가입 실패!', //알러트 내용
	    				type: BootstrapDialog.TYPE_DANGER,
	    				buttons: [{
	    						label: '닫기',
	    						action: function(cancel){
	    							cancel.close();
	    							}
	    					}]
	    			})
				</script>
		</c:when>
	</c:choose>
	<c:remove var="joinCk" scope="session" /> <!-- 회원가입 체크에 쓰인 세션 닫기 -->
	
	<c:if test="${sessionScope.loginFail=='1'}"> <!-- 로그인 실패 모달 -->
		<script type="text/javascript">
				BootstrapDialog.show({
   					title: '', //알러트 타이틀 이름
   					message: '아이디, 비밀번호를 다시 확인해주세요!', //알러트 내용
   					type: BootstrapDialog.TYPE_DANGER,
    				buttons: [{
    						label: '닫기',
    						action: function(cancel){
    							cancel.close();
    							}
   						}]
   				})
		</script>
	</c:if>
	<c:remove var="loginFail" scope="session" /> <!-- 회원가입 체크에 쓰인 세션 닫기 -->
	
	<c:choose>
		<c:when test="${sessionScope.searchID=='0'}"> <!-- 아이디 찾기에서 정보가 틀렸을때 -->
			<script type="text/javascript">
				BootstrapDialog.show({
					title : '', //알러트 타이틀 이름
					message : '해당하는 아이디를 찾을 수 없습니다!', //알러트 내용
					type : BootstrapDialog.TYPE_DANGER,
					buttons : [ {
						label : '닫기',
						action : function(cancel) {
							cancel.close();
						}
					} ]
				})
			</script>
		</c:when>
		<c:when test="${sessionScope.searchID!=null}"> <!-- 아이디 찾기 성공했을 때 -->
			<script type="text/javascript">
				BootstrapDialog.show({
					title : '', //알러트 타이틀 이름
					message : '아이디는 [${sessionScope.searchID}] 입니다!', //알러트 내용
					type : BootstrapDialog.TYPE_PRIMARY,
					buttons : [ {
						label : '닫기',
						action : function(cancel) {
							cancel.close();
						}
					} ]
				})
			</script>
		</c:when>
	</c:choose>
	<c:remove var="searchID" scope="session" /> <!-- 아이디 찾기 세션 종료 -->
	
	<c:choose>
		<c:when test="${sessionScope.searchPwd=='suc'}"> <!-- 비밀번호 찾기 성공 -->
			<script type="text/javascript">
				BootstrapDialog.show({
					title : '', //알러트 타이틀 이름
					message : '비밀번호를 정상적으로 변경하였습니다!', //알러트 내용
					type : BootstrapDialog.TYPE_PRIMARY,
					buttons : [ {
						label : '닫기',
						action : function(cancel) {
							cancel.close();
						}
					} ]
				})
			</script>
		</c:when>
		<c:when test="${sessionScope.searchPwd=='fail'}"> <!-- 비밀번호 찾기에서 정보가 틀렸을때 -->
			<script type="text/javascript">
				BootstrapDialog.show({
					title : '', //알러트 타이틀 이름
					message : '입력 정보를 다시 확인해주세요!', //알러트 내용
					type : BootstrapDialog.TYPE_DANGER,
					buttons : [ {
						label : '닫기',
						action : function(cancel) {
							cancel.close();
						}
					} ]
				})
			</script>
		</c:when>
		<c:when test="${sessionScope.searchPwd=='pwdFail'}"> <!-- 비밀번호 찾기에서 비밀번호와 확인 비밀번호가 같지 않을때 -->
			<script type="text/javascript">
				BootstrapDialog.show({
					title : '', //알러트 타이틀 이름
					message : '비밀번호와 확인 비밀번호가 같지 않습니다!', //알러트 내용
					type : BootstrapDialog.TYPE_DANGER,
					buttons : [ {
						label : '닫기',
						action : function(cancel) {
							cancel.close();
						}
					} ]
				})
			</script>
		</c:when>
	</c:choose>
	<c:remove var="searchPwd" scope="session" /> <!-- 비밀번호 찾기 세션 종료 -->

<!-- --------------------------로그인화면---------------------------------------------- -->
<div id="loginForm" style="display: ">
  <div id="panel" style="display:">
    <div class="container">
      <form class="login-form" action="/overclass/loginPost" method="post">        
        <div class="login-wrap">
            <p class="login-img"><i class="icon_lock_alt"></i></p>
            <div class="input-group">
              <span class="input-group-addon"><i class="icon_profile"></i></span>
              <input type="text" name="user_id" class="form-control" placeholder="아이디" autofocus>
            </div>
            <div class="input-group">
                <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                <input type="password" name="user_pwd" class="form-control" placeholder="패스워드">
            </div>
            <label class="checkbox">
                <input type="checkbox" name="useCookie"> 아이디 저장
                <span class="pull-right"> <a id="searchID" href="javascript:document.test.submit()">문제가 있나요?</a></span><!--  <a href="#"> -->
            </label>
            
            <div id="change-transitions" class="row">
				<button type="submit" data data-value="fadeInLeftBig" class="btn btn-primary btn-lg btn-block">로그인</button>
   		        <button type="button" data-value="fadeInLeftBig" class="btn btn-info btn-lg btn-block" id="join" >가입하기</button>
			</div>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- --------------------------회원가입페이지---------------------------------------------- -->
    <div id="joinForm" style="display: none;">
<!-- 		  <div class="row">
				<div class="col-sm-12">
					<h3 class="page-header"><i class="fa fa-files-o"></i></h3>
				</div>
			</div> -->
              
              <div class="row">
                  <div class="col-sm-4">
                  </div>
                  <div class="col-sm-4" style="margin-top: 50px">
                      <section class="panel">
                          <header class="panel-heading">
                             	회원가입
                          </header>
                          <div class="panel-body">
                              <div class="form">
                                  <form class="form-validate form-horizontal " id="register_form_join" name="register_form_join" action="/overclass/join" method="post">
                                      <div class="form-group ">
                                      		<input type="hidden" id="joinErrorCk" name="joinErrorCk"><!-- 에러났는지 카운트했던 것을 체크해서 회원가입 막음 -->
                                          <label for="fullname" class="control-label col-sm-4">아이디<span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class=" form-control" id="user_id" name="user_id" type="text" onblur="regCk(1, this)" />
                                              <span id="span1" class="joinSpan"></span>
                                          </div>
                                          
                                          <div class="col-sm-1">
                                              <button class="btn btn-primary" type="submit" id="dupl">중복체크</button>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group ">
                                          <label for="password" class="control-label col-sm-4">비밀번호 <span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class="form-control " id="user_pwd" name="user_pwd" type="password" onblur="regCk(2, this)"/>
                                          </div>
                                          <span id="span2" class="joinSpan"></span>
                                      </div>
                                      
                                      <div class="form-group ">
                                          <label for="confirm_password" class="control-label col-sm-4">비밀번호 확인 <span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class="form-control " id="user_pwd_confirm" name="user_pwd_confirm" type="password" onblur="regCk(3, this)"/>
                                          </div>
                                          <span id="span3" class="joinSpan"></span>
                                      </div>
                                      
                                      <div class="form-group ">
                                          <label for="username" class="control-label col-sm-4">이름 <span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class="form-control " id="user_name" name="user_name" type="text" placeholder="ex) 홍길동"  onblur="regCk(4, this)"/>
                                          </div>
                                          <span id="span4" class="joinSpan"></span>
                                      </div>
                                      
                                      <div class="form-group ">
                                          <label for="email" class="control-label col-sm-4">이메일 <span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class="form-control " id="user_email" name="user_email" type="email" placeholder="ex) kosta113" onblur="regCk(5, this)"/>
                                          </div>
                                          <span id="span5" class="joinSpan"></span>
                                      </div>
                                      
                                      <div class="form-group">
                                      <label class="control-label col-sm-4" for="inputSuccess">전화번호<span class="required">*</span></label>
                                      <div class="col-sm-8">
                                          <div class="row">
                                              <div class="col-sm-3">
                                                  <input type="text" class="form-control" id="user_tel1" name="user_tel1" placeholder="010" onblur="regCk(6, this)">
                                              </div>
                                              <div class="col-sm-3">
                                                  <input type="text" class="form-control" id="user_tel2" name="user_tel2" placeholder="1234" onblur="regCk(7, this)">
                                              </div>
                                              <div class="col-sm-3">
                                                  <input type="text" class="form-control" id="user_tel3" name="user_tel3" placeholder="4567" onblur="regCk(8, this)">
                                              </div>
                                          </div>
                                          <span id="span6" class="joinSpan"></span>

                                      </div>
                                  </div>
                                      
                                      <div class="form-group">
                                            <label class="control-label col-sm-4">주소<span class="required">*</span></label>
                                            <div class="col-sm-4">                               
                                                <select class="form-control" id="user_loc" name="user_loc" onblur="regCk(9, this)">
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
                                                <span id="span7" class="joinSpan"></span>
                                          </div>
                                          
                                      <div class="form-group">
                                            <label class="control-label col-sm-4">첫번째 취미<span class="required">*</span></label>
                                            <div class="col-sm-4">                               
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
                                                <span id="span8" class="joinSpan"></span>
                                          </div>
                                          
                                      <div class="form-group">
                                            <label class="control-label col-sm-4">두번째 취미<span class="required">*</span></label>
                                            <div class="col-sm-4">                               
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
                                                <span id="span9" class="joinSpan"></span>
                                          </div>
                                          
                                           <div class="form-group">
                                            <label class="control-label col-sm-4">비밀번호찾기 질문<span class="required">*</span></label>
                                            <div class="col-sm-4">                               
                                                <select class="form-control" id="user_pwdq" name="user_pwdq" onblur="regCk(12, this)">
                                                	<option>-- 선택 --</option>  
                                                	<option>나의 고향은?</option>  
                                                	<option>나의 친한 친구 이름은?</option>  
                                                	<option>나의 별명은?</option>  
                                                	<option>나의 출신학교는?</option>  
                                                	<option>부모님의 성함은?</option>  
                                                	<option>보물 제1호</option>  
                                                </select>  
                                            </div>
                                                <span id="span10" class="joinSpan"></span>
                                          </div>  
                                          
                                      <div class="form-group ">
                                          <label for="birth" class="control-label col-sm-4">비밀번호찾기 답변<span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class=" form-control" id="user_pwda" name="user_pwda" type="text" placeholder="ex) 코딩하기"  onblur="regCk(13, this)"/>
                                          </div>
                                          <span id="span11" class="joinSpan"></span>
                                      </div>
                                          
                                      <div class="form-group ">
                                          <label for="birth" class="control-label col-sm-4">생일 <span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class=" form-control" id="user_birth" name="user_birth" type="text" placeholder="ex) 900317" onblur="regCk(14, this)"/>
                                          </div>
                                          <span id="span12" class="joinSpan"></span>
                                      </div>
                                      
                                      <div class="form-group ">
                                          <label for="user_gender" class="control-label col-sm-4">성별 <span class="required">*</span></label>
                                           <div class="control-label col-sm-3" >
                                                  <input id="radio" name="radio"  value="남" type="radio" checked /> 남자
                                                  <input id="radio" name="radio"  value="여" type="radio" /> 여자
                                          </div>
                                      </div>
                                      
                                      
                                      
                                      <div class="form-group">
                                          <div class="col-sm-offset-2 col-sm-10">
                                       		<div class="col-sm-3"></div>
                                              <div id="change-transitions" class="row">
											     <button type="button" data-value="rotateInDownLeft" class="btn btn-primary btn-lg" id="join_join">가입</button>
        		    						<button type="button" data-value="fadeInDown" class="btn btn-danger btn-lg" id="back_join">취소</button>
										      </div>
                                          </div>
                                      </div>
                                  </form>
                              </div>
                          </div>
                      </section>
                  </div>
              </div>
            </div>
<!-- --------------------------아이디 찾기 페이지---------------------------------------------- -->
    <div id="searchIDForm" style="display: none;">
              <div class="row" style="margin-left: 0px, margin-right: 0px">
                  <div class="col-sm-4">
                  </div>
                  <div class="col-sm-4" style="margin-top: 50px">
                      <section class="panel">
                          <header class="panel-heading">
                             	아이디 찾기
                          </header>
                          <div class="panel-body">
                              <div class="form">
                                  <form class="form-validate form-horizontal " id="register_form_forID" name="register_form_forID" action="/overclass/searchID" method="post">
                                  
                                  <div class="form-group ">
                                          <label for="username" class="control-label col-sm-4">이름 <span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class="form-control " id="user_name" name="user_name" type="text" placeholder="ex) 홍길동" />
                                          </div>
                                      </div>
                                      
                                      <div class="form-group ">
                                          <label for="email" class="control-label col-sm-4">이메일 <span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class="form-control " id="user_email" name="user_email" type="email" placeholder="ex) kosta113"/>
                                          </div><!--  onkeyup="allowEmail(this)" -->
                                      </div>
                                          
                                      <div class="form-group ">
                                          <label for="birth" class="control-label col-sm-4">생일 <span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class=" form-control" id="user_birth" name="user_birth" type="text" placeholder="ex) 900317"/>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group">
                                          <div class="col-sm-offset-2 col-sm-10">
                                       		<div class="col-sm-3"></div>
                                              <div id="change-transitions" class="row">
											     <button type="summit" data-value="rotateInDownLeft" class="btn btn-primary btn-lg" id="searchID_post">제출</button>
										      </div>
                                          </div>
                                      </div>
                                  </form>
                              </div>
                          </div>
                      </section>
                  </div>
              </div>
            </div>
<!-- --------------------------비밀번호 찾기 페이지---------------------------------------------- -->
    <div id="searchPwdForm" style="display: none;">
              <div class="row" style="margin-top:50px; margin-left: 0px;, margin-right: 0px">
                  <div class="col-sm-4">
                  </div>
                  <div class="col-sm-4">
                      <section class="panel">
                          <header class="panel-heading">
                             	비밀번호 찾기
                          </header>
                          <div class="panel-body">
                              <div class="form">
                                  <form class="form-validate form-horizontal " id="register_form_forPwd" name="register_form_forPwd" action="/overclass/searchPwd" method="post">
                                  
                                  <div class="form-group ">
                                      		<input type="hidden" id="pwdErrorCk" name="pwdErrorCk"><!-- 에러났는지 카운트했던 것을 체크해서 비밀번호 변경 막음 -->
                                          <label for="fullname" class="control-label col-sm-4">아이디<span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class=" form-control" id="user_id" name="user_id" type="text" />
                                          </div>
                                      </div>
                                          
                                           <div class="form-group">
                                            <label class="control-label col-sm-4">비밀번호찾기 질문<span class="required">*</span></label>
                                            <div class="col-sm-4">                               
                                                <select class="form-control" id="user_pwdq" name="user_pwdq">
                                                	<option>-- 선택 --</option>  
                                                	<option>나의 고향은?</option>  
                                                	<option>나의 친한 친구 이름은?</option>  
                                                	<option>나의 별명은?</option>  
                                                	<option>나의 출신학교는?</option>  
                                                	<option>부모님의 성함은?</option>  
                                                	<option>보물 제1호</option>  
                                                </select>  
                                            </div>
                                          </div>  
                                          
                                      <div class="form-group ">
                                          <label for="birth" class="control-label col-sm-4">비밀번호찾기 답변<span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class=" form-control" id="user_pwda" name="user_pwda" type="text" placeholder="ex) 코딩하기" />
                                          </div>
                                      </div>
                                      
                                      <div class="form-group ">
                                          <label for="password" class="control-label col-sm-4">변경할 비밀번호 <span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class="form-control " id="user_pwd" name="user_pwd" type="password" onblur="regCk(15, this)"/>
                                          </div>
                                                <span id="pwd_span2" class="pwdSpan"></span>
                                      </div>
                                      
                                      <div class="form-group ">
                                          <label for="confirm_password" class="control-label col-sm-4">비밀번호 확인 <span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class="form-control " id="user_pwd_confirm" name="user_pwd_confirm" type="password" onblur="regCk(16, this)"/>
                                          </div>
                                                <span id="pwd_span3" class="pwdSpan"></span>
                                      </div>
                                      
                                      <div class="form-group">
                                          <div class="col-sm-offset-2 col-sm-10">
                                       		<div class="col-sm-3"></div>
                                              <div id="change-transitions" class="row">
											     <button type="button" data-value="rotateInDownLeft" class="btn btn-primary btn-lg" id="searchPwd_post">제출</button>
        		    						<button type="button" data-value="fadeInDown" class="btn btn-danger btn-lg" id="back_searchIDPwd">취소</button>
										      </div>
                                          </div>
                                      </div>
                                  </form>
                              </div>
                          </div>
                      </section>
                  </div>
              </div>
            </div>
    
    <!-- alert정의 -->
    <div class="modal hide fade" id="myModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3>알림창</h3>
		</div>
		<div class="modal-body">
			<p>ㅎㅇ</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">닫기</a>
			<a href="#" class="btn btn-primary">저장</a>
		</div>
	</div>
    
  </body>
</html>