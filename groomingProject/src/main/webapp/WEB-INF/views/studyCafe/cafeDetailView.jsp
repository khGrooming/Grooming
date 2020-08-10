<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style>
		section{margin-top:10%}
		
		.sideMenu{height:300px;background-color:blue;border-radius:10%;}
		.subMenu{height:100px;}
		.cafe{height:80px;text-align:center;padding:30px;}
	</style>
</head>
<body>
	<header><jsp:include page="../common/mainNavigationBar.jsp"/></header>
	
	<section>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-3">
				<br><br>
				<div class="container col-sm-3"></div>
				    <div class="sideMenu col-sm-7">
						<div class="cafe"><a href="searchMap.do">스터디 카페 검색</a></div>
						<div class="cafe"><a href="reservationCheck.do">카페 신청 내역</a></div>
						<div class="cafe"><a href="reservationHistory.do">카페 예약 내역</a></div>
		        	</div>
		        </div>
				<div class="container col-sm-5">
					<c:forEach var="info" items="${info}" begin="0" end="0">
						<h1>${info.cafeName}</h1>
						<hr>
						<img src="${contextPath}/resources/views/images/study.jpg" style="width:100%;">
						<hr>
						<h2>상세 설명</h2>
						<c:set var="content" value="${fn:split(info.cafeContent,'.')}" />
						<c:forEach var="cDetail" items="${content}" varStatus="i">
						     ${cDetail}<br>
						</c:forEach>
						<hr>
						<h2>장소</h2>
						${info.cafeAddress}
						<hr>
						<h2>연락처</h2>
						${info.cafePhone}
					</c:forEach>
				</div>
				<div class="container col-sm-3">
					<div class="row">
						<ul>
							<c:forEach var="info" items="${info}">
									<li>${info.cRoomName}&nbsp;&nbsp;&nbsp;<input type="radio" name="checkRoom" value="${info.cPriceNo}"></li>
							</c:forEach>
						</ul>
					</div>
					<hr>
					<div class="row">
						<div id="calendarDiv" style="width:100%"></div>
					</div>
				</div>
			</div>
		</div>
		
	</section>
	<br><br><br>
	<footer><jsp:include page="../common/footer.jsp"/></footer>
	
	<script>
		$(function(){
			$("[name='checkRoom']").on("click", function(){
				let today = new Date();
			    let year = today.getFullYear();
			    let month = today.getMonth() + 1;
			    let date = today.getDate();
				showCalendar(year, month);
				
				$cPriceNo = $('input[name="checkRoom"]:checked').val();
				console.log($cPriceNo);
				$.ajax({
					url:"checkRoom.do",
					type:"post",
					dataType:"json",
					data:{cPriceNo:$cPriceNo},
					success:function(data){
						
					},
					error:function(data){
						
					}
				})
			})
		});
	</script>
	
	<!-- 달력 화면에 뿌려주기 -->
    <script>
    function showCalendar(y, m) {
    	var text = '<table border="1" style="text-align:center; width:100%;"><thead>';
        text += '<th onclick="showCalendar('+(m==1?(y-1)+','+12:y+','+(m-1))+')"> < </th>';
        text += '<th colspan="5">' + y + '.' + ((m < 10) ? ('0' + m) : m) + '</th>';
        text += '<th onclick="showCalendar('+(m==12?(y+1)+','+1:y+','+(m+1))+')"> > </th>';
    	text += '<tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>'
        text += '</thead>';

        var d1 = (y+(y-y%4)/4-(y-y%100)/100+(y-y%400)/400+m*2+(m*5-m*5%9)/9-(m<3?y%4||y%100==0&&y%400?2:3:4))%7;
        for (i = 0; i < 42; i++) {
            if (i%7==0) text += '</tr>\n<tr>';
            if (i < d1 || i >= d1+(m*9-m*9%8)/8%2+(m==2?y%4||y%100==0&&y%400?28:29:30))
                text += '<td></td>';
            else
                text += '<td class="'+(i+1-d1)+'" onclick="getDate();"' + (i%7 ? '' : ' style="color:red;"') + '>' + (i+1-d1) + '</td>';
        }
        document.getElementById('calendarDiv').innerHTML = text + '</tr>\n</table>';
    }
    
    // 클릭한 날짜 구하기
    function getDate(){
    	$("#calendarDiv tbody tr td").on("click",function(){
    		console.log($(this).text());
    	})
    }
    
    // 달력 색깔 바꿔주기
    
	</script>
</body>
</html>