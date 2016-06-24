<%@page import="java.util.List"%>
<%@page import="kr.co.overclass.domain.UserVO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@include file="../include/header.jsp"%>
<!-- 헤더끝 -->
<% UserVO user = (UserVO)session.getAttribute("login"); %>
<section id="my_page" class="wrapper">

	<div class="row">
		<div class="col-lg-12">
			<section class="panel">
				<div class="panel-body">
					<div id="recent-activity" class="tab-pane active">
						<div class="profile-activity">
							<div class="col-lg-offset-3 col-lg-5 portlets">
							
								<!-- 글쓰기폼 시작 -->
								<%-- <%@include file="../include/write.jsp"%> --%>
								<!-- 글쓰기폼 끝 -->


							</div>

							<div class="col-lg-4">
								<div class="row">
									<div class="col-md-offset-7 col-md-2 portlets">
									</div>
								</div>
							</div>

							<!-- 게시글시작 -->
							<%@ include file="../include/findboard.jsp"%>
							<!-- 게시글폼 끝 -->

						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</section>

<!-- 라이트박스 스크립트 -->
<script src="/overclass/resources/js/lightbox.js"></script>
<script>
lightbox.option({
    'disableScrolling' : true,
    'showImageNumberLabel' : false,
    'fadeDuration' : 700
})
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(status, data, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data.places);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i], marker); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });
            
            daum.maps.event.addListener(marker, 'click', function() {
            	var markerPostion = marker.getPosition();
            	/* alert("좌표: "+markerPostion) */
	           	searchDetailAddrFromCoords(markerPostion, function(status, result) {
			        if (status === daum.maps.services.Status.OK) {
			            /* var detailAddr = !!result[0].roadAddress.name ? '<div>도로명주소 : ' + result[0].roadAddress.name + '</div>' : '';
			            
			            detailAddr += '<div>지번 주소 : ' + result[0].jibunAddress.name + '</div>';
			            
			            var content = '<div class="bAddr">' +
			                            '<span class="title">법정동 주소정보</span>' + 
			                            detailAddr + 
			                        '</div>'; */
			        	/* alert("도로명: "+result[0].roadAddress.name) */
			        	document.getElementById("loc_div").setAttribute("style","display:''")
			        	document.getElementById("map_div").setAttribute("style","display: none;")
			        	var addrName = result[0].roadAddress.name
			        	var locDiv = document.getElementById('loc');
			            var locInput = document.getElementById('mapLoc');
			            var mapXY = document.getElementById('mapXY');
			           	locInput.setAttribute("value",addrName+' ['+title+']')
			           	mapXY.setAttribute("value",markerPostion)
			            locDiv.innerHTML = '<span class="fa fa-map-marker" style="color: green"></span>'
			            +'<span> '+addrName+'</span>'
			            +'<span> <b>['+title+']</b></span><span style="color: black;"> 에서</span>';
			        }
       	    	})
            })

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
            
            itemEl.onclick = function() {
            	var markerPostion = marker.getPosition();
            	searchDetailAddrFromCoords(markerPostion, function(status, result) {
			        if (status === daum.maps.services.Status.OK) {
			            /* var detailAddr = !!result[0].roadAddress.name ? '<div>도로명주소 : ' + result[0].roadAddress.name + '</div>' : '';
			            
			            detailAddr += '<div>지번 주소 : ' + result[0].jibunAddress.name + '</div>';
			            
			            var content = '<div class="bAddr">' +
			                            '<span class="title">법정동 주소정보</span>' + 
			                            detailAddr + 
			                        '</div>'; */
			        	/* alert("도로명: "+result[0].roadAddress.name) */
			        	document.getElementById("loc_div").setAttribute("style","display:''")
			        	document.getElementById("map_div").setAttribute("style","display: none;")
			        	var addrName = result[0].roadAddress.name
			        	var locDiv = document.getElementById('loc');
			            var locInput = document.getElementById('mapLoc');
			            var mapXY = document.getElementById('mapXY');
			           	locInput.setAttribute("value",addrName+' ['+title+']')
			           	mapXY.setAttribute("value",markerPostion)
			            locDiv.innerHTML = '<span class="fa fa-map-marker" style="color: green"></span>'
			            +'<span> '+addrName+'</span>'
			            +'<span> <b>['+title+']</b></span><span style="color: black;"> 에서</span>';
			        }
       	    	})
			}
            
        })(marker, places[i].title);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.title + '</h5>';

    if (places.newAddress) {
        itemStr += '    <span>' + places.newAddress + '</span>' +
                    '   <span class="jibun gray">' +  places.address  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2detailaddr(coords, callback);
}
</script>
</body>

<!-- 쪽지 리스트처리를 위한 템플릿 -->
<script id="msgtemp" type="text/x-handlebars-template">
<li>
	<a href='/overclass/chat'>
		<span class="photo">
			<img alt="avatar" width='30' height='30' src='{{user_image}}'></span>
		<span class="subject">
			<span class="from">{{sender}}</span>
			<span class="time">{{writedate}}전</span>
		</span>
		<span class="subject">{{content}}</span>
	</a>
