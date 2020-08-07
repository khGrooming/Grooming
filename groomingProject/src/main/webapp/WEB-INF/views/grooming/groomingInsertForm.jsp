<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!--   <script src="http:/code.jquery.com/jquery-latest.min.js"></script> -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" 
  integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
        integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">


    <title>Hello, world!</title>
    <style>
         textarea{
            height:300px;
            border-radius: 5px;
        }
        input{
            border-radius:5px;
        }
        
	  @font-face { 
			font-family: 'TmoneyRoundWindExtraBold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff');
    	    font-weight: normal; 
    	    font-style: normal; 
   		}
   
	   * {
	      font-family:"TmoneyRoundWindExtraBold";
	   }
    </style>
</head>

<body>

    <header>
	   	<jsp:include page="../common/mainNavigationBar.jsp" />
    </header>


    <section>
   
			<div class="container" style="margin-top:150px;">
            <div class="col-6">
                <form>
                    <table>
                        <tr>
                            <td><span>���͵� �׷� �̸�</span></td>
                        </tr>
                        <tr>
                            <td><input type="text" size="50" placeholder="���͵� �׷� �̸��� �Է����ּ���" id="title"><br>
                                <small><span style="color:lightblue">�����ϸ鼭 ������ �� �� �̸��� ���ƿ�</span></small>
                                <small><span style="color:#aaa;" id="counterTitle">(0/40)</span></small>

                            </td>

                        </tr>
                        <tr>
                            <td>
                                <label>Ÿ��</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="radio" name="group">���� �׷�</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="radio" name="group">���� �׷�</label>
                            </td>
                        </tr>
                        <tr>
                            <td><span>���� �Ұ�</span></td>
                        </tr>
                        <tr>
                            <td><input type="text" size="50" placeholder="���͵� �׷� ���� �Ұ��� �Է����ּ���" id="introduce"><br>
                                <small><span style="color:lightblue">�̸��� ������ �Ѹ���� ����ؿ�!</span></small>
                                <small><span style="color:#aaa;" id="counterIntroduce">(0/60)</span></small>

                            </td>

                        </tr>
                        <tr>
                            <td><span>Ȱ�� �ο�</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="number" max="6" min="2" style="text-align: center;"><span>&nbsp;&nbsp;��</span>
                             </td>
                        </tr>
                        <tr>
                            <td>
                                <span>����</span>
                                <textarea cols="80" rows="6" placeholder="��ü���� Ȱ�� ������ �����ּ���!" id="content" style=""></textarea>
                                <small><span style="color:#aaa;" align="right" id="counterContent">(0/480)</span></small>
                            </td>
                          
                        </tr>
                        <tr>
                            <td>
                                <label>��ġ��</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="radio" name="money" id="exist">����</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="radio" name="money" id="nonexist">����</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="number" min="2000" step="1000" style="text-align: center;" id="money" ><span>��</span>
                             
                            </td>
                        </tr>
                        
                        <tr>
                            <td><span>�ؽ� �±�</span></td>
                        </tr>
                        <tr>
                            <td><input type="text" size="70" placeholder="�׷��� �ؽ��±׷� ǥ�����ּ���" id="hash"><br>
                                <small><span style="color:lightblue">�ؽ��±״� 2���̻� ������ּ���!</span>
                                <span style="color:#aaa;" align="right" id="hashCount">0��</span></small>
                            </td>

                        </tr>
                        
                        
                    </table>
                </form>
            </div>
            
            <!-- �����̳� ���� -->
            <div class="col-8">
				<form>
					<table>
						<tr>
							<td>
								<span>���͵� �Ⱓ</span><br>
								<input type="date" > ~ <input type="date"><br>
								<span>���͵� �׷��� <p style="color:red;">����</p>�� �Ⱓ�� �������ּ���</span>							
							</td>
						</tr>
					</table>
				</form>
            </div>

</div>
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
    // �ؽ��±װ���(���߿� ���)
    $('#hash').keydown(function (e) {
        var content = $(this).val();
        var hash = content.split("#");
        var count = 0;
        for(i=0; i<hash.length; i++){
           count++ ;
        }
        $('#hashCount').html(hash.length + "��");    //���ڼ� �ǽð� ī����

        if (hash.length < 2) {
            alert("2�� �̻� �Է����ּ���.");
            $('#hashCount').html("count"+ "��");
        }else{
        for(i=0; i<content.length; i++){
           if(content.indexOf(i) != '#'){
           alert("#�� �ٿ��� ������� �ؽ��±� �ܾ �ϼ����ּ��� ");
        }
       }
        $('#hashCount').html("count"+ "��");
        }
        
    });
   
   </script>
    </section>


    <footer>


    </footer>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
</body>

</html>