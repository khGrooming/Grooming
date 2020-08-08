<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!doctype html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--   <script src="http:/code.jquery.com/jquery-latest.min.js"></script> -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
        integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">


    <title>Hello, world!</title>
    <style>
    	body{
    		height:1200px;
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

       .groomingImage{
       	width:450px;
       	height:550px;
        background-image:url("${contextPath }/resources/views/images/book.png");
        background-size:cover;
        border:1px solid lightgreen;
       }
		
		.status{
			border-radius:10px;
			border:1px solid black; 
			width:80px; 
			height:40px;
			text-align:center;
			color:red;
			margin-bottom:20px;
		}
		.pimg{
			   background-image:url("${contextPath }/resources/views/images/�����.jpg");
			  background-size:cover;
			  width:100px; height:90px;
		}
     	
    </style>
</head>

<body>

    <header>
        <jsp:include page="../common/mainNavigationBar.jsp" /> 
    </header>


    <section>
        <div class="container" style="margin-top:150px;">
        	
            <div class="row">
                <div class="col-9">
                    <table>
                    	<tr><td><br></td></tr>
                        <tr><td><h3>�ʺ� JAVA���͵�</h3></td></tr>
                        <tr><td><span>���� �Ⱓ : </span><span>2020/08/01 ~ 2020/08/25</span></td></tr>
                        
                    </table>
                </div>
                <div  style="text-align:right; margin-left:70px;">
                    <table >
						<tr>
							<td align="right"><div class="status" ><h4>������</h4></div></td>
						</tr>
						<tr>
							<td>
								&nbsp;<i class="far fa-bookmark"></i>&nbsp;&nbsp;
								<a href="#" onclick="">�Ű�</a>
							</td>
						
                    	</tr>
                    	<tr>
                    		<td>
                    			<span>�ۼ��� :2020/08/01</span>
                    		</td> 
                    	</tr>
                    	<tr>
							<td>
                    			<span>��ȸ�� : </span><span>40</span>
                    		</td>
                    	</tr>	
                    </table>
                </div>
            </div>

        </div>
         <div class="container" style="margin-top:20px;">
            <div class="row">
                <div class="col-5">
                        <table>
                            <tbody>
                                <tr>
                                    <td><div class="groomingImage"></div></td>
                                </tr>
                            </tbody>
                        </table>
            
                </div>

                <!-- �����̳� ���� -->
                 <div class="col-7">
                   <table>
                            <tbody>
	
                              	<tr>
                              		<td style="padding-right:20px;"><div class="pimg" ></div></td>
                              		<td>ȣ��Ʈ : <span>�����</span><br>
                              			<span style="color:lightblue;">#AOMG#����#�ڹ�</span><br>
                              		��� : <span>������б� �������ڰ��к� ���� / ����ó����� , Cad, �ѱ��� 1��</span>
                              		</td>
                              		
                              	</tr>
                            
                            
                            </tbody>
                        </table>
                        <br>
                    <table>	
                    		<tr>
                    			<td><span>�׷� Ÿ�� : </span><span>ȣ��Ʈ</span>
                    		</tr>
                    		<tr>
    	                          	<td><span>���͵� �Ⱓ :</span><span>2020/08/25~2020/10/24</span></td>
                              	</tr>
                              	
                              	<tr>
                              		
                              		<td><span>��ġ�� : </span>1000��</td>
                              	</tr>
                              	<tr>
                              		<td><span>�����ο�  : 2/6��</span></td>
                              	</tr>	
                              
                              <tr>
                              	<td><br><h4>����� �հ��� ���͵帮�ڽ��ϴ�~ ���� ���͵� �ؿ�!</h4></td>
                              </tr>
                              
                              <tr>
                              <td>
                              	<p>
                              	��и��� �Ұ�<br>
								2�� ���� ��Ⱓ : ~6/15<br>
								�� ������ Ư���� �����ؾ��ϴ� �̼��� �����ϴ�.<br>
								�ڽ��� ���ϴ� ������ �ڷḦ ������ ���� �� �ִ� �����Դϴ�.<br>
								<hr>
								�ܱ��հ��ڰ��� ���α�ϵ��� ���鼭 �ܱ��հݰ� ������� ȿ������ ���� ����� ������� �� �ֽ��ϴ�.<br>
								�̷��в� ������ �˴ϴ�.<br>
								* �հ��ϰ� ������, ���ι���� ���� Ȯ���� �� ���ô� ��<br>
								*10���� �ܱ� �հ� ���ι���� ��� ���� �˰������ ��<br>
								*�ʱ��հݿ� ���� ���� �ڷ�, ������ ��� ������ ��<br>
								*������ ���� ���� �ڷ�, ������ ��� ������ ��<br>
								<hr>
								��и��� Ŀ��ŧ��<br>
								*���� ���ι� ����<br>
								*�ñ⺰ ���ι� ����<br>
								*�н� �����ٷ� ����<br>
								*�ʱ��հݼ��� ����<br>
								*���� �ı� ����<br>
                              	</p>
                              	</td>
                              </tr>
                    </table>
                   
                </div> 
            </div>
        </div> 
      
    </section>


    <footer> </footer>


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