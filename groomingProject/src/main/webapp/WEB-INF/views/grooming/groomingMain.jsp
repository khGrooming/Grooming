<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!doctype html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
   integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  
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
        }

        .top-img{
            background-image:url("${contextPath }/resources/views/images/book.png");
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
	  @font-face { 
			font-family: 'TmoneyRoundWindExtraBold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff');
    	    font-weight: normal; 
    	    font-style: normal; 
   		}
   
	   * {
	      font-family:"TmoneyRoundWindExtraBold";
	   }
	   
	   .card-deck{
	   	margin-right:auto;
	   	margin-left:auto;
	   	width: 100%;
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

                    <input type="checkbox" name="search_filter" id="mentor">&nbsp;<label for="mentor">멘토 타입</label>
                    <input type="checkbox" name="search_filter" id="money">&nbsp;<label for="money">예치금 존재</label>
                </div>
                <div class="cols-9"  style="width: 80%; text-align: right; padding-right:5pxx">
                    <select id="search">
                        <option value="title" id="title">제목</option>
                        <option value="writer" id="writer">작성자</option>
                        <option value="content" id="content">내용</option>
                    </select>
                    <input type="text" size="30px" id="keyword">
                    <button type="submit" id="find">검색</button>
                    <button type="button" onclick="location.href='groomingInsertForm.do'">글쓰기</button>
                </div>
            </div>
            <!-- 스터디 그룹 리스트 -->
   <div style="margin-top: 20px;">
            

          
		<div class="container">
			<div class="row">
		    <c:forEach var="g" items="${glist }">
		    	<!--날짜 차이 계산을 위한 fmt  -->
				<%-- <c:set var="today" value="<%=new Date() %>"/>
				<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today"/> --%>
 	    		<fmt:parseDate value="${g.groomingNd }" var="nowDate" pattern="yyyy-MM-dd"/>
<%-- 	    	<fmt:formatDate value="${g.groomingNd }" var="nowDate" pattern="yyyy-MM-dd"/>
 --%>  			<fmt:parseNumber value="${nowDate.time / (1000*60*60*24)}" integerOnly="true" var="nowDate"/> 
	       		<fmt:parseDate value="${g.groomingSd }" var="startDate" pattern="yyyy-MM-dd"/>
				<fmt:parseNumber value="${startDate.time / (1000*60*60*24)}" integerOnly="true" var="startDate"/>
<%-- 	 		<fmt:formatDate value="${g.groomingEd }" var="endDate" pattern="yyyy-MM-dd"/>
 --%>	 		<fmt:parseDate value="${g.groomingEd }" var="endDate" pattern="yyyy-MM-dd"/> 
				<fmt:parseNumber value="${endDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"/> 
 				
                <div class="card-deck col-lg-3">
                
		                    <div class="card" onclick="location.href='groomingDetail.do'">
		                        <!-- 그룹 이미지 -->
		                        <div class="top-img">
		                            <!-- 그룹 d-day 태그 -->
		                            <div id="circle" style="position: absolute; ">
		                            <c:if test="${endDate gt startDate }">
		                                D-<span style="position: relative; ">${endDate-startDate }</span>
		                            </c:if>
		                            <c:if test="${endDate lt startDate }">
		                               <span style="position: relative; ">마감</span>
		                            </c:if>
		                          
		                            </div>
		                        </div>
		                        <!-- 그룹 본문 -->
		                        <div class="card-body">
		                            <!-- 그룹 제목 -->
		                            <h5 class="card-title"><a href="groupPage.do">${g.groomingTitle }</a></h5>
		                            <!-- 그룹 한줄 소개  -->
		                            <p class="card-text">${g.groomingIntroduce }</p>
		                            <p class="card-text">
		                                <small class="text-muted">참여인원</small>&nbsp;<small><span>1</span>/<span>${g.groomingP }</span></small>
		                                <small><span class="groupType">${g.groomingType}</span></small>
		                            </p>
		
		                        </div>
		                    </div>
		           
	                 </div>
					</c:forEach>
                 </div>
                  
                   
                    <!-- 스터디 그룹 리스트 끝 -->
                </div>
    <table style="margin-bottom:100px;">
           <!-- 페이징 처리 부분 -->
		<tr align="center" height="20">	
			<td colspan="6">
		<!-- [이전] -->
				<c:if test="${pi.currentPage eq 1 }">
					[이전]&nbsp;
				</c:if>			
				<c:if test="${pi.currentPage gt 1 }">
				<c:url var="blistBack" value="groomingMain.do">
					<c:param name="page" value="${pi.currentPage - 1 }"/>
				</c:url>
					<a href="${blistBack }">[이전]</a>
				</c:if>	
		<!-- [번호들] -->
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
					<c:if test="${p eq pi.currentPage }">
						<font color="red" size="4">
							<b>[${p}]</b>
						</font>
					</c:if>
					
					<c:if test="${p ne pi.currentPage }">
						<c:url var="blistCheck" value="groomingMain.do">
							<c:param name="page" value="${p}"/>
						</c:url>
						<a href="${ blistCheck}">${p }</a>
					</c:if>
				</c:forEach>
		<!-- [이후] -->
				<c:if test="${pi.currentPage eq pi.maxPage }">
					&nbsp;[이후]
				</c:if>			
				<c:if test="${pi.currentPage lt pi.maxPage }">
				<c:url var="blistAfter" value="groomingMain.do">
					<c:param name="page" value="${pi.currentPage + 1 }"/>
				</c:url>
					<a href="${blistAfter }">[이후]</a>
				</c:if>	
			</td>
		</tr>
		</table>
        </div>
    </section>
	<script>
		$(function(){
			$("#mentor").click(function(){
				console.log("멘토필터 클릭됨");
			if($("#mentor").is(":checked")){
		/* 	
				location.href="groomingMe.do"; */
				
			}else {
				console.log("멘토필터 해지됨");
			}
			})
			
			$("#money").click(function(){
				
			if($("#money").is(":checked")){
				console.log("예치금필터 클릭됨");
			}else {
				console.log("예치금필터 해지됨");
			}
			})
			
		})
	
	</script>
	<script>
	$(function(){
		$('#find').on("click" , function(){
			
			var search = $('#search').val();
			var keyword = $('#keyword').val();
			
			/* if(search == null || keyword == null){
				alert("빈칸없이 검색해주세요!");
			}else{
				location.href="search.do";
			}
			 */
		 	 $.ajax({
				url : 'search.do',
				type : 'post',
				data :{search:search, keyword:keyword},
				success : function (data){
				
					$('#keyword').val("");
				
				},error:function(request, status, errorData){
					alert("error code: " + request.status + "\n"
						+"message: " + request.responseText
						+"error: " + errorData);
			}
			
			})  
		
		})
	
	})
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