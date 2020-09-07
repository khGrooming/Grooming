<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">

<head>

<title>Hello, world!</title>
 <style>
#content {
width: 70%;
height: 1000px;
margin: 1% auto;
}

input {
    border-radius: 5px;
}
		/*��Ʈ ���� */
        @font-face {
            font-family: 'TmoneyRoundWindExtraBold';
            src:
                url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff');
            font-weight: normal;
            font-style: normal;
      
        }

        * {
            font-family: "TmoneyRoundWindExtraBold";
        }
        
        /* image���� div */
     	#image{
     		width:400px;
     		height:300px;
     		background-color:lightgray;
     		border-radius:10px;
     	    display: table-cell;
    		vertical-align: middle;
    		text-align:center;
     	}
     	
     	
     	.icon{
     		font-size:50px;
     		color:white;
     	 
     	}
     	section{
     		margin-bottom:100px;
     	}
     	
     	.study tbody tr td{
     		padding:10px;
     	}
     	
     	/* 3D Button */
		.btn-3d {
			position: relative;
			display: inline-block;
			font-size: 12px;
			padding: 20px 30px;
			color: white;
			margin:10px;
			border-radius: 6px;
			text-align: center;
			transition: top .01s linear;
			text-shadow: 0 1px 0 rgba(0,0,0,0.15);
		}
		
		.btn-3d.green:hover  {background-color: #80C49D;}
		  {background-color: #82D1E3;}
		
		.btn-3d:active {
			top: 9px;
		}
		
		
		
		.btn-3d.green {
			background-color: #82c8a0;
			box-shadow: 0 0 0 1px #82c8a0 inset,
						0 0 0 2px rgba(255,255,255,0.15) inset,
						0 8px 0 0 rgba(126, 194, 155, .7),
						0 8px 0 1px rgba(0,0,0,.4),
						0 8px 8px 1px rgba(0,0,0,0.5);
		}
		.btn-3d.green:active {
			box-shadow: 0 0 0 1px #82c8a0 inset,
						0 0 0 2px rgba(255,255,255,0.15) inset,
						0 0 0 1px rgba(0,0,0,0.4);
		}

	input[type='date']{
		width: 150px;
	}


    </style>
</head>

<body>

<jsp:include page="./mypageinfo.jsp" />

    <section style="padding-top:20px;">
    	<div id="content">
    	<c:if test="${!empty tempList  }">

        <div class="container" style="border:3px solid lightgreen; border-radius:10px;">
        	<div  class="row">
        	
        
            <div class="col-7">
                <form>
                    <table class="study">
                    <tbody>
                    
                          
                        <tr>
                            <td><span>���͵� �׷� �̸� </span><br><input type="text" size="50" placeholder="���͵� �׷� �̸��� �Է����ּ���" id="title" value="${tempList.groomingTitle }"><br>
                                <small><span style="color: lightblue">�����ϸ鼭 ������ �� �� �̸��� ���ƿ�</span></small>
                                <small><span style="color: #aaa;" id="counterTitle">(0/40)</span></small></td>

                        </tr>
                        <tr>
                            <td><label>Ÿ��</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="radio" name="group" id="groupHost" >���� �׷�</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="radio" name="group" id="groupFree">���� �׷�</label></td>
                        </tr>
                        <script>
                        	$(function(){
                        		var groupChecked="${tempList.groomingType}";
                        		if(groupChecked == "ȣ��Ʈ"){
                        			$("#groupHost").attr("checked",true);
                        		}else{
                        			$("#groupFree").attr("checked",true);
                        		}
                        	})
                        </script>
                        
                        <tr>
                            <td><span>���� �Ұ�</span><br><input type="text" size="50" placeholder="���͵� �׷� ���� �Ұ��� �Է����ּ���" id="introduce" value="${tempList.groomingIntroduce }"><br>
                                <small><span style="color: lightblue">�̸��� ������
                                        �Ѹ���� ����ؿ�!</span></small> <small><span style="color: #aaa;"
                                        id="counterIntroduce">(0/60)</span></small></td>

                        </tr>
                        <tr>
                            <td><span>Ȱ��
                                    �ο�</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="number" max="6" min="2"
                                    style="text-align: center;" value="${tempList.groomingP }"><span>&nbsp;&nbsp;��</span><br>
                                    <small><span style="color: lightblue;">2~6������ �ο��� �������ּ���</span></small>
                            </td>
                        </tr>
                        <tr>
                            <td><span>����</span><br> <textarea cols="50" rows="10" placeholder="��ü���� Ȱ�� ������ �����ּ���!"
                                    id="content" style="    height: 200px; width: 400px;">${tempList.groomingContent}</textarea>
                                <small><span style="color: #aaa;" align="right"
                                        id="counterContent">(0/480)</span></small></td>

                        </tr>
                        <tr>
                            <td><label>��ġ��</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="radio" name="money" id="exist">����</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="radio" name="money"
                                        id="nonexist">����</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="number" min="2000" step="1000" style="text-align: center; width:100px;"
                                    id="money" readonly value="${tempList.money }"><span>��</span></td>
                        </tr>
                        <script>
                        	$(function(){
                        		 var moneyChecked=Number("${tempList.money}");
                        		 if(moneyChecked > 0){
                        				$("#exist").attr("checked",true);
                        				$("#money").attr("readonly",false); 
                        		 }
                        	})
                        </script>

                      
                        <tr>
                            <td><span>�ؽ� �±�</span><br><input type="text" size="50" placeholder="�׷��� �ؽ��±׷� ǥ�����ּ���" id="hash"><br> <small><span
                                        style="color: lightblue">�ؽ��±״� 2���̻� ������ּ���!</span> <span style="color: #aaa;"
                                        align="right" id="hashCount">0��</span></small></td>

                        </tr>
					
					</tbody>
                    </table>
                </form>
            </div>

            <!-- �����̳� ���� -->
            <div class="col-5">
                <form>
                    <table class="study">
                    <tbody>
                        <tr>
                            <td><span>���͵�  ���� �Ⱓ</span><br> <input class="start" type="date" value="${tempList.studySd }">
                                ~ <input class="end" type="date" value="${tempList.studyEd }"><br><small> <span>���͵� �׷���&nbsp;&nbsp;<span style="color: red;">����</span>�� �Ⱓ�� �������ּ���</span></small></td>
                        </tr>
                        <tr>
                        	 <td><span>���͵� ���� �Ⱓ</span><br> <input class="start" type="date"  value="${tempList.groomingSd }">
                                ~ <input class="end" type="date"  value="${tempList.groomingEd }"><br> <small><span>���͵� �׷���&nbsp;&nbsp;<span style="color: red;">����</span>�� �Ⱓ�� �������ּ���</span></small></td>
                        </tr>
                        <tr>
                        	<td ><span>��ǥ�̹���</span><br>
                        		<div id="image"><div class="icon"><img src="${contextPath }/resources/views/images/${tempList.groomingImg}" style="width: 100%"></div></div>
                        	</td>
                        <tr>
                        <tr>
                        	<td><button id="insert" class="btn-3d green" onclick="location.href='groomingMain.do'">����ϱ�</button>
                      			<button class="btn-3d green" onclick="save();">����ϱ�</button>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
	</div>
        </div>
        <script>
        	function save(){
        		var result = confirm("�ӽ����� �Ͻðڽ��ϱ�?");
        		if(result){
        		    alert("�ӽ�����Ǿ����ϴ�.");
        		    location.href="groomingMain.do";
        		}else{
        		    alert("��ҵǾ����ϴ�.");
        		    location.href="groomingMain.do";
        		}
        	}
        
        </script>
        <script>

            // �׷� �̸� 
            $('#title').keydown(function (e) {
                var content = $(this).val();
                $('#counterTitle').html("(" + content.length + "/40)");    //���ڼ� �ǽð� ī����

                if (content.length > 40) {
                    alert("�ִ� 40�ڱ��� �Է� �����մϴ�.");
                    $(this).val(content.substring(0, 40));
                    $('#counterTitle').html("(40/40)");
                }
            });

            // ���� �Ұ�
            $('#introduce').keydown(function (e) {
                var content = $(this).val();
                $('#counterIntroduce').html("(" + content.length + "/60)");    //���ڼ� �ǽð� ī����

                if (content.length > 60) {
                    alert("�ִ� 60�ڱ��� �Է� �����մϴ�.");
                    $(this).val(content.substring(0, 60));
                    $('#counterIntroduce').html("(60/60)");
                }
            });

            // ����
            $('#content').keydown(function (e) {
                var content = $(this).val();
                $('#counterContent').html("(" + content.length + "/480)");    //���ڼ� �ǽð� ī����

                if (content.length > 480) {
                    alert("�ִ� 480�ڱ��� �Է� �����մϴ�.");
                    $(this).val(content.substring(0, 480));
                    $('#counterContent').html("(480/480)");
                }
            });



        </script>
        <script>
            // �ؽ��±װ���(���߿� ��� / �̿�)
            $('#hash').keydown(function (e) {
                var content = $(this).val();
                var hash = content.split("#");
                var count = 0;
                for (i = 0; i < hash.length; i++) {
                    count++;
                }
                
                $('#hashCount').html(count + "��");    //���ڼ� �ǽð� ī����

         
                    if (window.event.keyCode == 13) {

                        if (hash.length < 2) {
                            alert("2�� �̻� �Է����ּ���.");
                            $('#hashCount').html(count + "��");
                        } else {
                            for (i = 0; i < content.length; i++) {
                                if (content.indexOf(i) == ' ') {
                                    alert("#�� �ٿ��� ������� �ؽ��±� �ܾ �ϼ����ּ��� ");
                                }
                            }
                        }
                    }
                
                $('#hashCount').html(count + "��");
            })
        
   

        </script>
        
        <script>
        // ���߿� ��ħ
        /* 	$(function(){
        		$("#insert").on("click",function(){
        		if($(".end").val() < $(".start").val()){
        			alert("���۳�¥���� ���ķ� �������ּ���");
        			$(".end").html("");
        		}})
        	}) */
        </script>
        </c:if>
        <c:if test="${empty tempList }">
        	<h4>���͵� �׷� �ۼ� ������ �����ϴ�</h4>
        	<p>�ۼ��Ϸ� ����</p>
        </c:if>
        </div>
    </section>


    <footer><jsp:include page="../common/footer.jsp" /> </footer>
</body>
</html>