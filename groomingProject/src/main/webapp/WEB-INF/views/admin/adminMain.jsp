<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.1/Chart.min.js"></script>

    <style>
        .statistics{width:150px; height:150px; background-color:antiquewhite; border-radius:50%;display:inline-block;margin-top: 50px; padding:35px;}
        .visit, .user, .group, .board{margin-left:50px;}
        .statisticsMain, .member, .grooming, .declaration{height:100px;background:chartreuse;}
        
        .sideMenu{/* background-color:blue; */ border: thin solid lightgray; border-radius:0.1rem;font-size:large;}
        .admin{height:80px;text-align:center;padding:30px;}
        .graph{width:50%;height:500px;position:relative;}
        .chart{
        vertical-align: middle;
        width: 100%;
        margin: 0 auto;
        position: relative;
        display: inline-block;
        }
        canvas{
        height: 100%;
        }
    </style>
</head>
<body>
	<jsp:include page="../common/mainNavigationBar.jsp"/>
    <section>
        <br><br>
        <h1 align="center">관리자 페이지</h1>
        <br><br>
        <div class="container-fluid">
			<div class="row">
        <div class="col-sm-3">
            <br><br>
            <!-- <div class="col-sm-3"></div> -->
            	<!-- <div class="container col-sm-3"></div> -->
                <div class="sideMenu col-sm-7">
                    <div class="admin"><a href="adminMain.do">통계</a></div>
                     <div class="admin"><a href="memberManage.do">회원 관리</a></div>
                     <div class="admin"><a href="groomingManage.do">그루밍 관리</a></div>
                     <div class="admin"><a href="declarationManage.do">신고 관리</a></div>
                     <div class="admin"><a href="cafeManage.do">카페 관리</a></div>
                     <div class="admin"><a href="helpManage.do">문의 사항</a></div>
                </div>
         </div>
         <div class="col-sm-8">
            
            
            <jsp:useBean id="today" class="java.util.Date" />
            <fmt:formatDate var="day" value="${today}" pattern='yyyy-MM-dd'/>
			
            <div class="statistics visit">
                <p align="center"><b>포인트 충전</b></p>
                <c:forEach var="point" items="${point}">
                	<c:if test="${point.lastDay eq day}">
                		<a onclick="getpoint"><h1 align="center">${point.count}</h1></a>
                	</c:if>
                </c:forEach>
            </div>
            <div class="statistics user">
                <p align="center"><b>회원가입 수</b></p>
                <c:forEach var="mlist" items="${mlist}">
                	<c:if test="${mlist.lastDay eq day}">
                		<a onclick="getMList"><h1 align="center">${mlist.count}</h1></a>
                	</c:if>
                </c:forEach>
            </div>
            <div class="statistics group">
                <p align="center"><b>그룹 수</b></p>
                <c:forEach var="glist" items="${glist}">
                	<c:if test="${glist.lastDay eq day}">
                		<a onclick="getGList"><h1 align="center">${glist.count}</h1></a>
                	</c:if>
                </c:forEach>
            </div>
            <div class="statistics board">
                <p align="center"><b>게시글 수</b></p>
                <c:forEach var="blist" items="${blist}">
                	<c:if test="${blist.lastDay eq day}">
                		<a onclick="getBList"><h1 align="center">${blist.count}</h1></a>

                	</c:if>
                </c:forEach>
            </div>
            <br clear="both">
            <br><br>
            <div class="graph">
                <canvas id="myLineChart" class="chart" width="800" height="400"></canvas>
            </div>
            <br><br>
         </div>
         </div></div>
         <br><br>

    </section>
    <%-- <jsp:include page="../common/footer.jsp"/> --%>
</body>
    <script> 
    $(function(){
	    var data = {
	    		labels: [
	    			<c:forEach var="clist" items="${clist}">
		        		"${clist.lastDay}",
		            </c:forEach>
	    		],
	    		datasets:[{
	    			label: "board",
	    			fillColor: "rgba(255,0,0,0.2)",
	    	        strokeColor: "rgba(255,0,0,0.2)",
	    	        pointColor: "rgba(255,0,0,0.2)",
	    	        pointStrokeColor: "#fff",
	    	        pointHighlightFill: "#fff",
	    	        pointHighlightStroke: "rgba(255,0,0,0.2)",
	    	        data:[
	    	        	<c:forEach var="blist" varStatus="i" items="${blist}">
	    	        		${blist.count},
			            </c:forEach>
	    	        ]
	    		},{
	    			label: "그루밍 수",
	    			fillColor: "rgba(0,255,0,0.2)",
	    	        strokeColor: "rgba(0,255,0,0.2)",
	    	        pointColor: "rgba(0,255,0,0.2)",
	    	        pointStrokeColor: "#fff",
	    	        pointHighlightFill: "#fff",
	    	        pointHighlightStroke: "rgba(0,255,0,0.2)",
	    	        data:[
	    	        	<c:forEach var="glist" varStatus="i" items="${glist}">
	    	        		${glist.count},
			            </c:forEach>
	    	        ]
	    		},{
	    			label: "회원가입 수",
	    			fillColor: "rgba(0,0,255,0.2)",
	    	        strokeColor: "rgba(0,0,255,0.2)",
	    	        pointColor: "rgba(0,0,255,0.2)",
	    	        pointStrokeColor: "#fff",
	    	        pointHighlightFill: "#fff",
	    	        pointHighlightStroke: "rgba(0,0,255,0.2)",
	    	        data:[
	    	        	<c:forEach var="mlist" varStatus="i" items="${mlist}">
	    	        		${mlist.count},
			            </c:forEach>
	    	        ]
	    		},{
	    			label: "포인트 충전",
	    			fillColor: "rgba(0,255,255,0.2)",
	    	        strokeColor: "rgba(0,255,255,0.2)",
	    	        pointColor: "rgba(0,255,255,0.2)",
	    	        pointStrokeColor: "#fff",
	    	        pointHighlightFill: "#fff",
	    	        pointHighlightStroke: "rgba(0,255,255,0.2)",
	    	        data:[
	    	        	<c:forEach var="point" varStatus="i" items="${point}">
	    	        		${point.count},
			            </c:forEach>
	    	        ]
	    		}]
	    };
	
	    // Global + Custom Chart Config Options
	
	    var options = {
	        bezierCurve: true,
	        animation: true,
	        animationEasing: "easeOutQuart",
	        showScale: true,
	        tooltipEvents: ["mousemove", "touchstart", "touchmove"],
	        tooltipCornerRadius: 3,
	        pointDot : true,
	        pointDotRadius : 3,
	        datasetFill : true,
	        scaleShowLine : true,
	        animationEasing : "easeOutBounce",
	        animateRotate : true,
	        animateScale : true,
	        responsive: false,
	    };
	
	
	    // Load Chart
	
	    var ctx1 = document.getElementById("myLineChart").getContext("2d");
	
	    var myLineChart = new Chart(ctx1).Line(data, options);
    })
    </script>

</html>