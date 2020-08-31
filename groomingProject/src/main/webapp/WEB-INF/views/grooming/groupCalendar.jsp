<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

    <!-- Bootstrap CSS -->
	<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
     integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
   
   <!-- fullcalendar -->
    <link href='${contextPath }/resources/views/css/fullcalendar-main.css' rel='stylesheet' />
    <script src='${contextPath }/resources/js/fullcalendar/fullcalendar-main.js'></script>
    <script src='${contextPath }/resources/js/fullcalendar/locales-all.js'></script>
    <script src='${contextPath }/resources/js/jquery-ui.js'></script>	<!-- 달력 드래그와 사이즈 위함 -->
	
	
    <title>Hello, world!</title>
    <style>
        body{
            height: 1200px;
        }
        /* div의 크기에 맞춤 */
        img {
            max-width: 100%;
            max-height: 100%;
        }

        
        @font-face { 
			font-family: 'TmoneyRoundWindExtraBold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff');
    	    font-weight: normal; 
    	    font-style: normal; 
   		}
   
	   * {
	      font-family:"TmoneyRoundWindExtraBold";
	   }
	   
	 
    </style>
</head>

<body>
    <!-- 헤더시작 -->
    <header>
      	<jsp:include page="../common/mainNavigationBar.jsp" />
    </header>

    <!-- 섹션 시작 -->

    <!-- 컨테이너로 양옆에 공백 생성 -->
    <div class=container style="margin-top:150px ; ">
	    <c:url var="calendar" value="calendar.do">
	    	<c:param name="groomingNo" value="${grooming.groomingNo}"/>
	    </c:url>
		<c:url var="gBlist" value="gBlist.do">
			<c:param name="groomingNo" value="${grooming.groomingNo}"/>
		</c:url>
		<c:url var="groupP" value="groupPage.do">
			<c:param name="groomingNo" value="${grooming.groomingNo}"/>
		</c:url>
    
       <label><a href="${groupP }"><i class="fas fa-user-graduate"></i>메인</a></label>

        <label><a href="${calendar }"><i class="fas fa-calendar-alt"></i>캘린더</a></label>

        <label><a href="${gBlist }"><i class="fas fa-icons"></i>게시판</a></label>

    

	<!-- 캘린더 내용 출석 체크 -->
    <section >

            <div class="table-responsive container" style="text-align:center; height:1000px;">
            	<table class="table table-bordered" >
            		<thead>
            		<tr>
            			<th rowspan="2" style="width:auto;">멤버 이름</th>
            			<th colspan="3"><label name=""></label></th>
            	
            		
            		</tr>
            		<tr>
            			<th>출석</th>
            			<th>결석</th>
            			<th>지각</th>
            		</tr>
            		
            		</thead>
	            	<tbody>
	            		<c:forEach var="m" items="${member }" >
	            		<tr>
	            			<td style="width:auto;">${m.memberNickName }</td>
	            			<td><input type="radio" name="chulseok" value="Y"></td>
	            			<td><input type="radio" name="chulseok" value="N"></td>
	            			<td><input type="radio" name="chulseok" value="L"></td>
	            		</tr>
	            		</c:forEach>
	            		
	            	</tbody>
            	
            	</table>
            
            </div>


      

  
      <!-- 캘린더 script -->
<script>



</script>
 
    </section>


	


    <footer>

		<jsp:include page="../common/footer.jsp" />
    </footer>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
</body>
</html>