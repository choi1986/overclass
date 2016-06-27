<%@page import="kr.co.overclass.dto.DocumentDTO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.overclass.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% UserVO user2 = (UserVO)session.getAttribute("login"); %>
<% List<DocumentDTO> dto = (List<DocumentDTO>)request.getAttribute("friendlist"); %>
<div class="col-sm-offset-3 col-sm-6">
	<div class="container">
		<section class="panel">
			<header class="panel-heading"> <strong>친구 목록</strong> </header>
			<table class="table table-hover">
				<thead>
					<tr>
						<th><h4>프로필</h4></th>
						<th><h4>아이디</h4></th>
						<th><h4>이름</h4></th>
					</tr>
				</thead>
				<c:forEach items="${friendlist }" var="UserVO">
				<tbody>
					<tr class="friendTB" onclick="friendAdd('${UserVO.user_id }')">
						<td><img class="img-circle" src="${UserVO.user_image}" width='40px' height='40px'></td>
						<td><h4><strong>${UserVO.user_id }</strong></h4></td>
						<td><h4>${UserVO.user_name }</h4></td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
		</section>
	</div>
</div>



<footer>
	<!-- 페이징버튼 -->
	<div id="page_div" class="col-sm-offset-2 col-sm-9">
		<div class="col-sm-offset-3 col-sm-10">
			<div class="btn-toolbar">
				<div class="btn-group">
					<c:if test="${pageMaker.prev }">
					<a href="/overclass/find/tagfindpage?page=${pageMaker.startPage -1 }">
						<button class="btn btn-default" type="button">«</button>
					</a>
					</c:if>
				</div>
				<div class="btn-group">
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					<a href="/overclass/find/tagfindpage?page=${idx }">
						
						<button class="<c:out value="${pageMaker.cri.page == idx?'btn btn-primary active':'btn btn-primary' }"/>">${idx }</button>
					</a>
					</c:forEach>
				</div>
				<div class="btn-group">
					<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
					<a href="/overclass/find/tagfindpage?page=${pageMaker.endPage +1 }">
						<button class="btn btn-default" type="button">»</button>
					</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!--페이징버튼-->
</footer>
<script type="text/javascript">
function friendAdd(user) {
	BootstrapDialog.show({
		title: '', //알러트 타이틀 이름
		message: '['+user+'] 친구 추가를 하시겠습니까?', //알러트 내용
		buttons: [{ //알러트 버튼 정의
			icon: 'fa fa-check', //알러트버튼에 넣을 아이콘
			label: '추가', //알러트 버튼 이름
			cssClass: 'btn-primary', //알러트 버튼 색바꾸기
			action: function(confirm) {
				alert("친구추가!"+user);
				confirm.close();
			}
			},{
				label: '닫기',
				action: function(cancel){
					cancel.close();
					}
			}]
	})
}
//신고
</script>