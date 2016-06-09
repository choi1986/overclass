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

    <!-- Bootstrap CSS -->    
    <link href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="<%= request.getContextPath() %>/resources/css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="<%= request.getContextPath() %>/resources/css/elegant-icons-style.css" rel="stylesheet" />
    <!-- <link href="<-%= request.getContextPath() %>/resources/css/font-awesome.css" rel="stylesheet" /> -->
    <!-- Custom styles -->
    <link href="<%= request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/resources/css/style-responsive.css" rel="stylesheet" />
    
	<!-- <link type="text/css" rel="stylesheet" href="../css/bootstrap.min.css"> -->
    <link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/animate.css">
    
   	<!-- <script type="text/javascript" src="<-%= request.getContextPath() %>/resources/js/jquery2.js"></script>-->
    <script src="<%= request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/js/animation.js"></script>
    <script src="<%= request.getContextPath() %>/resources/js/jquery.cookie.js"></script>
	<!-- <script type="text/javascript" src="<-%= request.getContextPath() %>/resources/js/validateCheck.js"></script>-->
<script type="text/javascript">

	duplCk=0;
	//joinForm JQuery
		$(document).ready(function(){
	var duplCheck = "<%=session.getAttribute("dupl")%>";
	$("#id").val(sessionStorage.getItem("dupl"));
	if ((sessionStorage.getItem("dupl") != null)||(sessionStorage.getItem("duplFail")==1)) {
		if($("#id").val()!=''){
			if (duplCheck == 'suc') {
				$("#panel").hide();
				$("#joinForm").show();
				//$("#id").val()
				alert("중복체크 성공!");
				duplCk = 1;
			} else if (duplCheck == 'fail') {
					$("#panel").hide();
					$("#joinForm").show();
					alert("중복체크 실패!");
				duplCk = 0;
			}
		}
	}
		/* 			$("#login").click(function() {
		 $.ajax({
		 url:"/overclass/memberaction.do",
		 type:"POST",
		 data:{
		 id:$("[name='id']").val(),
		 pwd:$("[name='pwd']").val(),
		 action:"login"
		 },
		 success:function(result){
		 $("#loginForm").hide()
		 $("body").attr("class","")
		 $("body").html(result)
		 }
		 })
		 })  */

		var cnt = 0; //birth 공백으로 바꾸는이벤트 1번만 하기위해 선언
		// if($("#action").val()
		$("#join").click(function() { //로그인 화면에서 회원가입버튼 눌렀을시
			alert("adfadsf");
			$("#panel").hide(); //로그인하는 아이디,비밀번호 감춤
			$("#joinForm").show(); //회원가입폼 보여줌
			$("#birth").click(function() { //예)900317이 입력된 텍스트클릭시 공백으로 바꿈
				if (cnt == 0) {
					$("#birth").val("").css("color", "black"); //예)900317글씨색을 검정으로 바꿈
					cnt++
				}
			});
			var tel1 = $("#tel1").val();
			var tel2 = $("#tel2").val();
			var tel3 = $("#tel3").val();
			var tel = tel1 + "-" + tel2 + "-" + tel3;
		}) //join click 
		$("#back").click(function() {
			$("#joinForm").hide(); //회원가입폼 감춤
			$("#panel").show();
		})
		var email_op = $("email_op").val()
		var em = "직접입력"
		if (email_op == em) {
			$("#email2").show()
		}
		$("#join_join").click(function() { //회원가입폼에서 가입버튼 눌렀을시
			sessionStorage.setItem("duplFail", 0);
			sessionStorage.removeItem("dupl");
			$("#action").val('join');
			if (duplCk != 1) {
				alert("먼저 중복체크를 해주세요!");
				sessionStorage.setItem("duplFail", 1);
				$("#register_form").removeAttr('action');
				//$("#join_join").attr('type' , 'button');
			}/*
						$.ajax({
							url : "../joinForm.do",
							type : "POST",
							data : {
								id : $("#id").val(),
								pwd : $("#pwd").val(),
								pwd_check : $("#pwd_check").val(),
								name : $("#name").val(),
								email : $("#email1").val(),
								tel : $("#tel1").val()+$("#tel2").val()+$("#tel3").val(),
								loc : $("#loc").val(),
								birth : $("#birth").val(),
								gender : $("gender:checked"),
								action : "join"
							},
							success : function(result) {
								alert("성공!");
								$("#joinForm").hide(); //회원가입폼 감춤
								$("#panel").show(); //로그인하는 아이디,비밀번호 다시보여줌
							}
						}) //ajax
			 */
		}) //join_join click 
		$("#dupl").click(function() { //회원가입폼에서 중복검사버튼 눌렀을시
			$("#action").val('dupl');
			sessionStorage.setItem("dupl", $("#id").val());
		}) //dupl click 

		$("#que").click(function() {
			$("#panel").hide()
			$("#queForm").show()
		})
		$("#check").click(function() {
			alert("h")
		})
		$("#id").click(function() {
			$("#check").click()
		})
	});
</script>
</head>


