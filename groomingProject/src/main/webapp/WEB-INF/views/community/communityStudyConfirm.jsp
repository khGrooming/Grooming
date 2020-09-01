<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><!-- -------------- style 부분------------- -->
<style type="text/css">
	#studyImg {
    	vertical-align: bottom;
    	color: gray;
	}
	.table_ra>tbody>tr>td, .table_ra>tbody>tr>th, .table_ra>tfoot>tr>td, .table_ra>tfoot>tr>th, .table_ra>thead>tr>td, .table_ra>thead>tr>th {
    	vertical-align: middle;
    	text-align:center;
	}
	/* 해시태그 */
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
	<div class="container" align="center">
	<!-- ------------------ 해시태그 검색 -------------------- -->
		
	<!-- ------------------ 정렬 ------------------- -->
		<div class="container" align="left">
			<input type="radio" id="rf_1_ra" name="filter_ra"><label for="rf_1_ra">&nbsp;최신순</label>&nbsp;&nbsp;&nbsp;
			<input type="radio" id="rf_2_ra" name="filter_ra"><label for="rf_2_ra">&nbsp;조회순</label>&nbsp;&nbsp;&nbsp;
			<input type="radio" id="rf_3_ra" name="filter_ra"><label for="rf_3_ra">&nbsp;좋아요 순</label>
			<input type="button" value="글쓰기" class="btn btn-info" style="float: right;"
					onclick="location.href='communityInsertView.do?bCategoryNo=BC00004'">
		</div>
		<br>
	<!-- ------------------ 게시판 -------------------------- -->	
		<div class="container" align="center">
			<div class="row">
				<div class="col-xs-6 col-md-3">
      				<a href="#" class="thumbnail">
        				<img src="${contextPath }/resources/views/images/studyImg.jpg" style="width:245px; height: 245px">
      				</a>
  				</div>
				<div class="col-xs-6 col-md-3">
      				<a href="#" class="thumbnail">
        				<img src="${contextPath }/resources/views/images/studyImg.jpg" style="width:245px; height: 245px">
      				</a>
  				</div>
  				<div class="col-xs-6 col-md-3">
      				<a href="#" class="thumbnail">
        				<img src="${contextPath }/resources/views/images/studyImg.jpg" style="width:245px; height: 245px">
      				</a>
  				</div>
  				<div class="col-xs-6 col-md-3">
      				<a href="#" class="thumbnail">
        				<img src="${contextPath }/resources/views/images/studyImg.jpg" style="width:245px; height: 245px">
      				</a>
  				</div>
			</div>
		</div>
	</div>
	
</body>
</html>