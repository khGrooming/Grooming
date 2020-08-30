<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!-- -------------- style 부분------------- -->
<style type="text/css">
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
</style>
<!-- ------ 검색 ------- -->
<style type="text/css">
.search-wrapper {
    position: absolute;
    transform: translate(-50%, -50%);
    top:50%;
    left:50%;
}
.search-wrapper .input-holder {    
    height: 50px;
    width:70px;
    overflow: hidden;
    background: rgba(255,255,255,0);
    border-radius:6px;
    position: relative;
    transition: all 0.3s ease-in-out;
}
.search-wrapper.active .input-holder {
    width: 200px;
    border-radius: 50px;
    background: rgb(250 245 245 / 50%);
    transition: all .5s cubic-bezier(0.000, 0.105, 0.035, 1.570);
}
.search-wrapper .input-holder .search-input {
    width: 100%;
    height: 30px;
    padding: 0px 70px 0 20px;
    opacity: 0;
    position: absolute;
    top: 0px;
    left: 0px;
    background: transparent;
    box-sizing: border-box;
    border: none;
    outline: none;
    font-family: "Open Sans", Arial, Verdana;
    font-size: 16px;
    font-weight: 400;
    line-height: 20px;
    color: #0c0c0c;
    transform: translate(0, 60px);
    transition: all .3s cubic-bezier(0.000, 0.105, 0.035, 1.570);
    transition-delay: 0.3s;
}
.search-wrapper.active .input-holder .search-input {
    opacity: 1;
    transform: translate(0, 10px);
}
.search-wrapper .input-holder .search-icon {
    width: 70px;
    height: 70px;
    border: none;
    border-radius: 6px;
    background: white;
    padding: 0px;
    outline: none;
    position: relative;
    z-index: 2;
    float: right;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
}
.search-wrapper.active .input-holder .search-icon {
    width: 40px;
    height: 40px;
    margin: 5px;
    border-radius: 20px;
}
.search-wrapper .input-holder .search-icon span {
    width:22px;
    height:22px;
    display: inline-block;
    vertical-align: middle;
    position:relative;
    transform: rotate(45deg);
    transition: all .4s cubic-bezier(0.650, -0.600, 0.240, 1.650);
}
.search-wrapper.active .input-holder .search-icon span {
    transform: rotate(-45deg);
}
.search-wrapper .input-holder .search-icon span::before, .search-wrapper .input-holder .search-icon span::after {
    position: absolute; 
    content:'';
}
.search-wrapper .input-holder .search-icon span::before {
    width: 4px;
    height: 11px;
    left: px;
    top: 14px;
    border-radius: 2px;
    background: #212529;
}
.search-wrapper .input-holder .search-icon span::after {
    width: 14px;
    height: 14px;
    left: 6px;
    top: 0px;
    border-radius: 14px;
    border: 2px solid #212529;
}
.search-wrapper .close {
    position: absolute;
    z-index: 1;
    top:14px;
    right:20px;
    width:25px;
    height:25px;
    cursor: pointer;
    transform: rotate(-180deg);
    transition: all .3s cubic-bezier(0.285, -0.450, 0.935, 0.110);
    transition-delay: 0.2s;
}
.search-wrapper.active .close {
	right: -40px;
    transform: rotate(45deg);
    transition: all .6s cubic-bezier(0.000, 0.105, 0.035, 1.570);
    transition-delay: 0.5s;
}
.search-wrapper .close::before, .search-wrapper .close::after {
    position:absolute;
    content:'';
    background: #7d7473;
    border-radius: 2px;
}
.search-wrapper .close::before {
    width: 5px;
    height: 25px;
    left: 10px;
    top: 0px;
}
.search-wrapper .close::after {
    width: 25px;
    height: 5px;
    left: 0px;
    top: 10px;
}
</style>
<!-- -------------- style 부분------------- -->
</head>
<body>
<!-- 	<div class="search-wrapper">
    	<div class="input-holder">
       		<input type="text" class="search-input" placeholder="검색어 입력" />
        	<button class="search-icon" onclick="searchToggle(this, event);"><span></span></button>
    	</div>
    	<span class="close" onclick="searchToggle(this, event);"></span>
	</div>
	<div class="container" align="center"> -->
	<!-- ------------------ 해시태그 검색 -------------------- -->
	<!-- ------------------ 정렬 ------------------- -->
		<div class="container" align="left">
			<input type="radio" id="rf_1_ra" name="filter_ra"><label for="rf_1_ra">&nbsp;최신순</label>&nbsp;&nbsp;&nbsp;
			<input type="radio" id="rf_2_ra" name="filter_ra"><label for="rf_2_ra">&nbsp;조회순</label>&nbsp;&nbsp;&nbsp;
			<input type="radio" id="rf_3_ra" name="filter_ra"><label for="rf_3_ra">&nbsp;댓글순</label>
			<input type="button" value="글쓰기" class="btn btn-info" style="float: right;"
					onclick="location.href='communityInsertView.do?bCategoryNo=BC00002'">
		</div>
		<br>
	<!-- ------------------ 게시판 -------------------------- -->
		<div class="container" align="center">
			<table class="table table-hover table_ra">
				<thead>
					<tr>
						<th>글 번호</th>
						<th>글 제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="n" items="${flist }">
						<tr>
							<td>${n.boardNo }</td>
							<td>
								<a href="#" class="tagKind">#스터디</a>
								<br>
								<c:url var="communityDetailView" value="communityDetailView.do">
									<c:param name="boardNo" value="${n.boardNo }" />
								</c:url>
								<a href="${communityDetailView }">${n.boardTitle }</a>
							</td>
							<td>${n.memberNickName }</td>
							<td>${n.boardVcount }</td>
							<td>${n.boardCreateDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	<!-- 검색 -->
	<script>
		function searchToggle(obj, evt){
	    	var container = $(obj).closest('.search-wrapper');
				if(!container.hasClass('active')){
	            	container.addClass('active');
	            	evt.preventDefault();
	        	} else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
	            	container.removeClass('active');
	            	// clear input
	            	container.find('.search-input').val('');
	        	}
		}
	</script>
	
</body>
</html>