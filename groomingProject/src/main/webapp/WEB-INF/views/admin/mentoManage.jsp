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
       	section { padding-top: 6.25rem; min-height: calc(100vh - 3.5rem); }
        li{margin:0px; padding:0px;}
		ul{padding-left:20px;}
		
        .sideMenu{/* background-color:blue; */ border: thin solid lightgray; border-radius:10%;font-size:large;}
        .admin{height:80px;text-align:center;padding:30px;}
        .sub{height:50px;text-align:center;font-size:small;}

        .statisticsMain, .member, .grooming, .declaration{height:100px;background:chartreuse;}
        .search{width:100%;height:40px;text-align:center;}
        #searchMento{width:350px;height:30px;}
        #searchMentoBtn{width:50px;height:35px;}
        .mentoInfo{border-collapse: collapse;width:100%;}
        .mentoInfo th,td{height:50px;text-align:center;}
        
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
        <div class="container-fluid">
        	<div class="row">
        		<div class="col-sm-3">
	            <br><br>
	            <div class="container col-sm-3"></div>
	                <div class="sideMenu col-sm-7">
	                    <div class="admin"><a href="adminMain.do">통계</a></div>
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
	                 <br>
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
	                     	<c:forEach var="mento" varStatus="i" items="${mNo}">
	                     		<c:if test="${mento.sanctions ne 0}">
		                     		<tr style="background:grey; opacity:0.7">
		                     			<input type="hidden" class="member${i.index}" value="${mento.memberNo}">
			                         	<td><c:out value="${i.current.memberEmail}"/></td>
			                         	<td><c:out value="${i.current.memberNickname}"/></td>
			                         	<td><c:out value="${i.current.memberName}"/></td>
			                         	
			                         	<td><ul>
			                         	<c:forEach var="career" varStatus="j" items="${mentoList}">
				                         	<c:if test="${career.specCName eq '학교' && i.current.memberNo eq career.memberNo}">
				                         	<input type="hidden" class="name${j.index}" value="${career.specName}">
				                         	<input type="hidden" class="pass${j.index}" value="${career.specComfirm}">
				                         	<input type="hidden" class="file${j.index}" value="${career.specFileName}">
				                         		<c:if test="${j.current.specComfirm eq 'Y'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:green;">${career.specName}</li>
				                         		</c:if>
				                         		<c:if test="${j.current.specComfirm eq 'N'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:red;">${career.specName}</li>
				                         		</c:if>
				                         	</c:if>
			                         	</c:forEach>
			                         	</ul></td>
			                         	<td><ul>
			                         	<c:forEach var="career" varStatus="j" items="${mentoList}">
				                         	<c:if test="${career.specCName eq '자격증' && i.current.memberNo eq career.memberNo}">
				                         	<input type="hidden" class="name${j.index}" value="${career.specName}">
				                         	<input type="hidden" class="pass${j.index}" value="${career.specComfirm}">
				                         	<input type="hidden" class="file${j.index}" value="${career.specFileName}">
					                         	<c:if test="${j.current.specComfirm eq 'Y'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:green;">${career.specName}</li>
				                         		</c:if>
				                         		<c:if test="${j.current.specComfirm eq 'N'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:red;">${career.specName}</li>
				                         		</c:if>
				                         	</c:if>
			                         	</c:forEach>
			                         	</ul></td>
			                         	<td><ul>
			                         	<c:forEach var="career" varStatus="j" items="${mentoList}">
				                         	<c:if test="${career.specCName eq '경력' && i.current.memberNo eq career.memberNo}">
				                         	<input type="hidden" class="name${j.index}" value="${career.specName}">
				                         	<input type="hidden" class="pass${j.index}" value="${career.specComfirm}">
				                         	<input type="hidden" class="file${j.index}" value="${career.specFileName}">
					                         	<c:if test="${j.current.specComfirm eq 'Y'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:green;">${career.specName}</li>
				                         		</c:if>
				                         		<c:if test="${j.current.specComfirm eq 'N'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:red;">${career.specName}</li>
				                         		</c:if>
				                         	</c:if>
			                         	</c:forEach>
			                         	</ul></td>
			                         	<td><button id="metoManageBtn" onclick="mentoManage(${i.index});">관리</button></td>
									</tr>
	                     		</c:if>
	                     		<c:if test="${mento.sanctions eq 0}">
		                     		<tr>
		                     			<input type="hidden" class="member${i.index}" value="${mento.memberNo}">
			                         	<td><c:out value="${i.current.memberEmail}"/></td>
			                         	<td><c:out value="${i.current.memberNickname}"/></td>
			                         	<td><c:out value="${i.current.memberName}"/></td>
			                         	
			                         	<td><ul>
			                         	<c:forEach var="career" varStatus="j" items="${mentoList}">
				                         	<c:if test="${career.specCName eq '학교' && i.current.memberNo eq career.memberNo}">
				                         	<input type="hidden" class="name${j.index}" value="${career.specName}">
				                         	<input type="hidden" class="pass${j.index}" value="${career.specComfirm}">
				                         	<input type="hidden" class="file${j.index}" value="${career.specFileName}">
				                         		<c:if test="${j.current.specComfirm eq 'Y'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:green;">${career.specName}</li>
				                         		</c:if>
				                         		<c:if test="${j.current.specComfirm eq 'N'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:red;">${career.specName}</li>
				                         		</c:if>
				                         	</c:if>
			                         	</c:forEach>
			                         	</ul></td>
			                         	<td><ul>
			                         	<c:forEach var="career" varStatus="j" items="${mentoList}">
				                         	<c:if test="${career.specCName eq '자격증' && i.current.memberNo eq career.memberNo}">
				                         	<input type="hidden" class="name${j.index}" value="${career.specName}">
				                         	<input type="hidden" class="pass${j.index}" value="${career.specComfirm}">
				                         	<input type="hidden" class="file${j.index}" value="${career.specFileName}">
					                         	<c:if test="${j.current.specComfirm eq 'Y'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:green;">${career.specName}</li>
				                         		</c:if>
				                         		<c:if test="${j.current.specComfirm eq 'N'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:red;">${career.specName}</li>
				                         		</c:if>
				                         	</c:if>
			                         	</c:forEach>
			                         	</ul></td>
			                         	<td><ul>
			                         	<c:forEach var="career" varStatus="j" items="${mentoList}">
				                         	<c:if test="${career.specCName eq '경력' && i.current.memberNo eq career.memberNo}">
				                         	<input type="hidden" class="name${j.index}" value="${career.specName}">
				                         	<input type="hidden" class="pass${j.index}" value="${career.specComfirm}">
				                         	<input type="hidden" class="file${j.index}" value="${career.specFileName}">
					                         	<c:if test="${j.current.specComfirm eq 'Y'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:green;">${career.specName}</li>
				                         		</c:if>
				                         		<c:if test="${j.current.specComfirm eq 'N'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:red;">${career.specName}</li>
				                         		</c:if>
				                         	</c:if>
			                         	</c:forEach>
			                         	</ul></td>
			                         	<td><button id="metoManageBtn" onclick="mentoManage(${i.index});">관리</button></td>
									</tr>
	                     		</c:if>
	                         </c:forEach>
						</c:if>
						<c:if test="${empty mentoList}">
							<tr>
								<td colspan="7">멘토가 없습니다.</td>
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
	                 
	                 <!-- 멘토 관리 모달창 -->
	                 <form action="mentoFail.do">
		                 <div id="mentoModal" class="modal">
							      <!-- Modal content -->
							<div class="modal-content">
								<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">멘토 관리</span></b></span></p>
								<p id="infoCheck" style="text-align: center; line-height: 1.5;"><br />멘토 자격을 박탈하시겠습니까?</p>
						     	<p><br /></p>
						     	
								<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">
									<button type="submit" class="pop_bt" style="font-size: 13pt;">확인</button>
									<button type="button" class="pop_bt" style="font-size: 13pt;" onClick="location.reload(true);">취소</button>
								</div>
							</div>
						</div>
	                 </form>
					
					<!-- 경력 보기 모달창 -->
					<div id="careerModal" class="modal">
						      <!-- Modal content -->
						<div class="modal-content">
							<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">경력 세부 사항</span></b></span></p>
							<table border="1">
								<thead align="center">
									<tr>
										<th>경력</th>
										<th>인증</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td id="specName"></td>
										<td id="speckCheck"></td>
									</tr>
									<tr>
										<td colspan="2" id="cImg"></td>
									</tr>
								</tbody>
							</table>
					     	<p><br /></p>
							<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">
								<button type="button" class="pop_bt" style="font-size: 13pt;" onClick="location.reload(true);">확인</button>
							</div>
						</div>
					</div>
					
					<br>
	                 <h1 align="center">멘토 신청자 관리</h1>
	                 <br>
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
	                     		<c:if test="${!empty sNo.sanctions}">
		                     		<tr style="background:grey; opacity:0.7">
			                         	<td><c:out value="${i.current.memberEmail}"/></td>
			                         	<td><c:out value="${i.current.memberNickname}"/></td>
			                         	<td><c:out value="${i.current.memberName}"/></td>
			                         	
			                         	<td><ul>
			                         	<c:forEach var="career" varStatus="j" items="${spareMentoList}">
				                         	<c:if test="${career.specCName eq '학교' && i.current.memberNo eq career.memberNo}">
				                         	<input type="hidden" class="name${j.index}" value="${career.specName}">
				                         	<input type="hidden" class="pass${j.index}" value="${career.specComfirm}">
				                         	<input type="hidden" class="file${j.index}" value="${career.specFileName}">
					                         	<c:if test="${j.current.specComfirm eq 'Y'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:green;">${career.specName}</li>
				                         		</c:if>
				                         		<c:if test="${j.current.specComfirm eq 'N'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:red;">${career.specName}</li>
				                         		</c:if>
				                         	</c:if>
			                         	</c:forEach>
			                         	</ul></td>
			                         	<td><ul>
			                         	<c:forEach var="career" varStatus="j" items="${spareMentoList}">
				                         	<c:if test="${career.specCName eq '자격증' && i.current.memberNo eq career.memberNo}">
				                         	<input type="hidden" class="name${j.index}" value="${career.specName}">
				                         	<input type="hidden" class="pass${j.index}" value="${career.specComfirm}">
				                         	<input type="hidden" class="file${j.index}" value="${career.specFileName}">
					                         	<c:if test="${j.current.specComfirm eq 'Y'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:green;">${career.specName}</li>
				                         		</c:if>
				                         		<c:if test="${j.current.specComfirm eq 'N'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:red;">${career.specName}</li>
				                         		</c:if>
				                         	</c:if>
			                         	</c:forEach>
			                         	</ul></td>
			                         	<td><ul>
			                         	<c:forEach var="career" varStatus="j" items="${spareMentoList}">
				                         	<c:if test="${career.specCName eq '경력' && i.current.memberNo eq career.memberNo}">
				                         	<input type="hidden" class="name${j.index}" value="${career.specName}">
				                         	<input type="hidden" class="pass${j.index}" value="${career.specComfirm}">
				                         	<input type="hidden" class="file${j.index}" value="${career.specFileName}">
					                         	<c:if test="${j.current.specComfirm eq 'Y'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:green;">${career.specName}</li>
				                         		</c:if>
				                         		<c:if test="${j.current.specComfirm eq 'N'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:red;">${career.specName}</li>
				                         		</c:if>
				                         	</c:if>
			                         	</c:forEach>
			                         	</ul></td>
			                         	<td><button id="metoManageBtn">관리</button></td>
									</tr>
	                     			</c:if>
		                         

							<c:if test="${empty sNo.sanctions}">
								<tr>
			                         	<td><c:out value="${i.current.memberEmail}"/></td>
			                         	<td><c:out value="${i.current.memberNickname}"/></td>
			                         	<td><c:out value="${i.current.memberName}"/></td>
			                         	
			                         	<td><ul>
			                         	<c:forEach var="career" varStatus="j" items="${spareMentoList}">
				                         	<c:if test="${career.specCName eq '학교' && i.current.memberNo eq career.memberNo}">
				                         	<input type="hidden" class="name${j.index}" value="${career.specName}">
				                         	<input type="hidden" class="pass${j.index}" value="${career.specComfirm}">
				                         	<input type="hidden" class="file${j.index}" value="${career.specFileName}">
					                         	<c:if test="${j.current.specComfirm eq 'Y'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:green;">${career.specName}</li>
				                         		</c:if>
				                         		<c:if test="${j.current.specComfirm eq 'N'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:red;">${career.specName}</li>
				                         		</c:if>
				                         	</c:if>
			                         	</c:forEach>
			                         	</ul></td>
			                         	<td><ul>
			                         	<c:forEach var="career" varStatus="j" items="${spareMentoList}">
				                         	<c:if test="${career.specCName eq '자격증' && i.current.memberNo eq career.memberNo}">
				                         	<input type="hidden" class="name${j.index}" value="${career.specName}">
				                         	<input type="hidden" class="pass${j.index}" value="${career.specComfirm}">
				                         	<input type="hidden" class="file${j.index}" value="${career.specFileName}">
					                         	<c:if test="${j.current.specComfirm eq 'Y'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:green;">${career.specName}</li>
				                         		</c:if>
				                         		<c:if test="${j.current.specComfirm eq 'N'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:red;">${career.specName}</li>
				                         		</c:if>
				                         	</c:if>
			                         	</c:forEach>
			                         	</ul></td>
			                         	<td><ul>
			                         	<c:forEach var="career" varStatus="j" items="${spareMentoList}">
				                         	<c:if test="${career.specCName eq '경력' && i.current.memberNo eq career.memberNo}">
				                         	<input type="hidden" class="name${j.index}" value="${career.specName}">
				                         	<input type="hidden" class="pass${j.index}" value="${career.specComfirm}">
				                         	<input type="hidden" class="file${j.index}" value="${career.specFileName}">
					                         	<c:if test="${j.current.specComfirm eq 'Y'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:green;">${career.specName}</li>
				                         		</c:if>
				                         		<c:if test="${j.current.specComfirm eq 'N'}">
						                         	<li class="hover" onclick="showImg(${j.index});" style="color:red;">${career.specName}</li>
				                         		</c:if>
				                         	</c:if>
			                         	</c:forEach>
			                         	</ul></td>
			                         	<td><button id="metoManageBtn">관리</button></td>
									</tr>
									</c:if>
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
										<a class="hover" onclick="slistBack()">[이전]</a>&nbsp;
									</c:if>
						<!-- [번호들] -->
									<c:forEach var="p" begin="${spi.startPage}" end="${spi.endPage}">
										<c:if test="${p eq spi.currentPage}">
											<font color="green" size="4"><b>[${p}]</b></font>
										</c:if>
										<c:if test="${p ne spi.currentPage}">
											<c:url var="slistCheck" value="mentoManage.do">
												<c:param name="spage" value="${p}"/>
												<c:param name="mpage" value="${pi.currentPage}"/>
											</c:url>
											<a class="hover" onclick="slistCheck()">${p}</a>
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
										&nbsp;<a class="hover" onclick="slistAfter()"">[이후]</a>
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
    <%-- <jsp:include page="../common/footer.jsp"/> --%>
