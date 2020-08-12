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
	#PromotionIcon {
    	vertical-align: bottom;
    	color: #e5df10;
	}
	.tagKind {
	    color: blue;
    	padding: 5px;
    	margin-right: 50px;
    	margin-left: 30px;
    	font-size: 13px;
	}
	.hr_ra {
		margin-top: 0px;
		margin-bottom: 10px;
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
					<svg id="PromotionIcon" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-emoji-smile" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						<path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
 	 					<path fill-rule="evenodd" d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683z"/>
  						<path d="M7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
					</svg>
					<b style="vertical-align: middle;">내 스터디 홍보하기</b>
				</h1>
				<br>
			</div>	
			<!-- ------------------ 해시태그 검색 -------------------- -->
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<h4><b>#추천 해시태그</b></h3>
				<hr class="hr_ra">
				<a href="#" class="tagKind">#스터디</a>
				<a href="#" class="tagKind">#스터디</a>
				<a href="#" class="tagKind">#스터디</a>
			</div>
			<div class="col-sm-3"></div>
			<!-- ------------------ 해시태그 검색 -------------------- -->
			<!-- ------------------ 내 스터디 홍보 ------------------- -->
			<div class="col-sm-11">
				<!-- ------------------ 정렬 -------------------------- -->
				<div class="col-sm-12" style="height: 42px;">
				&nbsp;&nbsp;&nbsp;
					<input type="radio" id="rf_1_ra" name="filter_ra" style="vertical-align: sub;"><label style="vertical-align: sub;" for="rf_1_ra">&nbsp;최신순</label>&nbsp;&nbsp;&nbsp;
					<input type="radio" id="rf_2_ra" name="filter_ra" style="vertical-align: sub;"><label style="vertical-align: sub;" for="rf_2_ra">&nbsp;조회순</label>&nbsp;&nbsp;&nbsp;
					<input type="radio" id="rf_3_ra" name="filter_ra" style="vertical-align: sub;"><label style="vertical-align: sub;" for="rf_3_ra">&nbsp;댓글순</label>&nbsp;&nbsp;&nbsp;
					<input type="button" value="글쓰기" class="btn btn-info" style="margin-left: 700px;">
					<br><br>
				</div>
				<!-- ------------------ 정렬 -------------------------- -->
				<table class="table table_ra">
					<thead>
						<tr>
							<th>글 번호</th>
							<th>글 제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td><a href="#" class="tagKind">#스터디</a><br>글 제목이요</td>
							<td>이아라</td>
							<td>0</td>
							<td>20/08/06</td>
						</tr>
						<tr>
							<td>1</td>
							<td><a href="#" class="tagKind">#스터디</a><br>글 제목이요</td>
							<td>이아라</td>
							<td>0</td>
							<td>20/08/06</td>
						</tr>
						<tr>
							<td>1</td>
							<td><a href="#" class="tagKind">#스터디</a><br>글 제목이요</td>
							<td>이아라</td>
							<td>0</td>
							<td>20/08/06</td>
						</tr>
						<tr>
							<td>1</td>
							<td><a href="#" class="tagKind">#스터디</a><br>글 제목이요</td>
							<td>이아라</td>
							<td>0</td>
							<td>20/08/06</td>
						</tr>
						<tr>
							<td>1</td>
							<td><a href="#" class="tagKind">#스터디</a><br>글 제목이요</td>
							<td>이아라</td>
							<td>0</td>
							<td>20/08/06</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-sm-1"></div>
			<!-- ------------------ 내 스터디 홍보 ------------------- -->
		</div>
		<!-- ----------------------- 메인 화면 테이블 ------------------ -->
	</div>
	
</body>
</html>