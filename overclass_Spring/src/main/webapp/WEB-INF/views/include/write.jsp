<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #808080;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #fdfdfd;/* #007aff; */
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .30em;
}

.filebox input[type="file"] {  /* 파일 필드 숨기기 */
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}
</style>
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
						<div class="photo col-lg-2" style="text-align: center;">
							<img alt="avatar" src="${user.user_image}" width='70' height='70'>
							<h4></h4>
							<p>
								<b>${user.user_id }</b>
							</p>
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
						<div class="filebox control-label col-lg-2">
						<!-- <label class="control-label col-lg-2" for="content">사진올리기</label> -->
							<label for="file" class="btn btn-primary"><span class="fa fa-camera-retro" style="color: #007aff;"></span> 사진올리기</label>
							<input type="file" id="file" name="file" accept="image/gif, image/jpeg, image/png">
						</div>
						<div class="filebox col-lg-10">
						<div class="col-lg-12" id="photo_div" style="display: none;">
							<img src="" id="photo" width="250px" height="200px">
						</div>
						</div>
					</div>

					<!-- 등록버튼 -->
					<div class="form-group">
						<div class="col-lg-offset-4 col-lg-4">
							<button type="button" id="docWriteSubmitBt" class="btn btn-primary btn-block">등록</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>