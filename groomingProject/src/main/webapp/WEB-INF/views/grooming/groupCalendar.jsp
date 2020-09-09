<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script type="text/javascript"
   src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
   


<!-- Bootstrap CSS -->
<link href="https://www.cssscript.com/wp-includes/css/sticky.css"
   rel="stylesheet" type="text/css">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
   integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
   crossorigin="anonymous">
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
   integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc"
   crossorigin="anonymous">




<title>Hello, world!</title>
<style>



@font-face {
   font-family: 'TmoneyRoundWindExtraBold';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}

* {
   font-family: "TmoneyRoundWindExtraBold";
}

table tr {
   border: 3px double green;
}

#tb1 tbody tr td {
   border: 3px double green;
}




h1{
   margin-top:50px;
}

.ui-datepicker-trigger {
   width: 25px;
   height: 25px;
}
</style>
</head>

<body>
   <!-- 헤더시작 -->
   <jsp:include page="../common/mainNavigationBar.jsp" />

   <!-- 섹션 시작 -->
   <section>
      <jsp:useBean id="now" class="java.util.Date" />
      <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

   <%--    <fmt:formatDate value="${grooming.studySd }" var="studySd" pattern="yyyy-MM-dd" /> --%>


      <!-- 컨테이너로 양옆에 공백 생성 -->
      <div class=container>
         <c:url var="calendar" value="calendar.do">
            <c:param name="groomingNo" value="${grooming.groomingNo}" />
            <c:param name="memberNo" value="${loginUser.memberNo}" />
         </c:url>
         <c:url var="gBlist" value="gBlist.do">
            <c:param name="groomingNo" value="${grooming.groomingNo}" />
         </c:url>
         <c:url var="groupP" value="groupPage.do">
            <c:param name="groomingNo" value="${grooming.groomingNo}" />
         </c:url>

         <label><a href="${groupP }"><i class="fas fa-user-graduate"></i>메인</a></label> 
         <label><a href="${calendar }"><i class="fas fa-calendar-alt"></i>출석부</a></label>
         <label><a href="${gBlist }"><i class="fas fa-icons"></i>게시판</a></label>


         <!-- 캘린더 내용 출석 체크 -->
         
                  <div id="div1">
                     <h1>출석부<small>(${memberNickName }님의 현재 출석률은 ${checkLate }% 입니다. <label style="color:lightgreen;">출석:${checkY }</label>&nbsp;&nbsp;<label style="color:yellow;">지각:${checkL }</label>&nbsp;&nbsp;<label  style="color:red;">결석:${checkN }</label>)</small></h1>
                  </div>
         
         <div class="table-responsive container"
            style="text-align: center; height: 300px;">

            <table class="table table-bordered" id="tb1" style="width: 5000px;">
               <tbody>


               </tbody>
            </table>


         </div>
   <c:if test="${loginUser.memberNo eq grooming.memberNo }">
         <h1>출석 체크</h1>
         <div style="text-align: center;" >
            <form action="insertCheck.do" id="form">
            <input type="hidden" name="groomingNo" value="${grooming.groomingNo }"/>
               <table class="table table-bordered" id="#tb2">
                  <thead>
                     <tr>
                        <th style="width: auto; border: 3px double green;">멤버 이름</th>
                        <!-- <th colspan="3" style="width: auto;"><input type="date" name="gCheckDate" id="checkDate" required></th> -->
                         <th colspan="3" style="width: auto;">
                            <input type="date" min="${grooming.studySd }" max="${today }" id="checkDate" name="gCheckDate" required>
                         </th> 
                     </tr>
   
                  </thead>
                  <tbody>
                     <c:forEach var="m" items="${member }">

                        <tr>
                           <input type="hidden" name="memberNickName" value="${m.memberNickName }"/>
                           <td style="width: auto;">${m.memberNickName }</td>
                           <td style="   border: 3px double green;">
                              <select name="gCheckStatus" class="check-select">
                                     <option value="Y" selected>출석</option>
                                     <option value="L">지각</option>
                                     <option value="N">결석</option>
                              </select>
                           </td>
                        
                        </tr>
                     </c:forEach>
                     <tr>
                           <td colspan="4">
                              <button type="button" id="save" >저장</button>
                              <button type="button" id="update">수정하기</button>
                           </td>
                           
                     </tr>
                  </tbody>
   
               </table>
            </form>
         </div>

