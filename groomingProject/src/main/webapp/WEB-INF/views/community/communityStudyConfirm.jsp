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
	#studyImg {
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
					<svg id="studyImg" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-book" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						<path fill-rule="evenodd" d="M3.214 1.072C4.813.752 6.916.71 8.354 2.146A.5.5 0 0 1 8.5 2.5v11a.5.5 0 0 1-.854.354c-.843-.844-2.115-1.059-3.47-.92-1.344.14-2.66.617-3.452 1.013A.5.5 0 0 1 0 13.5v-11a.5.5 0 0 1 .276-.447L.5 2.5l-.224-.447.002-.001.004-.002.013-.006a5.017 5.017 0 0 1 .22-.103 12.958 12.958 0 0 1 2.7-.869zM1 2.82v9.908c.846-.343 1.944-.672 3.074-.788 1.143-.118 2.387-.023 3.426.56V2.718c-1.063-.929-2.631-.956-4.09-.664A11.958 11.958 0 0 0 1 2.82z"/>
  						<path fill-rule="evenodd" d="M12.786 1.072C11.188.752 9.084.71 7.646 2.146A.5.5 0 0 0 7.5 2.5v11a.5.5 0 0 0 .854.354c.843-.844 2.115-1.059 3.47-.92 1.344.14 2.66.617 3.452 1.013A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.276-.447L15.5 2.5l.224-.447-.002-.001-.004-.002-.013-.006-.047-.023a12.582 12.582 0 0 0-.799-.34 12.96 12.96 0 0 0-2.073-.609zM15 2.82v9.908c-.846-.343-1.944-.672-3.074-.788-1.143-.118-2.387-.023-3.426.56V2.718c1.063-.929 2.631-.956 4.09-.664A11.956 11.956 0 0 1 15 2.82z"/>
					</svg>
					<b style="vertical-align: middle;">내 스터디 인증하기</b>
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
			<!-- ------------------ 내 스터디 인증 ------------------- -->
			<div class="col-sm-11">
				<!-- ------------------ 정렬 -------------------------- -->
				<div class="col-sm-12" style="height: 42px;">
				&nbsp;&nbsp;&nbsp;
					<input type="radio" id="rf_1_ra" name="filter_ra" style="vertical-align: sub;"><label style="vertical-align: sub;" for="rf_1_ra">&nbsp;최신순</label>&nbsp;&nbsp;&nbsp;
					<input type="radio" id="rf_2_ra" name="filter_ra" style="vertical-align: sub;"><label style="vertical-align: sub;" for="rf_2_ra">&nbsp;좋아요 순</label>&nbsp;&nbsp;&nbsp;
					<input type="button" value="올리기" class="btn btn-info" style="margin-left: 750px;">
					<br><br>
				</div>
				<!-- ------------------ 정렬 -------------------------- -->
				<div class="row">
  					<div class="col-md-4">
    					<div class="thumbnail">
      						<a href="#">
        						<img src="${contextPath }/resources/views/images/studyImg.jpg" style="width:400px; height: 300px">
      						</a>
    					</div>
  					</div>
  					<div class="col-md-4">
    					<div class="thumbnail">
      						<a href="#">
        						<img src="${contextPath }/resources/views/images/studyImg.jpg" style="width:400px; height: 300px">
      						</a>
    					</div>
  					</div>
  					<div class="col-md-4">
    					<div class="thumbnail">
      						<a href="#">
        						<img src="${contextPath }/resources/views/images/studyImg.jpg" style="width:400px; height: 300px">
      						</a>
    					</div>
  					</div>
  					<div class="col-md-4">
    					<div class="thumbnail">
      						<a href="#">
        						<img src="${contextPath }/resources/views/images/studyImg.jpg" style="width:400px; height: 300px">
      						</a>
    					</div>
  					</div>
  					<div class="col-md-4">
    					<div class="thumbnail">
      						<a href="#">
        						<img src="${contextPath }/resources/views/images/studyImg.jpg" style="width:400px; height: 300px">
      						</a>
    					</div>
  					</div>
  					<div class="col-md-4">
    					<div class="thumbnail">
      						<a href="#">
        						<img src="${contextPath }/resources/views/images/studyImg.jpg" style="width:400px; height: 300px">
      						</a>
    					</div>
  					</div>
				</div>
			</div>
			<div class="col-sm-1"></div>
			<!-- ------------------ 내 스터디 인증 ------------------- -->
		</div>
		<!-- ----------------------- 메인 화면 테이블 ------------------ -->
	</div>
	
</body>
</html>