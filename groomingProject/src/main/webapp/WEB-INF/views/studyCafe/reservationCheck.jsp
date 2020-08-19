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
            
             /* The Modal (background) */
	        .modal {
	            display: none; /* Hidden by default */
	            position: fixed; /* Stay in place */
	            z-index: 1; /* Sit on top */
	            left: 0;
	            top: 0;
	            width: 100%; /* Full width */
	            height: 100%; /* Full height */
	            overflow: auto; /* Enable scroll if needed */
	            background-color: rgb(0,0,0); /* Fallback color */
	            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	        }
	    
	        /* Modal Content/Box */
	        .modal-content {
	            background-color: #fefefe;
	            margin: 15% auto; /* 15% from the top and centered */
	            padding: 20px;
	            border: 1px solid #888;
	            width: 30%; /* Could be more or less, depending on screen size */                          
	        }
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
	                        <div class="cafe"><a href="reservationCheck.do">카페 신청 내역</a></div>
	                        <div class="cafe"><a href="reservationHistory.do">카페 예약 내역</a></div>
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
			                        <th>예약 변경</th>
			                    </tr>
		                    </thead>
		                    <tbody id="rInfo" align="center">
		                    <c:if test="${!empty rlist}">
		                        <c:forEach var="info" items="${rlist}">
			                        <tr>
			                        	<td>${info.cafeName}<br>${info.cRoomName}&nbsp;&nbsp;${info.cReserHeadCount} 명</td>
			                        	<td>${info.cReserDate.substring(0,10)}<br>${info.cReserSTime}시 ~ ${info.cReserETime}시</td>
			                        	<td><c:out value="${info.cReserHeadCount*(info.cReserETime-info.cReserSTime)*info.cRoomPrice} 원"/></td>
			                        	<td width="150px"><button type="button" onclick="location.href='cafeDetail.do?cafeNo=${info.cafeNo}&cReserNo=${info.cReserNo}'">변경</button>
			                        	<button type="button" onclick="cancelR();">취소</button></td>
			                       	</tr>
			                       	<input type="hidden" id="cReserNo" name="cReserNo" value="${info.cReserNo}">
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
            <div id="myModal" class="modal">
				      <!-- Modal content -->
				      <div class="modal-content">
			                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">예약 변경</span></b></span></p>
			                <p id="infoCheck" style="text-align: center; line-height: 1.5;"><br /></p>
			                <p><br /></p>
			           <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">
			                <button type="submit" class="pop_bt" style="font-size: 13pt;" >확인</button>
			                <button type="button" class="pop_bt" style="font-size: 13pt;" onClick="location.reload(true);">취소</button>
			            </div>
				      </div>
				    </div>
        </section>
        
        <script>
	        
	        function cancelR(){
	        	if(window.confirm("정말 취소하시겠습니까?")){
	        		$No = $("#cReserNo").val();
	        		location.href="cancelR.do?cReserNo="+$No;
	        	}
	        	
	        }
        </script>
    </body>
</html>