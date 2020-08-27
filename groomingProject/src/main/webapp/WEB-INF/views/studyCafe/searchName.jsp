<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름으로 카페 검색</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style>
		/* section{margin-top:10%} */
		
		.sideMenu{height:300px;background-color:blue;border-radius:10%;}
		.subMenu{height:100px;}
		
		.search{text-align:center;background:greenyellow;width:280px;height:50px;float:left;border:1px solid black}
		.searchView{width:100%;background:lawngreen;display:inline-block;padding:10px;}
		
		.searchName{width:200px;height:35px;}
		
		.panel{width:150px;height:200px;display:inline-block; border-radius: 10%;overflow:hidden;}
		
		.cafe{height:80px;text-align:center;padding:30px;}
		
		.thumbnail{width:150px}
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
					<div class="cafe"><a href="searchMap.do">스터디 카페 검색</a></div>
					<div class="cafe"><a href="reservationCheck.do">카페 신청 내역</a></div>
					<div class="cafe"><a href="reservationHistory.do">카페 예약 내역</a></div>
	        	</div>
	        </div>
			<div class="col-sm-8">
		       <div class="card text-center">
		        <div class="card-header">
		          <ul class="nav nav-tabs card-header-tabs">
		            <li class="nav-item">
		              <a class="nav-link" href="searchMap.do">지도</a>
		            </li>
		            <li class="nav-item">
		              <a class="nav-link active" href="searchName.do">이름</a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link" href="searchLocal.do">지역</a>
		              </li>
		          </ul>
		        </div>
		        <div class="card-body">
		            <br>
		            <div class="row">
		                	<input type="text" id="searchName" name="searchName">
		                    <button type="button" id="click" class="btn btn-default" onclick="searchCafeName();">
		                        <span class="glyphicon glyphicon-search"></span> 검색
		                    </button>
		            </div>
		            <br>
		            <div class="searchView">
		                <c:forEach var="cafe" items="${cafeList}">
			            <c:url var="cafeDetail" value="cafeDetail.do">
			            	<c:param name="cafeNo" value="${cafe.cafeNo}"/>
			            </c:url>
		                <div class="panel panel-default" onclick="location.href='cafeDetail.do?cafeNo=${cafe.cafeNo}'">
		                    <img src="${contextPath}/resources/views/images/study.jpg" class="thumbnail">
		                    <div class="panel-body"><c:out value="${cafe.cafeName}"/></div>
		                    <div class="panel-footer"><c:out value="${cafe.cafeAddress}"/></div>
		                </div>
		            	</c:forEach>
		            </div>
		        </div>
		        <br><br><br>
	   			</div>
			</div>
		</div>
		</div>
	</section>
	
	<footer><jsp:include page="../common/footer.jsp" /></footer>
	
	<script>
		$("#searchName").keyup(function(event){
			if(event.keyCode == 13){
				searchCafeName();
			}
		})
	
		function searchCafeName(){

			name = $("#searchName").val();

			$.ajax({
				url:"cafeName.do",
				type:"post",
				dataType:"json",
				data:{name:name},
				success:function(data){
					$view = $(".searchView").html("");
					
					for(var i in data){

						$panel = $("<div class='panel panel-default'>");
						$panel.attr("onclick","location.href='cafeDetail.do?cafeNo="+data[i].cafeNo+"'");
						$img = $("<img src='${contextPath }/resources/views/images/study.jpg' class='thumbnail'>");
						$body = $("<div class='panel-body'>");
						$footer = $("<div class='panel-footer'>");
						
						$body.append(data[i].cafeName);
						$footer.append(data[i].cafeAddress);
						
						$panel.append($img);
						$panel.append($body);
						$panel.append($footer);
						
						$view.append($panel);
					}
				},
				error:function(request, status, errorData){
                    alert("error code: " + request.status + "\n"
                          +"message: " + request.responseText
                          +"error: " + errorData);
                 }
			})
		}
		
	</script>
</body>
</html>