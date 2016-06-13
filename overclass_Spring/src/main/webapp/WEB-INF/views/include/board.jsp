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
								<c:if test="${DocumentDTO.writer == user}">
									<li><a href="#" style="color: black;" class="fa fa-bitbucket"> 게시글 삭제</a></li>
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
                              <%-- <%
                                 if (list.get(i).getTag() != null) {
                                       String tag[] = list.get(i).getTag().split(",");
                                       for (int j = 0; j < tag.length; j++) {
                              %> --%>
                              <c:if test="${DocumentDTO.tag != null }">
                              <c:set var="tags" value="${fn:split(DocumentDTO.tag,',' )}"/>
                              <c:forEach items="${tags }" var="tag">
                              <button class="btn btn-info">${tag}<%-- <%=tag[j]%> --%></button>
                           <%--    <%
                                 } // for j 끝
                                    } // if끝
                              %> --%>
                              </c:forEach>
                              </c:if>
                           </div>
                        </div>
                        
                        <!-- 댓글쓰기 -->
								<div class="form-group">
									<label class="control-label col-lg-2" for="reply_write">댓글</label>
									<div class="col-lg-10">
										<input id="reply_write" type="text" class="form-control" size="18" placeholder="댓글을 입력하세요...">
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
                        <%-- <c:forEach items="list" var="reply">
                           <div class="act-time">
                              <div class="activity-body act-in">
                                 <div class="text">
                                    <a href="#" class="activity-img"><img class="avatar" src="${reply.user_image }"></a>
                                    <p class="attribution">
                                       <a href="#" style="color: blue;">${reply.replyer }</a>
                                    <p>${reply.content }</p>
                                 </div>
                              </div>
                           </div>
                        </c:forEach> --%>

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
					<a href="/overclass/main/mainFeed_Page?page=${pageMaker.startPage -1 }">
						<button class="btn btn-default" type="button">«</button>
					</a>
					</c:if>
				</div>
				<div class="btn-group">
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					<a href="/overclass/main/mainFeed_Page?page=${idx }">
						
						<button class="<c:out value="${pageMaker.cri.page == idx?'btn btn-primary active':'btn btn-primary' }"/>">${idx }</button>
					</a>
					</c:forEach>
				</div>
				<div class="btn-group">
					<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
					<a href="/overclass/main/mainFeed_Page?page=${pageMaker.endPage +1 }">
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
         <p class="attribution">
         <a href="#" style="color: blue;">{{replyer }}</a>
         <p>{{content }}</p>
      </div>
   </div>
</div>
</script>


<script>
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

	function replyDisplay(dno, divno) {
		var replydiv = '#reply_div' + divno;
		$.ajax({
			url : '/overclass/reply/list/' + dno + '/1',
			type : 'get',
			success : function(result) {
				var htmlTxt='';
				for(var i=0; i<result.list.length; i++){
					htmlTxt+=template(result.list[i]);
				}
				
				// 페이징추가해야됨.
				
				$(replydiv).html(htmlTxt);
			}
		});
	}

	function replyDisplayPage(dno, page, divno) {
		var replydiv = '#reply_div' + divno;
		$.ajax({
			url : '/overclass/reply/list/' + dno + '/' + page,
			type : 'get',
			success : function(result) {
				var htmlTxt='';
				for(var i=0; i<result.list.length; i++){
					htmlTxt+=template(result.list[i]);
				}
				$(replydiv).html(htmlTxt);
			}
		});
	}
</script>