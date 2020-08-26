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

        <label><a href="${calendar }"><i class="fas fa-calendar-alt"></i>캘린더</a></label>

        <label><a href="${gBlist }"><i class="fas fa-icons"></i>게시판</a></label>
	

  
    <!--게시판에 들어갈 내용 -->
    <section >
        
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
            <c:forEach var="g" items="${glist}">
            <c:url var="gDetail" value="groupDetail.do">
				<c:param name="gBoardNo" value="${g.gBoardNo}"/>
				<c:param name="page" value="${pi.currentPage }"/>
				<c:param name="groomingNo" value="${grooming.groomingNo}"/>
				<c:param name="memberNo" value="${loginUser.memberNo }"/>
			</c:url> 
            <c:if test="${g.gBoardCategory eq '공지' }">
              <tr class ="tr" onclick="location.href='${gDetail }'" style="background:#f5f5dc;">
                <th scope="row">${g.gBoardNo}</th>
                <td class="category">${g.gBoardCategory}</td>
                <td>${g.gBoardTitle}</td>
                <td>${g.memberNickName}</td>
                <td>${g.createDate}</td>
                <td>${g.count}</td>
              </tr>
             </c:if>
            <c:if test="${g.gBoardCategory ne '공지' }">
              <tr class ="tr" onclick="location.href='${gDetail }'">
                <th scope="row">${g.gBoardNo}</th>
                <td class="category">${g.gBoardCategory}</td>
                <td>${g.gBoardTitle}</td>
                <td>${g.memberNickName}</td>
                <td>${g.createDate}</td>
                <td>${g.count}</td>
              </tr>
             </c:if>
             
             
             
			</c:forEach>

				<!-- 페이징 처리 부분 -->
		<tr align="center" height="20">	
			<td colspan="6">
		<!-- [이전] -->
				<c:if test="${pi.currentPage eq 1 }">
					[이전]&nbsp;
				</c:if>			
				<c:if test="${pi.currentPage gt 1 }">
				<c:url var="blistBack" value="gBlist.do">
					<c:param name="page" value="${pi.currentPage - 1 }"/>
					<c:param name="groomingNo" value="${grooming.groomingNo}"/>
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
						<c:url var="blistCheck" value="gBlist.do">
							<c:param name="page" value="${p}"/>
							<c:param name="groomingNo" value="${grooming.groomingNo}"/>
						</c:url>
						<a href="${ blistCheck}">${p }</a>
					</c:if>
				</c:forEach>
		<!-- [이후] -->
				<c:if test="${pi.currentPage eq pi.maxPage }">
					&nbsp;[이후]
				</c:if>			
				<c:if test="${pi.currentPage lt pi.maxPage }">
					<c:url var="blistAfter" value="gBlist.do">
						<c:param name="page" value="${pi.currentPage + 1 }"/>
						<c:param name="groomingNo" value="${grooming.groomingNo}"/>
					</c:url>
						<a href="${blistAfter }">[이후]</a>
				</c:if>	
			</td>
		</tr>


            </tbody>
        
          </table>
          
          
          <!-- 글작성 버튼 -->
 	       <div class="col-12" align="right">
          	<button type="button"  style="margin-right:10px;" id="ib" onclick="location.href='groupBoardInsertForm.do'" >글 작성</button>
          </div>
   
    
          
        
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