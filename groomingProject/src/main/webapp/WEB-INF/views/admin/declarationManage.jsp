<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신고 관리</title>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
    <style>
        .sideMenu{background-color:blue;border-radius:10%;font-size:large;}
        .admin{height:80px;text-align:center;padding:30px;}
        .sub{height:50px;text-align:center;font-size:small;}
        
        .statisticsMain, .member, .grooming, .declaration{height:100px;background:chartreuse;}

        .declarationInfo{width: 70%;border-collapse: collapse;margin-left:20%;}
        .declarationInfo th,td{height:50px;text-align:center;}
        
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
        <br><br>
        <div class="container col-sm-3">
            <br><br>
            <div class="col-sm-3"></div>
            <div class="sideMenu col-sm-7">
                <div class="admin"><a href="adminMain.do">통계</a></div>
                    <div class="admin"><a href="memberManage.do">회원 관리</a></div>
                    <div class="admin"><a href="groomingManage.do">그루밍 관리</a></div>
                    <div class="admin"><a href="declarationManage.do">신고 관리</a></div>
                    <div class="sub"><a href="declarationManage.do">회원 신고 관리</a></div>
                    <div class="admin"><a href="cafeManage.do">카페 관리</a></div>
            </div>
        </div>

            <h1 align="center">회원 신고 관리</h1>
            <br><br>
            <table class="declarationInfo" border="1">
                <thead>
                    <tr>
                        <th>아이디</th>
                        <th>닉네임</th>
                        <th>이름</th>
                        <th>신고 카테고리</th>
                        <th>신고 내용</th>
                        <th>신고 수</th>
                        <th>누적 신고 수</th>
                        <th>처리</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="mList" varStatus="i" items="${mList}">
	                    <tr>
                        	<td rowspan="4">${mList.memberEmail}</td>
                        	<td rowspan="4">${mList.memberNickname}</td>
                        	<td rowspan="4">${mList.memberName}</td>
                        	<td>회원 신고</td>
                        	<td id="member">
                        		<c:forEach var="dList" varStatus="j" items="${dList}">
	                        	<c:if test="${mList.memberNo eq dList.declarationNNo}">
	                        		<ul>
	                        		<c:if test="${dList.declarationCNo eq 1}">
	                        			<li>${dList.declarationContent}</li>
	                        		</c:if>
	                        		</ul> 
	                        	</c:if>
                        		</c:forEach>
                        	</td>

                        	<c:forEach var="dCount" varStatus="j" items="${dCount}">
	                        	<c:if test="${dCount.memberNo eq mList.memberNo}">
		                        	<td rowspan="4">${dCount.dCount}</td>
	                        	</c:if>
                        	</c:forEach>
                        	
                        	<c:forEach var="totalCount" varStatus="j" items="${totalCount}">
	                        	<c:if test="${totalCount.memberNo eq mList.memberNo}">
		                        	<td rowspan="4">${totalCount.totalCount}</td>
	                        	</c:if>
                        	</c:forEach>
							<td rowspan="4"><button type="button" onclick="sanctionsPlus();">제재</button></td>
                        	<%-- <c:url var="profilePage" value="profilePage.do">
						       <c:param name="pfMemberNo" value="프로필보고싶은사람의 memberNo" />
						    </c:url> --%>
	                    </tr>
	                    <tr>
	                    	<td>게시판 신고</td>
	                    	<td id="board"> 
                        		<c:forEach var="dList" varStatus="j" items="${dList}">
	                        	<c:if test="${mList.memberNo eq dList.declarationNNo}">
	                        		<ul>
	                        		<c:if test="${dList.declarationCNo eq 2}">
	                        			<li>${dList.declarationContent}</li>
	                        		</c:if>
	                        		</ul> 
	                        	</c:if>
                        		</c:forEach>
                        	</td>
	                    </tr>
	                    <tr>
	                    	<td>댓글 신고</td>
	                    	<td id="reply"> 
                        		<c:forEach var="dList" varStatus="j" items="${dList}">
	                        	<c:if test="${mList.memberNo eq dList.declarationNNo}">
	                        		<ul>
	                        		<c:if test="${dList.declarationCNo eq 3}">
	                        			<li>${dList.declarationContent}</li>
	                        		</c:if>
	                        		</ul> 
	                        	</c:if>
                        		</c:forEach>
                        	</td>
	                    </tr>
	                    <tr>
	                    	<td>그루밍 신고</td>
	                    	<td id="grooming"> 
                        		<c:forEach var="dList" varStatus="j" items="${dList}">
	                        	<c:if test="${mList.memberNo eq dList.declarationNNo}">
	                        		<ul>
	                        		<c:if test="${dList.declarationCNo eq 4}">
	                        			<li>${dList.declarationContent}</li>
	                        		</c:if>
	                        		</ul> 
	                        	</c:if>
                        		</c:forEach>
                        	</td>
	                    </tr>
                    </c:forEach>
                     <!-- 페이징 처리 부분 -->
							<tr align="center" height="20">
								<td colspan="8">
						<!-- [이전] -->
									<c:if test="${pi.currentPage eq 1}">
										[이전]&nbsp;
									</c:if>
									<c:if test="${pi.currentPage gt 1}">
										<c:url var="listBack" value="mentoManage.do">
											<c:param name="mpage" value="${pi.currentPage - 1}"/>
											<c:param name="spage" value="${spi.currentPage}"/>
										</c:url>
										<a class="hover" onclick="listBack();">[이전]</a>&nbsp;
									</c:if>
						<!-- [번호들] -->
									<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
										<c:if test="${p eq pi.currentPage}">
											<font color="green" size="4"><b>[${p}]</b></font>
										</c:if>
										<c:if test="${p ne pi.currentPage}">
											<c:url var="listCheck" value="mentoManage.do">
												<c:param name="mpage" value="${p}"/>
												<c:param name="spage" value="${spi.currentPage}"/>
											</c:url>
											<a class="hover" onclick="listCheck();">${p}</a>
										</c:if>
									</c:forEach>
						<!-- [이후] -->
									<c:if test="${pi.currentPage eq pi.maxPage}">
										&nbsp;[이후]
									</c:if>
									<c:if test="${pi.currentPage lt pi.maxPage}">
										<c:url var="listAfter" value="mentoManage.do">
											<c:param name="mpage" value="${pi.currentPage + 1}"/>
											<c:param name="spage" value="${spi.currentPage}"/>
										</c:url>
										&nbsp;<a class="hover" onclick="listAfter()">[이후]</a>
									</c:if>
								</td>
							</tr>
                </tbody>
            </table>
            <br><br>
            <form >
            <div id="myModal" class="modal">
				      <!-- Modal content -->
				<div class="modal-content">
					<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">제재</span></b></span></p>
					<p id="infoCheck" style="text-align: center; line-height: 1.5;"><br />
					<input type="radio" name="sanctions" value="0">경고 &nbsp;
					<input type="radio" name="sanctions" value="7">7일 정지 &nbsp;
					<input type="radio" name="sanctions" value="30">한달 정지 &nbsp;
					<input type="radio" name="sanctions" value="99">영구 정지 &nbsp;
					</p>
			     	<p><br /></p>
			     	
					<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">
						<button type="submit" id="userConfirm" class="pop_bt" style="font-size: 13pt;">추가</button>
						<button type="button" class="pop_bt" style="font-size: 13pt;" onClick="location.reload(true);">취소</button>
					</div>
				</div>
			</div>
		</form>
        <br clear="both">
    </section>
	<script>
		function sanctionsPlus(){
			$("#myModal").css("display","block");
			
		}
	</script>
</body>
</html>