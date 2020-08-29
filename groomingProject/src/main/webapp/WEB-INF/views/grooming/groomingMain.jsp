<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!doctype html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
  
  <!-- 아이콘 -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
        integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
 	 
    <title>Hello, world!</title>
    <style>
        #tab-menu li {
            width: 100px;
            font-size: large;
            font-weight: bold;
        }
        #tab-menu li a {
            text-align: center;
            color: black;
        }
        img {
            max-width: 100%;
            max-height: 100%;
        }
        #circle {
            width: 50px;
            height: 50px;
            border-radius: 100px;
            background: white;
            color:black;
            text-align: center;
            margin-left: 15px; 
            margin-top: 10px;
            border: 2px solid blue;
            display:table-cell;
            vertical-align:middle;
            line-height: 50px;
            top: 0;
    		left: 0;
            position:absolute;
        }
        
        #day{
        	position:relative;
        }
        .top-img{
          
            background-size: cover;
            height: 200px;
            border: 2px solid skyblue;
            border-radius: 15px 15px 0px 0px;
        }
        .groupType{
            margin-left: 100px;
        }
        .card{
            border: 2px solid skyblue;
            border-radius: 15px;
        }
        .card-deck{
            margin-top: 30px;
        }
		label{
			font-size:20px;
		}
	
	   
	   .card-deck{
	   	margin-right:auto;
	   	margin-left:auto;
	   	width: 100%;
	   }
	   
	   #end, #now{
	   	display:hidden;
	   }
    </style>
</head>

