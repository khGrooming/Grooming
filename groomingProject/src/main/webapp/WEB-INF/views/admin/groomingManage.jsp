<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            html,body{margin:0px;padding:0px;}
            header{width:100%;height:100px;background-color:yellowgreen;}
            footer{height:50px; background-color: grey;}

            .sideMenu{background-color:blue;border-radius:10%;font-size:large;}
            .admin{height:80px;text-align:center;padding:30px;}
            .statisticsMain, .member, .grooming, .declaration{height:100px;background:chartreuse;}
    
            .dropDown{width:120px;height:40px;background:sandybrown;float:right;}
            #groomingName{width:250px;height:35px;float:right;}
            #search{width:120px;height:40px;float:right;margin-right:10%;}

            .groomingInfo{width:70%;border-collapse: collapse;margin-left:20%;}
            .groomingInfo th,td{height:50px;text-align:center;}
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
            <h1 align="center">그루밍 관리</h1>
            <button type="button" id="search">검색</button>
            <input type="text" id="groomingName" name="groomingName">
            <div class="dropDown">카테고리</div>
            <br><br>
            <table class="groomingInfo" border="1">
                <thead>
                    <tr>
                        <th>스터디 이름</th>
                        <th>그룹 분류</th>
                        <th>그룹 인원</th>
                        <th>마지막 활동일</th>
                        <th>활성/비활성</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="4">아직 그룹이 없습니다.</td>
                        <td><button type="button">수정</button></td>
                    </tr>
                </tbody>
            </table>
        <br clear="both">
    </section>
</body>
</html>