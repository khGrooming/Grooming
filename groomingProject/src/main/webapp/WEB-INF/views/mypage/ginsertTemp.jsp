<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--      <script src="http:/code.jquery.com/jquery-latest.min.js"></script> -->
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<!-- datapicker  -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"> -->
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
	height: auto;
}

textarea {
	height: 300px;
	border-radius: 5px;
}

input {
	border-radius: 5px;
}
/*�고�� �ㅼ�� */
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

/* image�쎌�� div */
.image {
	width: 400px;
	height: 300px;
	background-color: lightgray;
	border-radius: 10px;
	display: table-cell;
	vertical-align: middle;
	text-align: center;
}

section {
	
}

.study tbody tr td {
	padding: 10px;
}

/* 3D Button */
.btn-3d {
	position: relative;
	display: inline-block;
	font-size: 12px;
	padding: 20px 60px;
	color: white;
	margin: 10px;
	border-radius: 6px;
	text-align: center;
	transition: top .01s linear;
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.15);
}

.btn-3d.green:hover {
	background-color: #80C49D;
}

{
	background-color:
	#82D1E3;
	}
.btn-3d:active {
	top: 9px;
}

.btn-3d.green {
	background-color: #82c8a0;
	box-shadow: 0 0 0 1px #82c8a0 inset, 0 0 0 2px rgba(255, 255, 255, 0.15)
		inset, 0 8px 0 0 rgba(126, 194, 155, .7), 0 8px 0 1px
		rgba(0, 0, 0, .4), 0 8px 8px 1px rgba(0, 0, 0, 0.5);
}

.btn-3d.green:active {
	box-shadow: 0 0 0 1px #82c8a0 inset, 0 0 0 2px rgba(255, 255, 255, 0.15)
		inset, 0 0 0 1px rgba(0, 0, 0, 0.4);
}

.money {
	display: none;
}

section .form_container .study .bootstrap-tagsinput .badge {
	margin: 0 3px;
	font-weight: lighter;
}

.ui-datepicker-trigger {
	width: 25px;
	height: 25px;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}
/* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em;
	/* label�� �⑤�⑷�怨� �쇱� */
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none; /* �ㅼ�댄�곕� �명�� 媛�異�湲� */
	ppearance: none;
}

.filebox .upload-display { /* �대�몄�媛� ������ 吏��� */
	margin-bottom: 5px;
	width: 300px;
}

@media ( min-width : 768px) {
	.filebox .upload-display {
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 0;
	}
}

