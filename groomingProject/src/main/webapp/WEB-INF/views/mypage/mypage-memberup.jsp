<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
#content {
	width: 75%;
	margin: 0 auto;
}

#member_tb {
	height: 330px;
}

#member_tb th label {
	width: 180px;
	padding-right: 10%;
}

#member_tb th {
	text-align: right;
}

#member_tb tr {
	margin-bottom: 10px;
}

#memberupForm input {
	width: 50%;
}

.mLabel {
	text-align: right;
	width: 35%;
	margin-right: 2%;
}

.spacIconTd {
	width: 50px;
}
.subcontent {
	position: relative;
	width: 48%;
	height : 550px;
	float: left;
	margin-right: 2%;
	border: 1px solid lightgray;
	padding: 3%;
	border-radius: 20px;
}

</style>
</head>
<body>
<jsp:include page="./mypageinfo.jsp" />
	<section sytle="padding-top: 0;">
	<div id="content" style="border:1px solid">
		<div class="subcontent">
		
		</div>
		<div class="subcontent">
		
		</div>
	
	
	</div>
</section>

<jsp:include page="../common/footer.jsp" />	

</body>
</html>




