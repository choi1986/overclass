<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>OVERCLASS</title>
<!-- CSS -->
	<!-- 부트스트랩 -->
	<link href="/overclass/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="/overclass/resources/css/bootstrap-theme.css" rel="stylesheet">
	<!-- 라이트박스 -->
	<link rel="stylesheet" href="/overclass/resources/css/lightbox.css">
	<!-- 부트스트랩모달 -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.9/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css">
	<!-- 아이콘 -->
	<link href="/overclass/resources/css/elegant-icons-style.css" rel="stylesheet">
	<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" >
	<!-- 스타일 -->
	<link href="/overclass/resources/css/style.css" rel="stylesheet">
	<link href="/overclass/resources/css/style-responsive.css" rel="stylesheet">
	<!-- 애니메이션 -->
	<link href="/overclass/resources/css/animate.css" type="text/css" rel="stylesheet">
	<!-- 파일버튼숨기기 -->
	<link href="/overclass/resources/css/fileboxcss.css" rel="stylesheet">
	<!-- 지도 -->
	<link href="/overclass/resources/css/map.css" rel="stylesheet">
<!-- CSS끝 -->

<!-- JS -->
	<!-- 제이쿼리 -->
	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<!-- 부트스트랩 -->
	<script src="/overclass/resources/js/bootstrap.min.js"></script>
	<!-- 부트스스트랩모달 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.9/js/bootstrap-dialog.min.js"></script>
	<!-- 제이쿼리ui -->
	<script src="/overclass/resources/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="/overclass/resources/js/bootstrap-switch.js"></script>
	<!-- 태그 -->
	<script src="/overclass/resources/js/jquery.tagsinput.js"></script>
	<script src="/overclass/resources/js/form-component.js"></script>
	<!-- 애니메이션 -->
	<script src="/overclass/resources/js/animation.js"></script>
	<script src="/overclass/resources/js/jquery.cookie.js"></script>
	<!-- handlebars (댓글) -->
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
  	<!-- 스크롤업 -->
  	<script src="/overclass/resources/js/jquery.scrollUp.js"></script>
<!-- JS끝 -->
</head>
<body>
<!-- 이미지 지도를 표시할 div 입니다 -->
<div id="staticMap" style="width: 100%; height: 667px; position: relative; overflow: hidden;" onclick="window.close();"></div>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=3d4e4c724fafd5907ed9e9da045588fb&query&libraries=services"></script>
<script>
var mapX = ${mapinfo.mapX}
var mapY = ${mapinfo.mapY}
var mapLoc = '${mapinfo.mapLoc}'
// 이미지 지도에 표시할 마커입니다
// 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
var markers = [
    {
        position: new daum.maps.LatLng(mapX, mapY)
    },
    {
        position: new daum.maps.LatLng(mapX, mapY), 
        text: mapLoc // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
    }
];

var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
    staticMapOption = { 
        center: new daum.maps.LatLng(mapX, mapY), // 이미지 지도의 중심좌표
        level: 3, // 이미지 지도의 확대 레벨
        marker: markers // 이미지 지도에 표시할 마커 
    };    

// 이미지 지도를 생성합니다
var staticMap = new daum.maps.StaticMap(staticMapContainer, staticMapOption);
</script>