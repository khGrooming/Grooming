<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!doctype html>
<html lang="ko">

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
    <title>Hello, world!</title>
    <style>
        body{
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
        #tab3:checked~#content3{
            display: block;
        }

        /* �� ���� �޴��� ���� */
        section {
            display: none;
            padding: 20px 10px 10px 10px;
            border: 3px solid #ddd;
            height: 700px;
        }

        /*������ư ����*/
        input {
            display: none;
        }

        /* �Ǹ޴� �±� ���콺 �ø��� */
        label:hover {
            color: #2e9cdf;
            cursor: pointer;
        }

        /* �±� �޴� css */
        label {
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
        .table{
            text-align: center;
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
        <input id="tab1" type="radio" name="tabs" >
        <label for="tab1"><i class="fas fa-user-graduate"></i>����</label>

        <input id="tab2" type="radio" name="tabs">
        <label for="tab2"><i class="fas fa-calendar-alt"></i>Ķ����</label>

        <input id="tab3" type="radio" name="tabs" checked>
        <label for="tab3"><i class="fas fa-icons"></i>�Խ���</label>


        <!-- ���ο� �� ����� -->
        <section id="content1">
         
               <!-- �׷�� ���� -->
                <h2 style="margin-top:20px; margin-left:20px;" align="left">Spring Project Fighting</h2>
                <!-- �׷�� ���� �Ұ� -->
                <p  style="margin-top:20px; margin-left:20px;" align="left">������ ������Ʈ �������ؼ� ��Ʈ�������� �ڽ��ְ� ���ô�~~~~~~~~~~~~~~~~</p>
                <div class="row">
                    <div class="col-4" style="width: 20%;">
                        <table>
                            <tr>
                                <div class="gimg"
                                    style="width: 300px; height:300px;  margin-left: 50px; margin-top: 50px; position: relative;">
                                    <!-- �׷� �̹��� �� �� -->
                                    <img src="${contextPath }/resources/views/images/�����.jpg"> 
                                </div>
                            </tr>

                        </table>
                    </div>

                    <div class="col-8" style=" margin-top: 50px; width:80%; ">
                        <table class="table">
                            <thead>
                                <!-- ��� ���� ��� -->
                                <tr>
                                    <th scope="col" style="width: 200px;">������</th> 
                                    <th scope="col" style="width: 200px;">�г���</th>
                                    <th scope="col" style="width: 200px;">�̸���</th>
                                    <th scope="col" style="width: 200px;">����ó</th>
                                    <th scope="col" style="width:200px;">ȸ��</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="pimg" style="width:40px; height:40px; "><img src="${contextPath }/resources/views/images/�����.jpg"></div>
                                    </td>
                                    <td>������</td>
                                    <td>gdoeb@naver.com</td>
                                    <td>01051704587</td>
                                    <td>����</td>
                                </tr>
                                <tr>
                                    <th>
                                        <div class="pimg" style="width:40px; height:40px; "><img src="${contextPath }/resources/views/images/�����.jpg"></div>
                                    </th>

                                    <td>Jacob</td>
                                    <td>2323@naver.com</td>
                                    <td>02616161</td>
                                    <td>���͵��</td>
                                </tr>
                                <tr>
                                    <th>
                                        <div class="pimg" style="width:40px; height:40px;"><img src="${contextPath }/resources/views/images/�����.jpg"></div>
                                    </th>
                                    <td>maroon5</td>
                                    <td>sugar@naver.com</td>
                                    <td>01051876123</td>
                                    <td>���͵��</td>
                                </tr>
                                <tr>
                                    <th>
                                        <div class="pimg" style="width:40px; height:40px;"><img src="${contextPath }/resources/views/images/�����.jpg"></div>
                                    </th>
                                    <td>�մ��</td>
                                    <td>���ƾ�@naver.com</td>
                                    <td>1515111531</td>
                                    <td>���͵��</td>
                                </tr>
                                <tr>
                                    <th>
                                        <div class="pimg" style="width:40px; height:40px;"><img src="${contextPath }/resources/views/images/�����.jpg"></div>
                                    </th>
                                    <td>����</td>
                                    <td>Onebin@naver.com</td>
                                    <td>1531313513</td>
                                    <td>���͵��</td>
                                </tr>
                                <tr>
                                    <th>
                                        <div class="pimg" style="width:40px; height:40px;"><img src="${contextPath }/resources/views/images/�����.jpg"></div>
                                    </th>
                                    <td>��ź����</td>
                                    <td>Yuri@naver.com</td>
                                    <td>777888877777</td>
                                    <td>���͵��</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            
    
    </section>
	
	<!-- Ķ���� ���� (���� ����/�⼮ üũ) -->
    <section id="content2">
       
    </section>

    <!--�Խ��ǿ� �� ���� -->
    <section id="content3">
        
        <table class="table table-hover" id="boardId">
            <thead>
              <tr>
                <th scope="col">������</th>
                <th scope="col">�۹�ȣ</th>	<!-- ��������/�����Խ��� -->
                <th scope="col">����</th>
                <th scope="col">�ۼ���</th>
                <th scope="col">�ۼ���</th>
                <th scope="col">��ȸ��</th>
              </tr>
            </thead>
            <tbody>
              <tr onclick="location.href='groupdetail.do'">
                <th scope="row">1</th>
                <td>��������</td>
                <td>���� �����̾��� ���͵��</td>
                <td>�輺��</td>
                <td>2020-07-12</td>
                <td>2</td>
              </tr>
              <tr>
                <th scope="row">2</th>
                <td>��������</td>
                <td>���� ������ ���� 2�迡���</td>
                <td>�輺��</td>
                <td>2020-07-17</td>
                <td>1</td>
              </tr>
              <tr>
                <th scope="row">3</th>
                <td>��������</td>
                <td>������ ������ ���ҳ׿��</td>
                <td>�輺��</td>
                <td>2020-07-27</td>
                <td>4</td>
              </tr>
              <tr>
                <th scope="row">4</th>
                <td>�����Խ���</td>
                <td>�ݿ��Ͽ� ������</td>
                <td>��������</td>
                <td>2020-07-12</td>
                <td>1</td>
              </tr>
              <tr>
                <th scope="row">5</th>
                <td>�����Խ���</td>
                <td>���� �ʿ�</td>
                <td>���̵�</td>
                <td>2020-07-22</td>
                <td>1</td>
              </tr>
              <tr>
                <th scope="row">6</th>
                <td>�����Խ���</td>
                <td>purpose</td>
                <td>etham</td>
                <td>2020-07-12</td>
                <td>12</td>
              </tr>
              <tr>
                <th scope="row">7</th>
                <td>�����Խ���</td>
                <td>�ʶ���</td>
                <td>������</td>
                <td>2020-07-12</td>
                <td>12</td>
              </tr>
              <tr>
                <th scope="row">8</th>
                <td>�����Խ���</td>
                <td>�� ���� �׷���</td>
                <td>������</td>
                <td>2020-07-12</td>
                <td>12</td>
              </tr>
              <tr>
                <th scope="row">9</th>
                <td>�����Խ���</td>
                <td>��Ű�� ũ�� ����</td>
                <td>��ȫ��</td>
                <td>2020-07-12</td>
                <td>12</td>
              </tr>
              <tr>
                <th scope="row">10</th>
                <td>�����Խ�����</td>
                <td>���� ���͵� �ٳ������ҿ��� �𿩿�</td>
                <td>�輺��</td>
                <td>2020-07-12</td>
                <td>12</td>
              </tr>

            </tbody>
        
          </table>
          
          <!-- ���ۼ� ��ư -->
 	       <div class="col-12" align="right">
          	<button type="button"  style="margin-right:10px;" id="ib" onclick="location.href='groupBoardInsertForm.do'") >�� �ۼ�</button>
          </div>
          
    
          
          <!-- ���������̼� -->
          <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
              <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#">Next</a>
              </li>
            </ul>
          </nav>
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