<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>그루밍 관리</title>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
        <style>
           	section { padding-top: 6.25rem; min-height: calc(100vh - 3.5rem); }
            .sideMenu{/* background-color:blue; */ border: thin solid lightgray; border-radius:0.1rem;font-size:large;}
            .admin{height:80px;text-align:center;padding:30px;}
            .statisticsMain, .member, .grooming, .declaration{height:100px;background:chartreuse;}
    
            .dropDown{width:120px;height:35px;float:right;}
            .search{width:150px;height:35px;float:right;}

            .groomingInfo{width:70%;border-collapse: collapse;margin-left:20%;}
            .groomingInfo th,td{height:50px;text-align:center;}
			.groomingInfo tbody tr:hover{background: lightgray;}
            
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
    <jsp:include page="../common/mainNavigationBar.jsp"/>
    <section>
        <br><br>
        <div class="container col-sm-3">
            <br><br>
            <!-- <div class="col-sm-3"></div> -->
                <div class="sideMenu col-sm-7">
                    <div class="admin"><a href="adminMain.do">통계</a></div>
                     <div class="admin"><a href="memberManage.do">회원 관리</a></div>
                     <div class="admin"><a href="groomingManage.do">그루밍 관리</a></div>
                     <div class="admin"><a href="declarationManage.do">신고 관리</a></div>
                     <div class="admin"><a href="cafeManage.do">카페 관리</a></div>
                </div>
         </div>
            <h1 align="center">그루밍 관리</h1>
            <form action="groomingManage.do">
	            <button type="submit" class="search" style="margin-right:100px;">검색</button>
	            <input type="text" name="groomingName" class="search" placeholder="그루밍 명을 입력해주세요" style="width:200px;">
	            <input type="text" name="day" class="search" placeholder="기간을 입력해주세요">
	            <select class="dropDown" name="category">
	            	<option value="null">전체</option>
	            	<option value="호스트">호스트</option>
	            	<option value="멘토">멘토</option>
	            </select>
            </form>
            <br><br>
            <table class="groomingInfo" border="1">
                <thead>
                    <tr>
                        <th>그루밍 이름</th>
                        <th>그루밍 소개</th>
                        <th>그룹 분류</th>
                        <th>그룹 인원</th>
                        <th>스케줄 활동일</th>
                        <th>커뮤니티 활동일</th>
                        <th>활성/비활성</th>
                    </tr>
                </thead>
                <tbody>
	               <c:forEach var="glist" varStatus="i" items="${glist}">
	               <c:if test="${glist.groomingStatus eq 'Y'}">
		               	<tr>
		               		<input type="hidden" class="grooming${i.index}" value="${glist.groomingNo}">
		               		<td>${glist.groomingTitle}</td>
		               		<td style="width:400px;">${glist.groomingIntroduce}</td>
		               		<td>${glist.groomingType}</td>
		               		<td>${glist.groomingCurrentPeople} / ${glist.groomingParticipants}</td>
		               		<td>${glist.gCalendarEndDate}</td>
		               		<td>${glist.gBoardCreateDate}</td>
		                 	<td><button type="button" onclick="openModal(${i.index});">수정</button></td>
		               	</tr>
	               </c:if>
	               <c:if test="${glist.groomingStatus eq 'B'}">
			               	<tr style="background:grey; opacity:0.7;">
			               		<input type="hidden" class="grooming${i.index}" value="${glist.groomingNo}">
			               		<td>${glist.groomingTitle}</td>
			               		<td style="width:400px;">${glist.groomingIntroduce}</td>
			               		<td>${glist.groomingType}</td>
			               		<td>${glist.groomingCurrentPeople} / ${glist.groomingParticipants}</td>
			               		<td>${glist.gCalendarEndDate}</td>
			               		<td>${glist.gBoardCreateDate}</td>
			                 	<td><button type="button" onclick="openModal(${i.index});">수정</button></td>
			               	</tr>							                        	
		               </c:if>
	               </c:forEach>
	                <!-- 페이징 처리 부분 -->
							<tr align="center" height="20">
								<td colspan="7">
						<!-- [이전] -->
									<c:if test="${pi.currentPage eq 1}">
										[이전]&nbsp;
									</c:if>
									<c:if test="${pi.currentPage gt 1}">
										<c:url var="listBack" value="groomingManage.do">
											<c:param name="page" value="${pi.currentPage - 1}"/>
											<c:param name="category" value="${category}"/>
											<c:param name="groomingName" value="${groomingName}"/>
											<c:param name="day" value="${day}"/>
										</c:url>
										<a class="hover" href="${listBack}">[이전]</a>&nbsp;
									</c:if>
						<!-- [번호들] -->
									<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
										<c:if test="${p eq pi.currentPage}">
											<font color="green" size="4"><b>[${p}]</b></font>
										</c:if>
										<c:if test="${p ne pi.currentPage}">
											<c:url var="listCheck" value="groomingManage.do">
												<c:param name="page" value="${p}"/>
												<c:param name="category" value="${category}"/>
												<c:param name="groomingName" value="${groomingName}"/>
												<c:param name="day" value="${day}"/>
											</c:url>
											<a class="hover" href="${listCheck}">${p}</a>
										</c:if>
									</c:forEach>
						<!-- [이후] -->
									<c:if test="${pi.currentPage eq pi.maxPage}">
										&nbsp;[이후]
									</c:if>
									<c:if test="${pi.currentPage lt pi.maxPage}">
										<c:url var="listAfter" value="groomingManage.do">
											<c:param name="page" value="${pi.currentPage + 1}"/>
											<c:param name="category" value="${category}"/>
											<c:param name="groomingName" value="${groomingName}"/>
											<c:param name="day" value="${day}"/>
										</c:url>
										&nbsp;<a class="hover" href="${listAfter}">[이후]</a>
									</c:if>
								</td>
							</tr>
                </tbody>
            </table>
        <br clear="both">
        <form action="gActivation.do">
	        <div id="activation" class="modal">
		      <!-- Modal content -->
		      <div class="modal-content">
	                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">그루밍 활성/비활성</span></b></span></p>
	                <p id="infoCheck" style="text-align: center; line-height: 1.5;"><br />
	                	<input type="radio" name="gActivation" value="Y">활성화 &nbsp;
	                	<input type="radio" name="gActivation" value="B">비활성화
	                </p>
	                <p><br /></p>
	           <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">
	                <button type="submit" class="pop_bt" style="font-size: 13pt;" >확인</button>
	                <button type="button" class="pop_bt" style="font-size: 13pt;" onClick="location.reload(true);">취소</button>
	            </div>
		      </div>
		    </div>
        </form>
    </section>
    <%-- <jsp:include page="../common/footer.jsp"/> --%>
    <script>
    	function openModal(i){
    		$("#activation").css("display","block");
    		$groomingNo = $(".grooming"+i).val()
    		console.log($groomingNo);
    		$("#infoCheck").append("<input type='hidden' name='groomingNo' value='"+$groomingNo+"'>");
    	}
    </script>
</body>
</html>