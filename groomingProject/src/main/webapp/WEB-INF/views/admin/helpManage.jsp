<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 관리</title>
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
    <style>
       	section { padding-top: 6.25rem; min-height: calc(100vh - 3.5rem); }
        .sideMenu{/* background-color:blue; */ border: thin solid lightgray; border-radius:0.1rem;font-size:large;}
        .admin{height:80px;text-align:center;padding:30px;}
        .sub{height:50px;text-align:center;font-size:small;}

        .statisticsMain, .member, .grooming, .declaration{height:100px;background:chartreuse;}
        .search{width:100%;height:40px;text-align:center;}
        #helpValue{width:350px;height:30px;}
        #searchBtn{width:50px;height:35px;}
        .helpInfo{border-collapse: collapse;width:100%;}
        .helpInfo th,td{height:50px;text-align:center;}
        .helpInfo tbody tr:hover{background: lightgray;}

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
        .helpEmailModal{
        	width: 100%;
        	borer: none;
        }
        #helpAnswerModal{
        	width: 100%;
        	height: 400px;
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
	                <div class="sideMenu col-sm-7">
	                    <div class="admin"><a href="adminMain.do">통계</a></div>
	                     <div class="admin"><a href="memberManage.do">회원 관리</a></div>
	                     <div class="admin"><a href="groomingManage.do">그루밍 관리</a></div>
	                     <div class="admin"><a href="declarationManage.do">신고 관리</a></div>
	                     <div class="admin"><a href="cafeManage.do">카페 관리</a></div>
						 <div class="admin"><a href="helpManage.do">문의 사항</a></div>
	                </div>
                </div>
		         <div class="col-sm-8">
		            <h1 align="center">회원 관리</h1>
		
		            <div class="search">
		                <form action="helpManage.do">
		                	<select id="category" name="category">
		                		<option value="helpContent" selected>내용</option>
								<c:forEach var="hCList" items="${hCList}">
		                		<option value="${hCList.helpCNo }">${hCList.helpCName }</option>
		                		</c:forEach>
		                	</select>
		                    <input type="text" id="helpValue" name="helpValue">
		                    <button type="submit" id="searchBtn">찾기</button>
		                </form>
		            </div>
		            <br><br>
		            <table class="helpInfo" border="1">
		                <thead>
		                    <tr>
		                        <th>문의 번호</th>
		                        <th>카테고리</th>
		                        <th>답변 받을 이메일</th>
		                        <th>내용</th>
		                        <th>날짜</th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <c:forEach var="hList" items="${hList}">
		                    	<tr class="hList" onclick="modalOpen('${hList.helpEmail}')">
		                    		<td class="helpNo">${hList.helpNo}</td>
		                    		<td class="helpCName">${hList.helpCName}</td>
		                    		<td class="helpEmail">${hList.helpEmail}</td>
		                    		<td class="helpContent">${hList.helpContent}</td>
		                    		<td class="helpCDate">${hList.helpCDate}</td>
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
										<c:url var="listBack" value="helpManage.do">
											<c:param name="helpValue" value="${helpValue}"/>
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
											<c:url var="listCheck" value="helpManage.do">
												<c:param name="helpValue" value="${helpValue}"/>
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
										<c:url var="listAfter" value="helpManage.do">
											<c:param name="helpValue" value="${helpValue}"/>
											<c:param name="page" value="${pi.currentPage + 1}"/>
											<c:param name="category" value="${category}"/>
										</c:url>
										&nbsp;<a href="${listAfter}">[이후]</a>
									</c:if>
								</td>
							</tr>
		                </tbody>
		            </table>
		            <div id="helpModal" class="modal">
						Modal content
						<div class="modal-content">
							<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">답변</span></b></span></p>
							<p id="infoCheck" style="text-align: left; line-height: 1.5;"><br/>문의 이메일 <input type="text" class="helpEmailModal" name="helpEmailModal"></p>
							<textarea id="helpAnswerModal" name="helpAnswerModal" required></textarea>
					     	<p><br/></p>
							<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">
								<button type="button" onclick="answerMail()" id="userConfirm" class="pop_bt" style="font-size: 13pt;">확인</button>
								<button type="button" class="pop_bt" style="font-size: 13pt;" onClick="location.reload(true);">취소</button>
							</div>
						</div>
					</div>
		            <br clear="both"><br>
		         </div>
	         </div>
         </div>
    </section>
    <script>
    
    	function modalOpen(helpEmail){
    		$("#helpModal").css("display","block");
    		$(".helpEmailModal").val(helpEmail);
    		
    	}
    
     $(function(){
    	if(${!empty category}){
    		$("#category").find("option").removeAttr("selected");
    		$(${category}).prop("selected","selected");
    	}
    });
     
		function answerMail(){
    		$("#helpModal").css("display","none");
			var helpEmailModal = $(".helpEmailModal").val();
			var helpAnswerModal = $("#helpAnswerModal").val();
			
			//email 전송
			$.ajax({ 
				url:"helpAnswer.do",
				data:{helpEmailModal:helpEmailModal,helpAnswerModal:helpAnswerModal},
				success:function(data){
					//console.log("이메일 전송 결과 : " + data);
					if(data == "success"){
						//console.log("이메일 전송 결과 : 완료");
					
					} else if(data == "retry"){
						//console.log("이메일 전송 결과 : 실패");
						alert("정상적으로 처리되지 않았습니다. 잠시 후 다시 해주세요.");
					} else {
						//console.log("이메일 전송 결과 : 일치하는 정보 없음");
						alert("입력하신 이메일과 일치하는 정보가 없습니다.");
					}
				},
				error:function(request, status, errorData){
					alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
				}
			});
			
		}

    </script>
</body>
</html>