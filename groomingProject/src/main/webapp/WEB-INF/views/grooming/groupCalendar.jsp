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
    
        <label for="tab1"><a href="${groupP }"><i class="fas fa-user-graduate"></i>메인</a></label>

        <label for="tab2"><a href="${calendar }"><i class="fas fa-calendar-alt"></i>캘린더</a></label>

        <label for="tab3"><a href="${gBlist }"><i class="fas fa-icons"></i>게시판</a></label>

    

	<!-- 캘린더 내용 (일정 관리/출석 체크) -->
    <section >
       
           <div id='calendar'></div>
       
       
       
       
      <!-- 캘린더 script -->
     <script>

			
     document.addEventListener('DOMContentLoaded', function() {
    	    var calendarEl = document.getElementById('calendar');

    	    var calendar = new FullCalendar.Calendar(calendarEl, {
    	      initialDate: '2020-06-12',
    	      initialView: 'timeGridWeek',
    	      nowIndicator: true,
    	      headerToolbar: {
    	        left: 'prev,next today',
    	        center: 'title',
    	        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
    	      },
    	      navLinks: true, // can click day/week names to navigate views
    	      editable: true,
    	      selectable: true,
    	      selectMirror: true,
    	      dayMaxEvents: true, // allow "more" link when too many events
    	      events: [
    	        {
    	          title: 'All Day Event',
    	          start: '2020-06-01',
    	        },
    	        {
    	          title: 'Long Event',
    	          start: '2020-06-07',
    	          end: '2020-06-10'
    	        },
    	        {
    	          groupId: 999,
    	          title: 'Repeating Event',
    	          start: '2020-06-09T16:00:00'
    	        },
    	        {
    	          groupId: 999,
    	          title: 'Repeating Event',
    	          start: '2020-06-16T16:00:00'
    	        },
    	        {
    	          title: 'Conference',
    	          start: '2020-06-11',
    	          end: '2020-06-13'
    	        },
    	        {
    	          title: 'Meeting',
    	          start: '2020-06-12T10:30:00',
    	          end: '2020-06-12T12:30:00'
    	        },
    	        {
    	          title: 'Lunch',
    	          start: '2020-06-12T12:00:00'
    	        },
    	        {
    	          title: 'Meeting',
    	          start: '2020-06-12T14:30:00'
    	        },
    	        {
    	          title: 'Happy Hour',
    	          start: '2020-06-12T17:30:00'
    	        },
    	        {
    	          title: 'Dinner',
    	          start: '2020-06-12T20:00:00'
    	        },
    	        {
    	          title: 'Birthday Party',
    	          start: '2020-06-13T07:00:00'
    	        },
    	        {
    	          title: 'Click for Google',
    	          url: 'http://google.com/',
    	          start: '2020-06-28'
    	        }
    	      ]
    	    });

    	    calendar.render();
    	  });
		
    </script>
       
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