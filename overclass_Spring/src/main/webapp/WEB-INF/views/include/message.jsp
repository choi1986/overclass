<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div style="position: fixed;">
	<div class="col-lg-offset-12">
		<a href="#"><img id="msg_icon" src="${initParam.root}img/메세지.png" style="position: fixed;"></a>
	</div>
	<div class="panel panel-default" id="msg_bar">
		<div class="panel-heading">
			<i class="fa fa-4x fa-envelope" style="color: royalblue;"></i><span></span>
			<div class="widget-icons pull-right">

				<a id="msg_icon2" class="wminimize"><i class="fa fa-chevron-up"></i></a>
			</div>
			<div class="clearfix"></div>
		</div>

		<div id="msg_body" class="panel-body">
			<div class="padd scroll" style="height: 320px; overflow: auto;">
				<ul class="chats">
				</ul>
			</div>
		</div>
	</div>

</div>