<body class="login-img3-body">
  
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
                <input type="checkbox" value="remember-me"> 아이디 저장
                <span class="pull-right"> <a href="#"> 문제가있나요?</a></span>
            </label>
            
            <div id="change-transitions" class="row">
				<button type="submit" data data-value="fadeInLeftBig" class="btn btn-primary btn-lg btn-block">로그인</button>
        		    <p><input type="hidden" name="action" value="login"></p>
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
              
              <div class="row" style="margin-top:50px; margin-left: 0px; margin-right: 0px;">
                  <div class="col-sm-4">
                  </div>
                  <div class="col-sm-4">
                      <section class="panel">
                          <header class="panel-heading">
                             	회원가입
                          </header>
                          <div class="panel-body">
                              <div class="form">
                                  <form class="form-validate form-horizontal " id="register_form" action="login.do" method="post">
                                      <div class="form-group ">
                                          <label for="fullname" class="control-label col-sm-4">아이디<span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class=" form-control" id="id" name="fullname" type="text" />
                                          </div>
                                          
                                          <div class="col-sm-1">
                                              <button class="btn btn-primary" type="submit" id="dupl" >중복체크</button>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group ">
                                          <label for="password" class="control-label col-sm-4">비밀번호 <span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class="form-control " id="pwd" name="password" type="password" onkeyup="allowWS(this)"/>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group ">
                                          <label for="confirm_password" class="control-label col-sm-4">비밀번호 확인 <span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class="form-control " id="pwd_check" name="confirm_password" type="password" onkeyup="allowWS(this)"/>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group ">
                                          <label for="username" class="control-label col-sm-4">이름 <span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class="form-control " id="name" name="username" type="text" placeholder="ex) 홍길동" />
                                          </div>
                                      </div>
                                      
                                      <div class="form-group ">
                                          <label for="email" class="control-label col-sm-4">이메일 <span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class="form-control " id="email" name="email" type="email" placeholder="ex) kosta113"/>
                                          </div><!--  onkeyup="allowEmail(this)" -->
                                      </div>
                                      
                                      <div class="form-group">
                                      <label class="control-label col-sm-4" for="inputSuccess">전화번호<span class="required">*</span></label>
                                      <div class="col-sm-8">
                                          <div class="row">
                                              <div class="col-sm-3">
                                                  <input type="text" class="form-control" name="tel1" placeholder="010" onkeyup="allowNUM(this)">
                                              </div>
                                              <div class="col-sm-3">
                                                  <input type="text" class="form-control" name="tel2" placeholder="1234" onkeyup="allowNUM(this)">
                                              </div>
                                              <div class="col-sm-3">
                                                  <input type="text" class="form-control" name="tel3" placeholder="4567" onkeyup="allowNUM(this)">
                                              </div>
                                          </div>

                                      </div>
                                  </div>
                                      
                                      <div class="form-group">
                                            <label class="control-label col-sm-4">주소<span class="required">*</span></label>
                                            <div class="col-sm-4">                               
                                                <select class="form-control" id="loc" name="address">
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
                                          </div>            
                                          
                                           <div class="form-group">
                                            <label class="control-label col-sm-4">비밀번호찾기 질문<span class="required">*</span></label>
                                            <div class="col-sm-4">                               
                                                <select class="form-control" id="pwd_q" name="pwd_q">
                                                	<option>-- 선택 --</option>  
                                                	<option>나의 고향은?</option>  
                                                	<option>나의 친한 친구 이름은?</option>  
                                                	<option>나의 별명은?</option>  
                                                	<option>나의 출신학교는?</option>  
                                                	<option>부모님의 성함은?</option>  
                                                	<option>보물제1호</option>  
                                                </select>  
                                            </div>
                                          </div>  
                                          
                                      <div class="form-group ">
                                          <label for="birth" class="control-label col-sm-4">비밀번호찾기 답변<span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class=" form-control" id="pwd_a" name="pwd_a" type="text" placeholder="ex) 코딩하기" />
                                          </div>
                                      </div>
                                          
                                      <div class="form-group ">
                                          <label for="birth" class="control-label col-sm-4">생일 <span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class=" form-control" id="birth" name="birth" type="text" placeholder="ex) 900317" onkeyup="allowNUM(this)" />
                                          </div>
                                      </div>
                                      
                                      <div class="form-group ">
                                          <label for="gender" class="control-label col-sm-4">성별 <span class="required">*</span></label>
                                           <div class="control-label col-sm-3" >
                                                  <input name="radio"  value="남" type="radio" checked /> 남자
                                                  <input name="radio"  value="여" type="radio" /> 여자
                                          </div>
                                      </div>
                                      
                                      
                                      
                                      <div class="form-group">
                                          <div class="col-sm-offset-2 col-sm-10">
                                       		<div class="col-sm-3"></div>
                                              <div id="change-transitions" class="row">
											     <button type="summit" data-value="rotateInDownLeft" class="btn btn-primary btn-lg" id="join_join">가입</button>
        		    						<p><input type="hidden" id="action" name="action" value="join"></p>
						   		        	     <button type="button" data-value="fadeInDown" class="btn btn-danger btn-lg" id="back">취소</button>
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
