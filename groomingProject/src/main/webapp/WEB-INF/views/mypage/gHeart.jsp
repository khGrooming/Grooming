<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.content-op{
width: 80%;
height:100%;
margin-right: auto; 
margin-left: auto; 
}
#ta{
	width:80%;
	min-width: 1000px;
	margin-left: auto;
	margin-right: auto;
}
#ta tr:nth-child(n+2){
	height:130px;
	border-bottom: 1px solid black;
}
#ta th{
	font-size: 20px;
}
#ta th{
	text-align: center;
}
#ta tr td{
text-align: center;
}
#ta tr td:nth-child(3){
text-align: left;
}
</style>
</head>

<body>
<jsp:include page="./mypageinfo.jsp" />
<div class="content-op">
<h3 style="width: 80%; margin:0 auto;">찜 목록</h3>
<br>
	<div style="height: 700px;">
	<c:if test="${!empty hlist }">
		<table id="ta">
			<tr style="border-bottom: 2px solid;border-top:2px solid; height: 55px ">
				<th style="width: 10%;"><input type="checkbox" id="allcheck"onclick="checkAll();"></th>
				<th>D-DAY</th>
				<th>그룹 이름/내용</th>
				<th>예치금</th>
				<th>인원현황</th>
				
			
			</tr>
			<c:forEach var="list" items="${hlist }">
				<c:url var="gdetail" value="groomingDetail.do">
					<c:param name="groomingNo" value="${list.groomingNo }"/>
					<%-- <c:param name="page" value="${pi.currentPage }"/> --%>
					<!-- 현재 보던 페이지 정보도 넘기자 -->
				</c:url>
	                        
	            <fmt:formatDate value="${list.groomingNd }" var="nowDate1" pattern="yyyyMMdd"/>	   	
	 	 		<fmt:formatDate value="${list.groomingEd }" var="endDate1" pattern="yyyyMMdd"/>	 	 		
	 	 		<fmt:parseDate value="${nowDate1 }" var="nowDate2" pattern="yyyyMMdd" />
	 	 		<fmt:parseDate value="${endDate1 }" var="endDate2" pattern="yyyyMMdd" />	 	 		
		    	<fmt:parseNumber value="${(endDate2.time - nowDate2.time)/ ( 24*60*60*1000)}" integerOnly="true" var="difDate"/> 
		    	<c:if test="${list.groomingEd gt list.groomingNd }">
				<tr id="trr" >
				</c:if>
				<c:if test="${list.groomingEd lt list.groomingNd }">
                  <tr id="trr" style="color:rgba(229, 229, 229, 1);">
                 </c:if>
				<td><input type="checkbox" id="checkA" name="checkA" class="checkA" value="${list.groomingHeartNo }" >
				
				</td>
				<td>
				  <c:if test="${list.groomingEd gt list.groomingNd }">
                      <span id="d-day">D-</span><span id="day" >${difDate }</span>
                  </c:if>
                  <c:if test="${list.groomingEd lt list.groomingNd }">
                     <span id="day">마감</span>
                  </c:if>
				
				
				</td>
				<td onclick="location.href='${gdetail}'" style="width: 700px;" >
					<div style="float: left; margin-right: 20px;">
					<img alt="그루밍 사진" src="${contextPath }/resources/upGroomingFiles/${list.groomingImg }"
						onerror="this.src='${contextPath }/resources/views/images/grooming_logo.png'" width="100px;" height="80px;">
					</div>
					<div  style="float: left;">
					<br>
				
					<p>제목:${list.groomingTitle}</p>
					<p style="width:500px; font-size:10px">${list.groomingIntroduce }</p>
					</div>
					</td>
				<td>
					<c:if test="${list.money eq 0 }">
						-
					</c:if>
					<c:if test="${list.money ne 0 }">
						${list.money }
					</c:if>
				</td>
				<td>${list.currentP }/${list.groomingP}</td>
				
			</tr>
			
			</c:forEach>
		
		</table>
	</c:if>
	<c:if test="${empty hlist }">
		<p style="font-size: 25px; text-align: center;">찜 목록이 없습니다.</p>
		<p style="text-align: center; cursor: pointer;" onclick="location.href='groomingMain.do'">그루밍 메인으로 가기</p>

	</c:if>
	</div>
	
<br>

<div style="width: 80%; margin: 0 auto;">
<button onclick="deleteAction();" style=" width: 80px;  border-radius: 10px;">삭제</button>
</div>
<script>
$(function(){
	var day=$("span[id=day]").text();
})
function checkAll(){
    if( $("#allcheck").is(':checked') ){
      $("input[name=checkA]").prop("checked", true);
    }else{
      $("input[name=checkA]").prop("checked", false);
    }
}

function deleteAction(){
	  var checkA = "";
	  $( "input[name='checkA']:checked" ).each (function (){
		  checkA = checkA + $(this).val()+"," ;
	  });
	  checkA = checkA.substring(0,checkA.lastIndexOf( ",")); //맨끝 콤마 지우기
	 
	  if(checkA == ''){
	    alert("삭제할 대상을 선택하세요.");
	    return false;
	  }
	  console.log("### checkRow => {}"+checkA);
	 
	  if(confirm("정보를 삭제 하시겠습니까?")){
	      /* ajax로 삭제하기 ?*/
	    
	      location.href="heartDele.do?checkList="+checkA;
	          
	      
	      /* var url = document.location.href;
	      var page = $("#page").val();
	      var saleType = $("#saleType").val();
	      var schtype = $("#schtype").val();
	      var schval = $("#schval").val();
	      location.href="${rc.contextPath}/test_proc.do?idx="+checkRow+"&goUrl="+url+"&page="+page+"&saleType="+saleType+"schtype="+schtype+"schval="+schval;  
 */
	  }else{
		  $("input[name=checkA]").prop("checked", false);
	  }
	}
	
	
</script>

<br>
	<div style="margin-left: auto; margin-right: auto; width: 100%; text-align: center; margin-top:5%;">
	
		<c:if test="${pi.currentPage eq 1 }">
			[이전]&nbsp;
		</c:if>
		<c:if test="${pi.currentPage gt 1 }">
			<c:url var="GHeartBack" value="GHeart.do">
				<c:param name="page" value="${pi.currentPage -1 }"/>
			</c:url>
			<a href="${GHeartBack }">[이전]</a>
		</c:if>
		<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
			<c:if test="${p eq pi.currentPage }">
				<font color="red" size="4"><b>[${p }]</b></font>
			</c:if>
			<c:if test="${p ne pi.currentPage }">
				<c:url var="GHeartCheck" value="GHeart.do">
				<c:param name="page" value="${p }"/>
				</c:url>
				<a href="${GHeartCheck }">${p }</a>
			</c:if>
		</c:forEach>
		<c:if test="${pi.currentPage eq pi.maxPage }">
			&nbsp;[이후]
		</c:if>
		<c:if test="${pi.currentPage lt pi.maxPage }">
			<c:url var="GHeartAfter" value="GHeart.do">
				<c:param name="page" value="${pi.currentPage +1 }"/>
			</c:url>
			<a href="${GHeartAfter }">[이후]</a>
		</c:if>
	</div>	
<br>
<br>
<br>
<br>
</div>
<jsp:include page="../common/footer.jsp" />
</html>