<body>
    <!-- 헤더시작 -->
    <header>
	<jsp:include page="../common/mainNavigationBar.jsp" />
    </header>

    <!-- 섹션 시작 -->
    <section>
    
 

        <!-- 컨테이너 -->
        <div class="container" style="margin-top: 150px;">
            <!-- 필터와 검색 -->
            <div class="row">
                <div class="cols-3 search_filter" style="width: 20%; text-align: right;"  >

                    <input type="radio" name="search_filter" id="mentor">&nbsp;<label for="mentor">멘토 타입</label>
                    <input type="radio" name="search_filter" id="money">&nbsp;<label for="money">예치금 존재</label>
                </div>
                <div class="cols-9"  style="width: 80%; text-align: right; padding-right:5pxx">
                    <select id="search">
                        <option value="title" id="title">제목</option>
                        <option value="writer" id="writer">작성자</option>
                        <option value="content" id="content">내용</option>
                    </select>
                    <input type="text" size="30px" id="keyword" required>
                    <button id="find">검색</button>
                    
                    <c:if test="${!empty loginUser }">
                  	
                    <button type="button" id="writeG">글쓰기</button>
                 	  
                    </c:if>
                </div>
            </div>
            <!-- 스터디 그룹 리스트 -->
  		 <div style="margin-top: 20px;">
            

          
		<div class="container">
			<div id="row"class="row">
		    <c:forEach var="g" items="${glist }">
		    	<!--날짜 차이 계산을 위한 fmt  -->
		
	    	 <fmt:formatDate value="${g.groomingNd }" var="nowDate1" pattern="yyyyMMdd"/>
	    	
 	 		<fmt:formatDate value="${g.groomingEd }" var="endDate1" pattern="yyyyMMdd"/>
 	 		
 	 		<fmt:parseDate value="${nowDate1 }" var="nowDate2" pattern="yyyyMMdd" />
 	 		<fmt:parseDate value="${endDate1 }" var="endDate2" pattern="yyyyMMdd" />
 	 		
	    	<fmt:parseNumber value="${(endDate2.time - nowDate2.time)/ ( 24*60*60*1000)}" integerOnly="true" var="difDate"/> 
	
	    	
  			
 				
                <div class="card-deck col-lg-3">
                
		                    <div class="card">
		                        <!-- 그룹 이미지 -->
		                        <div class="top-img">
		                            <img src="${contextPath }/resources/upGroomingFiles/${g.groomingImg}">
		                          
		                            <!-- 그룹 d-day 태그 -->
		                            <div id="circle" >
		                            <c:if test="${(g.groomingEd gt g.groomingNd) && (g.groomingP gt g.currentP) && (g.status eq 'Y') }">
		                                <span id="d-day">D-</span><span id="day" >${difDate }</span>
		                            </c:if>
		                            <c:if test="${(g.groomingEd lt g.groomingNd) || (g.groomingP eq g.currentP) || (g.status eq 'B')}">
		                               <span id="day">마감</span>
		                            </c:if>
		                          
		                            </div>
		                        </div>
		                        <!-- 그룹 본문 -->
		                        <div class="card-body">
		                            <!-- 그룹 제목 -->
		                            <c:url var="gdetail" value="groomingDetail.do">
										<c:param name="groomingNo" value="${g.groomingNo }"/>
										<c:param name="memberNo" value="${loginUser.memberNo }"/> 
										<%-- <c:param name="page" value="${pi.currentPage }"/> --%>
										<!-- 현재 보던 페이지 정보도 넘기자 -->
									</c:url>
		                            <h5 class="card-title"><a href="${gdetail }">${g.groomingTitle }</a></h5>
		                            <!-- 그룹 한줄 소개  -->
		                            <p class="card-text">${g.groomingIntroduce }</p>
		                            <p class="card-text">
		                                <small class="text-muted">참여인원</small>&nbsp;<small><span>${g.currentP }/</span><span>${g.groomingP }</span></small>
		                                <small><span class="groupType">${g.groomingType}</span></small>
		                            </p>
		
		                        </div>
		                    </div>
		           
	                 </div>
					</c:forEach>
                 </div>
                  
             
                   
                </div>
  
        </div>
       </div>
       <input type="hidden" value="${selectG }" id="selectG">
       <input type="hidden" value="${selectS }" id="selectS">
    </section>
    <!-- 필터 -->
    
    <script>
   	$(function(){
    		
    	var gmemberNo = $("#selectG").val();
    	var smemberNo = $("#selectS").val();
    	var memberNo = "${loginUser.memberNo}";
    	$("#writeG").on("click",function(){
    	
    		if(gmemberNo != ""){
    			alert("이미 작성하신 스터디 게시글이 있습니다.");
    		
    		}else if(smemberNo != ""){
    			var result = confirm("임시저장된 글이 있습니다. 불러오시겠습니까?");
    			
    			if(result){
    				location.href='groomingSaveInsert.do?memberNo='+memberNo;
    			
    			}else{
    				event.preventDefault();
    			}
    			
    		}else{
    			
    			location.href='groomingInsert.do';
    		}
    		
    		
    	})
   	})
    
    </script>
	<script>
		$(function(){
	
			 
			$("#mentor").click(function(){
				
				$.ajax({
					url : 'groomingMe.do',
					type : 'post',
					dataType:"json",
					success : function (data){
					    $divRow = $("#row");
					    $divRow.html("");
					    
						var $divCardDeck ;
						var $divCard;
						var $divTopImg ;
						var $divCircle ;
						var $dDay;
						var $day ;
						var $cardBody;
						var $cardTitle;
						var $gDetail;
						var $cardText1;
						var $cardText2 ;
						var $small1 ;
						var $small2;
						var $span1;
						var $span2 ;
						var $small3 ;
						var $span3;
						var $img;
						
						
						if(data.length >0){ 
							for(var i in data){
								// D-day 계산을 위한 것
								var endDate = new Date(data[i].groomingEd);
								var nowDate = new Date(data[i].groomingNd);
								var difDate = endDate.getTime() - nowDate.getTime();
								difDate = difDate/(1000*60*60*24);
								
								 $divCardDeck = $("<div class='card-deck col-lg-3'>");
								 $divCard = $("<div class='card'>");
								 $divTopImg = $("<div class='top-img'>");
								 $img = $("<img src=/groomingProject/resources/upGroomingFiles/"+data[i].groomingImg+">");
								 $divCircle = $("<div id='circle'>");
								 if(data[i].groomingEd > data[i].groomingNd){
									
									 $dDay = $("<span id='d-day'>").text("D-");
									 $day = $("<span id='day'>").text(difDate);
									 $divCircle.append($dDay);
									 $divCircle.append($day);
								 }else{
									 $day = $("<span id='day'>").text("마감");
									 $divCircle.append($day);
								}
								
								 $cardBody = $("<div class='card-body'>");
								 $cardTitle = $("<h5 class='card-title'>");
								 $gDetail =$("<a href='groomingDetail.do?groomingNo="+data[i].groomingNo+"'>").text(data[i].groomingTitle);
								 $cardText1 = $("<p class='card-text'>").text(data[i].groomingIntroduce);
								 $cardText2 = $("<p class='card-text'>");
								 $small1 = $("<small class='text-muted'>").text("참여인원&nbsp;");
								 $small2 = $("<small>");
								 $span1 = $("<span>").text(data[i].currentP+"/");
								 $span2 = $("<span>").text(data[i].groomingP);
								 $small3 = $("<small class='text-muted'>");
								 $span3 = $("<span class='groupType'>").text(data[i].groomingType);
								
								 
								 $divTopImg.append($divCircle);
								 $divTopImg.append($img);
								 
								 $cardTitle.append($gDetail);
								 
								 $small2.append($span1);
								 $small2.append($span2);
								 $small3.append($span3);
								 $cardText2.append($small2);
								 $cardText2.append($small3);
								 
								 $cardBody.append($cardTitle);
								 $cardBody.append($cardText1);
								 $cardBody.append($cardText2);
								 
								 $divCard.append($divTopImg);
								 $divCard.append($cardBody);
								 
								 $divCardDeck.append($divCard);
								 $divRow.append($divCardDeck);
						
							}
						}
					
					
			
					},error:function(request, status, errorData){
						alert("error code: " + request.status + "\n"
							+"message: " + request.responseText
							+"error: " + errorData);
				}
				
				})  
				
			})
			
			
			
			
			
			$("#money").click(function(){
			
				$.ajax({
					url : 'groomingMo.do',
					type : 'post',
					dataType:"json",
					success : function (data){
					    $divRow = $("#row");
					    $divRow.html("");
						var $divCardDeck ;
						var $divCard;
						var $divTopImg ;
						var $divCircle ;
						var $dDay;
						var $day ;
						var $cardBody;
						var $cardTitle;
						var $gDetail;
						var $cardText1;
						var $cardText2 ;
						var $small1 ;
						var $small2;
						var $span1;
						var $span2 ;
						var $small3 ;
						var $span3;
						var $img;

						if(data.length >0){ 
							for(var i in data){
								console.log(data[i].groomingNo);
								// D-day 계산을 위한 것
								var endDate = new Date(data[i].groomingEd);
								var nowDate = new Date(data[i].groomingNd);
								var difDate = endDate.getTime() - nowDate.getTime();
								difDate = difDate/(1000*60*60*24);
								
								 $divCardDeck = $("<div class='card-deck col-lg-3'>");
								 $divCard = $("<div class='card'>");
								 $divTopImg = $("<div class='top-img'>");
								 $img = $("<img src=/groomingProject/resources/upGroomingFiles/"+data[i].groomingImg+">");
								 $divCircle = $("<div id='circle'>");
								 if(data[i].groomingEd > data[i].groomingNd){
									 $dDay = $("<span id='d-day'>").text("D-");
									 $day = $("<span id='day'>").text(difDate);
									 $divCircle.append($dDay);
									 $divCircle.append($day);
								 }else{
									 $day = $("<span id='day'>").text("마감");
									 $divCircle.append($day);
								}
								
								 $cardBody = $("<div class='card-body'>");
								 $cardTitle = $("<h5 class='card-title'>");
								 $gDetail =$("<a href='groomingDetail.do?groomingNo="+data[i].groomingNo+"'>").text(data[i].groomingTitle);
								 $cardText1 = $("<p class='card-text'>").text(data[i].groomingIntroduce);
								 $cardText2 = $("<p class='card-text'>");
								 $small1 = $("<small class='text-muted'>").text("참여인원&nbsp;");
								 $small2 = $("<small>");
								 $span1 = $("<span>").text(data[i].currentP+"/");
								 $span2 = $("<span>").text(data[i].groomingP);
								 $small3 = $("<small class='text-muted'>");
								 $span3 = $("<span class='groupType'>").text(data[i].groomingType);
								
								 
								 $divTopImg.append($divCircle);
								 $divTopImg.append($img);
								 
								 $cardTitle.append($gDetail);
								 
								 $small2.append($span1);
								 $small2.append($span2);
								 $small3.append($span3);
								 $cardText2.append($small2);
								 $cardText2.append($small3);
								 
								 $cardBody.append($cardTitle);
								 $cardBody.append($cardText1);
								 $cardBody.append($cardText2);
								 
								 $divCard.append($divTopImg);
								 $divCard.append($cardBody);
								 
								 $divCardDeck.append($divCard);
								 $divRow.append($divCardDeck);
							}
						}
					},error:function(request, status, errorData){
						alert("error code: " + request.status + "\n"
							+"message: " + request.responseText
							+"error: " + errorData);
				}
				
				})  
				
			})
		})
	
	</script>
	 <script>
		$(function() {
			$('#find').on("click", function() {
	
				var search = $('#search').val();
				var keyword = $('#keyword').val();
	
				if(keyword == ""){
					alert("한 글자 이상 검색해주세요!");
				}else{
					
				
				 
				$.ajax({
					url:'search.do',
					type:'post',
					data:{search : search, keyword : keyword},
					dataType:"json",
					success:function(data) {
						$('#keyword').val("");
						$divRow = $("#row");
						$divRow.html("");
						var $divCardDeck;
						var $divCard;
						var $divTopImg;
						var $divCircle;
						var $dDay;
						var $day;
						var $cardBody;
						var $cardTitle;
						var $gDetail;
						var $cardText1;
						var $cardText2;
						var $small1;
						var $small2;
						var $span1;
						var $span2;
						var $small3;
						var $span3;
						var $img;
						console.log(data[0].groomingImg);
						if(data.length > 0) {
							for(var i in data) {
								console.log(data[i].groomingNo);
								// D-day 계산을 위한 것
								var endDate = new Date(data[i].groomingEd);
								var nowDate = new Date(data[i].groomingNd);
								var difDate = endDate.getTime() - nowDate.getTime();
								difDate = difDate/(1000*60*60*24);
								
								$divCardDeck = $("<div class='card-deck col-lg-3'>");
								$divCard = $("<div class='card'>");
								$divTopImg = $("<div class='top-img'>");
								$img = $("<img src=/groomingProject/resources/upGroomingFiles/"+data[i].groomingImg+">");
								$divCircle = $("<div id='circle'>");
								
								if (data[i].groomingEd > data[i].groomingNd) {
									$dDay = $("<span id='d-day'>").text("D-");
									$day = $("<span id='day'>").text(difDate);
									$divCircle.append($dDay);
									$divCircle.append($day);
								} else {
									$day = $("<span id='day'>").text("마감");
									$divCircle.append($day);
								}

								$cardBody = $("<div class='card-body'>");
								$cardTitle = $("<h5 class='card-title'>");
								$gDetail = $("<a href='groomingDetail.do?groomingNo=" + data[i].groomingNo + "'>").text(data[i].groomingTitle);
								$cardText1 = $("<p class='card-text'>").text(data[i].groomingIntroduce);
								$cardText2 = $("<p class='card-text'>");
								$small1 = $("<small class='text-muted'>").text("참여인원&nbsp;");
								$small2 = $("<small>");
								$span1 = $("<span>").text(data[i].currentP + "/");
								$span2 = $("<span>").text(data[i].groomingP);
								$small3 = $("<small class='text-muted'>");
								$span3 = $("<span class='groupType'>").text(data[i].groomingType);

								$divTopImg.append($divCircle);
								$divTopImg.append($img);

								$cardTitle.append($gDetail);

								$small2.append($span1);
								$small2.append($span2);
								$small3.append($span3);
								$cardText2.append($small2);
								$cardText2.append($small3);

								$cardBody.append($cardTitle);
								$cardBody.append($cardText1);
								$cardBody.append($cardText2);

								$divCard.append($divTopImg);
								$divCard.append($cardBody);

								$divCardDeck.append($divCard);
								$divRow.append($divCardDeck);
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
			}); // click end
		});
	</script> 


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