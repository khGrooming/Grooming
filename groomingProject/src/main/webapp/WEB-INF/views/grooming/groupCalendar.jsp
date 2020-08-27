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

        /* 인라인 형식의 출력 */
        #tab1:checked~#content1,
        #tab2:checked~#content2,
        #tab3:checked~#content3{
            display: block;
        }

        /* 각 탭의 메뉴의 내용 */
        section {
            display: none;
            padding: 20px 10px 10px 10px;
            border: 3px solid #ddd;
            height: auto;
        }

        /*라디오버튼 숨김*/
        input {
            display: none;
        }

        /* 탭메뉴 태그 마우스 올릴시 */
        label:hover {
            color: #2e9cdf;
            cursor: pointer;
        }

        /* 태그 메뉴 css */
        label {
            display: inline-block;
            margin: 0 0 -3px;
            padding: 15px 25px;
            font-weight: 600;
            text-align: center;
            color: #bbb;
            border: 1px solid #ddd;
            border-top-left-radius: 6px;
            border-top-right-radius: 6px;

        }
        /*input 클릭시, label 스타일*/
        input:checked+label {
            color: #555;
            border: 3px solid #ddd;
            /* border-top: 2px solid #2e9cdf; */
            border-bottom: 3px solid #ffffff;
        }
        .table{
            text-align: center;
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
        <c:url var="calendar" value="calendar.do"/>
	<c:url var="gBlist" value="gBlist.do"/>
	<c:url var="groupP" value="groupPage.do"/>
    
        <!--디폴트 메뉴-->
        <input id="tab1" type="radio" name="tabs" >
        <label for="tab1"><a href="${groupP }"><i class="fas fa-user-graduate"></i>메인</a></label>

        <input id="tab2" type="radio" name="tabs" checked>
        <label for="tab2"><a href="${calendar }"></a><i class="fas fa-calendar-alt"></i>캘린더</a></label>

        <input id="tab3" type="radio" name="tabs" >
        <label for="tab3"><a href="${gBlist }"><i class="fas fa-icons"></i>게시판</a></label>

        <!-- 메인에 들어갈 내용용 -->
        <section id="content1">
         
         
    </section>

	<!-- 캘린더 내용 (일정 관리/출석 체크) -->
    <section id="content2">
       
           <div id='calendar'></div>
       
       
       
       
      <!-- 캘린더 script -->
     <script>
		
        document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {

          initialView: 'dayGridMonth',
          selectable: true
         
        });
        calendar.render();
      });

    </script>
       
    </section>

    <!--게시판에 들어갈 내용 -->
    <section id="content3">
   
    
          
        
    </section>

</div>


    <footer  style="margin-top:100px;">

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