</li>
	

</script>
<script id="msgtoptemp" type="text/x-handlebars-template">
<div class="notify-arrow notify-arrow-blue"></div>
						<li>
							<p class="blue">새로운 쪽지 {{count}}개</p>
						</li>
</script>

<script type="text/javascript">
var msg_source = $("#msgtemp").html();
var msg_template = Handlebars.compile(msg_source);
var msgtop_source = $("#msgtoptemp").html();
var msgtop_template = Handlebars.compile(msgtop_source);

var timer;
var msgid;

$(document).ready(function() {
	$.ajax({
		url : "/overclass/msg/sitebarCount",
		type:'POST',
		data:{
			user_id:'<%=user.getUser_id()%>'
		},
		success : function(success) {
			$("#sitebarMsgCount").html(success);
		}
	});
	
	//사진미리보기
	function readURL(input) {
		if (input.files && input.files[0]) {
			var file = input.files[0].name;
			var img_format = "\.(bmp|gif|jpg|jpeg|png)$"; 
			
		    if(!(new RegExp(img_format, "i")).test(file)){
		    	BootstrapDialog.show({
		    		title: '', //알러트 타이틀 이름
		    		message: '이미지 파일만 첨부 가능합니다..', //알러트 내용
		    		type: BootstrapDialog.TYPE_DANGER,
		    		buttons: [{ //알러트 버튼 정의
		    				icon: 'fa fa-check',
		    				label: '확인',
		    				cssClass: 'btn-danger',
		    				action: function(cancel){
		    					cancel.close();
		   					}
		    			}]
		    	})
			    $('#photo_div').slideUp(1000)
		        $('#file').val('');
		    	return;
		    }
		    
			var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성d
			reader.onload = function(e) {
				//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
				$('#photo').attr('src', e.target.result);
				$('#photoview').attr('href', e.target.result);
				$('#photo_div').slideDown(1000)
				$('#photo_div a').attr("class","")
				//이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
				//(아래 코드에서 읽어들인 dataURL형식)
			}
				reader.readAsDataURL(input.files[0]);
			//File내용을 읽어 dataURL형식의 문자열로 저장
		}
	}//readURL()

	//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
	$("#file").change(function() {
		//alert(this.value); //선택한 이미지 경로 표시
		if(this.value != "") {
			readURL(this);
		} else {
			$('#photo_div').slideUp(1000)
		}
	});
	
	//사진 삭제버튼
	$('#photoDel').click(function() {
        $('#photo_div').slideUp(1000)
        $('#file').val(""); //전달한 양식 초기화
	})
	
	   //   댓글div 열닫
	   $(".wminimize").click(function() {
	      
	      // dno
	      var divNum = this.firstChild.nextSibling.firstChild.nodeValue;
	      var divtemp = '#reply_div'+divNum;
	      var divtemp2 = '#reply_icon'+divNum+'_2'
	      var divtemp3 = '#reply_div_page_'+divNum
	      
	      //var div = $("#reply_div")
	      var div = $(divtemp);
	      var div2 = $(divtemp2);
	      var div3 = $(divtemp3);
	      div.slideToggle("slow")
	      // 열고
	      if(div2.attr("class") == "fa fa-chevron-up"){
	         div2.attr("class","fa fa-chevron-down")
	         replyDisplayPage(divNum,1);
	      } else {
	         //닫고
	         div2.attr("class","fa fa-chevron-up")
	         div3.attr("style","display: none;")
	      }
	   })
	   // 좋아요클릭
	   $(".goodclass").click(function() {
	      
	      // 이게 dno
	      var goodtemp = this.firstChild.nextSibling.firstChild.nodeValue;
	      //var goodtemp = this.firstChild.nextSibling.nextSibling.nextSibling;
	      var goodtmp = '#good_icon'+goodtemp;
	      var goodcount = '#good_count'+goodtemp;
	      
	      //var div = $("#reply_div")
	      var goodspan = $(goodtmp);
	      if(goodspan.attr("class") == "fa fa-lg fa-thumbs-o-up"){
	    	// 여기가 좋아요
	         $.ajax({
	        	 url:'/overclass/good/',
	        	 type:'post',
				headers:{
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"POST"
				},
				data:JSON.stringify({
					good_user:'<%=user.getUser_id()%>',
					dno:goodtemp
				}),
				success:function(result){
					//$(goodcount).val(result);
					$(goodcount).html('&nbsp'+result);
			        goodspan.attr("class","fa fa-lg fa-thumbs-up");
				}
	         });
	      } else {
	         // 여기가 좋아요 취소
	         $.ajax({
	        	 url:'/overclass/good/delete',
	        	 type:'post',
				headers:{
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"POST"
				},
				data:JSON.stringify({
					good_user:'<%=user.getUser_id()%>',
					dno:goodtemp
				}),
				success:function(result){
					$(goodcount).html('&nbsp'+result);
					goodspan.attr("class","fa fa-lg fa-thumbs-o-up");
				}
	         });
	      }
	   })
	   
	 
	//지도버튼 show hide
	$("#map_div").hide()
	$("#mapbtn").click(function() {
		$("#map_div").slideToggle(1000)
		/* alert($("#map_div").height()) */
	})
	
	//지도 닫기버튼
	$('#mapDel').click(function() {
        $('#map_div').slideUp(1000)
	})
	
	//글등록 모달정의
	$("#docWriteSubmitBt").click(function() {
		if($("#content").val().trim() == "") {
			BootstrapDialog.show({
	    		title: '', //알러트 타이틀 이름
	    		message: '글을 입력해주세요', //알러트 내용
	    		buttons: [{ //알러트 버튼 정의
	    			icon: 'fa fa-check', //알러트버튼에 넣을 아이콘
	    			label: '확인', //알러트 버튼 이름
	    			cssClass: 'btn-primary', //알러트 버튼 색바꾸기
	    			hotkey:13,
	    			action: function(confirm) {
	    				confirm.close()
					}
    			}]
	    	})
		} else {
			BootstrapDialog.show({
	    		title: '', //알러트 타이틀 이름
	    		message: '글을 등록 하시겠습니까?', //알러트 내용
	    		buttons: [{ //알러트 버튼 정의
	    			id: 'docWriteBt', //알러트 버튼의 아이디
	    			icon: 'fa fa-check', //알러트버튼에 넣을 아이콘
	    			label: '등록', //알러트 버튼 이름
	    			cssClass: 'btn-primary', //알러트 버튼 색바꾸기
	    			action: function(confirm) {
	    				var formObj = $("#writeDoc");
	    				formObj.attr({action:'/overclass/main/writeDoc',method:'post',onsubmit:''});
	    				formObj.submit();
	    				confirm.close()
					}
	    			},{
	    				label: '취소',
	    				action: function(cancel){
	    					cancel.close();
	    					}
	    			}]
	    	})
		}
	})
	
	//글쓰기 폼 클릭시
	$("#content_body").hide()
	$("#content_form").click(function() {
		$("#content_body").slideToggle(1000); //글쓰기아이콘 누르면 슬라이드 효과
		if ($("#content_icon").attr("class") == "fa fa-chevron-up") { //글쓰기아이콘 바꾸기
			$("#content_icon").attr("class","fa fa-chevron-down")
		} else {
			$("#content_icon").attr("class","fa fa-chevron-up")
		}
	})
	
	// 사이트바 쪽지 클릭 이벤트
	$("#mail_notificatoin_bar").click(function() { 
		$.ajax({
			url : "/overclass/msg/sitebar",
			type:'POST',
			data:{
				user_id:'<%=user.getUser_id()%>'
			},
			success : function(success) {
				var htmlTxt = msgtop_template(success);
				for(var i=0; i<success.list.length; i++){
					htmlTxt+=msg_template(success.list[i]);
				}
				$("#msg4").html(htmlTxt);
			}
		});
	});

	$("#alert_notificatoin_bar").click(function() { // 알림바 알림 클릭 이벤트
		$.ajax({
			url : "addfunctionaction.do?action=notice",
			success : function(success) {
				$("#alert_notificatoin_bar").html(success);
			}
		})
	})
	
	$("#dropdown_alr").click(function() {
		$("#dropdown_alr").slideToggle("slow")
	})
}); //ready


