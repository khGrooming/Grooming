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

                    <label><input type="checkbox" name="search_filter">&nbsp;멘토 타입</label>
                    <label><input type="checkbox" name="search_filter">&nbsp;예치금 존재</label>
                </div>
                <div class="cols-9"  style="width: 80%; text-align: right; padding-right:5pxx">
                    <select>
                        <option name="title">제목</option>
                        <option name="writer">작성자</option>
                        <option name="content">내용</option>
                    </select>
                    <input type="text" size="30px">
                    <button type="submit">검색</button>
                    <button type="button" onclick="location.href='groomingInsertForm.do'">글쓰기</button>
                </div>
            </div>
            <!-- 스터디 그룹 리스트 -->
            <div style="margin-top: 20px;">
            

          
		    <c:forEach var="g" items="${list }">
		    	<!--날짜 차이 계산을 위한 fmt  -->
	    		<fmt:parseDate value="${g.groomingNd }" var="nowDate" pattern="yyyy-MM-dd"/>
				<fmt:parseNumber value="${nowDate.time / (1000*60*60*24)}" integerOnly="true" var="nowDate"/> 
	       		<fmt:parseDate value="${g.groomingSd }" var="startDate" pattern="yyyy-MM-dd"/>
				<fmt:parseNumber value="${startDate.time / (1000*60*60*24)}" integerOnly="true" var="startDate"/>
	 			<fmt:parseDate value="${g.groomingEd }" var="endDate" pattern="yyyy-MM-dd"/>
				<fmt:parseNumber value="${endDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"/> 
				
				<%-- <c:set var="today" value="<%=new Date() %>"/>
				<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today"/> --%>
				
                <div class="card-deck cols-4">
                
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
		           
		                 
                  
                   
                    <!-- 스터디 그룹 리스트 끝 -->
                </div>
           
            </c:forEach>
        </div>
    </section>





    <footer>


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