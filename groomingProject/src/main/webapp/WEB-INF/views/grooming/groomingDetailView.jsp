<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--      <script src="http:/code.jquery.com/jquery-latest.min.js"></script> -->

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
	integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc"
	crossorigin="anonymous">

<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>


<!-- modal CSS  -->
<link
	href="${pageContext.servletContext.contextPath }/resources/views/css/modal.css"
	rel="stylesheet">
<title>Hello, world!</title>
<style>
section img {
	width: 100%;
	height: 100%;
}
/*폰트 설정 */
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
.groomingImage {
width: 450px;
	height: 550px;
	background-size: cover;
	border: 1px solid lightgreen;
}
.status {
	border-radius: 10px;
	border: 1px solid black;
	width: 80px;
	height: 40px;
	text-align: center;
	color: red;
	margin-bottom: 20px;
}
.pimg {
	background-size: cover;
	width: 100px;
	height: 90px;
}
i {
	font-size: 40px;
}
.fas {
	color: yellow;
}
#gImg {
	width: 100%;
	height: 100%;
	border-radius: 10px;
}
</style>
</head>
<body>
	<jsp:include page="../common/mainNavigationBar.jsp" />
 
	<section>



<div class="container" style="margin-bottom: 50px;">


			<div class="row">
				<div class="col-9">
					<table>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td><h3>${grooming.groomingTitle }</h3></td>
						</tr>
						<tr>
							<td><span>모집 기간 : </span><span>${grooming.groomingSd }
									~ ${grooming.groomingEd }</span></td>
						</tr>

					</table>
				</div>
				<div style="text-align: right; margin-left: 70px;">
					<table>
						<tr>
							<td align="right">
								<div class="status">
									<c:if test="${(grooming.groomingEd gt grooming.groomingNd) && (grooming.groomingP gt grooming.currentP) && (grooming.status eq 'Y') }">
										<c:out value="<h4>모집중</h4>" escapeXml="false" />
									</c:if>
									<c:if test="${(grooming.groomingEd lt grooming.groomingNd)  || (grooming.groomingP eq grooming.currentP) || (grooming.status eq 'B') }">
										<c:out value="<h4>마감</h4>" escapeXml="false" />
									</c:if>
								</div>
							</td>
						</tr>
						<tr>
							<td style="text-align:right;"> 
							
									<c:if test="${!empty heart }">
										<i id="heart" class="fas fa-bookmark"></i>
									</c:if>
									<c:if test="${empty heart }">
										<i id="nheart" class="far fa-bookmark"></i>
									</c:if>
								<c:if test="${!empty loginuUser }">
									<button data-toggle='modal' data-target='#declareForm' id='apply'>신고</button>
								</c:if>
								<c:if test="${empty loginuUser }">
									<button data-toggle='modal' data-target='#declareForm' id='apply' disabled>신고</button>
								</c:if>
								
								<!-- 신청폼 모달 -->
								<div class="modal fade" id="declareForm" tabindex="-1" role="dialog" aria-labelledby="declareModalLabel" aria-hidden="true">
			
									<div class="modal-dialog">
										<form action="declare.do" method="post">
											<div class="modal-content" style="width: auto; height: auto;">
											<input type="hidden" value="${grooming.groomingNo }" name="dnNo">
											<input type="hidden" value="${grooming.groomingNo }" name="groomingNo">
											<input type="hidden" value="${loginUser.memberNo }" name="memberNo">
												<!-- 모달 제목 -->
												<div class="modal-header">
													<h5 class="modal-title" id="declareModalLabel">신고 사유</h5>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<!-- 모달 본문 내용 -->
												<div class="modal-body container">
													
													<textarea cols="100" rows="10" placeholder="신고 사유를 입력하세요. "
														id="summernote" name="dContent" class="form-control" required></textarea>
													
												</div>
												<div style="text-align:center; margin-bottom:10px;">
													<button type="sumbit">제출</button>
													<button type="button" data-dismiss="modal">취소</button>
												</div>
											</div>
										</form>
									</div>

								</div>
								
								
							</td>

						</tr>
						<tr>
							<td><span>작성일 :${grooming.groomingCd }</span></td>
						</tr>
						<tr>
							<td><span>조회수 : </span><span>${grooming.count}</span></td>
						</tr>
					</table>
				</div>
			</div>

		</div>
		<div class="container" style="margin-top: 20px;">
			<div class="row">
				<div class="col-5">
					<table>
						<tbody>
							<tr>
								<td>
									<div class="groomingImage">
										<img src="${contextPath }/resources/upGroomingFiles/${grooming.groomingImg}">
									</div>
								</td>
							</tr>
						</tbody>
					</table>

				</div>

				<!-- 컨테이너 우측 -->
				<div class="col-7">
					<table>
						<tbody>

							<tr>
								<td style="padding-right: 20px;">
									<div class="pimg">
										<img
											src="${contextPath }/resources/upprofileFiles/${member.memberPhoto}">
									</div>
								</td>
								<td>호스트 : <span>${member.memberNickName }</span><br> 태그:<c:forEach
										var="t" items="${tag }">
										<span style="color: lightblue;">${t.tagName }</span>
									</c:forEach><br> 경력 : <c:forEach var="s" items="${spec }">
										<span>${s.specName }</span>
									</c:forEach>
								</td>

							</tr>


						</tbody>
					</table>
					<br>
				<table>
					<tbody id="people">
						<tr>
							<td><span>그룹 타입 : </span><span>${grooming.groomingType }</span></td>
						</tr>
						<tr>
							<td><span>스터디 기간 :</span><span>${grooming.studySd } ~ ${grooming.studyEd }</span></td>
						</tr>

						<tr>

							<td><span>예치금 : </span>${grooming.money }</td>
						</tr>
						<tr>
							<td><span>모집인원 : ${grooming.currentP }/${grooming.groomingP }명</span></td>
						</tr>

						<tr>
							<td><br>
							<h4>${grooming.groomingIntroduce }</h4></td>
						</tr>

						<tr>
							<td>
								<p>${grooming.groomingContent }</p>
							</td>
						</tr>
					</tbody>
				</table>

				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
			<c:if test="${loginUser.memberNo eq grooming.memberNo }">
				<div class="col-3">
					<!-- 신청자 리스트  확인 버튼 -->
					<button data-toggle="modal" id="applicantList">신청자 리스트</button><!-- data-target="#applicant" -->
					<!-- 리스트 모달 -->
					<div class="modal fade" id="applicant" tabindex="-1" role="dialog"
						aria-labelledby="applicantModalLabel" aria-hidden="true" data-backdrop="static">

						<div class="modal-dialog">

							<div class="modal-content" style="width: 800px; height: auto;">
								<!-- 모달 제목 -->
								<div class="modal-header">
									<h5 class="modal-title" id="applicantModalLabel">신청자 리스트</h5>
									<button type="button" class="close" id="close" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<!-- 모달 본문 내용 -->
								<div class="modal-body">
									<table class="table" style="text-align: center">
										<thead>
											<!-- 멤버 정보 목록 -->
											<tr>
												<th scope="col" style="width: 100px;">프로필</th>
												<th scope="col" style="width: 100px;">닉네임</th>
												<th scope="col">신청 내용</th>
												<th scope="col" style="width: 200px">수락/거절</th>
											</tr>
										</thead>
										<tbody class="tbody">
										<c:forEach var="aL" items="${appList }">
										
											<tr class="appTr">
											
												<input type="hidden" class="applyNo" value="${aL.groomingAN }" >
												
												<td>
													<div class="pimg" style="width: 50px; height: 50px;">
														<img src="${contextPath }/resources/upprofileFiles/${aL.memberPhoto}">
													</div>
												</td>
												<td >${aL.memberNickName }</td>
												
												<td>
												<button data-toggle="modal" id="contentOpen">신청서 열람</button>
													<%-- <div class="modal modal-xl fade" id="open_modal_appContent" tabindex="-1" role="dialog" 
													aria-labelledby="applyContentLabel" aria-hidden="true" >

														<div class="modal-dialog">

															<div class="modal-content" style="width: 800px; height: auto;">
																
																<!-- 모달 제목 -->
																<div class="modal-header">
																	<h5 class="modal-title" id="applyContentLabel">신청 내용</h5>
																	<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																
																<!-- 모달 본문 내용 -->
																<div class="modal-body">
																	${aL.groomingAC }
																</div>
																
															</div>
														</div>
													</div> --%>
												</td>
												
												<td class="appTd">
													<button class="accept" >수락</button>&nbsp;&nbsp;
													<button class="reject" >거절</button>
												</td>

											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>

							</div>

						</div>

					</div>
					<!-- 신청자 리스트 모달 끝 -->
				</div>

				<c:url var="gupdate" value="groomingUpdate.do" >
					<c:param name="groomingNo" value="${grooming.groomingNo}"/> 
					<c:param name="page" value="${currentPage }"/>						
				</c:url>
			
				<!-- 글의 상태 버튼 -->
				<div class="col-6" style="text-align: center">
					<button onclick="location.href='${gupdate}'">수정</button>
					<button id="deleteGrooming" type="button">삭제</button>
					<button id="limit" type="button">마감</button>
				</div>
				</c:if>
				<c:url var="goMain" value="groomingMain.do" >
					<c:param name="memberNo" value="${loginUser.memberNo}"/> 
					<c:param name="page" value="${currentPage }"/>
				</c:url> 
				<div>
					<button onclick="location.href='${goMain}'">목록으로</button>
				</div>
				<c:if test="${grooming.status eq 'Y' }">
					<c:if test="${loginUser.memberNo ne grooming.memberNo  }">
				<div class="col-3">
		
					<!-- 신청하기 버튼 -->
					<c:if test="${empty loginUser ||(!empty memberNoList) || (grooming.groomingEd lt grooming.groomingNd)  || (grooming.groomingP eq grooming.currentP) || (grooming.status eq 'B') }">
						<c:out value="<button data-toggle='modal' data-target='#applyForm' id='apply' disabled>신청하기</button>" escapeXml="false" />
					</c:if>
					
					<c:if test="${!empty loginUser && (empty memberNoList) && (grooming.groomingEd gt grooming.groomingNd) && (grooming.groomingP gt grooming.currentP) && (grooming.status eq 'Y') }">
						<c:out value="<button data-toggle='modal' data-target='#applyForm' id='apply'>신청하기</button>" escapeXml="false" />
					</c:if>
				
				
					
					<!-- 신청폼 모달 -->
					<div class="modal fade" id="applyForm" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel2" aria-hidden="true" >

						<div class="modal-dialog">
							<form action="applyContent.do" method="post">
								<div class="modal-content" style="width: auto; height: auto;">
								<input type="hidden" value="${grooming.groomingNo }" name="groomingNo">
								<input type="hidden" value="${grooming.money }" name="money">
								<input type="hidden" value="${loginUser.memberNo }" name="memberNo">
								
	
									<!-- 모달 제목 -->
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel2">신청서</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<!-- 모달 본문 내용 -->
									<div class="modal-body container">
										
										<textarea cols="100" rows="10" placeholder="신청된 내용은 수정이 불가피하오니 신중하게 적어주시기 바랍니다."
											name="groomingAC" class="form-control" required></textarea>
										</td>
									</div>
									<div style="text-align:center; margin-bottom:10px;">
										<button type="submit" id="submit" >제출</button>
										<button type="button" data-dismiss="modal">취소</button>
									</div>
								</div>
							</form>
						</div>

					</div>
					
					<!-- 신청 폼 모달 끝 -->
				</div>
				</c:if>
			</c:if>
			</div>
		</div>
	<input type="hidden" value="${grooming.money }" id ="hiddenmoney">
	</section>
	 

	<script>
      $(function(){
         $("#applicantList").on("click",function(){
            var groomingNo = "${grooming.groomingNo}";
            $.ajax({
               url:"LimitCheck.do",
               data:{groomingNo:groomingNo},
               success:function(data){
                  if(data=="success"){
                     alert("이미 마감된 게시글입니다.");
                     event.stopImmediatePropagation();
                  }else{
                     
                     $("#applicant").modal("show");
                  }
               
                  
               },error:function(request, status, errorData){
                  alert("error code: " + request.status + "\n"
                        +"message: " + request.responseText
                        +"error: " + errorData);
               }
               })
            
            
            
            
         
         })
         
         $("#close").on("click",function(){
            $("#applicant").modal("hide");
         })
         
         $(document).on("click",".close",function(){
            $("div[name=modal]").modal("hide");
         })
         
         
      })
   
   
   </script>
	<script>
      $(function(){
         var groomingNo = "${grooming.groomingNo}";
         $("#deleteGrooming").on("click",function(){
            var result = confirm("삭제하시겠습니까?");
            
            if(result){
               location.href="groomingDelete.do?groomingNo="+groomingNo;
            }
         
         })
         
         
         $("#limit").on("click",function(){
            var result = confirm("글을 마감하시겠습니까?");
            
            if(result){
            
               $.ajax({
                  url:"groomingLimit.do",
                  data:{groomingNo:groomingNo},
                  success:function(data){
                     if(data=="success"){
                        alert("마감 되었습니다.");
                        location.reload();
                     }
                  
                     
                  },error:function(request, status, errorData){
                     alert("error code: " + request.status + "\n"
                           +"message: " + request.responseText
                           +"error: " + errorData);
                  }
                  })
               
               
            
            
            }
            
         })
      })
      
   
   
   
   
   </script>

	<script>
      $("#submit").on("click",function(){
    	 alert("신청되었습니다.");
      })
   </script>
	<script>
   
      $(function(){
         var gheart = "${heart.groomingHNo}";
         var groomingNo = "${grooming.groomingNo}";
         var memberNo = "${loginUser.memberNo}";
         var gmemberNo="${grooming.memberNo}";
         var dmemberNo = "${declaration.memberNo}";
         var dgroomingNo = "${declaration.dnNo}";
         var groomingTitle = "${grooming.groomingTitle}";
         var count = "${grooming.count}";
      $(document).on("click","#nheart",function(){
   		if(memberNo == ""){
   			alert("로그인 해야지만 이용가능한 서비스 입니다.");
   			return false;
   		}
         $.ajax({
            url:"findHeart.do",
            data:{groomingNo:groomingNo,memberNo:memberNo},
            success:function(data){
               if(data=="false"){
                  // 이 게시글이 찜하기가 안되어있다.
                           if(memberNo == gmemberNo){
                              alert("자신의 글은 찜할 수 없습니다.!")
                           }else{
                              $.ajax({
                                 url:"addHeart.do",
                                 data:{groomingNo:groomingNo,memberNo:memberNo},
                                 success:function(data){
                                    console.log("찜");
                                    var $div1;
                                    var $div2;
                                    var $div3;
                                    var $h1;
                                    var $i;
                                    var $span;
                                     $div2 = $("#top div");
                                     $div2.html("");
                                       if(data == "success"){
                                         /*   $h1=$("<h1>").text(groomingTitle+" ");
                                           $i=$("<i id='nheart' class='fas fa-bookmark'>");
                                           $h1.append($i);
                                           $div2.append($h1);
                                     */
                                    	   $("#nheart").attr("class","fas fa-bookmark");
                                       }
                                    
                                    
                                 },error:function(request, status, errorData){
                                    alert("error code: " + request.status + "\n"
                                          +"message: " + request.responseText
                                          +"error: " + errorData);
                                 }
                                 })
                                 
                           } // else 끝
                        
                        
                     
               }else{
                  $.ajax({
                     url:"cancelHeart.do",
                     data:{groomingNo:groomingNo,memberNo:memberNo},
                     success:function(data){
                           console.log("취소");
                           var $div1;
                           var $div2;
                           var $div3;
                           var $h1;
                           var $i;
                           var $span;
                            $div2 = $("#top div");
                            $div2.html("");
                              if(data == "success"){
                                /*   $h1=$("<h1>").text(groomingTitle+" ");
                                  $i=$("<i id='nheart' class='far fa-bookmark'>");
                                 
                                  $h1.append($i);
                                  $div2.append($h1); */
                                  $("#nheart").attr("class","far fa-bookmark");
                           }
                        
                        
                     
                        
                     },error:function(request, status, errorData){
                        alert("error code: " + request.status + "\n"
                              +"message: " + request.responseText
                              +"error: " + errorData);
                     }
                     })
               }
            
               
            },error:function(request, status, errorData){
               alert("error code: " + request.status + "\n"
                     +"message: " + request.responseText
                     +"error: " + errorData);
            }
            })
      
      })
      
         $("#apply").on("click",function(e){
            var result = confirm("신고하시겠습니까?");
            
            if(result){
               if(memberNo == gmemberNo){
                  alert("자신의 글은 신고할 수 없습니다.");
                  $(this).attr("disabled",true)
               }
               
               if((memberNo == dmemberNo) && (groomingNo == dgroomingNo)){
                  alert("이미 신고하신 게시글 입니다.!");
                  $(this).attr("disabled",true)
               }
            }else{
               event.stopImmediatePropagation();
            }
            
         })
         
         
      
      })
  
   
   </script>

	<script>
      
      $(function(){
         
         
         getAppList();
           setInterval(function(){
            currentPeole();
         },1000);   
         
         $(document).on("click",".accept",function(){
            var groomingNo = "${grooming.groomingNo}";
            var appTemp = $(this);
            var applyNo = appTemp.parents(".appTr").children(".applyNo").val();
            var groomingP = "${grooming.groomingP}" ;
            var currentP = "${grooming.currentP}";
            var money = $("#hiddenmoney").val();
            var groomingType = "${grooming.groomingType }";
            $.ajax({
               url:"checkPeople.do",
               data:{groomingNo:groomingNo},
               success:function(data){
                  if(data.groomingP == data.currentP){
                     event.stopImmediatePropagation();
                     alert("참여인원이 꽉 찼습니다.!");
                  }else{
                     
                     $.ajax({
                        url:"checkGPoint.do",
                        data:{applyNo:applyNo},
                        dataType:"json",
                        success:function(data){
                           var allmoney = 0;
                           if(data.length>0){
                              for(var i in data){
                                  allmoney += data[i].addPoint; 
                                  
                              }
                           }else{
                              event.stopImmediatePropagation();
                              alert("신청자의 포인트가 부족합니다.!");
                              return false;
                           }
                           if(allmoney < money){
                              console.log(allmoney);
                              console.log(돈);
                              event.stopImmediatePropagation();
                              alert("신청자의 포인트가 부족합니다.!");
                              return false;
                           }else{
                              $.ajax({
                                 url:"gaccept.do",
                                 data:{applyNo:applyNo,groomingNo:groomingNo,money:money,groomingType:groomingType},
                                 success:function(data){
                                    if(data=="success"){
                                    getAppList();
                                 }
                                    
                                 },error:function(request, status, errorData){
                                    alert("error code: " + request.status + "\n"
                                          +"message: " + request.responseText
                                          +"error: " + errorData);
                                 }
                                 })
                           }
                           
                           
                           
                           
                        
                           
                        },error:function(request, status, errorData){
                           alert("error code: " + request.status + "\n"
                                 +"message: " + request.responseText
                                 +"error: " + errorData);
                        }
                        })
                        
                        
                        
                        
                  }   // else 끝 
                  
               }
                  
               ,error:function(request, status, errorData){
                  alert("error code: " + request.status + "\n"
                        +"message: " + request.responseText
                        +"error: " + errorData);
               }
               })
            
            
            
         
            });
         
         
         
         $(document).on("click",".reject",function(){
            var groomingNo = "${grooming.groomingNo}";
            var appTemp = $(this);
            var applyNo = appTemp.parents(".appTr").children(".applyNo").val();
            
            $.ajax({
               url:"greject.do",
               data:{applyNo:applyNo},
               success:function(data){
                  if(data=="success"){
                  getAppList();
               }
                  
               },error:function(request, status, errorData){
                  alert("error code: " + request.status + "\n"
                        +"message: " + request.responseText
                        +"error: " + errorData);
               }
               })
         })
         
      })
      
                  
         
            /* -- ajax-- */
         
         
      function getAppList(){
         
         var groomingNo = "${grooming.groomingNo}";
         $.ajax({
            url:"gacceptList.do",
            data:{groomingNo:groomingNo},
            dataType:"json",
            success:function(data){
               $tableBody = $(".tbody");
               $tableBody.html("");
               
               var $tr;
               var $input;
               var $td1;
               var $div1;
               var $img1;
               var $td2;
               var $td3;
               var $td4;
               var $button1;
               var $div2;
               var $div3;
               var $div4;
               var $div5;
               var $h5;
               var $button2;
               var $span1;
               
               var $div6;
               var $td5;
               var $button3;
         
                  console.log(data.length);
               if(data.length> 0){   // 신청자가 한 명 이상 존재하면
                  for(var i in data){
                      $tr = $("<tr class='appTr'>");
                      $input = $("<input type='hidden' class='applyNo' >");
                      $inputVal = $input.val(data[i].groomingAN);
                      $td1 = $("<td>");
                      $div1 = $("<div class='pimg' style='width:50px; height:50px;'>");
                      $img1 = $("<img src='${contextPath }/resources/upprofileFiles/"+data[i].memberPhoto+"'>");
                      $td2 = $("<td>").text(data[i].memberNickName);
                      $td3 = $("<td>");
                      $button1 = $("<button data-toggle='modal' data-target='#open_modal_appContent"+i+"'>").text("신청서열람");
                      $div2 = $("<div class='modal' name='modal' id='open_modal_appContent"+i+"'>");
                      $div3 = $("<div class='modal-dialog'>");
                      $div4 = $("<div class='modal-content' style='width: 500px; height: 300px;'>");
                      $div5 = $("<div class='modal-header'>");
                      $h5 = $("<h5 class='modal-title'>").text("신청 내용");
                      $button2 = $("<button type='button' class='close'>");
                      $span1 = $("<span aria-hidden='true'>").text("X");
                     
                      $div6 = $("<div class='modal-body'>").text(data[i].groomingAC);
                      
                      $td4 = $("<td>");
                      $button3 = $("<button class='accept'>").text("수락");
                      $button4 = $("<button class='reject'>").text("거절");
                      
                      $td1.append($div1);
                      $div1.append($img1);
                      $td3.append($button1);
                      $td3.append($div2);
                      
                      $div2.append($div3);
                      $div3.append($div4);
                      $div4.append($div5);
                      $div5.append($h5);
                      $div5.append($button2);
                      $button2.append($span1);
                      
                      $div4.append($div6);
                      $td4.append($button3);
                      $td4.append($button4);
                      
                      $tr.append($td1);
                      $tr.append($td2);
                      $tr.append($td3);
                      $tr.append($td4);
                      $tr.append($inputVal);
                      $tableBody.append($tr);
                      
                  }
               }else{               // 신청자가 없으면
                  $tr = $("<tr>");
                  $rContent = $("<td colspan='3'>").text("신청자가 없습니다.");
                  
                  $tr.append($rContent);
                  $tableBody.append($tr);
               }
               
               
            },
            error:function(request, status, errorData){
               alert("error code: " + request.status + "\n"
                     +"message: " + request.responseText
                     +"error: " + errorData);
            }
         }) 
      }
      
      
      function currentPeole(){
         var groomingNo = "${grooming.groomingNo}";
         
         $.ajax({
            url:"checkPeople.do",
            data:{groomingNo:groomingNo},
            dataType:"json",
            success:function(data){
               $tableBody = $("#people");
               $tableBody.html("");
               
               var $tr1;
               var $tr2;
               var $tr3;
               var $tr4;
               var $tr5;
               var $tr6;
            
               var $td1;
               var $td2;
               var $td3;
               var $td4;
               var $td5;
               var $td6;
            
               var $span1;
               var $span2;
               var $span3;
               var $span4;
               var $span5;
               var $span6;
               var $span7;
               
               var $br;
               var $h4;
               var $p;
            
                  $tr1 = $("<tr>");
                  $tr2 = $("<tr>");
                  $tr3 = $("<tr>");
                  $tr4 = $("<tr>");
                  $tr5 = $("<tr>");
                  $tr6 = $("<tr>");
                  
                  $td1 = $("<td>"); 
                  $td2 = $("<td>"); 
                  $td3 = $("<td>"); 
                  $td4 = $("<td>"); 
                  $td5 = $("<td>"); 
                  $td6 = $("<td>"); 
                  
                  $span1 = $("<span>").text("그룹 타입 : ");
                  $span2 = $("<span>").text(data.groomingType);
                  $span3 = $("<span>").text("스터디 기간 : ");
                  $span4 = $("<span>").text(data.studySd+" ~ "+data.studyEd);
                  $span5 = $("<span>").text("예치금 : ");
                  $span6 = $("<span>").text(data.money);
                  $span7 = $("<span>").text("모집 인원 : "+data.currentP+"/"+data.groomingP+"명");
                  
                  $br = $("<br>");
                  $h4 = $("<h4>").text(data.groomingIntroduce);
                  $p = $("<p>").text(data.groomingContent);
                  
                  $td1.append($span1);
                  $td1.append($span2);
                  $td2.append($span3);
                  $td2.append($span4);
                  $td3.append($span5);
                  $td3.append($span6);
                  $td4.append($span7);
                   $td5.append($br);
                  $td5.append($h4);
                  $td6.append($p); 
                  
                  $tr1.append($td1);
                  $tr2.append($td2);
                  $tr3.append($td3);
                  $tr4.append($td4);
                   $tr5.append($td5);
                  $tr6.append($td6); 
                  
                  $tableBody.append($tr1);
                  $tableBody.append($tr2);
                  $tableBody.append($tr3);
                  $tableBody.append($tr4);
                   $tableBody.append($tr5);
                  $tableBody.append($tr6); 
                  
               
               
            },
            error:function(request, status, errorData){
               alert("error code: " + request.status + "\n"
                     +"message: " + request.responseText
                     +"error: " + errorData);
            }
         }) 

         
         
      }
      
      
   </script>

	<jsp:include page="../common/footer.jsp" />


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<!--    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"></script> -->
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