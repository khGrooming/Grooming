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
			section{margin-top:10%}
			
            .sideMenu{height:300px;background-color:blue;border-radius:10%;}
            .subMenu{height:100px;}

            .search{background:greenyellow;width:280px;height:50px;border:1px solid black}
            .searchView{width:100%;height:550px;background:lawngreen;display:inline-block;padding:10px;}

            .panel{width:150px;height:200px;display:inline-block; border-radius: 10%;overflow:hidden;}
            img{width: 150px;}

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
                        <div class="cafe"><a href="#">카페 신청 내역</a></div>
                        <div class="cafe"><a href="reservationHistory.do">카페 예약 내역</a></div>
                   </div>
                </div>
            
            <div class="col-sm-8">
                <h1 align="center">카페 신청 내역</h1>
                <table class="table table-bordered">
                    <thead>
                        <th>카페 이름</th>
                        <th>예약 날짜</th>
                        <th>가격</th>
                    </thead>
                    <tbody>
                        <td colspan="3">아직 정보가 없습니다.</td>
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