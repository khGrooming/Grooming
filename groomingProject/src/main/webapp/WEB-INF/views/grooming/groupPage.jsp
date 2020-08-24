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
        <!--디폴트 메뉴-->
        <input id="tab1" type="radio" name="tabs" checked>
        <label for="tab1"><i class="fas fa-user-graduate"></i>메인</label>

        <input id="tab2" type="radio" name="tabs">
        <label for="tab2"><i class="fas fa-calendar-alt"></i>캘린더</label>

        <input id="tab3" type="radio" name="tabs" >
        <label for="tab3"><i class="fas fa-icons"></i>게시판</label>


        <!-- 메인에 들어갈 내용용 -->
        <section id="content1">
         
               <!-- 그루밍 제목 -->
                <h2 style="margin-top:20px; margin-left:20px;" align="left">${grooming.groomingTitle }</h2>
                <!-- 그루밍 한줄 소개 -->
                <p  style="margin-top:20px; margin-left:20px;" align="left">${grooming.groomingIntroduce }</p>
                <div class="row">
                    <div class="col-4" style="width: 20%;">
                        <table>
                            <tr>
                                <div class="gimg"
                                    style="width: 300px; height:300px;  margin-left: 50px; margin-top: 50px; position: relative;">
                                    <!-- 그룹 이미지 들어갈 곳 -->
                                    <img src="${contextPath }/resources/upGroomingFiles/${grooming.groomingImg}"> 
                                </div>
                            </tr>

                        </table>
                    </div>

                    <div class="col-8" style=" margin-top: 50px; width:80%; ">
                        <table class="table">
                            <thead>
                                <!-- 멤버 정보 목록 -->
                                <tr>
                                    <th scope="col" style="width: 200px;">프로필</th> 
                                    <th scope="col" style="width: 200px;">닉네임</th>
                                    <th scope="col" style="width: 200px;">이메일</th>
                                    <th scope="col" style="width: 200px;">연락처</th>
                                    <th scope="col" style="width:200px;">회원</th>
                                    <th scope="col" style="width:200px;">제명</th>
                                </tr>
                            </thead>
                            <tbody class="tbody">
                            <c:forEach var="m" items="${mlist }">
                                <tr>
                                	<input type="hidden" value="${m.memberNo }" class="memberNo">
                                    <td>
                                        <div class="pimg" style="width:40px; height:40px; ">
                                        	<img src="${contextPath }/resources/upprofileFiles/${m.memberPhoto}">
                                        </div>
                                    </td>
                                    <td>${m.memberNickName}</td>
                                    <td>${m.memberEmail}</td>
                                    <td>${m.memberPhone}</td>
                                    <c:if test="${grooming.memberNo eq m.memberNo }">
                                    	<td>${grooming.groomingType }</td>
                                    </c:if>
	                                <c:if test="${grooming.memberNo ne m.memberNo }">
                                  	 	 <td>스터디원</td>
                                    </c:if>
                                    <c:if test="${grooming.memberNo eq m.memberNo }">
                                   	 <td><button type="button" disabled>제명</button></td>
                                    </c:if>
                                    <c:if test="${grooming.memberNo ne m.memberNo }">
                                   	 <td><button type="button" id="kickout">제명</button></td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            <input type="hidden" value="${grooming.groomingNo }" id="groomingNo">
    
    </section>
	<script>
		$(function(){
			var groomingNo = $("#groomingNo").val();
			var memberNo = $(".memberNo").val();
			var groomingType = "${grooming.groomingType}";
			$("#kickout").on("click",function(){
				var result = confirm("제명하시겠습니까?");
		
				if(result){
					
					$.ajax({
						url:'kickOut.do',
						type:'post',
						data:{groomingNo:groomingNo, memberNo:memberNo},
						dataType:"json",
						success:function(data) {
							
							$tableBody = $(".tbody");
							$tableBody.html("");
							
							var $tr;
							var $input;
							var $inputVal;
							var $td1;
							var $div1;
							var $img1;
							
							var $td2;
							var $td3;
							var $td4;
							var $td5;
							var $td6;
							var $td7;
							var $button;							
							
							if(data.length > 0) {
								for(var i in data) {
									console.log(data[i].gMemberNo);
								$tr = $("<tr>");
								$input = $("<input type='hidden' class='memberNo'>");
								$inputVal = $input.val(data[i].memberNo);            
								$td1 = $("<td>");
								$div1 = $("<div class='pimg' style='width:40px; height:40px; '>");
								$img1 = $("<img src='${contextPath }/resources/upprofileFiles/"+data[i].memberPhoto+"'>");
								
								$td3 = $("<td>").text(data[i].memberNickName);
								$td4 = $("<td>").text(data[i].email);
								$td5 = $("<td>").text(data[i].phone);
								
									if(data[i].memberNo == data[i].gMemberNo){
										$td6 = $("<td>").text(groomingType);
									}else if(data[i].memberNo != data[i].gMemberNo){
										$td6 = $("<td>").text("스터디 원");
									}

								$td7 = $("<td>");
									if(data[i].memberNo == data[i].gMemberNo){
										$button = $("<button type='button' disabled>");
										$td7.append($button);
									}else if(data[i].memberNo != data[i].gMemberNo){
										$button = $("<button type='button' id='kickout'>");
										$td7.append($button);
									}
									
									
									$div1.append($img1);
									$td1.append($div1);
									$tr.append($inputVal);
									$tr.append($td1);
									$tr.append($td2);
									$tr.append($td3);
									$tr.append($td4);
									$tr.append($td5);
									$tr.append($td6);
									$tr.append($td7);
									
									$tableBody.append($tr);
								} //for end
							}

						},
						error : function(request, status, errorData) {
							alert("error code: " + request.status + "\n"
								+ "message: " + request.responseText
								+ "error: " + errorData);
						}

					}); // ajax end
				
				
				}
				
				
			
			
			})
		})
		
		
		
	
	
	
	</script>
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
        
        <table class="table table-hover" id="boardId">
            <thead>
              <tr>
                <th scope="col">글번호</th>	
                <th scope="col">글유형</th><!-- 공지사항/자유게시판 -->
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">작성일</th>
                <th scope="col">조회수</th>
              </tr>
            </thead>
            <tbody>
              <tr onclick="location.href='groupdetail.do'">
                <th scope="row">1</th>
                <td>공지사항</td>
                <td>내일 예정이었던 스터디디</td>
                <td>김성훈</td>
                <td>2020-07-12</td>
                <td>2</td>
              </tr>

            </tbody>
        
          </table>
          
          <!-- 글작성 버튼 -->
 	       <div class="col-12" align="right">
          	<button type="button"  style="margin-right:10px;" id="ib" onclick="location.href='groupBoardInsertForm.do'" >글 작성</button>
          </div>
         <!--     <script>
                $(function () {
                    var td = $("#boardId tbody tr td").eq(0).text();
                    if (td.equals("공지사항")) {
                        $('#boardId tbody tr td').css({
                            "background-color": "blue"
                        });
                    }
                })
            </script> -->
    
          
          <!-- 페이지네이션 -->
          <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
              <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#">Next</a>
              </li>
            </ul>
          </nav>
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