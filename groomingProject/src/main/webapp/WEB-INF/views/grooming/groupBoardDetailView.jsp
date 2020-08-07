<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
        integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">


    <script src="http:/code.jquery.com/jquery-latest.min.js"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
        
            <!--summernote css/js �߰�  -->

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <title>Hello, world!</title>
    <style>
        body {
            height: 1200px;
        }

        /* div�� ũ�⿡ ���� */
        img {
            max-width: 100%;
            max-height: 100%;
        }

        /* �ζ��� ������ ��� */
        #tab1:checked~#content1,
        #tab2:checked~#content2,
        #tab3:checked~#content3 {
            display: block;
        }

        /* �� ���� �޴��� ���� */
        section {
            display: none;
            padding: 20px 10px 10px 10px;
            border: 3px solid #ddd;
            height: auto;
        }

        /*������ư ����*/
        .radio {
            display: none;
        }


        /* �Ǹ޴� �±� ���콺 �ø��� */
        .menu:hover {
            color: #2e9cdf;
            cursor: pointer;
        }

        /* �±� �޴� css */
        .menu {
            display: inline-block;
            margin: 0 0 -3px;
            padding: 15px 25px;
            font-weight: 600;
            text-align: center;
            color: #bbb;
            border: 1px solid #ddd;
            border-top-left-radius: 6px;
            border-top-right-radius: 6px;

        }

        /*input Ŭ����, label ��Ÿ��*/
        input:checked+label {
            color: #555;
            border: 3px solid #ddd;
            /* border-top: 2px solid #2e9cdf; */
            border-bottom: 3px solid #ffffff;
        }

        .table th {
            text-align: center;
            vertical-align: middle;
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
    <!-- ������� -->
    <header>
        <jsp:include page="../common/mainNavigationBar.jsp" />
    </header>

    <!-- ���� ���� -->

    <!-- �����̳ʷ� �翷�� ���� ���� -->
    <div class=container style="margin-top:150px ; ">
        <!--����Ʈ �޴�-->
        <input id="tab1" type="radio" name="tabs" class="radio">
        <label for="tab1" class="menu"><i class="fas fa-user-graduate"></i>����</label>

        <input id="tab2" type="radio" name="tabs" class="radio">
        <label for="tab2" class="menu"><i class="fas fa-calendar-alt"></i>Ķ����</label>

        <input id="tab3" type="radio" name="tabs" class="radio" checked>
        <label for="tab3" class="menu"><i class="fas fa-icons"></i>�Խ���</label>


        <!-- ���ο� �� ����� -->
        <section id="content3">

            <div style="text-align: right; margin-right: 20px;">
            <a href="#">�Ű��ϱ�</a>
            <p >�ۼ��� : <label>2020-07-25</label>&nbsp;&nbsp;��ȸ�� : <label>7ȸ</label></p>
            </div>
                    <div class="container">

                        <table class="table table-bordered">

                            <form method="post">
                                <tr>
                                    <th>�ۼ��Խ��� </th>
                                    <td>
                                        <label>�����Խ���</label>
                                        <label hidden>��������</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>���� </th>
                                    <td><label>�ʶ������� �ʶ������� �ʶ�������</label></td>
                                </tr>
                                <tr>
                                    <th>���� </th>
                                    <td><textarea cols="100" rows="10" class="form-control" readonly
                                            style="height:auto;">�ð� ���� �ӻ��̴� ��е�
						                                    ������ �� ���� �̾߱�
						                                    ���� �� ����� ���ĵ� ����
						                                    ���� �����ϸ� �Ҽ��� ����
						                                    �� �̸� �ҷ���
						                                    
                                    * �� ƴ���� ��ġ�� �� �� ��ų�� �η���
						                                    ������ �� ���� ������
						                                    ���ݸ� �� ���� �� ��ٷ���
						                                    �ʶ� ������ ���� �ȵ���
						                                    �ð踦 �� ��ä�� ������
						                                    �װ� �ִ� �̷�����
						                                    �� �̸��� �ҷ���
						                                    
						                                    ���� ���� ������ �� �ð���
						                                    �ʿ� ���� �Բ�������
						                                    ���� ����ִ� �״밡 ����
						                                    ���� ����� �״뵵 ����
						                                    �� �̸��� ����
						                                    
						                                    * Repeat
						                                    
						                                    �� �����ϸ� ��� �� �ſ���
						                                    �� �˾ƺ����� �״� ����ϰ���
						                                    �׷� �⹦�ߴ� ����
						                                    �� ƴ���� ��ġ�� �� ��� �� ����
						                                    
						                                    �ճ����� ������ �ð�ٴþ� �޷���
						                                    ���ݸ� �� ���� ���ƺ�
						                                    �� ���� �� ���� ������ �Ǵ�
						                                    �ʶ� ������ ���� ������
						                                    � ����� �𸣰�����
						                                    �װ� ���� �̷�����
						                                    Ȥ�� ���� ��Ǵٸ�
						                                    �ʸ� �˾ƺ� �� �ְ�
						                                    �� �̸��� �ҷ���</textarea></td>
                                </tr>





                            </form>

                        </table>
                        
                       <!-- ���� ���� ��ư -->
                        <div align="right">
                            <button type="button">����</button>
                            <button type="button">����</button>
                        </div>
                        
                        <br><br><br>
                        
                        <!-- ��� ���  -->
                        <div class="container">
                            <table class="table table-bordered">
                                <form method="post">

                                    <tr>
                                        <td class="col-6" style="width: 70%;">
                                            <textarea cols="20" rows="2" class="form-control" style="resize: none;">
                                             </textarea>
                                        </td>
                                        <br><br>
                                        <td class="col-4" style="width:30%; vertical-align: middle; text-align: center;">
                                            <button>��� ���</button>
                                        </td>

                                    </tr>
                                </form>
                            </table>
                            <!-- ��� ��� ���� -->
                            <table align="center" width="500" border="1" id="tb2">
                                <thead>
                                    <tr>
                                        <td colspan="2"><b id="rCount"></b></td>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>





        </section>






    </div>


    <footer>


    </footer>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
</body>

</html>