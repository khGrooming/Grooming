<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
      <title>카페 페이지</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	    integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<!-- 카카오맵 API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f23df3d72e20cc3d63e0de5a303f1054"></script>
	<script src="https://www.w3.org/TR/geolocation-API/"/></script>
	<style>
	/* section{margin-top:10%} */
      
	.sideMenu{height:300px;background-color:blue;border-radius:10%;}
	.subMenu{height:100px;}
	
	.search{text-align:center;background:greenyellow;width:280px;height:50px;float:left;border:1px solid black}
	#map{width:100%;height:550px;padding:10px;}
	
	.btn{float:right;}
	.searchName{float:right;width:200px;height:35px;}
	
	.cafe{height:80px;text-align:center;padding:30px;}
     
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
		         <c:if test="${!empty SessionScope.loginUser}">
						<div class="cafe"><a href="reservationCheck.do?memberNo=${SessionScope.loginUser}">카페 신청 내역</a></div>
						<div class="cafe"><a href="reservationHistory.do?memberNo=${SessionScope.loginUser}">카페 예약 내역</a></div>
					</c:if>
					<c:if test="${empty SessionScope.loginUser}">
						<div class="cafe"><a href="loginPage.do">카페 신청 내역</a></div>
						<div class="cafe"><a href="loginPage.do">카페 예약 내역</a></div>
					</c:if>
			 </div>
		 </div>
            <div class="col-sm-8">
                   <div class="card text-center">
                    <div class="card-header">
                      <ul class="nav nav-tabs card-header-tabs">
                        <li class="nav-item">
                          <a class="nav-link active" href="searchMap.do">지도</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="searchName.do">이름</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="searchLocal.do">지역</a>
                          </li>
                      </ul>
                    </div>
                    <div class="card-body" onclick="test();">
                        <br>
                        <div id="map">
                            
                        </div>
                    </div>
                    <br><br>
               </div>
            </div>
        </div>
        </div>
        
	</section>
	<footer><jsp:include page="../common/footer.jsp" /></footer>
	
	<!-- 카카오맵을 불러오기 위한 script -->
	<script>		
		function getLocation() {
			  if (navigator.geolocation) { // GPS를 지원하면
			    navigator.geolocation.getCurrentPosition(function(position) {
			      // console.log('X : '+position.coords.latitude)
			      // console.log('Y : '+position.coords.longitude);
			      var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
					var options = { //지도를 생성할 때 필요한 기본 옵션	
						center: new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude), //지도의 중심좌표.
						level: 3 //지도의 레벨(확대, 축소 정도)
					};
					
					var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
					
					// 마커가 표시될 위치입니다 
					var markerPosition  = new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude); 
					
					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
					    position: markerPosition
					});
					
					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
				
			      
			    }, function(error) {
			      console.error(error);
			    }, {
			      enableHighAccuracy: true,
			      maximumAge: 1,
			      timeout: Infinity
			    });
			  } else {
			    alert('GPS를 지원하지 않습니다');
			  }
			}
		getLocation();
		
		// gps 거절시 기본 세팅
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션	
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
		
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	</script>
</body>
</html>