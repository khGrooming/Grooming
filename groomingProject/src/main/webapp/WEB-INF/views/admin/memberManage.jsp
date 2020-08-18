<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 관리</title>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
    <style>
        html, body{margin:0px;padding:0px}
        header{width:100%;height:100px;background-color:yellowgreen;}
        footer{height:50px; background-color: grey;bottom:0%;}

        .sideMenu{background-color:blue;border-radius:10%;}
        .admin{height:80px;text-align:center;padding:30px;font-size:large;}
        .sub{height:50px;text-align:center;font-size:small;}

        .statisticsMain, .member, .grooming, .declaration{height:100px;background:chartreuse;}
        .search{width:100%;height:40px;text-align:center;}
        #searchMember{width:350px;height:30px;}
        #searchMemberBtn{width:50px;height:35px;}
        .memberInfo{border-collapse: collapse;width:100%;}
        .memberInfo th,td{height:50px;text-align:center;}
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
                     <div class="sub"><a href="memberManage.do">회원 검색</a></div>
                     <div class="sub"><a href="mentoManage.do">멘토 관리</a></div>
                     <div class="admin"><a href="groomingManage.do">그루밍 관리</a></div>
                     <div class="admin"><a href="declarationManage.do">신고 관리</a></div>
                     <div class="admin"><a href="cafeManage.do">카페 관리</a></div>
                </div>
         </div>
         <div class="container col-sm-8">
            <br><br>
            <h1 align="center">회원 관리</h1>

            <div class="search">
                <form>
                    <input type="text" id="searchMember" name="searchMember">
                    <button type="submit" id="searchMemberBtn">찾기</button>
                </form>
            </div>
            <br><br>
            <table class="memberInfo" border="1">
                <thead>
                    <tr>
                        <th>아이디</th>
                        <th>닉네임</th>
                        <th>이름</th>
                        <th>연락처</th>
                        <th>주소</th>
                        <th>포인트</th>
                    </tr>
                </thead>
                <tbody>
                    <td colspan="6">아직 정보가 없습니다.</td>
                </tbody>
            </table>
            <br clear="both"><br>
         </div>
    </section>
</body>
</html>