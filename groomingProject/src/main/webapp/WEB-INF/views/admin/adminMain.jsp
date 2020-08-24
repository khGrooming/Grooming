<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        html, body{margin:0px;padding:0px}
        header{width:100%;height:100px;background-color:yellowgreen;}
        footer{height:50px; background-color: grey;}

        .statistics{width:150px; height:150px; background-color:brown;border-radius:50%;display:inline-block;margin-top: 50px;}
        .visit, .user, .group, .board{margin-left:50px;}
        .statisticsMain, .member, .grooming, .declaration{height:100px;background:chartreuse;}
        
        .sideMenu{background-color:blue;border-radius:10%;font-size:large;}
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
    <header></header>
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
         <div class="container col-sm-8">
            <h1 align="center">관리자 페이지</h1>
            <div class="statistics visit">
                <p align="center"><b>방문자 수</b></p>
            </div>
            <div class="statistics user">
                <p align="center"><b>회원가입 수</b></p>
            </div>
            <div class="statistics group">
                <p align="center"><b>그룹 수</b></p>
            </div>
            <div class="statistics board">
                <p align="center"><b>게시글 수</b></p>
            </div>
            <br clear="both">
            <br><br>
            <div class="graph">
                <canvas id="myLineChart" class="chart" width="800" height="400"></canvas>
            </div>
            <br><br>
         </div>
    </section>
</body>
    <script> 
    // Data
    var data = {
    labels: ["January", "February", "March", "April", "May", "June", "July", "test", "test2", "test3"],
    datasets: [{
        label: "My First dataset",
        fillColor: "rgba(220,220,220,0.2)",
        strokeColor: "rgba(220,220,220,1)",
        pointColor: "rgba(220,220,220,1)",
        pointStrokeColor: "#fff",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "rgba(220,220,220,1)",
        data: [65, 59, 80, 81, 56, 55, 40, 49, 20, 1000]
    }, {
        label: "My Second dataset",
        fillColor: "rgba(151,187,205,0.2)",
        strokeColor: "rgba(151,187,205,1)",
        pointColor: "rgba(151,187,205,1)",
        pointStrokeColor: "#fff",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "rgba(151,187,205,1)",
        data: [28, 48, 40, 19, 86, 27, 90]
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
    </script>

</html>