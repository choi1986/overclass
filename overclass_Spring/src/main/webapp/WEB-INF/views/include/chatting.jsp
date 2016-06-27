<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="col-sm-5">
	<!-- Widget -->
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="pull-left"><span class="fa fa-comments-o"></span><strong> 대화&nbsp;&nbsp;</strong></div>
			<div id="chatTo" class="pull-left">${targetuser } </div>
			<div class="clearfix"></div>
		</div>

		<div class="panel-body">
			<!-- Widget content -->
			<div id="chatwindow" class="padd sscroll" style="overflow: auto; height: 520px;">
				<!-- 채팅목록 -->
				<ul class="chats" id="textout">

				</ul>

			</div>
			<!-- Widget footer -->
			<div class="widget-foot">
				<div class="row" style="margin-top: 25px;">
					<div class="form-group col-lg-offset-1 col-lg-9 form-group has-success">
						<input type="text" id="sendtext" class="form-control" readonly
							placeholder="메시지를 입력하세요..." onkeydown="return chatEnter(event)">
					</div>
					<!-- <button type="button" id="txtsubmit" class="btn btn-success">보내기</button> -->
				</div>
			</div>
		</div>


	</div>
</div>

<div class="panel panel-default"
	style="width: 300px; height: 660px; overflow: auto;">
	<div class="panel-heading">
		<h2>
			<span class="fa fa-group"></span><strong> 친구목록</strong>
		</h2>
	</div>
	<div class="panel-body">
		<table class="table bootstrap-datatable countries">
			<tbody>
				<c:forEach items="${friendlist }" var="flist">
				<tr class="info">
					<td>
						<a href="javascript:chatChange('${flist.user_id }');">
							<img src="${flist.user_image }" class="img-circle" style="height: 30px; width: 30px;">
						</a>
					</td>
					<td><a href="javascript:chatChange('${flist.user_id }');" id="cl_${flist.user_id }">${flist.user_id }</a>
						<!-- <div class="btn-group">
                           <a data-toggle="dropdown" class="btn btn-link dropdown-toggle" type="button">teset1 
                           </a>
                           <ul class="dropdown-menu">
                               <li><a href="#">피드가기</a></li>
                               <li><a href="#">메세지 보내기</a></li>
                           </ul>
                       </div> -->
					</td>
					<td><a href="javascript:chatChange('${flist.user_id }');">${flist.user_name }</a></td>
					
				</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
</div>
