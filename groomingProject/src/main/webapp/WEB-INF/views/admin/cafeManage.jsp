<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신고 관리</title>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
    <style>
        .sideMenu{background-color:blue;border-radius:10%;font-size:large;}
        .admin{height:80px;text-align:center;padding:30px;}
        .sub{height:50px;text-align:center;font-size:small;}
        
        .statisticsMain, .member, .grooming, .declaration{height:100px;background:chartreuse;}

        .declarationInfo{width: 70%;border-collapse: collapse;margin-left:20%;}
        .declarationInfo th,td{height:50px;text-align:center;}
    </style>
</head>
<body>
    <header><jsp:include page="../common/mainNavigationBar.jsp"/></header>
    <section>
        <br><br>
            <h1 align="center">카페 관리</h1>
            <br><br>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-3">
				<br><br>
					<div class="container col-sm-3"></div>
				    <div class="sideMenu col-sm-7">
						<div class="admin"><a href="adminMain.do">통계</a></div>
	                    <div class="admin"><a href="memberManage.do">회원 관리</a></div>
	                    <div class="admin"><a href="groomingManage.do">그루밍 관리</a></div>
	                    <div class="admin"><a href="declarationManage.do">신고 관리</a></div>
	                    <div class="sub"><a href="declarationManage.do">회원 신고 관리</a></div>
	                    <div class="sub"><a href="boardManage.do">커뮤니티 신고 관리</a></div>
	                    <div class="admin"><a href="cafeManage.do">카페 관리</a></div>
	            	</div>
	        	</div>
	        </div>
			<div class="col-sm-8">
		       <div class="card text-center">
		            <div class="row">
	                	<input type="text" id="searchName" name="searchName">
	                    <button type="button" id="click" class="btn btn-default" onclick="searchCafeName();">
	                        <span class="glyphicon glyphicon-search"></span> 검색
	                    </button>
		            </div>
		            <br>
		            <div class="searchView">
		                <c:forEach var="cafe" items="${cafeList}">
			            <c:url var="cafeDetail" value="cafeDetail.do">
			            	<c:param name="cafeNo" value="${cafe.cafeNo}"/>
			            </c:url>
		                <div class="panel panel-default" onclick="location.href='cafeDetail.do?cafeNo=${cafe.cafeNo}'">
		                    <img src="${contextPath}/resources/views/images/study.jpg" class="thumbnail">
		                    <div class="panel-body"><c:out value="${cafe.cafeName}"/></div>
		                    <div class="panel-footer"><c:out value="${cafe.cafeAddress}"/></div>
		                </div>
		            	</c:forEach>
		            </div>
		        </div>
		        <br><br><br>
   			</div>
		</div>
        <br clear="both">
    </section>

</body>
</html>