function msg_open(msgidnum) {
	var msg = document.getElementById(msgidnum);
	$.ajax({
		url : "addfunctionaction.do?action=msg_open",
		data : {
			user_id : msg.firstChild.nodeValue
		},
		success : function(success) {
			$("#msg_body").html(success);
			document.getElementById('msg_scroll').scrollTop = document
					.getElementById('msg_scroll').scrollHeight;
		},
		error : function(xhr) {
			alert("에러:" + xhr.status)
		}
	})//ajax()
}

function msg_write() {
	var msg_content = document.getElementById('msg_write_content').value;
	var msg_to_user = document.getElementById('msg_write_to').value;
	var msg_from_user = document.getElementById('msg_write_from').value;
	$.ajax({
		url : "addfunctionaction.do?action=msg_write",
		data : {
			msg_to : msg_to_user,
			msg_from : msg_from_user,
			content : msg_content
		},
		success : function(result) {
			$("#msg_body").html(result);
			document.getElementById('msg_scroll').scrollTop = document
					.getElementById('msg_scroll').scrollHeight;
		}
	})
}

//스크롤업
function enterKey(e) {
	if (e.keyCode == 13) { /* IE기준으로 설명 */
		msg_write();
		return false;
	} else
		return true;
}

$(function () {
    $.scrollUp({
        animation: 'fade',
        scrollImg: {
            active: true,
            type: 'background',
            src: 'img/top.png'
        }
    });
});
$('#scrollUpTheme').attr('href', '/overclass/resources/css/image.css?1.1');
$('.image-switch').addClass('active');

</script>
</html>