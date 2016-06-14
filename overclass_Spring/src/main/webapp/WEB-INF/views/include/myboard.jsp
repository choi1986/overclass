<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:forEach items="${list }" var="DocumentDTO">
<div id="main_Board">
	<div class="row">
		<div class="col-lg-offset-3 col-lg-5 portlets">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="pull-right">
						<div class="btn-group">
							 <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
								<i class="fa fa-align-justify"></i> 
							</a>
							<ul class="dropdown-menu" role="menu">
								<c:if test="${DocumentDTO.writer == user.user_id}">
									<li><a href="#" onclick="delDoc(${DocumentDTO.dno })" style="color: black;" class="fa fa-bitbucket"> 게시글 삭제</a></li>
								</c:if>
								
								<li><a href="#" style="color: red;" class="fa fa-exclamation-circle"> 게시글 신고하기</a></li>
							</ul>
						</div>
					</div>
				</div>
					
				<div class="panel-body">
					<div class="padd">
						<div class="form quick-post">
							<!-- 글쓰기폼-->
							<form class="form-horizontal">
								<!-- 타이틀 -->
								<div class="form-group">
									<div class="photo col-lg-2" style="text-align: center;">
										<img alt="avatar" src="${DocumentDTO.user_image}" width='70' height='70'>
										<h4></h4>
										<p>
											<b>${DocumentDTO.writer }</b>
										</p>
									</div>
									<!-- 글내용 -->
									<div class="col-lg-10">
										<div class="panel-content" style="width: 100%; height: 100px; overflow: hidden; word-break: break-all;">
											${DocumentDTO.content }
										</div>
									</div>
								</div>
									
									<!-- 사진 -->
									<div class="form-group">
										<div class="control-label col-lg-2">
										</div>
										<div class="filebox col-lg-10">
											<div class="col-lg-12" id="photo_div">
											<c:if test="${DocumentDTO.image != '' }">
											<a href="${DocumentDTO.image }" data-lightbox="image-${DocmentDTO.dno }" data-title="사진">
												<img src="${DocumentDTO.image }" width="500px" height="350px">
											</a>
											 </c:if>
											</div>
										</div>
									</div>
									
									

									<!-- 좋아요 -->
                        <div class="form-group">
                           <div class="goodclass">
                              <div style="display: none;">${DocumentDTO.dno }</div>
                              <a class="control-label col-lg-2">
                                 좋아요&nbsp;&nbsp;
                                 <span id="good_icon${DocumentDTO.dno }" class="fa fa-lg fa-thumbs-o-up" style="color: blue;"></span>
                              </a>
                           </div>
                              
                           <div class="col-lg-8">
                              <i class="fa fa-lg fa-heart" style="color: red;">
                                 <span style="color: black;">&nbsp;${DocumentDTO.goodcnt }</span>
                              </i>
                           </div>
                        </div>
                        <!-- 태그 -->
                        <div class="form-group">
                           <label class="control-label col-lg-2" for="content">태그</label>
                           <div class="col-lg-9">
                              <c:if test="${DocumentDTO.tag != null }">
                              <c:set var="tags" value="${fn:split(DocumentDTO.tag,',' )}"/>
                              <c:forEach items="${tags }" var="tag">
                              <button class="btn btn-info">${tag}</button>
                              </c:forEach>
                              </c:if>
                           </div>
                        </div>
                        
                        <!-- 댓글쓰기 -->
								<div class="form-group">
									<label class="control-label col-lg-2" for="reply_write">댓글</label>
									<div class="col-lg-10">
										<input id="reply_write${DocumentDTO.dno }" type="text" class="form-control" size="18" placeholder="댓글을 입력하세요..." onkeydown="return writeReply(event,${DocumentDTO.dno})">
									</div>
								</div>
								
								<div class="form-group">
								<div class="widget-icons pull-right">
									<a id="reply_icon" class="wminimize">
										<div style="display: none;">${DocumentDTO.dno }</div>
										<i id="reply_icon${DocumentDTO.dno }_2" class="fa fa-chevron-up">댓글&nbsp;&nbsp;&nbsp;&nbsp;</i>
									</a>
								</div><br>
                        <!-- 댓글 -->
                        <div id="reply_div${DocumentDTO.dno }" style="display: none;">
                        </div>
                        
                        <div class="text-center">
                        	<div style="display: none;">${DocumentDTO.dno }</div>
                        	<div style="display: none;"></div>
                        	<ul class='pagination pagination-sm' id='reply_div_page_${DocumentDTO.dno }' style="display: none;">
                        	
                        	</ul>
                        </div>
                     </div>
							</form>
						</div>
					</div>
					<div class="widget-foot">
						<!-- Footer goes here -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</c:forEach>
