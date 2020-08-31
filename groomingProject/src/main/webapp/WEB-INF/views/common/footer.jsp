<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<style type="text/css">
/* 풋터 최하단에 위치하도록 하는 css */
section
{
	padding-top: 6.25rem;
	min-height: calc(100vh - 3.5rem);
}
footer
{
	width: 100%;
}
.footer_container
{
	height: 3.75rem;
	width: 100%;
	background-color: #343a40;
}
.footer_container .footer_navbar
{
	color: white;
    position: relative;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: space-between;
    padding: .5rem 1rem;
}
.footer_container .footer_navbar .footer_item,
.footer_container .footer_navbar .footer_question
{
	color: white;
	margin: 0.2rem 0.5rem 0.2rem auto;
    padding: .3rem 1rem;
    display: block;
   	border: thin solid #343a40;
}
.footer_container .footer_navbar .footer_question
{
	cursor: pointer;
	margin: 0.2rem auto 0.2rem 0.5rem;
}
.footer_container .footer_navbar .footer_item:hover,
.footer_container .footer_navbar .footer_question:hover
{
    text-decoration: none;
}
.footer_container .footer_navbar .footer_question:hover
{
	color: green;
    border-bottom: thin solid green;
}

/* The Modal (background) */
footer .modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 10000; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0,0,0); /* Fallback color */
	background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	-webkit-animation-name: fadeIn; /* Fade in the background */
	-webkit-animation-duration: 0.4s;
	animation-name: fadeIn;
	animation-duration: 0.4s
}

/* Modal Content */
footer .modal .modal-content {
	position: fixed;
	bottom: 0;
	background-color: #fefefe;
	width: 100%;
	-webkit-animation-name: slideIn;
	-webkit-animation-duration: 0.4s;
	animation-name: slideIn;
	animation-duration: 0.4s
}

/* The Close Button */
footer .modal .close {
	color: white;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

footer .modal .close:hover,
footer .modal .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

footer .modal .modal-header {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
}

footer .modal .modal-body
{
	display: grid;
	padding: 2px 16px;
	margin: 1rem;
}
footer .modal .modal-body p
{
	margin: 1rem 0 0.3rem;
}
footer .modal .modal-body textarea
{
	resize:none;
	line-height: 1.2rem;
	/* overflow-y:hidden; */
	height: 5rem;
	max-height: 20rem;
}

footer .modal .modal-footer {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
}
footer .modal .modal-footer button {
    border: none;
    outline: none;
}
footer .modal .modal-footer {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
}

/* Add Animation */
@-webkit-keyframes slideIn {
	from {bottom: -300px; opacity: 0} 
	to {bottom: 0; opacity: 1}
}

@keyframes slideIn {
	from {bottom: -300px; opacity: 0}
	to {bottom: 0; opacity: 1}
}

@-webkit-keyframes fadeIn {
	from {opacity: 0} 
	to {opacity: 1}
}

@keyframes fadeIn {
	from {opacity: 0} 
	to {opacity: 1}
}
</style>
</head>
<body>
	<footer>
		<!-- 문의 하기 Modal -->
		<div id="footer_qModal" class="modal">
		
			<!-- Modal content -->
			<div class="modal-content">
				<div class="modal-header">
					<h2>문의 하기</h2>
					<span id="footer_qModal_Btn_close">&times;</span>
				</div>
				<div class="modal-body">
					<p>이메일 <small>답변 받을 이메일을 정확하게 적어주세요.</small></p>
					<input type="text" id="footer_qModal_email" required>
					<p>카테고리를 선택해 주세요.</p>
					<select id="footer_qModal_cate" name="helpcategory">
					    <option value="HC00001" selected>계정</option>
					    <option value="HC00002">그루밍</option>
					    <option value="HC00003">커뮤니티</option>
					    <option value="HC00004">스터디카페</option>
					    <option value="HC00005">맨토</option>
					    <option value="HC00006">환불</option>
					</select>
	
					<p>문의 내용</p>
					<textarea id="footer_qModal_content" onkeyup="this.style.height='5rem'; this.style.height = this.scrollHeight/16 + 'rem';" required></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" id="footer_siteQuestion">전송</button>
				</div>
			</div>
		
		</div>

		<div class="footer_container">
			<div class="footer_navbar">
				<a class="footer_item">Copyright &copy; Grooming 2020</a>
				<a id="footer_qModal_Btn" class="footer_question">문의 하기</a>
			</div>
		</div>
	</footer>

<script>
	var footer_qModal = document.getElementById("footer_qModal");
	var footer_qModal_Btn = document.getElementById("footer_qModal_Btn");
	var footer_qModal_Btn_close = document.getElementById("footer_qModal_Btn_close");
	
	footer_qModal_Btn.onclick = function() {
		footer_qModal.style.display = "block";
	}
	
	footer_qModal_Btn_close.onclick = function() {
		footer_qModal.style.display = "none";
	}
	
	window.onclick = function(event) {
		if (event.target == footer_qModal) {
		 footer_qModal.style.display = "none";
		}
	}
	
	$("#footer_siteQuestion").on("click", function() {
		let regexEmail = new RegExp("[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*");
		var helpEmail = $("#footer_qModal_email").val();
		var hCategoryNo = $("#footer_qModal_cate option:selected").val();
		var helpContent = $("#footer_qModal_content").val();
		var memberNo = "${loginUser.memberNo }";
		console.log(helpEmail);
		console.log(hCategoryNo);
		console.log(helpContent);
		console.log(memberNo);
		
		if ($.trim($("#footer_qModal_content").val()) == "") {
			alert("내용을 입력해 주세요.");
			return;
		} else if (!regexEmail.test($("#footer_qModal_email").val())) {
			alert("연락 받을 이메일을 입력해 주세요.");
			return;
		}
	
		$.ajax({
			url:"siteQuestion.do",
			data:{memberNo:memberNo
				,helpEmail:helpEmail
				,hCategoryNo:hCategoryNo
				,helpContent:helpContent},
			success:function(data){
				console.log("문의 전송 결과 : " + data)
				if(data == "success"){
					alert("문의가 전수 되었습니다.");
				} else {
					alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
				}
			},
			error:function(request, status, errorData){
				alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
			}
		});
		footer_qModal.style.display = "none";
	});

</script>
</body>
</html>