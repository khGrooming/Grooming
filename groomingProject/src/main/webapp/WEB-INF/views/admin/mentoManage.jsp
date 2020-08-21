<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>멘토 관리</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
    <style>
        html, body{margin:0px;padding:0px}
        section{margin-top:10%}
        li{margin:0px; padding:0px;}
		ul{padding-left:20px;}
		
        .sideMenu{background-color:blue;border-radius:10%;font-size:large;}
        .admin{height:80px;text-align:center;padding:30px;}
        .sub{height:50px;text-align:center;font-size:small;}

        .statisticsMain, .member, .grooming, .declaration{height:100px;background:chartreuse;}
        .search{width:100%;height:40px;text-align:center;}
        #searchMento{width:350px;height:30px;}
        #searchMentoBtn{width:50px;height:35px;}
        .mentoInfo{border-collapse: collapse;width:100%;}
        .mentoInfo th,td{height:50px;text-align:center;}
    </style>
</head>
<body>
    <header><jsp:include page="../common/mainNavigationBar.jsp"/></header>
    <section>
        <div class="container-fluid">
        	<div class="row">
        		<div class="col-sm-3">
	            <br><br>
	            <div class="container col-sm-3"></div>
	                <div class="sideMenu col-sm-7">
	                    <div class="admin"><a href="admingMain.do">통계</a></div>
	                     <div class="admin"><a href="memberManage.do">회원 관리</a></div>
	                     <div class="sub"><a href="memberManage.do">회원 검색</a></div>
	                     <div class="sub"><a href="mentoManage.do">멘토 관리</a></div>
	                     <div class="admin"><a href="groomingManage.do">그루밍 관리</a></div>
	                     <div class="admin"><a href="declarationManage.do">신고 관리</a></div>
	                     <div class="admin"><a href="cafeManage.do">카페 관리</a></div>
	                </div>
                </div>
	         
	         <div class="col-sm-8">
	             <h1 align="center">멘토 관리</h1>
	                 <div class="search">
	                     <form action="mentoManage.do">
	                     <select name="category">
	                     	<option value="mento" selected>멘토</option>
	                     	<option value="spare">멘토 신청자</option>
	                     </select>
	                         <input type="text" id="searchMento" name="searchMento">
	                         <button type="submit" id="searchMeentoBtn">찾기</button>
	                     </form>
	                 </div>
	                 <br><br>
	                 <table class="mentoInfo" border="1">
	                     <tbody>
	                     	<tr>
	                             <th rowspan="2">아이디</th>
	                             <th rowspan="2">닉네임</th>
	                             <th rowspan="2">이름</th>
	                             <th colspan="3">경력(학교, 자격증, 경력)</th>
	                             <th rowspan="2">관리</th>
	                         </tr>
	                     	<tr>
	                         	<th>학교</th>
	                         	<th>자격증</th>
	                         	<th>경력</th>
	                         </tr>
	                     <c:if test="${!empty mentoList}">
	                     	<c:forEach var="mento" varStatus="i" items="${mNo}" begin="0" end="${mNo.size()}">
	                     		<tr>
		                         	<td><c:out value="${i.current.memberEmail}"/></td>
		                         	<td><c:out value="${i.current.memberNickname}"/></td>
		                         	<td><c:out value="${i.current.memberName}"/></td>
		                         	
		                         	<td><ul>
		                         	<c:forEach var="career" items="${mentoList}">
			                         	<c:if test="${career.specCName eq '학교' && i.current.memberNo eq career.memberNo}">
				                         	<li>${career.specName}</li>
			                         	</c:if>
		                         	</c:forEach>
		                         	</ul></td>
		                         	<td><ul>
		                         	<c:forEach var="career" items="${mentoList}">
			                         	<c:if test="${career.specCName eq '자격증' && i.current.memberNo eq career.memberNo}">
				                         	<li>${career.specName}</li>
			                         	</c:if>
		                         	</c:forEach>
		                         	</ul></td>
		                         	<td><ul>
		                         	<c:forEach var="career" items="${mentoList}">
			                         	<c:if test="${career.specCName eq '경력' && i.current.memberNo eq career.memberNo}">
				                         	<li>${career.specName}</li>
			                         	</c:if>
		                         	</c:forEach>
		                         	</ul></td>
		                         	<td><button id="metoManageBtn">관리</button></td>
								</tr>
		                         
	                         </c:forEach>
						</c:if>
						<c:if test="${empty mentoList}">
							<tr>
								<td colspan="5">멘토가 없습니다.</td>
							<tr>
						</c:if>
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
										<a onclick="test();">[이전]</a>&nbsp;
									</c:if>
						<!-- [번호들] -->
									<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
										<c:if test="${p eq pi.currentPage}">
											<font color="red" size="4"><b>[${p}]</b></font>
										</c:if>
										<c:if test="${p ne pi.currentPage}">
											<c:url var="listCheck" value="mentoManage.do">
												<c:param name="mpage" value="${p}"/>
												<c:param name="spage" value="${spi.currentPage}"/>
											</c:url>
											<a onclick="test();">${p}</a>
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
										&nbsp;<a onclick="listAfter()">[이후]</a>
									</c:if>
								</td>
							</tr>
	                     </tbody>
	                 </table>
	                 
	                 <h1 align="center">멘토 신청자 관리</h1>
	                 <table class="mentoInfo" border="1">
	                     <tbody>
	                     	<tr>
	                             <th rowspan="2">아이디</th>
	                             <th rowspan="2">닉네임</th>
	                             <th rowspan="2">이름</th>
	                             <th colspan="3">경력(학교, 자격증, 경력)</th>
	                             <th rowspan="2">관리</th>
	                         </tr>
	                     	<tr>
	                         	<th>학교</th>
	                         	<th>자격증</th>
	                         	<th>경력</th>
	                         </tr>
	                     <c:if test="${!empty spareMentoList}">
	                     	<c:forEach var="mento" varStatus="i" items="${sNo}" begin="0" end="${sNo.size()}">
	                     		<tr>
		                         	<td><c:out value="${i.current.memberEmail}"/></td>
		                         	<td><c:out value="${i.current.memberNickname}"/></td>
		                         	<td><c:out value="${i.current.memberName}"/></td>
		                         	
		                         	<td><ul>
		                         	<c:forEach var="career" items="${spareMentoList}">
			                         	<c:if test="${career.specCName eq '학교' && i.current.memberNo eq career.memberNo}">
				                         	<li>${career.specName}</li>
			                         	</c:if>
		                         	</c:forEach>
		                         	</ul></td>
		                         	<td><ul>
		                         	<c:forEach var="career" items="${spareMentoList}">
			                         	<c:if test="${career.specCName eq '자격증' && i.current.memberNo eq career.memberNo}">
				                         	<li>${career.specName}</li>
			                         	</c:if>
		                         	</c:forEach>
		                         	</ul></td>
		                         	<td><ul>
		                         	<c:forEach var="career" items="${spareMentoList}">
			                         	<c:if test="${career.specCName eq '경력' && i.current.memberNo eq career.memberNo}">
				                         	<li>${career.specName}</li>
			                         	</c:if>
		                         	</c:forEach>
		                         	</ul></td>
		                         	<td><button id="metoManageBtn">관리</button></td>
								</tr>
		                         
	                         </c:forEach>
						</c:if>
						<c:if test="${empty spareMentoList}">
							<tr>
								<td colspan="7">멘토 신청자가 없습니다.</td>
							<tr>
						</c:if>
	                        <!-- 페이징 처리 부분 -->
							<tr align="center" height="20">
								<td colspan="7">
						<!-- [이전] -->
									<c:if test="${spi.currentPage eq 1}">
										[이전]&nbsp;
									</c:if>
									<c:if test="${spi.currentPage gt 1}">
										<c:url var="slistBack" value="mentoManage.do">
											<c:param name="spage" value="${spi.currentPage - 1}"/>
											<c:param name="mpage" value="${pi.currentPage}"/>
										</c:url>
										<a href="${slistBack }">[이전]</a>&nbsp;
									</c:if>
						<!-- [번호들] -->
									<c:forEach var="p" begin="${spi.startPage}" end="${spi.endPage}">
										<c:if test="${p eq spi.currentPage}">
											<font color="red" size="4"><b>[${p}]</b></font>
										</c:if>
										<c:if test="${p ne spi.currentPage}">
											<c:url var="slistCheck" value="mentoManage.do">
												<c:param name="spage" value="${p}"/>
												<c:param name="mpage" value="${pi.currentPage}"/>
											</c:url>
											<a href="${slistCheck }">${p}</a>
										</c:if>
									</c:forEach>
						<!-- [이후] -->
									<c:if test="${spi.currentPage eq spi.maxPage}">
										&nbsp;[이후]
									</c:if>
									<c:if test="${spi.currentPage lt spi.maxPage}">
										<c:url var="slistAfter" value="mentoManage.do">
											<c:param name="spage" value="${spi.currentPage + 1}"/>
											<c:param name="mpage" value="${pi.currentPage}"/>
										</c:url>
										&nbsp;<a href="${slistAfter }">[이후]</a>
									</c:if>
								</td>
							</tr>
	                     </tbody>
	                 </table>
	                 <br clear="both"><br>
	         	</div>
         	</div>
         </div>
    </section>
    <footer><jsp:include page="../common/footer.jsp"/></footer>
</body>
	
	<script>
		function listAfter(){
			location.href="${listAfter}";
		}
	</script>



</html>