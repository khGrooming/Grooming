<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <title>카페 페이지</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>	
        <style>
			/* section{margin-top:10%} */
			
            .sideMenu{height:300px;/* background-color:blue; */ border: thin solid lightgray; border-radius:10%;}
            .subMenu{height:100px;}

            .search{background:greenyellow;width:280px;height:50px;border:1px solid black}
            .searchView{width:100%;height:550px;background:lawngreen;display:inline-block;padding:10px;}

            .panel{width:150px;height:200px;display:inline-block; border-radius: 10%;overflow:hidden;}
            section img{width: 150px;}

            .cafe{height:80px;text-align:center;padding:30px;}
        </style>
    </head>
    <body>
        <header><jsp:include page="../common/mainNavigationBar.jsp"/></header>
        <br><br>    
        <section>
        <div class="container-fluid">
			<div class="row">
            <div class="col-sm-3">
               <br><br>
               <div class="col-sm-3"></div>
                   <div class="sideMenu col-sm-7">
                        <div class="cafe"><a href="searchMap.do">스터디 카페 검색</a></div>
                       <c:if test="${!empty loginUser}">
							<div class="cafe"><a href="reservationCheck.do?memberNo=${loginUser.memberNo}">카페 신청 내역</a></div>
							<div class="cafe"><a href="reservationHistory.do?memberNo=${loginUser.memberNo}">카페 예약 내역</a></div>
						</c:if>
						<c:if test="${empty loginUser}">
						<c:url var="loginPage_Cafe" value="loginPage.do">
							<c:param name="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
						</c:url>
						<div class="cafe"><a href="${loginPage_Cafe }">카페 신청 내역</a></div>
						<div class="cafe"><a href="${loginPage_Cafe }">카페 예약 내역</a></div>
						</c:if>
                   </div>
                </div>
            
            <div class="col-sm-8">
                <h1 align="center">카페 신청 내역</h1>
                <table class="table table-bordered">
                    <thead>
	                    <tr>
	                        <th>카페 이름</th>
	                        <th>예약 날짜</th>
	                        <th>가격</th>
	                        <th>예약 신청</th>
	                    </tr>
                    </thead>
                    <tbody id="rInfo" align="center">
                    <c:if test="${!empty rlist}">
                        <c:forEach var="info" items="${rlist}">
	                        <tr>
	                        	<td>${info.cafeName}<br>${info.cRoomName}&nbsp;&nbsp;${info.cReserHeadCount} 명</td>
	                        	<td>${info.cReserDate.substring(0,10)}<br>${info.cReserSTime}시 ~ ${info.cReserETime}시 (<c:out value="${info.cReserETime-info.cReserSTime} 시간"/>)</td>
	                        	<td><c:out value="${info.cReserHeadCount*(info.cReserETime-info.cReserSTime)*info.cRoomPrice} 원"/></td>
	                        	<td width="100px"><button type="button" onclick="location.href='cafeDetail.do?cafeNo=${info.cafeNo}'">신청</button>
	                       	</tr>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty rlist}">
                    	<td colspan="4">카페 예약 내역이 없습니다.</td>
                    </c:if>
                    </tbody>
                </table>
            </div>
            </div>
            </div>
        </section>
        
        <script>
        	
        </script>
    </body>
</html>