.filebox .upload-thumb-wrap { /* 異�媛��� �대�몄�瑜� 媛��몃�� ���� */
	display: inline-block;
	width: 100%;
	padding: 2px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.filebox .upload-display img { /* 異�媛��� �대�몄� */
	display: block;
	max-width: 100%;
	width: 100%;
	height: auto;
}

.form_container {
	width: 100%;
	margin-bottom: 100px;
}

.badge::before
{
   content: "#";
}
</style>

</head>

<body>

	
<jsp:include page="./mypageinfo.jsp" /> 

	
		<jsp:useBean id="now" class="java.util.Date" />
		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

		<label id="today" style=""></label>
		<div class="form_container container">
		<h3 style="width: 20%;
    	float: left;">���깅�댁��</h3>
		
		<c:if test="${!empty grooming }">
		<br clear="both">
			<!-- style=" "> -->
		<div style="border:1px solid lightgray;  border-radius: 10px;">
			<c:url var="groomingSaveUpdate" value="gSaveUpdate.do">
				<c:param name="groomingNo" value="${grooming.groomingNo }"/>
				<c:param name="memberNo" value="${loginUser.memberNo }"/>
			</c:url>
			
			<form action="${groomingSaveUpdate }" method="post" enctype="multipart/form-data">
				
				<input type="hidden" value="${grooming.groomingNo }">
				<div class="row" style="margin-bottom: 10px; margin-top: 10px;">

					<div class="col-7">
						<table class="study">
							<tbody>
								<tr>
									<td><span>�ㅽ�곕�� 洹몃９ �대�</span><br> <input type="text"
										size="50" placeholder="�ㅽ�곕�� 洹몃９ �대��� ���ν�댁＜�몄��" id="title"
										name="groomingTitle" value="${grooming.groomingTitle }" required><br> <small><span
											style="color: lightblue">媛��듯��硫댁�� 二쇱��媛� �� �ㅼ�대�� �대��� 醫�����</span></small> <small><span
											style="color: #aaa;" id="counterTitle">(0/40)</span></small></td>

								</tr>
								<tr>
									<td><label>����</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<c:if test="${grooming.groomingType eq '硫���' }">
										<label for="m"><input type="radio" name="groomingType" id="m"
											value="硫���" checked>硫��� 洹몃９</label>&nbsp;&nbsp;&nbsp;&nbsp; 
											<label for="h"><input type="radio" name="groomingType" value="�몄�ㅽ��" id="h">�몄�ㅽ��
											洹몃９</label></td>
									</c:if>
									<c:if test="${grooming.groomingType eq '�몄�ㅽ��' }">
										<label for="m"><input type="radio" name="groomingType" id="m"
											value="硫���" >硫��� 洹몃９</label>&nbsp;&nbsp;&nbsp;&nbsp; 
											<label for="h"><input type="radio" name="groomingType" value="�몄�ㅽ��" id="h" checked>�몄�ㅽ��
											洹몃９</label></td>
									</c:if>		
								</tr>

								<tr>
									<td><span>��以� ��媛�</span><br> <input type="text"
										size="50" placeholder="�ㅽ�곕�� 洹몃９ ��以� ��媛�瑜� ���ν�댁＜�몄��" id="introduce"
										name="groomingIntroduce" value="${grooming.groomingIntroduce }" required><br> <small><span
											style="color: lightblue">�대ぉ�� 吏�以��� ��留���硫� 異⑸��댁��!</span></small> <small><span
											style="color: #aaa;" id="counterIntroduce">(0/60)</span></small></td>

								</tr>
								<tr>
									<td><span>�����몄��</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="number" max="6" min="2" style="text-align: center;" name="groomingP" value="${grooming.groomingP }" required><span>&nbsp;&nbsp;紐�</span><br>
										<small><span style="color: lightblue;">2~6紐��쇰�
												�몄���� 援ъ�깊�댁＜�몄��</span></small></td>
								</tr>
								<tr>
									<td><span>�댁��</span><br> 
									<textarea cols="50" rows="10" placeholder="援ъ껜���� ���� �댁�⑹�� ���댁＜�몄��!" id="content" style="resize: none;" name="groomingContent"  required></textarea>
										<small><span style="color: #aaa;" align="right" id="counterContent">(0/480)</span></small></td>
									<input type="hidden" value="${grooming.groomingContent }" id ="textareaContent">
								</tr>
								<tr>
									<td><label>��移�湲�</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<c:if test="${grooming.money gt 0 }">
											<label id="l1"><input type="radio" name="money1"
												id="exist" value="y" checked>����</label>&nbsp;&nbsp;&nbsp;&nbsp;
											<label id="l2"><input type="radio" name="money1"
												id="nonexist" value="x">����</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="number" min="1000" step="1000" style="text-align: center; width: 60px;" class="money" name="money" value="${grooming.money }">
											<span class="money">&nbsp;&nbsp;��</span>
										</c:if>
										<c:if test="${grooming.money eq 0 }">
											<label id="l1"><input type="radio" name="money1"
												id="exist" value="y" >����</label>&nbsp;&nbsp;&nbsp;&nbsp;
											<label id="l2"><input type="radio" name="money1"
												id="nonexist" value="x" checked>����</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="number" min="1000" step="1000" style="text-align: center; width: 60px;" class="money" name="money" value="${grooming.money }">
											<span class="money">&nbsp;&nbsp;��</span>
										</c:if>
										
										
										
										
									</td>
								</tr>

							</tbody>
						</table>

					</div>

					<!-- 而⑦���대�� �곗륫 -->
					<div class="col-5" style="margin: 0;">
						<table class="study">
							<tbody>
								<tr>
									<td>
										<span>�댁�� ��洹�</span><br> 
										
											<input type="text" name="tagName" placeholder="Tags," data-role="tagsinput" value="${tlist }" class="form-control"
											 id="tagName" style="display: none;" required>
										<small><span style="color: lightblue">�댁�ы��洹몃�� 5媛� �댄��濡� �깅��댁＜�몄��!</span></small></td>
									</td>
								</tr>

								<tr>
									<td>
										<span>�ㅽ�곕�� 紐⑥� 湲곌�</span><br> 
										<input id="startG" type="text" name="groomingSd" value="${grooming.groomingSd }" required> ~ <input id="endG" type="text" name="groomingEd" value="${grooming.groomingEd }" required><br>
										<small><span>�ㅽ�곕�� 洹몃９��&nbsp;&nbsp;<span style="color: red;">紐⑥�</span>�� 湲곌��� �ㅼ���댁＜�몄��</span></small>
									</td>
								</tr>
								<tr>
									<td>
										<span>�ㅽ�곕�� 吏��� 湲곌�</span><br> 
										<input id="start" type="text" min="${today }" name="studySd" value="${grooming.studySd }" required> ~
										<input id="end" type="text" name="studyEd" value="${grooming.studyEd }" required><br>
										<small> <span>�ㅽ�곕�� 洹몃９��&nbsp;&nbsp;<span style="color: red;">吏���</span>�� 湲곌��� �ㅼ���댁＜�몄��</span></small>
									</td>
								</tr>
								<tr>
									<td><span>�����대�몄�</span><br></td>
								</tr>
								<tr>
									<td>
										<div class="filebox preview-image">
											<img src="${contextPath }/resources/upGroomingFiles/${grooming.groomingImg}" id="UImg" style="width:300px;height:150px;"> 
											<input class="upload-name" value="���쇱����" disabled="disabled" >
											<label for="input-file">��濡���</label> 
											<input type="file" id="input-file" class="upload-hidden" name="uploadFile">
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<input id="insert" class="btn-3d green" value="�깅���湲�">
										<button class="btn-3d green" onclick="save();">痍⑥����湲�</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</form>
			</div>
		</c:if>
		<c:if test="${empty grooming }">
			<br>
			<br>
			<br>
			<div style="height: 500px;">
			
				<h3 style="width: 30%; margin:0 auto;">���깅�댁���� ���듬����.</h3>
			</div>
		
		</c:if>
		</div>
		<script>
			$(function(){
				$(document).on("click","#insert",function(){
					var result= confirm("�깅�����寃��듬��源�?");
					if(result){
						$("form").submit();
					}else{
						event.preventDefault();
					}
				
				})
				
				
			})
		
		
		
		</script>
		<!-- textarea�� 媛��� �ｌ�� script -->
		 <script>
			$(function(){
			
				var textareaContent = $("#textareaContent").val();
				var content = $("#content");
				if(textareaContent != null){
					content.text(textareaContent);
				}
			})
			
		</script> 
		<script>
			$('input').keydown(function() {
				if (event.keyCode === 13) {
					event.preventDefault();
				};
			});
			
			/*   window.onbeforeunload = function(e) {
			        return false;
			    }; */
		</script>
		<script>
			// ���� ��濡��� 愿��� script
			$(document).ready(function() {

								var fileTarget = $('.filebox .upload-hidden');

								fileTarget.on('change',function() {
													if (window.FileReader) {
														// ���쇰� 異�異�
														var filename = $(this)[0].files[0].name;
													}

													else {
														// Old IE ���쇰� 異�異�
														var filename = $(this).val().split('/').pop().split('\\').pop();
													};

													$(this).siblings(
															'.upload-name')
															.val(filename);
												});

								//preview image 
								var imgTarget = $('.preview-image .upload-hidden');	// api���� 湲곗〈�� ������ �대�몄�
								var imgTarget1 = $('.preview-image #UImg');	// ���� ��濡��� ���� �ъ�⑹��댁���� �대�몄�
								imgTarget.on('change',function() {
												var parent = $('.preview-image .upload-hidden').parent();
												parent.children('.upload-display').remove();
												imgTarget1.remove();
							if (window.FileReader) {
							//image ���쇰�
									if (!$(this)[0].files[0].type.match(/image\//))
										return;
									var reader = new FileReader();
									reader.onload = function(e) {
										var src = e.target.result;
										parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
									}
									reader.readAsDataURL($(this)[0].files[0]);
								}
							else {
								$(this)[0].select();
								$(this)[0].blur();
								var imgSrc = document.selection.createRange().text;
								parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

								var img = $(this).siblings('.upload-display').find('img');
								img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+ imgSrc+ "\")";
							}
												});
									});
		</script>


		<script>
			// 洹몃９ ���� 愿��� script
			$(function() {
				
				if($("#m").is(":checked")){
					$("#exist").attr('style', "display:none;");
					$("#nonexist").attr('style', "display:none;");
					$("#l1").attr('style', "display:none;");
					$("#l2").attr('style', "display:none;");
					$(".money").attr('style', "display:inline;");
				}
				if($("#h").is(":checked")){
					$("#exist").attr('style', "display:inline;");
					$("#nonexist").attr('style', "display:inline;");
					$("#l1").attr('style', "display:inline;");
					$("#l2").attr('style', "display:inline;");
					$(".money").attr('style', "display:inline;");
					$("#exist").attr("checked",true);
				
				}
				
				
				$("input:radio[name='groomingType']").on("click", function() {

					if ($(this).val() == '硫���') {
						$("#exist").attr('style', "display:none;");
						$("#nonexist").attr('style', "display:none;");
						$("#l1").attr('style', "display:none;");
						$("#l2").attr('style', "display:none;");
						$(".money").attr('style', "display:inline;");
					}
					if ($(this).val() == '�몄�ㅽ��') {
						$("#exist").attr('style', "display:inline;");
						$("#nonexist").attr('style', "display:inline;");
						$("#l1").attr('style', "display:inline;");
						$("#l2").attr('style', "display:inline;");
						$(".money").attr('style', "display:inline;");
						$("#exist").attr("checked", true);
					}

				})

				$("input:radio[name='money1']").on("click", function() {

					if ($(this).val() == 'x') {
						console.log("��移�湲� ����");
						$(".money").attr('style', "display:none;");
					}
					if ($(this).val() == 'y') {
						console.log("��移�湲� ����");
						$(".money").attr('style', "display:inline;");
					}

				})

			})
		</script>
		<script>
			function save() {
				var result = confirm("�깅��� 痍⑥������寃��듬��源�? ");
				if (result) {
					alert("痍⑥�������듬����.");
					location.href="groomingMain.do"; 
				} 
			}
		</script>

		<script>
			// 洹몃９ �대� 
			$('#title').keydown(function(e) {
				var content = $(this).val();
				$('#counterTitle').html("(" + content.length + "/40)"); //湲����� �ㅼ��媛� 移댁�댄��

				if (content.length > 40) {
					alert("理��� 40��源�吏� ���� 媛��ν�⑸����.");
					$(this).val(content.substring(0, 40));
					$('#counterTitle').html("(40/40)");
				}
			});

			// ��以� ��媛�
			$('#introduce').keydown(function(e) {
				var content = $(this).val();
				$('#counterIntroduce').html("(" + content.length + "/60)"); //湲����� �ㅼ��媛� 移댁�댄��

				if (content.length > 60) {
					alert("理��� 60��源�吏� ���� 媛��ν�⑸����.");
					$(this).val(content.substring(0, 60));
					$('#counterIntroduce').html("(60/60)");
				}
			});

			// �댁��
			$('#content').keydown(function(e) {
				var content = $(this).val();
				$('#counterContent').html("(" + content.length + "/480)"); //湲����� �ㅼ��媛� 移댁�댄��

				if (content.length > 480) {
					alert("理��� 480��源�吏� ���� 媛��ν�⑸����.");
					$(this).val(content.substring(0, 480));
					$('#counterContent').html("(480/480)");
				}
			});
		</script>

		<script>
			// ��吏� 愿��� script
			$(function() {

				//�ㅻ�� ��吏�瑜� 異���

				//datepicker ��援��대� �ъ�⑺��湲� ���� �몄�댁�ㅼ��
				$.datepicker.setDefaults($.datepicker.regional['ko']);

				// �����쇱�� 醫�猷��쇱�댄�� ��吏� ���� 遺�媛�
				// 醫�猷��쇱�� ������ �댁�� ��吏� ���� 遺�媛�
					//������.
				$('#startG')
						.datepicker(
								{
									showOn : "both", // �щ�μ�� ������ ���대� (both: focus or button)
									buttonImage : "${contextPath }/resources/views/images/calendar.png", // 踰��� �대�몄�
									buttonImageOnly : true, // 踰��� �대�몄�留� ������吏� �щ�
									buttonText : "��吏�����", // 踰��쇱�� ��泥� ���ㅽ��
									dateFormat : "yy-mm-dd", // ��吏��� ����
									changeMonth : true, // ���� �대����湲� ���� �������� �����щ�
									minDate : 0,
									onClose : function(selectedDate) {
										// ������(fromDate) datepicker媛� �ロ����
										// 醫�猷���(toDate)�� ������������ 理��� ��吏�(minDate)瑜� ������ �����쇰� 吏���
										$("#endG").datepicker("option",
												"minDate", "selectedDate:'+1d'");
									}
								});

				//醫�猷���
				$('#endG')
						.datepicker(
								{
									showOn : "both",
									buttonImage : "${contextPath }/resources/views/images/calendar.png",
									buttonImageOnly : true,
									buttonText : "��吏�����",
									dateFormat : "yy-mm-dd",
									changeMonth : true,
									//minDate: 0, // �ㅻ�� �댁�� ��吏� ���� 遺�媛�
									onClose : function(selectedDate) {
										// 醫�猷���(toDate) datepicker媛� �ロ����
										// ������(fromDate)�� ������������ 理��� ��吏�(maxDate)瑜� ������ 醫�猷��쇰� 吏��� 
										$("#startG").datepicker("option",
												"maxDate", selectedDate);
										 $("#start").datepicker("option",
													"minDate", selectedDate); 
									}
								});
				/*  --------------------------- ���� �ㅽ�곕�� 紐⑥� 湲곌�, ������ �ㅽ�곕��  湲곌�-------------------------- */
				//������.
				$('#start')
						.datepicker(
								{
									showOn : "both", // �щ�μ�� ������ ���대� (both: focus or button)
									buttonImage : "${contextPath }/resources/views/images/calendar.png", // 踰��� �대�몄�
									buttonImageOnly : true, // 踰��� �대�몄�留� ������吏� �щ�
									buttonText : "��吏�����", // 踰��쇱�� ��泥� ���ㅽ��
									dateFormat : "yy-mm-dd", // ��吏��� ����
									changeMonth : true, // ���� �대����湲� ���� �������� �����щ�
									minDate : 0,
									onClose : function(selectedDate) {
										// ������(fromDate) datepicker媛� �ロ����
										// 醫�猷���(toDate)�� ������������ 理��� ��吏�(minDate)瑜� ������ �����쇰� 吏���
										
									 $("#end").datepicker("option",
												"minDate", "selectedDate:'+1d'"); 
								
									}});

				//醫�猷���
				$('#end')
						.datepicker(
								{
									showOn : "both",
									buttonImage : "${contextPath }/resources/views/images/calendar.png",
									buttonImageOnly : true,
									buttonText : "��吏�����",
									dateFormat : "yy-mm-dd",
									changeMonth : true,
									minDate: 0, // �ㅻ�� �댁�� ��吏� ���� 遺�媛�  */
									onClose : function(selectedDate) {
										// 醫�猷���(toDate) datepicker媛� �ロ����
										// ������(fromDate)�� ������������ 理��� ��吏�(maxDate)瑜� ������ 醫�猷��쇰� 吏��� 
										$("#start").datepicker("option",
												"maxDate",  selectedDate);
									}
								});

			
			});
		</script>

		





	<jsp:include page="../common/footer.jsp" />
	


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