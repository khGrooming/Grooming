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
	.Img_ra{
		width:40px;
		height:40px;
	}
	.table_ra>tbody>tr>td, .table_ra>tbody>tr>th, .table_ra>tfoot>tr>td, .table_ra>tfoot>tr>th, .table_ra>thead>tr>td, .table_ra>thead>tr>th {
    	vertical-align: middle;
    	text-align:center;
	}
	.tagKind {
	    color: blue;
    	padding: 5px;
    	margin-right: 50px;
    	margin-left: 30px;
    	font-size: 13px;
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
			<!-- ------------------ 랭킹 시스템 -------------------- -->
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<table class="table table_ra">
					<thead>
						<tr>
							<th>순위</th>
							<th>닉네임</th>
							<th>채택 수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><img class="Img_ra" alt="1st" src="${contextPath }/resources/views/images/1st.PNG"></td>
							<td>이아라</td>
							<td>100</td>
						</tr>
						<tr>
							<td><img class="Img_ra" alt="2st" src="${contextPath }/resources/views/images/2st.PNG"></td>
							<td>이아라</td>
							<td>100</td>
						</tr>
						<tr>
							<td><img class="Img_ra" alt="3st" src="${contextPath }/resources/views/images/3st.PNG"></td>
							<td>이아라</td>
							<td>100</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-sm-3"></div>
			<!-- ------------------ 랭킹 시스템 -------------------- -->
			<!-- ------------------ 정렬 ------------------------- -->
			<div class="col-sm-12">
				&nbsp;&nbsp;&nbsp;
				<input type="radio" id="rf_1_ra" name="filter_ra"><label for="rf_1_ra">&nbsp;최신순</label>&nbsp;&nbsp;&nbsp;
				<input type="radio" id="rf_2_ra" name="filter_ra"><label for="rf_2_ra">&nbsp;조회순</label>&nbsp;&nbsp;&nbsp;
				<input type="radio" id="rf_3_ra" name="filter_ra"><label for="rf_3_ra">&nbsp;댓글순</label>&nbsp;&nbsp;&nbsp;
			</div>
			<!-- ------------------ 정렬 ------------------------- -->
			<!-- ------------------ 게시글 리스트 ------------------- -->
			<div class="col-sm-12">
				<table class="table table_ra">
					<thead>
						<tr>
							<th>글 번호</th>
							<th>글 제목</th>
							<th>닉네임</th>
							<th>조회 수</th>
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
			<!-- ------------------ 게시글 리스트 ------------------- -->
		</div>
		<!-- ----------------------- 메인 화면 테이블 ------------------ -->
	</div>
</body>
</html>