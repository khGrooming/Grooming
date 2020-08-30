<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 관리</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style>
        html, body{margin:0px;padding:0px}
        section{margin-top:10%}

        .sideMenu{background-color:blue;border-radius:10%;font-size:large;}
        .admin{height:80px;text-align:center;padding:30px;}
        .sub{height:50px;text-align:center;font-size:small;}

        .statisticsMain, .member, .grooming, .declaration{height:100px;background:chartreuse;}
        .search{width:100%;height:40px;text-align:center;}
        #searchMember{width:350px;height:30px;}
        #searchMemberBtn{width:50px;height:35px;}
        .memberInfo{border-collapse: collapse;width:100%;}
        .memberInfo th,td{height:50px;text-align:center;}
        
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
		            <h1 align="center">회원 관리</h1>
		
		            <div class="search">
		                <form action="memberManage.do">
		                	<select id="category" name="category">
		                		<option id="memberName" value="memberName" selected>이름</option>
		                		<option id="nickname" value="nickname">닉네임</option>
		                		<option id="email" value="email">이메일</option>
		                		<option id="sanctions" value="sanctions">제제 대상</option>
		                	</select>
		                    <input type="text" id="searchMember" name="name" value="${name}">
		                    <button type="submit" id="searchMemberBtn">찾기</button>
		                </form>
		            </div>
		            <br><br>
		            <table class="memberInfo" border="1">
		                <thead>
		                    <tr>
		                        <th>아이디</th>
		                        <th>닉네임</th>
		                        <th>이름</th>
		                        <th>연락처</th>
		                        <th>포인트</th>
		                        <th style="display:none;"></th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <c:forEach var="list" items="${list}">
		                    	<c:if test="${!empty list.sanctions}">
		                    		<tr style="background:grey; opacity:0.9">
		                    	</c:if>
		                    	<c:if test="${empty list.sanctions}">
			                    	<tr>
		                    	</c:if>
		                    		<td>${list.memberEmail}</td>
		                    		<td>${list.memberNickname}</td>
		                    		<td>${list.memberName}</td>
		                    		<td>${list.memberPhone}</td>
		                    		<td class="point">${list.point}</td>
		                    		<td style="display:none;"><input type="hidden" id="memberNo" value="${list.memberNo}"></td>
		                    	</tr>
		                    </c:forEach>
		                    <!-- 페이징 처리 부분 -->
							<tr align="center" height="20">
								<td colspan="5">
						<!-- [이전] -->
									<c:if test="${pi.currentPage eq 1}">
										[이전]&nbsp;
									</c:if>
									<c:if test="${pi.currentPage gt 1}">
										<c:url var="listBack" value="memberManage.do">
											<c:param name="name" value="${name}"/>
											<c:param name="page" value="${pi.currentPage - 1}"/>
											<c:param name="category" value="${category}"/>
										</c:url>
										<a href="${listBack}">[이전]</a>&nbsp;
									</c:if>
						<!-- [번호들] -->
									<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
										<c:if test="${p eq pi.currentPage}">
											<font color="red" size="4"><b>[${p}]</b></font>
										</c:if>
										<c:if test="${p ne pi.currentPage}">
											<c:url var="listCheck" value="memberManage.do">
												<c:param name="name" value="${name}"/>
												<c:param name="page" value="${p}"/>
												<c:param name="category" value="${category}"/>
											</c:url>
											<a href="${listCheck}">${p}</a>
										</c:if>
									</c:forEach>
						<!-- [이후] -->
									<c:if test="${pi.currentPage eq pi.maxPage}">
										&nbsp;[이후]
									</c:if>
									<c:if test="${pi.currentPage lt pi.maxPage}">
										<c:url var="listAfter" value="memberManage.do">
											<c:param name="name" value="${name}"/>
											<c:param name="page" value="${pi.currentPage + 1}"/>
											<c:param name="category" value="${category}"/>
										</c:url>
										&nbsp;<a href="${listAfter}">[이후]</a>
									</c:if>
								</td>
							</tr>
		                </tbody>
		            </table>
		            <form action="pointCalculation.do">
			            <div id="myModal" class="modal">
							      <!-- Modal content -->
							<div class="modal-content">
								<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">포인트 관리</span></b></span></p>
								<p id="infoCheck" style="text-align: center; line-height: 1.5;"><br /><input type="text" name="addPoint"></p>
						     	<p><br /></p>
						     	
								<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">
									<button type="submit" id="userConfirm" class="pop_bt" style="font-size: 13pt;">확인</button>
									<button type="button" class="pop_bt" style="font-size: 13pt;" onClick="location.reload(true);">취소</button>
								</div>
							</div>
						</div>
					</form>
		            <br clear="both"><br>
		         </div>
	         </div>
         </div>
    </section>
    <footer><jsp:include page="../common/footer.jsp"/></footer>
    <script>
    $(document).on("mouseenter",".point", function(){
		$(".point").css("cursor","pointer");
	}).on("click", ".point", function(){
		$(".modal").css("display","block");
		$memberNo = $(this).next().children("input").val();
		$("#infoCheck").append("<input type='hidden' name='memberNo' value='"+$memberNo+"'>");
	});
    
    $(function(){
    	if(${!empty category}){
    		
    		$("#category").find("option").removeAttr("selected");
    		$(${category}).prop("selected","selected");
    	}
    });

    </script>
</body>
</html>