<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   
   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <style>
      /* section{margin-top:10%} */
      p{margin:0px;}
      
      .sideMenu{height:300px;background-color:blue;border-radius:10%;}
      .subMenu{height:100px;}
      .cafe{height:80px;text-align:center;padding:30px;}
      
      #reservation{display:none;}
      #headCount{display:none;}
      #space{display:none;}
      #reservationBtn{display:none;}
      .calculation{display:none;}
      
      .timeScroll{overflow-x:scroll;overflow-y:hidden;white-space: nowrap;}
      .time, .impossible{width:50px;display:inline-block;}
      
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
   
   <section>
      <div class="container-fluid">
         <div class="row">
            <div class="col-sm-3">
            <br><br>
            <div class="container col-sm-3"></div>
                <div class="sideMenu col-sm-7">
                  <div class="cafe"><a href="searchMap.do">스터디 카페 검색</a></div>
               <c:if test="${!empty loginUser}">
                  <div class="cafe"><a href="reservationCheck.do?memberNo=${loginUser.memberNo}">카페 신청 내역</a></div>
                  <div class="cafe"><a href="reservationHistory.do?memberNo=${loginUser.memberNo}">카페 예약 내역</a></div>
               </c:if>
               <c:if test="${empty loginUser}">
                  <div class="cafe"><a href="loginPage.do">카페 신청 내역</a></div>
                  <div class="cafe"><a href="loginPage.do">카페 예약 내역</a></div>
               </c:if>
                 </div>
              </div>
            <div class="container col-sm-5">
               <c:forEach var="info" items="${info}" begin="0" end="0">
                  <h1>${info.cafeName}</h1>
                  <hr>
                  <img src="${contextPath}/resources/views/images/study.jpg" style="width:100%;">
                  <hr>
                  <h2>상세 설명</h2>
                  <c:set var="content" value="${fn:split(info.cafeContent,'.')}" />
                  <c:forEach var="cDetail" items="${content}" varStatus="i">
                       ${cDetail}<br>
                  </c:forEach>
                  <hr>
                  <h2>장소</h2>
                  ${info.cafeAddress}
                  <hr>
                  <h2>연락처</h2>
                  ${info.cafePhone}
               </c:forEach>
            </div>
            <div class="container col-sm-3">
            <form method="post" action="insertR.do?memberNo=${loginUser.memberNo}">
               <div class="row">
                  <ul>
                     <c:forEach var="info" items="${info}">
                           <li>${info.cRoomName}&nbsp;&nbsp;&nbsp;<input type="radio" name="cPriceNo" value="${info.cPriceNo}"></li>
                     </c:forEach>
                  </ul>
               </div>
               
               <hr>
               
               <div class="row">
                  <div id="calendarDiv" style="width:100%"></div>
               </div>
               
               <hr>
               
               <div id="reservation" class="row timeScroll"><hr></div>
               
               <hr>
               
               <div class="row">
                  <div id="reservationInfo" style="width:100%"></div>
               </div>
               
               <hr>
               
               <div class="row">
                  <p id="head" style="display:none;">총 인원 수</p>
                  <select id="headCount" name="cReserHeadCount"></select>   
               </div>
               
               <hr>
               
               <input type="hidden" id="cReserNo" name="cReserNo" value="${cReserNo}">
               <input type="hidden" id="cReserDate" name="cReserDate">
               <input type="hidden" id="STime" name="cReserSTime">
               <input type="hidden" id="ETime" name="cReserETime">
               <input type="hidden" id="money" name="money">
               
               <hr>
               
               <div class="row">
                  <p id="space">공간 사용료</p>
                  <div class="calculation"></div>
               </div>
               
               <button id="reservationBtn" type="button" onclick="openModal();" style="width:100%">예약하기</button>
               
               <div id="reservationModal" class="modal">
                  <!-- Modal content -->
                  <div class="modal-content">
                         <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">예약 확인</span></b></span></p>
                         <p id="infoCheck" style="text-align: center; line-height: 1.5;"><br /></p>
                         <p><br /></p>
                    <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">
                         <button type="submit" id="userConfirm" class="pop_bt" style="font-size: 13pt;">확인</button>
                         <button type="button" class="pop_bt" style="font-size: 13pt;" onClick="location.reload(true);">취소</button>
                     </div>
                  </div>
                </div>
            </form>
            </div>
         </div>
      </div>
      

   </section>
   <br><br><br>
   <footer><jsp:include page="../common/footer.jsp"/></footer>
   
   <script>
   // 달력에서 앞공백에 대한 정보 담을 변수
   $getClass = 0;
   
   // 오늘 날짜에 대한 정보 선언
   var today = new Date();
    var year = today.getFullYear();
    var month = today.getMonth() + 1;
    var day = today.getDate();
    var hours = today.getHours();
    
    // 넘어갈 정보들
    var cPriceNo = '';      // 룸 선택시 넘어갈 가격정보
    var selectDay = day;   // 예약 날짜(기본:오늘)
   var click1=0;         // 예약 시작 시간
   var click2=0;         // 예약 종료 시간
   var s;               // 달에 따라 바뀌는 클릭 가능한 날짜
   
      $(function(){
         // 예약할 룸 클릭시 ajax로 데이터 가져와 예약불가 날짜 뿌려주기
         $("[name='cPriceNo']").on("click", function(){
            cPriceNo = $('input[name="cPriceNo"]:checked').val();
            $("#reservationInfo").html("");
            $("#head").html("");
            $.ajax({
               url:"checkRoom.do",
               type:"post",
               dataType:"json",
               data:{cPriceNo:cPriceNo, day:day},
               success:function(data){
                  showCalendar(year, month, day);
                  console.log(data);
                  changeTime(data);
                  
                  click1=0;
                  click2=0;
                  
                  return cPriceNo;
               },
               error:function(data){
                  
               }
            })
         })
      });

    //달력 화면에 뿌려주기
    function showCalendar(y, m, d) {
       var text = '<p align="left" style="width:50%; display:inline-block;">시간 선택</p>';
       text += '<p align="right" style="width:50%; display:inline-block;">'+y+'년' +month+'일'+day+'일 </p>';
       text += '<table border="1" style="text-align:center; width:100%;"><thead>';
       if(m==month){
          s=day;
          text += '<th onclick="showCalendar('+(m==1?(y-1)+','+12+','+(d=1):y+','+(m))+','+(day)+')"> < </th>';
       }else if(m>month){
          if((m-1)==month){
             text += '<th onclick="showCalendar('+(m==1?(y-1)+','+12+','+(d=1):y+','+(m-1))+','+(day)+')"> < </th>';
          }else{
             s=1;
             text += '<th onclick="showCalendar('+(m==1?(y-1)+','+12+','+(d=1):y+','+(m-1))+','+(d=1)+')"> < </th>';             
          }
       }else{
           s=1;
           text += '<th onclick="showCalendar('+(m==1?(y-1)+','+12+','+(d=1):y+','+(m-1))+','+(d=1)+')"> < </th>';
        }
        text += '<th colspan="5">' + y + '.' + ((m < 10) ? ('0' + m) : m) + '</th>';
        if(m==month){
           s=day;
            text += '<th onclick="showCalendar('+(m==12?(y+1)+','+1+','+(d=1):y+','+(m+1))+','+(d)+')"> > </th>';
        }else{
           s=1;
           text += '<th onclick="showCalendar('+(m==12?(y+1)+','+1+','+(d=1):y+','+(m+1))+','+(d=1)+')"> > </th>';
        }
       text += '<tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>'
        text += '</thead>';

        var d1 = (y+(y-y%4)/4-(y-y%100)/100+(y-y%400)/400+m*2+(m*5-m*5%9)/9-(m<3?y%4||y%100==0&&y%400?2:3:4))%7;
        for (i = 0; i < 42; i++) {
            if (i%7==0) text += '</tr>\n<tr>';
            if (i < d1 || i >= d1+(m*9-m*9%8)/8%2+(m==2?y%4||y%100==0&&y%400?28:29:30))
                text += '<td></td>';
            else{
                text += '<td class="calTd" ' + (i%7 ? '' : ' style="color:red;"') + '>' + (i+1-d1) + '</td>';
               $getClass = ((i+1+d1)-(i+1-d1))/2;
            }
        }
        document.getElementById('calendarDiv').innerHTML = text + '</tr>\n</table>';
      colorApply(d);
      $("#cReserDate").val(y+'/'+((m < 10) ? ('0' + m) : m)+'/'+d);
        return $getClass, s;
    }
    
    // 클릭한 날짜 구하고 색깔 바꾸기
    $(document).off("click").on("click",".calTd",function(){
      
       $(this).css("background","yellow");
       
       for(var i in $("#calendarDiv tbody tr td").text()){
          if(i == $(this).text()){
             $("#calendarDiv tbody tr td").eq(parseInt(i)+parseInt($getClass)-1).css("background","blue");
          }else if(i < s){
             $("#calendarDiv tbody tr td").eq(i).css("background","grey");
             $("#calendarDiv tbody tr td").eq(parseInt(i)+parseInt($getClass)-1).css({"background":"grey"});
          }else{
             $("#calendarDiv tbody tr td").eq(parseInt(i)+parseInt($getClass)-1).css("background","white");
          }
       }
      
       // 날짜 변경
      $selectDate = $("#cReserDate").val().substring(0,8);
      $("#cReserDate").val($selectDate+$(this).text());
       
       // 여기에 시간 바뀌는 메소드를 만들어 적용하자
       selectDay = $(this).text();
       console.log(selectDay);
       $.ajax({
          url:"checkTime.do",
          type:"post",
          dataType:"json",
          data:{date:selectDay, cPriceNo:cPriceNo},
          success:function(data){
             changeTime(data);
             click1=0;
             click2=0;

          },
          error:function(data){
             
          }
          
       });
    }).on("mouseenter", ".calTd", function(){
       $(".calTd").css("cursor","pointer");
    })
    
    // 처음에 달력 색깔 바꿔주기
    function colorApply(d){
       // 현재날짜 이전의 백그라운드 회색으로 설정
       for(var i in $("#calendarDiv tbody tr td").text()){
          if(i == d){
             $("#calendarDiv tbody tr td").eq(parseInt(i)+parseInt($getClass)-1).css("background","yellow");
          }else if(i < d){
             $("#calendarDiv tbody tr td").eq(i).css({"background":"grey","opacity":"0.5"});
             $("#calendarDiv tbody tr td").eq(parseInt(i)+parseInt($getClass)-1).css({"background":"grey","opacity":"0.5"});
             $("#calendarDiv tbody tr td").eq(parseInt(i)+parseInt($getClass)-1).prop("class","none");
          }
       }
    }

      // 룸 클릭이나 달력 날짜 클릭시 예약 시간 바뀌는 함수
      function changeTime(data){
         var cPriceNo = $('input[name="cPriceNo"]:checked').val();
         $reservation = $("#reservation");
         $reservation.css("display","block");
         $reservation.html("");
         
         <c:forEach var="info" items="${info}" begin="0" end="${info.size()}">
            if('${info.cPriceNo}'==(cPriceNo)){
               $price = ${info.cRoomPrice};   
               $time = ${info.cRoomAvailableTime};
            }
         </c:forEach>
         // 모든 시간 뿌리기
         for(var i=10; i <= 10+$time; i++){
            $timeDiv = $("<div class='time'>");
            $timeDiv.append(i);
            if(i == 10+$time){
               $timeDiv.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+(11+$time));
            }
            $timespan = $("<span class='timeSelect' style='background:yellow;text-align:center;'><br>");
            $timespan.append("&nbsp;&nbsp;&nbsp;"+$price);
            if(selectDay == day){
               if(hours+1 > i){
                  $timespan.css("background","grey");
                  $timespan.prop("class","none");
               }               
            }
            for(var j in data){
               console.log(data);
               if(data[j].cReserSTime <= i && data[j].cReserETime >= i && data[j].memberNo != '${loginUser.memberNo}'){
                  $timespan.css("background","grey");
                  $timespan.prop("class","none");
               }
            }
            $timeDiv.append($timespan);

            $reservation.append($timeDiv);
         }

      }
      
      // 예약 가능한 시간 마우스 호버시 마우스 모양 변화
      $(document).on("mouseenter", ".timeSelect", function(){
          $(".timeSelect").css("cursor","pointer");
       }).on("click",".timeSelect", function(){
         $(this).css("background","blue");
         
         clickArea(parseInt($(this).parents(".time").text().substring(0,2)));

         if(click2 == 0){
            $("#reservationInfo").text(selectDay +'일'+ click1+':00 시 ~'+ (click1+1)+':00 시 (1시간)');
            $("#STime").val(click1);
            $("#ETime").val(click1+1);
         }
         else if(click1>click2){
            $("#reservationInfo").text(selectDay +'일'+ click2+':00 시 ~'+ (click1+1)+':00 시'+'('+(click1-click2+1)+'시간)');   
            $("#STime").val(click2);
            $("#ETime").val(click1+1);
         }else{
            $("#reservationInfo").text(selectDay +'일'+ click1+':00 시 ~'+ (click2+1)+':00 시'+'('+(click2-click1+1)+'시간)');
            $("#STime").val(click1);
            $("#ETime").val(click2+1);
         }

         
         $("#headCount").html("");
         hCount();      
         
      })
      
       // 예약 가능한 시간 클릭시 이벤트 처리
      function clickArea(str){

         if(click1 == 0){
            click1 = str;
            return click1;
         }else{
            if(click2 != 0){
               click1 = str;
               click2 = 0;
               
               // 색칠한거 다 지우고 click1의 색깔만 파란색
               $.ajax({
                  url:"checkTime.do",
                   type:"post",
                   dataType:"json",
                   data:{date:selectDay, cPriceNo:cPriceNo},
                   success:function(data){
                     
                     changeTime(data);
                     
                     for(var i=0; i<=10; i++){
                        if($(".time").eq(i).text().substring(0,2) == click1){
                           $(".time").eq(i).children(".timeSelect").css("background","blue");
                        }
                     }
                  },
                  error:function(data){
                     
                  }
               });
                
                return click1, click2;
            }else{
               click2 = str;
               
               // 가운데 색깔 채우기 & 예약 못하는 경우 추가
               $.ajax({
                  url:"checkTime.do",
                   type:"post",
                   dataType:"json",
                   data:{date:selectDay, cPriceNo:cPriceNo},
                   success:function(data){
                     for(var i=0; i<=10; i++){
                        $time = $(".time").eq(i).text().substring(0,2);
                        if($time > click1 && $time < click2 || $time < click1 && $time > click2){
                           $(".time").eq(i).children(".timeSelect").css("background","blue");         
                           
                           for(var j in data){

                              if((data[j].cReserSTime <= i+10 && data[j].cReserETime >= i+10 && data[j].memberNo != ${loginUser.memberNo})){
                                 alert("예약할 수 없는 시간이 포함되어 있습니다.");
                                 changeTime(data);
                                 return;
                              }
                           }
                        }
                     }
                   },
                  error:function(data){   
                  }
               });

               return click2;            
            }
         }
      }
      
      // 인원수 체크 
      function hCount(){
         var cPriceNo = $('input[name="cPriceNo"]:checked').val();
         $select = $("#headCount");
         $select.css("display","inline-block");
         $("#head").css("display","inline-block");
         
         <c:forEach var="info" items="${info}" begin="0" end="${info.size()}">
            if('${info.cPriceNo}'==(cPriceNo)){
               <c:forEach var="hCount" varStatus="i" begin="1" end="${info.cRoomHeadCount}">
                  $select.append("<option value='${i.count}'>${i.count} 명</option>");
               </c:forEach>               
            }

         </c:forEach>
      }
      
      // 사용료 계산
      $("#headCount").on("change",function(){
            $cal = $(".calculation");
            $cal.css("display","block");
            $cal.html("");
         
            
            $head = $("#headCount option:selected").val();
            
            <c:forEach var="info" items="${info}" begin="0" end="${info.size()}">
               if('${info.cPriceNo}'==(cPriceNo)){
                  $price = ${info.cRoomPrice};   
               }
            </c:forEach>
            
            $cal.append("<p>총 사용료</p>");
            if(click1 > click2 && click2 != 0){
               $cal.append("<p class='money' align='right'>"+$head*$price*((click1+1)-click2)+" 원");               
            }else if(click1 < click2){
               $cal.append("<p class='money' align='right'>"+$head*$price*((click2+1)-click1)+' 원');   
            }else if(click2 == 0){
               $cal.append('<p class="money" align="right">'+$head*$price+' 원');
            }else if(click1 == click2){
            	$cal.append('<p class="money" align="right">'+$head*$price+' 원');
            }
            
            $("#reservationBtn").css("display","block");

      });

      // 모달창 오픈
      function openModal(){
         $("#reservationModal").css("display","block");

         $money = $(".money").text().split(' 원');
         $("#money").val($money[0]);
         
         <c:if test="${empty loginUser}">
            $("#infoCheck").append("<p>로그인해야 예약 가능합니다.<p>");
            $("#userConfirm").attr("type","button");
            
            $("#userConfirm").attr("onclick","location.href='loginPage.do'");
            return;
         </c:if>
         
         $memberNo = "${loginUser.memberNo}";
         $cReserNo = $("#cReserNo").val();
         
         console.log($money[0])
         $.ajax({
            url:"checkPoint.do",
            data:{money:$money[0],cReserNo:$cReserNo,memberNo:$memberNo},
            success:function(data){
               if(data == "success"){
                  $cPriceNo = $('input[name="cPriceNo"]:checked').val();
                  $head = $("#headCount option:selected").val();
                  $money = $(".money").text();
                  $selectDate = $("#cReserDate").val();
                  
                  <c:forEach var="info" items="${info}" begin="0" end="${info.size()}">
                     if('${info.cPriceNo}'==$cPriceNo){
                        $cafeName = '${info.cafeName}';
                        $cRoomName = '${info.cRoomName}';
                     }
                  </c:forEach>

                    if(click1 < click2){
                     $("#infoCheck").append("<p>"+$cafeName + "  " + $cRoomName + "<br>"+ $selectDate + "  " + click1 + " 시 ~ " + (click2+1) + " 시<br>" + $head+" 명</p><br>");
                     $("#infoCheck").append("<p>예약 클릭 시 예약 확인 페이지로 이동합니다.</p>");
                     $("#infoCheck").append("<p>★예약 변경시 신청한 예약은 취소 됩니다.</p>");
                  }else if(click2 < click1){
                     $("#infoCheck").append("<p>"+$cafeName + "  " + $cRoomName + "<br>"+ $selectDate + "  " + click2 + " 시 ~ " + (click1+1) + " 시<br>" + $head+" 명</p><br>");
                     $("#infoCheck").append("<p>예약 클릭 시 예약 확인 페이지로 이동합니다.</p>");
                     $("#infoCheck").append("<p>★예약 변경시 신청한 예약은 취소 됩니다.</p>");
                  }else{
                     $("#infoCheck").append("<p>"+$cafeName + "  " + $cRoomName + "<br>"+ $selectDate + "  " + click1 + " 시 ~ " + (click1+1) + " 시<br>" + $head+" 명</p><br>");
                     $("#infoCheck").append("<p>예약 클릭 시 예약 확인 페이지로 이동합니다.</p>");
                     $("#infoCheck").append("<p>★예약 변경시 신청한 예약은 취소 됩니다.</p>");
                  }
               }else {
                  $("#infoCheck").append("<p>포인트가 부족합니다.<br>확인 클릭시 포인트 충전 페이지로 이동합니다.<p>");
                  $("#userConfirm").attr("type","button");
                  
                  // 포인트 충전 사이트로 바꿔놓을 것!!
                  $("#userConfirm").attr("onclick","location.href='searchName.do'");
               }
               
            },
            error:function(data){
            }
         })
         
      }

      
   </script>
   
   
   <!-- 수량 버튼 스크립트 -->
    <!-- <script>
        (function ($) {
            $.fn.spinner = function() {
                this.each(function() {
                    var el = $(this);

                    // add elements
                    el.wrap('<span class="spinner"></span>');
                    el.before('<span class="sub">-</span>');
                    el.after('<span class="add">+</span>');

                    // substract
                    el.parent().on('click', '.sub', function () {
                    if (el.val() > parseInt(el.attr('min'))){
                        el.val(function(i, oldval) { return --oldval; });
                        //console.log(el.val());
                    }

                    });

                    // increment
                    el.parent().on('click', '.add', function () {
                    if (el.val() < parseInt(el.attr('max'))){ // 최대 예약인원
                        el.val(function(i, oldval) { return ++oldval; });
                        //console.log(el.val());
                    } else {
                       alert("1회 구매 최대 수량입니다.");
                    }
                        
                    });
                });
            };
        })(jQuery);// 수량 버튼 스크립트 끝
        $('.ㅊ]').spinner();
    </script> -->
</body>
</html>