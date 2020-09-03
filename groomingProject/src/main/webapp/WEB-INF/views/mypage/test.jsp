<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="jqueryui/style.css">
</head>
<style>
#content {
	width: 70%;
	height: 1000px;
	margin: 5% auto;
}
</style>
<body>

<jsp:include page="./mypageinfo.jsp" />
<div id="content">
<div style="width: 500px; height: 500px; border:1px solid;">
<img src="${contextPath }/resources/views/images/kakao_login_medium_wide.png" id="testImg">
</div>
<div class="Container" >
  <font size = 2 id = "slider_value_view">0</font>						  
  <input style = "width:50%;" class="slider_range" type="range" value="0" min="0" max="100"></input>						  
</div>
<button onclick="imgSizeCheck()">버튼</button>
<div id="afterImg">


</div>
</div>



<script language = "javascript">

function ShowSliderValue(sVal)
{
	var obValueView = document.getElementById("slider_value_view");
	obValueView.innerHTML = sVal
	$("#testImg").css("width",sVal+"%");
}

var RangeSlider = function(){
	var range = $('.slider_range');
    
	range.on('input', function(){		
		ShowSliderValue(this.value);
	});
};

RangeSlider();

function imgSizeCheck(){
	var w = $("#testImg").width();
	var h = $("#testImg").height();
	alert("w:"+w+"h"+h);
}

</script>

</body>
</html>