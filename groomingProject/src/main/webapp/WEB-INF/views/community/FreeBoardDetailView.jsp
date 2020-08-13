<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.servletContext.contextPath }/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- -------------- style 부분------------- -->
<style type="text/css">    
	.table_ra>tbody>tr>td, .table_ra>tbody>tr>th, .table_ra>tfoot>tr>td, .table_ra>tfoot>tr>th, .table_ra>thead>tr>td, .table_ra>thead>tr>th {
    	vertical-align: middle;
    	text-align:center;
	}
	#freeIcon {
    	vertical-align: bottom;
    	color: gray;
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
			<div class="col-sm-11" align="center">
				<h1>
					<svg id="freeIcon" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-journal-text" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						<path d="M4 1h8a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2h1a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H4a1 1 0 0 0-1 1H2a2 2 0 0 1 2-2z"/>
 		 				<path d="M2 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H2zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H2zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H2z"/>
  						<path fill-rule="evenodd" d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
					</svg>
					<b style="vertical-align: middle;">자유 게시판</b>
				</h1>
				<br>
			</div>	
			<!-- ------------------ 자유 게시판 ------------------- -->
			<div class="col-sm-11">
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
<%-- 					<c:url var="noticeUpdateView" value="noticeUpdateView.do">
						<c:param name="boardNo" value="${board.boardNo }" />
					</c:url>
					<c:url var="noticeDelete" value="noticeDelete.do">
						<c:param name="boardNo" value="${board.boardNo }" />
					</c:url>
					<c:if test="${loginUser.memberNo eq board.memberNo }">	
						<tr>
							<td colspan="2" align="center">
								<a href="${# }">수정하기</a>
								<a href="${ #}">삭제하기</a>
							</td>
						</tr> 
					</c:if>--%>
				</table>
			</div>
			<div class="col-sm-1"></div>
			<!-- ------------------ 자유 게시판 ------------------- -->
		</div>
		<!-- ----------------------- 메인 화면 테이블 ------------------ -->
	
</body>
</html>