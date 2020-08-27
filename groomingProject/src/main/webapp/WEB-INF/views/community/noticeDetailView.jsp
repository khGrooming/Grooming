<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Grooming</title>
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.servletContext.contextPath }/resources/views/images/grooming_logo(100x100).png">

<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

<!-- -------------- style 부분------------- -->
<style type="text/css">
	.table_ra>tbody>tr>td, .table_ra>tbody>tr>th, .table_ra>tfoot>tr>td, .table_ra>tfoot>tr>th, .table_ra>thead>tr>td, .table_ra>thead>tr>th {
    	vertical-align: middle;
    	text-align:center;
	}
	#noticeIcon {
    	vertical-align: bottom;
    	color: red;
	}
</style>
<!-- -------------- style 부분------------- -->
</head>
<body>
	<jsp:include page="../common/mainNavigationBar.jsp"/>
	<div class="col-sm-2">
		<jsp:include page="../common/communityBar.jsp"/>
	</div>
	<!-- ----------------------- 메인 화면 테이블 ------------------ -->
	<div class="col-sm-10">
	<!-- ------------------ 공지사항 상세보기 ------------------- -->
		<div class="col-sm-1"></div>
		<div class="col-sm-8">
			<div align="center">
				<h1>
					<svg id="noticeIcon" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-volume-up-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						<path d="M11.536 14.01A8.473 8.473 0 0 0 14.026 8a8.473 8.473 0 0 0-2.49-6.01l-.708.707A7.476 7.476 0 0 1 13.025 8c0 2.071-.84 3.946-2.197 5.303l.708.707z"/>
						<path d="M10.121 12.596A6.48 6.48 0 0 0 12.025 8a6.48 6.48 0 0 0-1.904-4.596l-.707.707A5.483 5.483 0 0 1 11.025 8a5.483 5.483 0 0 1-1.61 3.89l.706.706z"/>
  						<path d="M8.707 11.182A4.486 4.486 0 0 0 10.025 8a4.486 4.486 0 0 0-1.318-3.182L8 5.525A3.489 3.489 0 0 1 9.025 8 3.49 3.49 0 0 1 8 10.475l.707.707z"/>
  						<path fill-rule="evenodd" d="M6.717 3.55A.5.5 0 0 1 7 4v8a.5.5 0 0 1-.812.39L3.825 10.5H1.5A.5.5 0 0 1 1 10V6a.5.5 0 0 1 .5-.5h2.325l2.363-1.89a.5.5 0 0 1 .529-.06z"/>
					</svg>
					<b style="vertical-align: middle;">공 지 사 항</b>
				</h1>
				<br>
			</div>	
			<c:if test="${ loginUser.memberAdmin eq 'Y' }">
				<div class="col-sm-12">
					<input type="button" value="글쓰기" class="btn btn-info" style="margin-left: 640px;"
									onclick="location.href='noticeInsertView.do'">
					<br><br>
				</div>
			</c:if>
			<table align="center" border="1" cellspacing="0" width="400">
				<tr>
					<td>제목</td>
					<td>${board.boardTitle }</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${board.memberNickName }</td>
				</tr>
				<tr>
					<td>작성날짜</td>
					<td>${board.boardCreateDate }</td>
				</tr>
				<tr>
					<td>작성내용</td>
					<td>${board.boardContent }</td>
				</tr>	
				<c:url var="noticeUpdateView" value="noticeUpdateView.do">
					<c:param name="boardNo" value="${board.boardNo }" />
				</c:url>
				<c:url var="noticeDelete" value="noticeDelete.do">
					<c:param name="boardNo" value="${board.boardNo }" />
				</c:url>
				<c:if test="${loginUser.memberNo eq board.memberNo }">	
					<tr>
						<td colspan="2" align="center">
							<a href="${noticeUpdateView }">수정하기</a>
							<a href="${noticeDelete }">삭제하기</a>
						</td>
					</tr>
				</c:if>
			</table>
		</div>
		<div class="col-sm-3"></div>
		<!-- ------------------ 공지사항 상세보기 ------------------- -->
	</div>
	<!-- ----------------------- 메인 화면 테이블 ------------------ -->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>