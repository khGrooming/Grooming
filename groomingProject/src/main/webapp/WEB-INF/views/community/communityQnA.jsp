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
/* font start */
	@font-face { 
		font-family: 'TmoneyRoundWindExtraBold'; 
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') 
			format('woff');
		font-weight: normal; 
		font-style: normal; 
	}
	
	* {
		font-family:"TmoneyRoundWindExtraBold";
	}
/* font end */
</style>

<style type="text/css">
	.table_ra>tbody>tr>td, .table_ra>tbody>tr>th, .table_ra>tfoot>tr>td, .table_ra>tfoot>tr>th, .table_ra>thead>tr>td, .table_ra>thead>tr>th {
    	vertical-align: middle;
    	text-align:center;
	}
	#QA_ra {
    	vertical-align: bottom;
    	color: gray;
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
					<svg id="QA_ra" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-question-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						<path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  						<path d="M5.25 6.033h1.32c0-.781.458-1.384 1.36-1.384.685 0 1.313.343 1.313 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.007.463h1.307v-.355c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.326 0-2.786.647-2.754 2.533zm1.562 5.516c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"/>
					</svg>
					<b style="vertical-align: middle;">Q & A</b>
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
			<!-- ------------------ Q & A ------------------- -->
			<div class="col-sm-11">
				<!-- ------------------ 정렬 -------------------------- -->
				<div class="col-sm-12" style="height: 42px;">
				&nbsp;&nbsp;&nbsp;
					<input type="radio" id="rf_1_ra" name="filter_ra" style="vertical-align: sub;"><label style="vertical-align: sub;" for="rf_1_ra">&nbsp;최신순</label>&nbsp;&nbsp;&nbsp;
					<input type="radio" id="rf_2_ra" name="filter_ra" style="vertical-align: sub;"><label style="vertical-align: sub;" for="rf_2_ra">&nbsp;조회순</label>&nbsp;&nbsp;&nbsp;
					<input type="radio" id="rf_3_ra" name="filter_ra" style="vertical-align: sub;"><label style="vertical-align: sub;" for="rf_3_ra">&nbsp;댓글순</label>&nbsp;&nbsp;&nbsp;
					<input type="radio" id="rf_4_ra" name="filter_ra" style="vertical-align: sub;"><label style="vertical-align: sub;" for="rf_4_ra">&nbsp;채택순</label>&nbsp;&nbsp;&nbsp;
					<input type="button" value="질문하기" class="btn btn-info" style="margin-left: 630px;">
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
			<!-- ------------------ Q & A ------------------- -->
		</div>
		<!-- ----------------------- 메인 화면 테이블 ------------------ -->
	</div>
	
</body>
</html>