<footer>
	<!-- 페이징버튼 -->
	<div id="page_div" class="col-lg-offset-4 col-lg-4">
		<div class="col-lg-offset-1 col-lg-8">
			<div class="btn-toolbar">
				<div class="btn-group">
					<c:if test="${pageMaker.prev }">
					<a href="/overclass/main/myFeed_Page?page=${pageMaker.startPage -1 }">
						<button class="btn btn-default" type="button">«</button>
					</a>
					</c:if>
				</div>
				<div class="btn-group">
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					<a href="/overclass/main/myFeed_Page?page=${idx }">
						
						<button class="<c:out value="${pageMaker.cri.page == idx?'btn btn-primary active':'btn btn-primary' }"/>">${idx }</button>
					</a>
					</c:forEach>
				</div>
				<div class="btn-group">
					<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
					<a href="/overclass/main/myFeed_Page?page=${pageMaker.endPage +1 }">
						<button class="btn btn-default" type="button">»</button>
					</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!--페이징버튼-->
</footer>

<!-- 댓글처리를 위한 템플릿 -->
<script id="template" type="text/x-handlebars-template">
<div class="act-time">
   <div class="activity-body act-in">
      <div class="text">
         <a href="#" class="activity-img"><img class="avatar" src="{{user_image }}"></a>
		<a href="javascript:deleteModal({{rno}},{{dno}})" style="float: right;"><span class="fa fa-close"></span></a>
         <p class="attribution">
         <a href="#" style="color: blue;">{{replyer }}</a>
         <p>{{content }}</p>
      </div>
   </div>
</div>
</script>


