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
    <c:url var="calendar" value="calendar.do">
    	<c:param name="groomingNo" value="${grooming.groomingNo}"/>
    </c:url>
	<c:url var="gBlist" value="gBlist.do">
			<c:param name="groomingNo" value="${grooming.groomingNo}"/>
	</c:url>
	<c:url var="groupP" value="groupPage.do">
			<c:param name="groomingNo" value="${grooming.groomingNo}"/>
	</c:url>
    
        <!--디폴트 메뉴-->
        <label><a href="${groupP }"><i class="fas fa-user-graduate"></i>메인</a></label>

        <label><a href="${calendar }"><i class="fas fa-calendar-alt"></i>출석부</a></label>

        <label><a href="${gBlist }"><i class="fas fa-icons"></i>게시판</a></label>


        <!-- 메인에 들어갈 내용용 -->
        <section >
         
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
                                <tr class="appTr">
                                	<input type="hidden" value="${m.memberNo }" class="memberNo">
                                    <td>
                                        <div class="pimg" style="width:40px; height:40px; ">
                                        	<img src="${contextPath }/resources/upprofileFiles/${m.memberPhoto}">
                                        </div>
                                    </td>
                                    <td class="nick">${m.memberNickName}</td>
                                    <td>${m.memberEmail}</td>
                                    <td>${m.memberPhone}</td>
                                    <c:if test="${grooming.memberNo eq m.memberNo }">
                                    	<td>${grooming.groomingType }</td>
                                    </c:if>
	                                <c:if test="${grooming.memberNo ne m.memberNo }">
                                  	 	 <td>스터디원</td>
                                    </c:if>
                                    <c:if test="${loginUser.memberNo eq grooming.memberNo}">
	                                    <c:if test="${grooming.memberNo eq m.memberNo}">
	                                   	 <td><button class="kickout" value="제명" disabled><i class="fas fa-user-minus"></i></button></td>
	                                    </c:if>
	                                    <c:if test="${grooming.memberNo ne m.memberNo }">
	                                   	 <td><button type="button" class="kickout" ><i class="fas fa-user-minus"></i></button></td>
	                                    </c:if>
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
			
			
			
			getGroupList();
			
			setInterval(function(){
				getGroupList();
			},10000);   
			
			$(document).on("click",".kickout",function(){
			var appTemp = $(this);
			var memberNo = appTemp.parents(".appTr").children(".memberNo").val();
			var nick = appTemp.parents(".appTr").children(".nick").text();
			
				var result = confirm(nick+"님을 제명하시겠습니까?");
		
				if(result){
					
					$.ajax({
						url:'kickOut.do',
						type:'post',
						data:{memberNo:memberNo},
						success:function(data) {
							if(data=="success"){
							getGroupList();
							alert(nick+"님을 그룹에서 제명하셨습니다.");
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
			
			
			function getGroupList(){
				var groomingNo = $("#groomingNo").val();
				var groomingType = "${grooming.groomingType}";
				var groomingMemberNo = "${grooming.memberNo}";
				var memberNo = "${loginUser.memberNo}";
				$.ajax({
					url:'groupList.do',
					type:'post',
					data:{groomingNo:groomingNo},
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
						
						var $td3;
						var $td4;
						var $td5;
						var $td6;
						var $td7;
						var $button;							
						var $icon;
						if(data.length > 0) {
							for(var i in data) {
								console.log(data[i].gMemberNo);
							$tr = $("<tr class='appTr'>");
							$input = $("<input type='hidden' class='memberNo'>");
							$inputVal = $input.val(data[i].memberNo);            
							$td1 = $("<td>");
							$div1 = $("<div class='pimg' style='width:40px; height:40px; '>");
							$img1 = $("<img src='${contextPath }/resources/upprofileFiles/"+data[i].memberPhoto+"'>");
							
							$td3 = $("<td class='nick'>").text(data[i].memberNickName);
							$td4 = $("<td>").text(data[i].email);
							$td5 = $("<td>").text(data[i].phone);
							
								if(data[i].memberNo == data[i].gMemberNo){
									$td6 = $("<td>").text(groomingType);
								}else if(data[i].memberNo != data[i].gMemberNo){
									$td6 = $("<td>").text("스터디원");
								}
							$icon =$("<i class='fas fa-user-minus'>");
							$td7 = $("<td>");
							if(groomingMemberNo == memberNo){
								if(data[i].memberNo == data[i].gMemberNo){
									$button = $("<button class='kickout' disabled>");
									$button.append($icon);
									$td7.append($button);
								}else if(data[i].memberNo != data[i].gMemberNo){
									$button = $("<button class='kickout'>");
									$button.append($icon);
									$td7.append($button);
								}
							}else{
								$button = $("<button class='kickout' disabled>");
								$button.append($icon);
								$td7.append($button);
							}	
								
								$div1.append($img1);
								$td1.append($div1);
								$tr.append($inputVal);
								$tr.append($td1);
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
		
	</script>
	
	<!-- 캘린더 내용 (일정 관리/출석 체크) -->
    <section id="content2">
       
          
       
    </section>

    <!--게시판에 들어갈 내용 -->
    <section id="content3">
        
          
        
    </section>

</div>


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