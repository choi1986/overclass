<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="panel panel-default">
	<div id="content_form" class="panel-heading"
		style="background-color: #EEF6FF;">
		<div class="pull-left">
			<h4>글쓰기</h4>
		</div>
		<div class="widget-icons pull-right">
			<a id="content_bar" class="wminimize"><i id="content_icon" class="fa fa-chevron-up"></i></a>
		</div>
		<div class="clearfix"></div>
	</div>
	<div id="content_body" class="panel-body">
		<div class="padd">

			<!-- 글쓰기폼-->
			<div class="form quick-post">
				<form role="form" class="form-horizontal" action="/overclass/main/writeDoc"
					method="post" enctype="multipart/form-data">
					<!-- 타이틀 -->
					<div class="form-group">
						<div class="col-lg-2">
							<span class="photo"><img alt="avatar"
								src="<%-- <%=user.getId_img_path()%> --%>" width='70' height='70'></span>
							<p><%-- <%=user.getName()%> --%></p>
						</div>
						<div class="col-lg-10">
							<input type="hidden" id="action" name="action" value="contentInsert"> 
								<input type="hidden" id="writer" name="writer" value="test1"<%-- <%=user.getUser_id()%> --%>>
							<textarea class="form-control" name="content" id="content" rows="5"></textarea>
						</div>
					</div>

					<!-- 태그 -->
					<div class="form-group">
						<label class="control-label col-lg-2" for="content">태그</label>
						<div class="col-lg-10">
							<input name="tag" id="tagsinput" class="tagsinput" />							
						</div>
					</div>

					<!-- 파일 -->
					<div class="form-group">
						<label for="exampleInputFile"></label> <label
							class="control-label col-lg-2" for="content">사진올리기</label>
						<div class="col-lg-10">
							<input type="file" id="file" name="image">
							<p class="help-block"></p>`
						</div>
					</div>
					
					<!-- 파일 사진올릴시 -->
					<div class="form-group">
						<label for="exampleInputFile"></label> 
						<label class="control-label col-lg-2" for="content"></label>
						<div class="col-lg-10" id="photo_div" style="display: none;">
							<img src="" id="photo" width="250px" height="200px">
						</div>
					</div>


					<!-- Buttons -->
					<div class="form-group">
						<!-- Buttons -->
						<div class="col-lg-offset-4 col-lg-4">
							<button type="button" id="docWriteSubmitBt"
								class="btn btn-primary btn-block">등록</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
