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
        .sideMenu{/* background-color:blue; */ border: thin solid lightgray; border-radius:10%;font-size:large;}
        .admin{height:80px;text-align:center;padding:30px;}
        .sub{height:50px;text-align:center;font-size:small;}
        
        .statisticsMain, .member, .grooming, .declaration{height:100px;background:chartreuse;}

        .declarationInfo{width: 70%;border-collapse: collapse;margin-left:20%;}
        .declarationInfo th,td{height:50px;text-align:center;}
        
        .panel{width:150px;height:250px;display:inline-block; border-radius: 10%;overflow:hidden;}
		
		.cafe{height:100px;text-align:center;padding:30px;}
		
		.thumbnail{width:150px}
		
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
		
		.modalInfo{width:100%; text-align:center;}
		section img{width:100%;}
    </style>
</head>
<body>
    <jsp:include page="../common/mainNavigationBar.jsp"/>
    <section>
        <br><br>
            <h1 align="center">카페 관리</h1>
            <br><br>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-3">
				<br><br>
					<div class="container col-sm-3"></div>
				    <div class="sideMenu col-sm-7">
						<div class="admin"><a href="adminMain.do">통계</a></div>
	                    <div class="admin"><a href="memberManage.do">회원 관리</a></div>
	                    <div class="admin"><a href="groomingManage.do">그루밍 관리</a></div>
	                    <div class="admin"><a href="declarationManage.do">신고 관리</a></div>
	                    <div class="admin"><a href="cafeManage.do">카페 관리</a></div>
	            	</div>
	        	</div>
			<div class="col-sm-8">
		       <div class="card text-center">
		            <div class="row">
	                	<input type="text" id="searchName" name="searchName">
	                    <button type="button" id="click" class="btn btn-default" onclick="searchCafeName();">
	                        <span class="glyphicon glyphicon-search"></span> 검색
	                    </button>
	                    <button type="button" id="click" class="btn btn-default" onclick="insertCafe();">
	                        <span class="glyphicon glyphicon-plus-sign"></span> 추가
	                    </button>
		            </div>
		            <br>
		            <div class="searchView">
		                <c:forEach var="cafe" varStatus="i" items="${cafeList}">
		                <div class="panel panel-default" onclick="openDetail(${i.index}, 0);">
		                	<input type="hidden" class="cafeNo${i.index}" value="${cafe.cafeNo}">
		                    <img src="${contextPath}/resources/views/images/cafeImage/${cafe.cafeImg}" class="thumbnail">
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
        <br clear="both">
        <!-- 카페 정보 변경 폼 -->
        <form action="cafeInfoChange.do" method="post" enctype="multipart/form-data">
            <div id="changeCafe" class="modal">
				      <!-- Modal content -->
				<div class="modal-content">
					<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">카페 관리</span></b></span></p>
					<p id="infoCheck" style="text-align: center; line-height: 1.5;"><br /></p>
			     	<p><br /></p>
			     	
					<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">
						<button type="submit" id="userConfirm" class="pop_bt" style="font-size: 13pt;">변경</button>
						<button type="button" class="pop_bt" style="font-size: 13pt;" onClick="location.reload(true);">취소</button>
					</div>
				</div>
			</div>
		</form>
		<!-- 카페 추가 폼 -->
            <div id="insertCafe" class="modal">
				      <!-- Modal content -->
				<div class="modal-content">
					<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">카페 추가</span></b></span></p>
					<p id="insertInfo" style="text-align: center; line-height: 1.5;"><br />
					<form action="insertCafeInfo.do" method="post" enctype="multipart/form-data">
						<label>카페 이름</label><input type="text" name="cafeName" class="modalInfo">
						<label>카페 소개</label><textarea name="cafeContent" class="modalInfo"></textarea>
						<label>카페 연락처</label><input type="text" name="cafePhone" class="modalInfo">
						<label>카페 주소</label><input type="text" name="cafeAddress" class="modalInfo">
						<label>카페 이미지</label><div id="image_container"></div>
						<input type="file" name="uploadFile" id="image" accept="image/*" onchange="setThumbnail(event);">
						<label>카페 룸 이름</label><input type="text" name="cRoomName" class="modalInfo">
						<label>카페 이용 시간</label><input type="text" name="cRoomAvailableTime" class="modalInfo">
						<label>카페 최소 예약 시간</label><input type="text" name="cRoomTime" class="modalInfo">
						<label>카페 룸 가격</label><input type="text" name="cRoomPrice" class="modalInfo">
						<label>카페 룸 이용가능 수</label><input type="text" name="cRoomHeadCount" class="modalInfo">
					</p>
			     	<p><br /></p>
			     	
					<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">
						<input type="submit" id="userConfirm" class="pop_bt" style="font-size: 13pt;" value="추가">
						<button type="button" class="pop_bt" style="font-size: 13pt;" onClick="location.reload(true);">취소</button>
					</div>
					</form>
				</div>
			</div>
		 <script> 
			
		 </script>

    </section>
	<script>
		function openDetail(i, j){
			$("#changeCafe").css("display","block");
			$cafeNo = $(".cafeNo"+i).val();
			$infoCheck = $("#infoCheck");
			$infoCheck.html("");
			
			$.ajax({
				url:"cafeinfo.do",
				data:{cafeNo:$cafeNo},
				type:"post",
				dataType:"json",
				success:function(data){
					$cPriceNo = data[j].cPriceNo;
					$cafeName = data[j].cafeName;
					$cafeContent = data[j].cafeContent;
					$cafePhone = data[j].cafePhone;
					$cafeAddress = data[j].cafeAddress;
					$cRoomName = data[j].cRoomName;
					$cRoomAvailableTime = data[j].cRoomAvailableTime;
					$cRoomTime = data[j].cRoomTime;
					$cRoomPrice = data[j].cRoomPrice;
					$cRoomHeadCount = data[j].cRoomHeadCount;
					
					$infoCheck.append("<input class='modalInfo' name='cafeNo' type='hidden' value='"+$cafeNo+"'>");
					$infoCheck.append("<input class='modalInfo' name='cPriceNo' type='hidden' value='"+$cPriceNo+"'>");
					$infoCheck.append("<labe>카페 이름 </label><input class='modalInfo' name='cafeName' type='text' value='"+$cafeName+"'><br><br>");
					$infoCheck.append("<labe>카페 소개 </label><textarea name='cafeContent' class='modalInfo'>"+$cafeContent+"</textarea><br><br>");
					$infoCheck.append("<labe>카페 연락처 </label><input class='modalInfo' name='cafePhone' type='text' value='"+$cafePhone+"'><br><br>");
					$infoCheck.append("<labe>카페 주소 </label><input class='modalInfo' name='cafeAddress' type='text' value='"+$cafeAddress+"'><br><br>");
					$infoCheck.append("<label>카페 이미지</label>");
					$infoCheck.append("<div id='image_container'><img src='${contextPath }/resources/views/images/cafeImage/"+data[j].cafeImg+"' class='thumbnail'></div>");
					$infoCheck.append("<input type='file' name='uploadFile' id='image' accept='image/*' onchange='setThumbnail(event);'>");
					$infoCheck.append("<labe>카페 룸 이름 </label><input class='modalInfo' name='cRoomName' type='text' value='"+$cRoomName+"'><br><br>");
					$infoCheck.append("<labe>카페 이용 시간 </label><input class='modalInfo' name='cRoomAvailableTime' type='text' value='"+$cRoomAvailableTime+"'><br><br>");
					$infoCheck.append("<labe>카페 최소 예약 시간 </label><input class='modalInfo' name='cRoomTime' type='text' value='"+$cRoomTime+"'><br><br>");
					$infoCheck.append("<labe>카페 룸 가격 </label><input class='modalInfo' name='cRoomPrice' type='text' value='"+$cRoomPrice+"'><br><br>");
					$infoCheck.append("<labe>카페 룸 이용가능 수 </label><input class='modalInfo' name='cRoomHeadCount' type='text' value='"+$cRoomHeadCount+"'><br><br>");
					
					for(l in data){
						if(l == j){
							$infoCheck.append("<a style='color:green;' onclick='openDetail("+i+","+l+");'> ["+l+"] </a>");
						}else{
							$infoCheck.append("<a style='color:blue;' onclick='openDetail("+i+","+l+");'> ["+l+"] </a>");
						}
					}
				},
				error:function(data){
					console.log("실패!");
				}
			})
		}

		function insertCafe(){
			$("#insertCafe").css("display","block");
			
		}
		
		// 이미지 미리보기
		 function setThumbnail(event) { 
			 var reader = new FileReader(); 
			 reader.onload = function(event) {
				$("#image_container").html("");
				 var img = document.createElement("img");
				 img.setAttribute("src", event.target.result);
				 document.querySelector("div#image_container").appendChild(img);
				 };
				 reader.readAsDataURL(event.target.files[0]); 
		 }
		
		 function searchCafeName(){
				$name = $("#searchName").val();

				$.ajax({
					url:"cafeName.do",
					type:"post",
					dataType:"json",
					data:{name:$name},
					success:function(data){
						$view = $(".searchView").html("");
						
						for(var i in data){

							$panel = $("<div class='panel panel-default'>");
							$panel.attr("onclick","openDetail("+i+",0)");
							$cafeNo = $('<input type="hidden" class="cafeNo'+i+'" value="'+data[i].cafeNo+'">')
							$img = $("<img src='${contextPath }/resources/views/images/cafeImage/"+data[i].cafeImg+"' class='thumbnail'>");
							$body = $("<div class='panel-body'>");
							$footer = $("<div class='panel-footer'>");
							
							$body.append(data[i].cafeName);
							$footer.append(data[i].cafeAddress);
							
							$panel.append($cafeNo);
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