<script>
function delDoc(dno) {
	BootstrapDialog.show({
		title: '', //알러트 타이틀 이름
		message: '글을 삭제 하시겠습니까?', //알러트 내용
		type: BootstrapDialog.TYPE_DANGER,
		buttons: [{ //알러트 버튼 정의
			icon: 'fa fa-check', //알러트버튼에 넣을 아이콘
			label: '삭제', //알러트 버튼 이름
			cssClass: 'btn-danger', //알러트 버튼 색바꾸기
			hotkey:13,
			action: function(confirm) {
				location.href="/overclass/main/myFeed/removeDoc?dno="+dno;
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
var source = $("#template").html();
var template = Handlebars.compile(source);
	var result = '${msg}';
	
	if (result == 'Write_SUCCESS') {
		BootstrapDialog.show({
    		title: '', //알러트 타이틀 이름
    		message: '글이 등록 되었습니다.', //알러트 내용
    		buttons: [{ //알러트 버튼 정의
    				icon: 'fa fa-check',
    				label: '확인',
    				cssClass: 'btn-primary',
    				hotkey:13,
    				action: function(cancel){
    					cancel.close();
   					}
    			}]
    	})
		
	} else if (result == 'Remove_SUCCESS') {
		BootstrapDialog.show({
    		title: '', //알러트 타이틀 이름
    		message: '글이 삭제 되었습니다.', //알러트 내용
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

	var replyPage = 1;

	function replyDisplayPage(dno, replyPage) {
		var replydiv = '#reply_div' + dno;
		var reply_page = '#reply_div_page_'+dno
		$.ajax({
			url : '/overclass/reply/list/' + dno + '/' + replyPage,
			type : 'get',
			success : function(result) {
				var htmlTxt='';
				for(var i=0; i<result.list.length; i++){
					htmlTxt+=template(result.list[i]);
				}
				
				// 페이징추가해야됨.
				$(replydiv).html(htmlTxt);
				printPaging(result.pageMaker, dno, reply_page);
			}
		});
	}
	
	var printPaging = function(pageMaker, dno, reply_page){
		var pageStr = "";
		
		if(pageMaker.prev){
			pageStr += "<li><a href='"+(pageMaker.startPage-1)+"'>«</a></li>"
		}
		
		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			pageStr += "<li "+strClass+"><a href='javascript:replyDisplayPage("+dno+","+i+")'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			pageStr += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}
		
		$(reply_page).attr("style","display: show;")
		$(reply_page).html(pageStr);
	}
	
	function deleteModal(rno,dno){
		BootstrapDialog.show({
			title : '', //알러트 타이틀 이름
			message : '댓글을 삭제하시겠습니까?', //알러트 내용
			type: BootstrapDialog.TYPE_DANGER,
			buttons : [ { //알러트 버튼 정의
				id : 'docWriteBt', //알러트 버튼의 아이디
				icon : 'fa fa-check', //알러트버튼에 넣을 아이콘
				label : '확인', //알러트 버튼 이름
				cssClass : 'btn-danger', //알러트 버튼 색바꾸기
				hotkey : 13,
				action : function(confirm) {
					deleteReply(rno,dno);
					confirm.close();
					
				}},{
    				label: '닫기',
    				action: function(cancel){
    					cancel.close();
    					}
    			}]
    	})//BootstrapDialog
	}//deleteReply
	
	function deleteReply(rno,dno){
		$.ajax({
			url:'/overclass/reply/'+rno,
			type:'delete',
			success:function(result){
				if(result=='SUCCESS'){
					// 성공모달
					BootstrapDialog.show({
						title : '', //알러트 타이틀 이름
						message : '댓글이 삭제되었습니다.', //알러트 내용
						buttons : [ { //알러트 버튼 정의
							id : 'docWriteBt', //알러트 버튼의 아이디
							icon : 'fa fa-check', //알러트버튼에 넣을 아이콘
							label : '확인', //알러트 버튼 이름
							cssClass : 'btn-primary', //알러트 버튼 색바꾸기
							hotkey : 13,
							action : function(confirm) {
								//댓글목록갱신
								replyDisplayPage(dno,1);
								confirm.close()
							}
						} ]
					})
				} else {
					// 실패모달
					BootstrapDialog.show({
						title : '', //알러트 타이틀 이름
						message : '댓글을 삭제하지 못했습니다.', //알러트 내용
						buttons : [ { //알러트 버튼 정의
							id : 'docWriteBt', //알러트 버튼의 아이디
							icon : 'fa fa-check', //알러트버튼에 넣을 아이콘
							label : '확인', //알러트 버튼 이름
							cssClass : 'btn-primary', //알러트 버튼 색바꾸기
							hotkey : 13,
							action : function(confirm) {
								confirm.close()
							}
						} ]
					});
				}//else
			},//success:function
			error:function(status){
				alert(status);
				console.log(status);
			}
		})//ajax
	}
	
	function writeReply(event,dno){
		var replyWriteTxt = '#reply_write'+dno;
		if(event.keyCode == 13){
			if($(replyWriteTxt).val() != '') { 
				$.ajax({
					url:"/overclass/reply/",
					type:'post',
					headers:{
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"POST"
					},
					data:JSON.stringify({
						dno:dno,
						content:$(replyWriteTxt).val()
					}),
					success:function(result){
						if(result=='SUCCESS'){
							BootstrapDialog.show({
								title : '', //알러트 타이틀 이름
								message : '댓글이 등록되었습니다.', //알러트 내용
								buttons : [ { //알러트 버튼 정의
									id : 'docWriteBt', //알러트 버튼의 아이디
									icon : 'fa fa-check', //알러트버튼에 넣을 아이콘
									label : '확인', //알러트 버튼 이름
									cssClass : 'btn-primary', //알러트 버튼 색바꾸기
									action : function(confirm) {
										// 댓글목록 갱신
										replyDisplayPage(dno,1);
										confirm.close()
									}
								} ]
							})
						$(replyWriteTxt).val("");
						}else{
							BootstrapDialog.show({
								title : '', //알러트 타이틀 이름
								message : '댓글등록이 실패했습니다.', //알러트 내용
								type: BootstrapDialog.TYPE_DANGER,
								buttons : [ { //알러트 버튼 정의
									id : 'docWriteBt', //알러트 버튼의 아이디
									icon : 'fa fa-check', //알러트버튼에 넣을 아이콘
									label : '확인', //알러트 버튼 이름
									cssClass : 'btn-danger', //알러트 버튼 색바꾸기
									hotkey : 13,
									action : function(confirm) {
										confirm.close()
									}
								} ]
							})
						}//else
					},
					error:function(xhr){
						alert('에러'+xhr.status);
					}
				})
			}// != if
			return false;
		} // keycode if
	}
</script>