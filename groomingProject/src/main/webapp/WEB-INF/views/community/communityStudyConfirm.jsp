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
   .modal-title{
      margin: auto 0.18rem;
       height: 2.18rem;
       width: 2.18rem;
       border-radius: 50%;
       border: thin solid lightgrey;
    }
    .modal {
    height: 250px;
    overflow-y: auto;
    height: 650px;
    margin-top: 70px;
}
	.item-container {display:flex; margin-top:10rem;}
	.item-card {margin:auto;}
	#item-card {width:15rem; border-radius:0px; border:none; text-align:center;}
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
	.item-col {margin-bottom: 1rem;}
	/* item page end */
</style>
<!-- -------------- style 부분------------- -->
</head>
<body>
	<div class="container" align="center">
	<!-- ------------------ 해시태그 검색 -------------------- -->
		
	<!-- ------------------ 정렬 ------------------- -->
		<div class="container" align="left">
			<c:if test="${!empty loginUser }">
				<input type="button" value="글쓰기" class="btn btn-info" style="float: right;"
						onclick="location.href='communityInsertView.do?bCategoryNo=BC00004'">
			</c:if>
		</div>
		<br><br>
	<!-- ------------------ 게시판 -------------------------- -->	
		<div class="container item-container" style="margin-top: 30px;">
			<div class="row item-row">
			<c:forEach var="c" items="${clist }">
					
				<input type="hidden" value="">
				<div class="col-3 item-col" id="item-col">
					<div class="card item-card" id="item-card">
						<input type="hidden" value="">
						<div class="card-image-zoom">
							<img src="${contextPath}/resources/buploadFiles/${c.boardImg}" class="card-img-top" alt="..."
								data-toggle="modal" data-target="#confirmDetailView${c.boardNo}"
								onerror="this.src='${contextPath }/resources/buploadFiles/ww.jpg'">
						</div>
					</div>
				
					<!-- Modal 스터디 인증 상세보기 -->
					<div id="confirmDetailView${c.boardNo}" class="modal fade" role="dialog">
	  					<div class="modal-dialog">
	
	    					<!-- Modal 내용-->
	     					<div class="modal-content">
	      						<div class="modal-header">
	      							<img src="${contextPath}/resources/upprofileFiles/${c.memberPhoto }" class="modal-title" alt="..."
	      								onerror="this.src='${contextPath }/resources/upprofileFiles/MEMBER_SAMPLE_IMG.JPG'">
	        						&nbsp;&nbsp;<h5>${c.memberNickName }</h5>
	        						<button type="button" class="close" data-dismiss="modal">x</button>
	      						</div>
	      						<div class="modal-body">
	      							<img src="${contextPath}/resources/buploadFiles/${c.boardImg}" class="card-img-top" alt="..."
	      								onerror="this.src='${contextPath }/resources/buploadFiles/ww.jpg'">
	        						<hr>
	        						<p>${c.boardContent }</p>
	      						</div>
	      					
	      						<div class="modal-footer">
	      							<c:url var="communityUpdateView" value="communityUpdateView.do">
										<c:param name="boardNo" value="${c.boardNo }" />
										<c:param name="bCategoryNo" value="${c.bCategoryNo }" />
									</c:url>
									<c:url var="communityDelete" value="communityDelete.do">
										<c:param name="boardNo" value="${c.boardNo }" />
										<c:param name="bCategoryNo" value="${c.bCategoryNo }" />
									</c:url>
									<c:if test="${loginUser.memberNo eq c.memberNo }">	
										<tr>
											<td colspan="2" align="center">
												<a href="${communityUpdateView }">수정하기</a>
											</td>
											<td colspan="2" align="center">
												<a href="${communityDelete }">삭제하기</a>
											</td>
										</tr>
									</c:if> 
	      							<p>${c.boardCreateDate }</p> 
	      					
	    						</div>
	  						</div>
	  					</div>
	  				</div>
  				</div>
			</c:forEach>			
			</div>
		</div>
	</div>
	
	<script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>
</body>
</html>