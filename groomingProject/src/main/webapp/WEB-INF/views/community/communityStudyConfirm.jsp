<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><!-- -------------- style 부분------------- -->
<style type="text/css">
	#studyImg {
    	vertical-align: bottom;
    	color: gray;
	}
	.table_ra>tbody>tr>td, .table_ra>tbody>tr>th, .table_ra>tfoot>tr>td, .table_ra>tfoot>tr>th, .table_ra>thead>tr>td, .table_ra>thead>tr>th {
    	vertical-align: middle;
    	text-align:center;
	}
	/* 해시태그 */
	.tagKind {
	    color: blue;
    	padding: 5px;
    	margin-right: 50px;
    	margin-left: 30px;
    	font-size: 13px;
	}
	/* item page */
	.item-container {margin-top:10rem;}
	.item-card {margin:auto;}
	#item-card {width:15rem; height:19rem; border-radius:0px; border:none; text-align:center;}
	#item-card:focus,
	#item-card:hover {cursor:pointer;}
	.item-row {padding-left:1rem; padding-right:1rem; }
	.item-order {margin:0; padding:0; list-style:none; display:inline-flex;}
	.item-order li {padding:0 0.5rem;}
	.item-card-text {margin-bottom:0rem; color:gray;}
	#keyword-badge {margin-bottom:0.5rem;}
	.card-image-zoom {overflow: hidden;}
	.card-image-zoom img {transition-duration: 0.3s; transition-timing-function: ease;}
	.card-image-zoom:hover img {transform: scale(1.1);}
	#all-item-order li::hover {font-color:black; !important}
	#keyword-badge {background-color:#5b89a6;}
	/* item page end */
</style>
<!-- -------------- style 부분------------- -->
</head>
<body>
	<div class="container" align="center">
	<!-- ------------------ 해시태그 검색 -------------------- -->
		
	<!-- ------------------ 정렬 ------------------- -->
		<div class="container" align="left">
			<input type="radio" id="rf_1_ra" name="filter_ra"><label for="rf_1_ra">&nbsp;최신순</label>&nbsp;&nbsp;&nbsp;
			<input type="radio" id="rf_2_ra" name="filter_ra"><label for="rf_2_ra">&nbsp;조회순</label>&nbsp;&nbsp;&nbsp;
			<input type="radio" id="rf_3_ra" name="filter_ra"><label for="rf_3_ra">&nbsp;좋아요 순</label>
			<input type="button" value="글쓰기" class="btn btn-info" style="float: right;"
					onclick="location.href='communityInsertView.do?bCategoryNo=BC00004'">
		</div>
		<br>
	<!-- ------------------ 게시판 -------------------------- -->	
		<div class="container item-container" align="center" style="margin-top: 30px;">
			<c:forEach var="n" items="${clist }">
				<div class="row item-row">		
					
					<input type="hidden" value="">
					<div class="col-3 col-sm item-col" id="item-col">
						<div class="card item-card" id="item-card">
							<input type="hidden" value="">
							<div class="card-image-zoom">
								<img src="${contextPath}/resources/buploadFiles/${n.boardImg}" class="card-img-top" alt="..."
											data-toggle="modal" data-target="#confirmDetailView">
							</div>
						</div>
					</div>
					
				</div>
				
				<!-- Modal 스터디 인증 상세보기 -->
	<div id="confirmDetailView" class="modal fade" role="dialog">
  		<div class="modal-dialog">

    		<!-- Modal 내용-->
     		<div class="modal-content">
      			<div class="modal-header">
        			<h5 class="modal-title">${n.boardNo }</h5>
        			<button type="button" class="close" data-dismiss="modal">x</button>
      			</div>
      			<div class="modal-body">
<%--       				<c:forEach var="n" items="${clist }">				
        				<img src="" alt=".."><br>
        				<p>${n.boardNo }</p>
      				</c:forEach> --%>
        			<p>${n.boardNo }</p>
      			</div>
      			<div class="modal-footer">
      				<p>${n.boardNo }</p> 
      				<!-- 좋아요 -->
					<div class="iteminfo-icons" id="iteminfo-icons">
						<span class="col iteminfo-wish-span" id="iteminfo-wish-span" style="justify-content: center;">
							<button class="btn btn-default iteminfo-icons" id="iteminfo-wish-btn">
								<i class="fa fa-heart" style="font-size: 1.5rem; color: gray;" aria-hidden="true"></i>
							</button>
							<!-- 신고 -->
							<a href="#declareForm" data-toggle='modal'>
								<img style="vertical-align: middle;" alt="dep" 
									src="${pageContext.servletContext.contextPath }/resources/views/images/dd.PNG">
							</a>
							<input type="hidden" id="goWish-real-btn" data-toggle="modal" href="#goWish">
						</span>
					
					<script>
						$(function(){			
							if(0==0){
								$(".fa-heart").css("color","gray");
							}else{
								$(".fa-heart").css("color","pink");
							}
						})
					</script>
      			</div>
    			</div>
  			</div>
  		</div>
  	</div>
				
				
			</c:forEach>
		</div>
	</div>
	
	
	<script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>
</body>
</html>