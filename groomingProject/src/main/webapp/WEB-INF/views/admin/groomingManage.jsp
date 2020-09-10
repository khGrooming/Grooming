<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>그루밍 관리</title>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
        <style>
           	section { padding-top: 6.25rem; min-height: calc(100vh - 3.5rem); }
            .sideMenu{/* background-color:blue; */ border: thin solid lightgray; border-radius:10%;font-size:large;}
            .admin{height:80px;text-align:center;padding:30px;}
            .statisticsMain, .member, .grooming, .declaration{height:100px;background:chartreuse;}
    
            .dropDown{width:120px;height:35px;float:right;}
            #groomingName{width:250px;height:35px;float:right;}
            #search{width:120px;height:35px;float:right;margin-right:10%;}

            .groomingInfo{width:70%;border-collapse: collapse;margin-left:20%;}
            .groomingInfo th,td{height:50px;text-align:center;}
        </style>
</head>
<body>
    <jsp:include page="../common/mainNavigationBar.jsp"/>
    <section>
        <br><br>
        <div class="container col-sm-3">
            <br><br>
            <div class="col-sm-3"></div>
                <div class="sideMenu col-sm-7">
                    <div class="admin"><a href="adminMain.do">통계</a></div>
                     <div class="admin"><a href="memberManage.do">회원 관리</a></div>
                     <div class="admin"><a href="groomingManage.do">그루밍 관리</a></div>
                     <div class="admin"><a href="declarationManage.do">신고 관리</a></div>
                     <div class="admin"><a href="cafeManage.do">카페 관리</a></div>
                </div>
         </div>
            <h1 align="center">그루밍 관리</h1>
            <form action="groomingManage.do">
	            <button type="submit" id="search">검색</button>
	            <select class="dropDown" name="category">
	            	<option value="null">전체</option>
	            	<option value="호스트">호스트</option>
	            	<option value="멘토">멘토</option>
	            </select>
            </form>
            <br><br>
            <table class="groomingInfo" border="1">
                <thead>
                    <tr>
                        <th>그루밍 이름</th>
                        <th>그루밍 소개</th>
                        <th>그룹 분류</th>
                        <th>그룹 인원</th>
                        <th>활성/비활성</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <c:forEach var="glist" items="${glist}">
                        	<tr>
                        		<td>${glist.groomingTitle}</td>
                        		<td style="width:400px;">${glist.groomingIntroduce}</td>
                        		<td>${glist.groomingType}</td>
                        		<td>${glist.groomingCurrentPeople} / ${glist.groomingParticipants}</td>
                        		<c:if test="${glist.gCalendarStartDate lt glist.gBoardModifyDate}">
                        			<td>${glist.gBoardModifyDate}</td>
                        		</c:if>
                        		<c:if test="${glist.gCalendarStartDate gt glist.gBoardModifyDate}">
                        			<td>${glist.gCalendarStartDate}</td>
                        		</c:if>
		                        <td><button type="button">수정</button></td>
                        	</tr>
						                        	
                        </c:forEach>
                    </tr>
                </tbody>
            </table>
        <br clear="both">
    </section>
    <%-- <jsp:include page="../common/footer.jsp"/> --%>
</body>
</html>