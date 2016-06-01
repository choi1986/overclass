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
    <link rel="shortcut icon" href="img/favicon.png">

    <title>회원가입</title>

    <!-- Bootstrap CSS -->    
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="../css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="../css/elegant-icons-style.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/style-responsive.css" rel="stylesheet" />
</head>
	<script type="text/javascript" src="../js/jquery2.js"></script>
	<script type="text/javascript" src="../js/validateCheck.js"></script>
<body>
		<div id="joinForm" style="display: none;">
		  <div class="row">
				<div class="col-sm-12">
					<h3 class="page-header"><i class="fa fa-files-o"></i>회원가입 페이지</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
					</ol>
				</div>
			</div>
		
              
              <div class="row">
                  <div class="col-sm-3">
                  </div>
                  <div class="col-sm-5">
                      <section class="panel">
                          <header class="panel-heading">
                             	회원가입
                          </header>
                          <div class="panel-body">
                              <div class="form">
                                  <form class="form-validate form-horizontal " id="register_form" method="get" action="">
                                      <div class="form-group ">
                                          <label for="fullname" class="control-label col-sm-4">아이디<span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class=" form-control" id="id" name="fullname" type="text" />
                                          </div>
                                          
                                          <div class="col-sm-1">
                                              <button class="btn btn-primary" type="button">중복체크</button>
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
                                              <input class="form-control " id="name" name="username" type="text" placeholder="ex) 홍길동" onkeyup="allowKR(this)"/>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group ">
                                          <label for="email" class="control-label col-sm-4">이메일 <span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class="form-control " id="email" name="email" type="email" placeholder="ex) kosta113" onkeyup="allowEmail(this)"/>
                                          </div>
                                      </div>
                                      
                                      <div class="form-group">
                                      <label class="control-label col-sm-4" for="inputSuccess">전화번호</label>
                                      <div class="col-sm-8">
                                          <div class="row">
                                              <div class="col-sm-2">
                                                  <input type="text" class="form-control" id="tel1" placeholder="010" onkeyup="allowNUM(this)">
                                              </div>
                                              <div class="col-sm-2">
                                                  <input type="text" class="form-control" id="tel2" placeholder="1234" onkeyup="allowNUM(this)">
                                              </div>
                                              <div class="col-sm-2">
                                                  <input type="text" class="form-control" id="tel3" placeholder="4567" onkeyup="allowNUM(this)">
                                              </div>
                                          </div>

                                      </div>
                                  </div>
                                      
                                      <div class="form-group ">
                                          <label for="address" class="control-label col-sm-4">주소 <span class="required">*</span></label>
                                          <div class="col-sm-4">
                                              <input class=" form-control" id="loc" name="address" type="text" />
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
                                           <div class="radios col-sm-4">
                                                  <input name="radio"  value="남" type="radio" checked /> 남자
                                                  <input name="radio"  value="여" type="radio" /> 여자
                                          </div>
                                      </div>
                                      
                                      <div class="form-group">
                                          <div class="col-sm-offset-2 col-sm-10">
                                          		<div class="col-sm-3"></div>
                                              <div class="col-sm-5">
                                              		<button class="btn btn-primary" type="submit">가입</button>
                                              		<button class="btn btn-default" type="button">취소</button>
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
</body>
</html>