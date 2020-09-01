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
	   
	   #calendar{
	      eventBackgroundColor:lightgreen;
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

    

	<!-- 캘린더 내용 (일정 관리/출석 체크) -->
    <section >

       
       		<div id="wrapCalendar">
		           <div id='calendar'></div>
       		</div>
       
       <div id="ModalPop" class="infoModal">
    <!-- Modal content -->
    <div class="infoModal-content">
        <p class="mTitle" style="text-align: center;"><span style="font-size: 14pt;"><b><span
                        style="font-size: 24px;">예약상세정보</span></b></span></p>
        <table align="center" class="tableM">
            <tr>
                <td colspan="6" style="text-align: center; padding:13px;background:#242424;color:#b3a193">예약 정보</td>
            </tr>
            <tr>
                <td colspan="2">성함 : <span id="hiddenMName"></span></td>
                <td colspan="2">일자 : <span id="hiddenRDate"></span></td>
                <td colspan="2">시간 : <span id="hiddenRTime"></span></td>
            </tr>
            <tr>
                <td colspan="6">장례상품</td>
            </tr>
            <tr>
                <td colspan="2">구분 : <span id="hiddenRName"></span></td>
                <td colspan="2">가격 : <span id="hiddenRPrice"></span></td>
            </tr>
            <tr>
                <td colspan="6">반려동물 정보</td>
            </tr>
            <tr>
                <td colspan="2">이름 : <span id="hiddenAName"></span></td>
                <td colspan="2">품종 : <span id="hiddenAKind"></span></td>
                <td colspan="2">체중 : <span id="hiddenAWeight"></span></td>
            </tr>
        </table>
        <div
            style="width:500px; cursor:pointer;background-color:white;text-align: center;padding-bottom: 10px;padding-top: 10px;margin:auto">
            <form method="post" id="deleteRNo" action="<%=request.getContextPath()%>/delete.ca"
                onsubmit="return deleteRno();">
                <input type="hidden" name="deleteRNo">
                <button type="submit" style="font-size: 14px;">삭제</button>
                <button type="button" class="pop_bt" onClick="close_pop();" style="font-size: 14px;">닫기</button>
            </form>
        </div>
    </div>
</div>

<!-- 일정변경 모달창 -->
<div id="changePop" class="infoChange">
    <!-- Modal content -->
    <div class="infoChange-content">
        <p class="mTitle" style="text-align: center;"><span style="font-size: 14pt;"><b><span
                        style="font-size: 24px;">예약상세정보</span></b></span></p>
        <form>
            <table align="center" class="tableM2" border="1px">
                <tr>
                    <td>현재 날짜</td>
                    <td><input type="text" id="inputDate" readonly></td>
                </tr>
                <tr>
                    <td>변경 날짜</td>
                    <td><input type="text" name="changeInputDate" readonly></td>
                </tr>
                <tr>
                    <td>장례 상품</td>
                    <td>
                        <select name="changeRProduct">
                            <option value="1">기본형</option>
                            <option value="2">일반형</option>
                            <option value="3">고급형</option>
                            <option value="4">VIP형</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>예약 시간</td>
                    <td>
                        <select name="changeRTime">
                            <option value="오전 9시 30분">오전 9시 30분</option>
                            <option value="오전 10시 30분">오전 10시 30분</option>
                            <option value="오전 11시 30분">오전 11시 30분</option>
                            <option value="오후  1시">오후 1시</option>
                            <option value="오후  2시">오후 2시</option>
                            <option value="오후  3시">오후 3시</option>
                            <option value="오후  4시">오후 4시</option>
                            <option value="오후  5시">오후 5시</option>
                            <option value="오후  6시">오후 6시</option>
                        </select>
                    </td>
                </tr>
                <input type="hidden" id="hiddenRNo">
            </table>
            <div
                style="width:396px;cursor:pointer;background-color:white;border:none;border-bottom-right-radius:3px;border-bottom-left-radius:3px;text-align: center;padding-bottom: 10px;padding-top: 10px;margin-left:75px;margin-top:20px;">
                <button type="button" onclick="changeRinfo();" style="font-size: 14px;">변경</button>
                <button type="button" class="pop_bt" onClick="window.location.reload();"
                    style="font-size: 14px;">닫기</button>
            </div>
        </form>
    </div>
</div>
      <!-- 캘린더 script -->
     <script>

			
     document.addEventListener('DOMContentLoaded', function() {
    	    var calendarEl = document.getElementById('calendar');
    	    var calendar = new FullCalendar.Calendar(calendarEl, {
    	    
    	      initialView: 'dayGridMonth',		// 초기설정 나는 달 기준으로 날짜 뿌려줌
    	      nowIndicator: true,
    	      headerToolbar: {
    	        left: 'prev,next today',
    	        center: 'title',
    	        right: 'dayGridMonth'
    	      },
    	      
    	      windowResize: function(arg) {
    	    	    alert('창의 크기가 변하여 창에 맞게 캘린더가 조정됩니다!!!');
    	      },
    	
    	   
    	      navLinks: true, // can click day/week names to navigate views
    	      editable: true,
    	      selectable: true,		// 날짜 선택가능
    	      selectMirror: true,	// 클릭 또는 드래그 하는 동안 날짜가 클릭됬는지 표시 해줌
    	      unselectAuto:false,
    	      dayMaxEventRows: true, // allow "more" link when too many events
    	      views: {
    	    	    timeGrid: {
    	    	      dayMaxEventRows: 4 // adjust to 6 only for timeGridWeek/timeGridDay
    	    	    }
    	    	  },
    	      dateClick: function(info) {
    	          // alert('clicked ' + info.dateStr);
    	        },
    	        select: function(info) {
    	         /*  alert('selected ' + info.startStr + ' to ' + info.endStr); */
    	        },
    	        visibleRange: {
    	            start: "${grooming.studySd}",
    	            end: "${grooming.studyEd}"
    	          },
    	       
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