</body>
	
	<script>
		$(document).on("mouseenter", ".hover",function(){
			$(".hover").css("cursor","pointer");
		})
	
		function listAfter(){
			location.href="${listAfter}";
		}
		function listBack(){
			location.href="${listBack}";
		}
		function listCheck(){
			location.href="${listCheck}";
		}
		
		function slistAfter(){
			location.href="${listAfter}";
		}
		function slistBack(){
			location.href="${listBack}";
		}
		function slistCheck(){
			location.href="${listCheck}";
		}
		
		function mentoManage(i){
			$("#mentoModal").css("display","block");
			$memberNo = $(".member"+i).val();
			
			$("#infoCheck").append("<input type='hidden' name='memberNo' value='"+$memberNo+"'>");
		}

		function showImg(i){
			$name = $(".name"+i).val();
			$pass = $(".pass"+i).val();
			$file = $(".file"+i).val();
			
			$("#careerModal").css("display","block");
			
			$("#specName").append($name);
			$("#speckCheck").append($pass);
			
			// 파일 이름을 $file로 설정하기 
			if($file != null){
				$("#cImg").append("<img src='${contextPath}/resources/upprofileFiles/"+$file+"' style='width:100%'>");
			}else{
				$("#cImg").append("사진 파일 없음");
			}
		}
	</script>



</html>