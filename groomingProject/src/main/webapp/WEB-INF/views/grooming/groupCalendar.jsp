<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
	
	<!-- datapicker  -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Bootstrap CSS -->
<link href="https://www.cssscript.com/wp-includes/css/sticky.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
	integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc"
	crossorigin="anonymous">




<title>Hello, world!</title>
<style>
body {
	height: 1200px;
}
/* div의 크기에 맞춤 */
img {
	max-width: 100%;
	max-height: 100%;
}

@font-face {
	font-family: 'TmoneyRoundWindExtraBold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: "TmoneyRoundWindExtraBold";
}

table tr {
	border: 3px double green;
}

#tb1 tbody tr td {
	
}

h1{
	margin-top:50px;
}
</style>
</head>

<body>
	<!-- 헤더시작 -->
	<header>
		<jsp:include page="../common/mainNavigationBar.jsp" />
	</header>

	<!-- 섹션 시작 -->
	<section>
		<jsp:useBean id="now" class="java.util.Date" />
		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

	<%-- 	<fmt:formatDate value="${grooming.studySd }" var="studySd" pattern="yyyy-MM-dd" /> --%>
	


		<!-- 컨테이너로 양옆에 공백 생성 -->
		<div class=container style="margin-top: 100px;">
			<c:url var="calendar" value="calendar.do">
				<c:param name="groomingNo" value="${grooming.groomingNo}" />
			</c:url>
			<c:url var="gBlist" value="gBlist.do">
				<c:param name="groomingNo" value="${grooming.groomingNo}" />
			</c:url>
			<c:url var="groupP" value="groupPage.do">
				<c:param name="groomingNo" value="${grooming.groomingNo}" />
			</c:url>

			<label><a href="${groupP }"><i class="fas fa-user-graduate"></i>메인</a></label> 
			<label><a href="${calendar }"><i class="fas fa-calendar-alt"></i>출석부</a></label>
			<label><a href="${gBlist }"><i class="fas fa-icons"></i>게시판</a></label>


			<!-- 캘린더 내용 출석 체크 -->
			<h1>출석부</h1>
			<div class="table-responsive container"
				style="text-align: center; height: 300px;">

				<table class="table table-bordered" id="tb1" style="width: 3000px;">
					<tbody>


					</tbody>
				</table>


			</div>

			<h1>출석 체크</h1>
			<div style="text-align: center;" >
				<form action="insertCheck.do">
				<input type="hidden" name="groomingNo" value="${grooming.groomingNo }"/>
					<table class="table table-bordered" id="#tb2">
						<thead>
							<tr>
								<th style="width: auto;">멤버 이름</th>
								<!-- <th colspan="3" style="width: auto;"><input type="date" name="gCheckDate" id="checkDate" required></th> -->
	 							<th colspan="3" style="width: auto;"><input type="date" min="${grooming.studySd }" max="${today }" id="checkDate" name="gCheckDate" ></th> 
							</tr>
	
						</thead>
						<tbody>
							<c:forEach var="m" items="${member }">

								<tr>
									<input type="hidden" name="memberNickName" value="${m.memberNickName }"/>
									<td style="width: auto;">${m.memberNickName }</td>
									<td>
										<select name="gCheckStatus" class="check-select">
											    <option value="Y" selected>출석</option>
											    <option value="L">지각</option>
											    <option value="N">결석</option>
										</select>
									</td>
								<!-- 	<td><label>결석&nbsp;<input type="radio" class="chulseok" value="N"></label></td>
									<td><label>지각&nbsp;<input type="radio" class="chulseok" value="L"></label></td> -->
								</tr>
							</c:forEach>
							<tr>
									<td colspan="4">
										<button type="submit">저장</button>
										<button type="">수정하기</button>
									</td>
									
							</tr>
						</tbody>
	
					</table>
					</form>
			</div>



		</div>
	</section>
<script>

</script>
	
	</script>
	
	
	<script>
		$(function() {
			checkList();
			setInterval(function(){
				$("#tb1 tbody").html("");
				checkList();
				console.log("나 깜빡임");
			},3000);
			
		
		})

		function checkList() {
			var groomingNo = "${grooming.groomingNo}";
			var memberNickName = "${str}";
			var NickName = memberNickName.split(',');

			for (var j = 0; j < NickName.length; j++) {

				(function(j) {
					$.ajax({
								url : "checkList.do",
								data : {
									groomingNo : groomingNo,
									memberNickName : NickName[j]
								},
								dataType : "json",
								traditional : true,
								async : false,
								success : function(data) {
									var $label;
									var $table;
									var $tableBody;
									var $tr1;
									var $tr2;
									var $td1;
									var $td2;
									var $br;
									$tableBody = $("#tb1 tbody");

									if (data.length > 0) { // 출석이 하나 이상 존재하면 

										$label = $("<label class='NickName'>").text(NickName[j]);
										$table = $("<table class='table table-bordered' id='tb1' >");
										$tableBody.append($label);
										$tr1 = $("<tr class='tr1'> style='width:auto;'");
										$br = $("<br>")
										for ( var i in data) {

											$td1 = $("<td class='td1'>").text(data[i].gCheckDate);
											if (data[i].gCheckStatus == 'Y') {
												$td2 = $("<td class='td2'>").text("출석");
											} else if (data[i].gCheckStatus == 'N') {
												$td2 = $("<td class='td2'> style='width:auto;'").text("결석").css('color', 'red');
											} else {
												$td2 = $("<td class='td2'> style='width:auto;'").text("지각").css('color','yellow');
											}
											/*  $table.append($tableBody);  
											
											$div1.append($table);    */

											$tr1.append($td1);
											$tr1.append($td2);
											$tableBody.append($tr1);
										}
										$tableBody.append($tr2);
										$tableBody.append($br);

									} else {

										$td2 = $("<td style='text-align:left;'>")
												.text("출석체크를 오늘부터 해주세요!");
										$tr2 = $("<tr>");
										$tr2.append($td2);
										$tableBody.append($tr2);
									}
								},
								error : function(request, status, errorData) {
									alert("error code: " + request.status
											+ "\n" + "message: "
											+ request.responseText + "error: "
											+ errorData);
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

	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
</body>
</html>