</c:if>
      
      </div>
   </section>

   
   
   
   <script>
      $(function() {
          checkLate();
         checkList();
         setInterval(function(){
            $("#tb1 tbody").html("");
             checkLate()
            checkList();
         },20000);
         
      
      })

      function checkList() {
         var groomingNo = "${grooming.groomingNo}";
         var memberNickName = "${str}";
         var NickName = memberNickName.split(',');

         for (var j = 0; j < NickName.length; j++) {

            (function(j) {
               $.ajax({
                        url : "checkList.do",
                        data : {
                           groomingNo : groomingNo,
                           memberNickName : NickName[j]
                        },
                        dataType : "json",
                        traditional : true,
                        async : false,
                        success : function(data) {
                           var $label;
                           var $table;
                           var $tableBody;
                           var $tr1;
                           var $tr2;
                           var $td1;
                           var $td2;
                           var $br;
                           $tableBody = $("#tb1 tbody");

                           if (data.length > 0) { // 출석이 하나 이상 존재하면 

                              $label = $("<label class='NickName'>").text(NickName[j]);
                              $table = $("<table class='table table-bordered' id='tb1' >");
                              $tableBody.append($label);
                              $tr1 = $("<tr class='tr1'> style='width:auto;'");
                              $br = $("<br>")
                              for ( var i in data) {

                                 $td1 = $("<td class='td1'>").text(data[i].gCheckDate);
                                 if (data[i].gCheckStatus == 'Y') {
                                    $td2 = $("<td class='td2'>").text("출석");
                                 } else if (data[i].gCheckStatus == 'N') {
                                    $td2 = $("<td class='td2'> style='width:auto;'").text("결석").css('color', 'red');
                                 } else {
                                    $td2 = $("<td class='td2'> style='width:auto;'").text("지각").css('color','yellow');
                                 }
                                 /*  $table.append($tableBody);  
                                 
                                 $div1.append($table);    */

                                 $tr1.append($td1);
                                 $tr1.append($td2);
                                 $tableBody.append($tr1);
                              }
                              $tableBody.append($tr2);
                              $tableBody.append($br);

                           } else {
							  $tableBody.html("");
                              $td2 = $("<div style='text-align:left;'>")
                                    .text("출석체크를 시작일을 처음으로 진행 해주세요!");
                              $tableBody.append($td2);
                           }
                        },
                        error : function(request, status, errorData) {
                           alert("error code: " + request.status
                                 + "\n" + "message: "
                                 + request.responseText + "error: "
                                 + errorData);
                        }
                     });

            })(j);

         }
      }
      
      function checkLate(){
         var groomingNo = "${grooming.groomingNo}";
         var memberNo = "${loginUser.memberNo}";
         var memberNickName = "${memberNickName }";
         $.ajax({
            url : "checkLate.do",
            data : {
               groomingNo : groomingNo,
               memberNo : memberNo
            },
            dataType : "json",
            async : false,
            success : function(data) {
               var $label1;
               var $label2;
               var $label3;
               var $div;
               var $small;
               var $h1;
               $div = $("#div1");
               $div.html("");
               if(data != null){
               $h1 = $("<h1>").text("출석부");
               $small=$("<small>").text("("+data.memberNickName+"님의 현재 출석률은 "+data.checkLate+"% 입니다.)");
               $label1=$("<label style='color:lightgreen;'>").text("출석:"+data.checkY);
               $label2=$("<label style='color:yellow'>").text("지각:"+data.checkL);
               $label3=$("<label style='color:red;'>").text("결석:"+data.checkN);
               
               $small.append($label1);
               $small.append($label2);
               $small.append($label3);
               $h1.append($small);
               $div.append($h1);
               }
            },error : function(request, status, errorData) {
               alert("error code: " + request.status
                     + "\n" + "message: "
                     + request.responseText + "error: "
                     + errorData);
            }
         });
         
         
         
         
      }
      
      
   </script>
<script >
   $(function(){
      
      

   /*    //datepicker 한국어로 사용하기 위한 언어설정
      $.datepicker.setDefaults($.datepicker.regional['ko']);

      // 시작일은 종료일이후 날짜 선택 불가
      // 종료일은 시작일 이전 날짜 선택 불가

      //시작일.
      $('#checkDate').datepicker({
                     showOn : "both", // 달력을 표시할 타이밍 (both: focus or button)
                     buttonImage : "${contextPath }/resources/views/images/calendar.png", // 버튼 이미지
                     buttonImageOnly : true, // 버튼 이미지만 표시할지 여부
                     buttonText : "날짜선택", // 버튼의 대체 텍스트
                     dateFormat : "yy-mm-dd", // 날짜의 형식
                     changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
                     onClose : function(selectedDate) {
                     
                     
                  }
      }); */
   $("#checkDate").change(function(){
      var gCheckDate =$("#checkDate").val();
      $('#save').unbind('click');
      $("#save").on("click",function(){
   
         var groomingNo = "${grooming.groomingNo}";
             $.ajax({
               url:'confirmCheck.do',
               type:'post',
               data:{gCheckDate:gCheckDate,groomingNo:groomingNo},
               success : function (data){
                  if(data == "success"){
                      alert("이미 출석하신 날짜입니다. 수정을 원하시면 오른쪽에 수정버튼을 눌러주세요!");
                   }else {
                      
                      $("#form").submit();
                      alert("출석체크 됬어요~");
                   }
                  
               
                  
               },error:function(request, status, errorData){
                  alert("error code: " + request.status + "\n"
                     +"message: " + request.responseText
                     +"error: " + errorData);
            }
            
            })   
            
            
            // ajax끝
         
         
         
         
         
         
         
         })
   
      $('#update').unbind('click');
      $("#update").on("click",function(){
   
         var groomingNo = "${grooming.groomingNo}";
             $.ajax({
               url:'confirmCheck.do',
               type:'post',
               data:{gCheckDate:gCheckDate,groomingNo:groomingNo},
               success : function (data){
                  if(data == "success"){
                     console.log("일단 액션 바꾸기전");
                     $("#form").attr("action","updateCheck.do");
                     console.log("액션바꾸고 나서");
                     $("#form").submit();
                     alert("수정되었습니다.");
               /*       $("#update").submit(); */
                   }else {
                      alert("출석체크 하지않은 날짜입니다. 출석체크 해주세요!");
                   }
                  
               
                  
               },error:function(request, status, errorData){
                  alert("error code: " + request.status + "\n"
                     +"message: " + request.responseText
                     +"error: " + errorData);
            }
            
            })   
            
            
            // ajax끝
         
         
         
         })
         
      
         
   })
   })
</script>

	<jsp:include page="../common/footer.jsp" />

   <!-- Optional JavaScript -->
   <!-- jQuery first, then Popper.js, then Bootstrap JS -->

   <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
      integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
      crossorigin="anonymous"></script>
   <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
      integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
      crossorigin="anonymous"></script>
</body>
</html>