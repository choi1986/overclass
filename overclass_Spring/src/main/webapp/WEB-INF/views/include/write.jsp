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
				<form role="form" id="writeDoc" class="form-horizontal" action="/overclass/main/writeDoc"
					method="post" enctype="multipart/form-data">
					<!-- 타이틀 -->
					<div class="form-group">
						<div class="photo col-sm-2" style="text-align: center;">
							<img class="img-circle" alt="avatar" src="${user.user_image}" width='70' height='70'>
							<h4></h4>
							<p>
								<b>
									<input type="hidden" id="writer" name="writer" value="${user.user_id }">
									${user.user_id }
								</b>
							</p>
						</div>
						<div class="col-sm-10">
							<input type="hidden" id="action" name="action" value="contentInsert"> 
							<textarea class="form-control" name="content" id="content" rows="5"></textarea>
						</div>
					</div>

					<!-- 태그 -->
					<div class="form-group">
						<label class="control-label col-sm-2" for="content">태그</label>
						<div class="col-sm-10">
							<input name="tag" id="tagsinput" class="tagsinput" />							
						</div>
					</div>

					<!-- 파일 -->
					<div class="form-group">
						<div class="filebox control-label col-sm-2">
							<label for="file" class="btn btn-primary"><span class="fa fa-camera-retro" style="color: #007aff;"></span> 사진올리기</label>
							<input type="file" id="file" name="file" accept="image/gif, image/jpeg, image/png, image/bmp#">
						</div>
						<div class="filebox col-sm-10">
						<div class="col-sm-12" id="photo_div" style="display: none;">
							<img class="img-responsive img-thumbnail" src="" id="photo" width="250px" height="200px">
							<br/><a href="#" class="hidden">삭제</a>
						</div>
						</div>
					</div>
					
					<!-- 지도 -->
					<div class="form-group">
						<label class="control-label col-sm-2" for="content">지도</label>
						<div class="col-sm-10">
							<div class="map_wrap">
							    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
							
							    <div id="menu_wrap" class="bg_white">
							        <div class="option">
							            <div>
							                <form onsubmit="searchPlaces(); return false;">
							                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
							                    <button type="submit">검색하기</button> 
							                </form>
							            </div>
							        </div>
							        <hr>
							        <ul id="placesList"></ul>
							        <div id="pagination"></div>
							    </div>
							</div>
						</div>
					</div>
					<!-- 등록버튼 -->
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-4">
							<button type="button" id="docWriteSubmitBt" class="btn btn-primary btn-block">등록</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>