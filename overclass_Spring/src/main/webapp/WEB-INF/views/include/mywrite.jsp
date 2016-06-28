<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="panel panel-default">
	<div id="content_form" class="panel-heading" style="background-color: #EEF6FF;">
		<div class="pull-left">
			<h4>글쓰기</h4>
		</div>
		<div class="widget-icons pull-right">
			<a id="content_bar" class="wminimize"><i id="content_icon" class="fa fa-chevron-up"></i></a>
		</div>
		<div class="clearfix"></div>
	</div>
	<div id="content_body" class="panel-body" style="">
		<div class="padd">

			<!-- 글쓰기폼-->
			<div class="form quick-post">
				<form role="form" onsubmit="searchPlaces(); return false;"
					id="writeDoc" class="form-horizontal" action="" method="get"
					enctype="multipart/form-data">

					<div class="form-group">
						<label class="col-sm-2"> <img class="img-rounded"
							src="${user.user_image}" width='90px' height='90px'>
						</label>
						<div class="col-sm-10">
							<h4>
								<b>${user.user_id } </b>
							</h4>
							<br>
							<input type="hidden" id="writer" name="writer" value="${user.user_id }">
							<div id="loc_div">
							<a href="#" id="loc" onclick="mapLocDel()"></a>
								<input id="mapLoc" type="hidden" name="mapLoc" value="">
								<input id="mapXY" type="hidden" name="mapXY" value="">
							</div>
						</div>
					</div>
					
					<!-- 글내용 -->
					<div class="form-group">
						<label class="control-label col-sm-2" for="content">내용</label>
						<div class="col-sm-10">
							<input type="hidden" id="action" name="action"
								value="contentInsert">
							<textarea class="form-control" name="content" id="content"
								rows="5"></textarea>
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
					<div class="form-group" id="photo_div" style="display: none;">
						<div class="filebox control-label col-sm-2">사진</div>
						<div class="filebox col-sm-10">
							<a id="photoview" href="" data-lightbox="image-999999"
								data-title="사진"> <img class="img-responsive img-thumbnail"
								src="" id="photo"
								style="width: 50%; height: 50%; position: relative; overflow: hidden;">
							</a> <br />
							<a id="photoDel" href="#" class="hidden">삭제</a>
						</div>
					</div>

					<!-- 지도 -->
					<div class="form-group" id="map_div">
						<div class="control-label col-sm-2">지도</div>
						<div class="col-sm-10">
							<div class="map_wrap col-sm-12">
								<div id="map"
									style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
								<div id="menu_wrap" class="bg_white">
									<div class="row">
										<div class="option col-sm-8">
											<input class="form-control input-sm m-bot15" type="text"
												value="서울역" id="keyword" style="height: 20px;"> 
										</div>
										<div class="col-sm-offset-1">
											<label class="col-sm-1"></label>
											<button id="map_search" class="btn btn-primary" type="submit">검색하기</button>
										</div>
									</div>
									<hr>
									<div class="row">
										<ul id="placesList"></ul>
										<div id="pagination"></div>
									</div>
								</div>
							</div>
							<a id="mapDel" href="#" class="d">닫기</a>
						</div>
					</div>

					<div class="form-group">
						<div class="control-label col-sm-2">
							<button id="mapbtn" class="btn btn-success mapbtn">
								<span class="fa fa-globe" style="color: limegreen;"></span> 지도
							</button>
						</div>
						<div class="filebox control-label col-sm-1">
							<label for="file" class="filebtn btn btn-primary"><span
								class="fa fa-camera-retro" style="color: #007aff;"></span> 사진</label> <input
								type="file" id="file" name="file"
								accept="image/gif, image/jpeg, image/png, image/bmp#">
						</div>
						<div class="filebox control-label col-sm-offset-1 col-sm-4">
							<button type="button" id="docWriteSubmitBt"
								class="btn btn-primary btn-block">등록</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=3d4e4c724fafd5907ed9e9da045588fb&query&libraries=services"></script>
<script>
//위치정보 삭제
function mapLocDel() {
	$("#mapLoc").attr("value","")
	$("#mapXY").attr("value","")
	$("#loc_div").slideUp(1000)
}
</script>