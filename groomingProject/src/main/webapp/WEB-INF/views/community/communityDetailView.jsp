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
	<!-- ------------------ 상세보기 ------------------- -->
		<div class="col-sm-1"></div>
		<div class="col-sm-8">
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
				<c:url var="communityUpdateView" value="communityUpdateView.do">
					<c:param name="boardNo" value="${board.boardNo }" />
				</c:url>
				<c:url var="communityDelete" value="communityDelete.do">
					<c:param name="boardNo" value="${board.boardNo }" />
				</c:url>
				<c:if test="${loginUser.memberNo eq board.memberNo }">	
					<tr>
						<td colspan="2" align="center">
							<a href="${communityUpdateView }">수정하기</a>
						</td>
						<td colspan="2" align="center">
							<a href="${communityDelete }">삭제하기</a>
						</td>
					</tr>
				</c:if> 
			</table>
		</div>
		<div class="col-sm-3"></div>
		<!-- ------------------ 상세보기 ------------------- -->
	</div>
	<!-- ----------------------- 메인 화면 테이블 ------------------ -->
	
	
</body>
</html>