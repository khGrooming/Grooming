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

        
        @font-face { 
			font-family: 'TmoneyRoundWindExtraBold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff');
    	    font-weight: normal; 
    	    font-style: normal; 
   		}
   
	   * {
	      font-family:"TmoneyRoundWindExtraBold";
	   }
	 
		table tr{
			border : 3px double green;
		}
		
		#tb1 tbody tr td{
			
		}
    </style>
</head>

<body>
    <!-- 헤더시작 -->
    <header>
      	<jsp:include page="../common/mainNavigationBar.jsp" />
    </header>

    <!-- 섹션 시작 -->
    <section >

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
    
       <label><a href="${groupP }"><i class="fas fa-user-graduate"></i>메인</a></label>

        <label><a href="${calendar }"><i class="fas fa-calendar-alt"></i>출석부</a></label>

        <label><a href="${gBlist }"><i class="fas fa-icons"></i>게시판</a></label>


	<!-- 캘린더 내용 출석 체크 -->
			<h1>출석부</h1>
            <div class="table-responsive container" style="text-align:center; height:500px;">
          
		            		<table class="table table-bordered" id="tb1" style="width:5000px;">
					            <tbody>
		          					
									
				            	</tbody>
			            	</table>
		            	
			            	
		      </div>
      
     <div class="row">
            <div class="cols-2">
            	<table class="table table-bordered" >
            		<thead>
            		<tr>
            			<th style="width:auto;">멤버 이름</th>
            		</tr>
    
            		</thead>
	            	<tbody>
	            		<c:forEach var="m" items="${member }" >
	            		<tr>
	            			<td style="width:auto;">${m.memberNickName }</td>
	            		</tr>
	            		</c:forEach>
	            		
	            	</tbody>
            	
            	</table>
            	</div>
            	<div class="cols-10">
            	<table class="table table-bordered" >
            		<thead>
            		<tr>
            			<th colspan="3" style="width:auto;"><label name="">날짜</label></th>
            		</tr>
    
            		</thead>
	            	<tbody>
	            		<c:forEach var="m" items="${member }" >
	            		<tr>
	            			<td><label>출석&nbsp;<input type="radio" name="chulseok" value="Y"></label></td>
	            			<td><label>결석&nbsp;<input type="radio" name="chulseok" value="N"></label></td>
	            			<td><label>지각&nbsp;<input type="radio" name="chulseok" value="L"></label></td>
	            		</tr>
	            		</c:forEach>
	            		
	            	</tbody>
            	
            	</table>
            	</div>
            	</div>
       

  
    </div>
    </section>
  <script>

	$(function(){
		
		
		checkList();
	
	})

	function checkList(){
		var groomingNo = "${grooming.groomingNo}";
		var memberNickName ="${str}";
		 var NickName = memberNickName.split(',');
	
		for(var j=0; j<NickName.length; j++){
			
			(function(j){
				$.ajax({
					url:"checkList.do",
					data:{groomingNo:groomingNo,memberNickName:NickName[j]},
					dataType:"json",
					traditional : true,
				 	async: false, 
					success:function(data){
					
						var $label;
						var $table;
						var $tableBody;
						var $tr1;
						var $tr2;
						var $td1;
						var $td2;
						var $br;
						$tableBody = $("#tb1 tbody");
					
						
						if(data.length > 0){	// 출석이 하나 이상 존재하면 
						
								 $label=$("<label class='NickName'>").text(NickName[j]);
								$table=$("<table class='table table-bordered' id='tb1' >");  
								$tableBody.append($label);
								$tr1=$("<tr class='tr1'> style='width:auto;'");
								$br = $("<br>")
							for(var i in data){
	
								$td1=$("<td class='td1'>").text(data[i].gCheckDate);
								if(data[i].gCheckStatus=='Y'){
									$td2=$("<td class='td2'>").text("출석");
								}else if(data[i].gCheckStatus=='N'){
									$td2=$("<td class='td2'> style='width:auto;'").text("결석").css('color','red');
								}else{
									$td2=$("<td class='td2'> style='width:auto;'").text("지각").css('color','yellow');
								}
						 	   /*  $table.append($tableBody);  
						 	
								$div1.append($table);    */
								
								$tr1.append($td1);
								$tr1.append($td2);
								$tableBody.append($tr1);
							}
								$tableBody.append($tr2);
								$tableBody.append($br);
								
						}else{
						    
							 $td2=$("<td>").text("출석체크를 오늘부터 해주세요!");
							 $tr2=$("<tr>");
							 $tr2.append($td2);
							 $tableBody.append($tr2);
						}
					},
					error:function(request, status, errorData){
						alert("error code: " + request.status + "\n"
								+"message: " + request.responseText
								+"error: " + errorData);
					}
				});
		
			})(j);
	
		
		}
	}
	
</script> 

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