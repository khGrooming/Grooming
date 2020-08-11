<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!doctype html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!--      <script src="http:/code.jquery.com/jquery-latest.min.js"></script> -->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
        integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

	<!-- modal CSS  -->
	<link href="${pageContext.servletContext.contextPath }/resources/views/css/modal.css" rel="stylesheet">
    <title>Hello, world!</title>
    <style>
    
    	body{
    		height:1200px;
    	}
		
		 img {
            max-width: 100%;
            max-height: 100%;
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
                        <tr><td><h3>${grooming.groomingTitle }</h3></td></tr>
                        <tr><td><span>���� �Ⱓ : </span><span>${grooming.groomingSd } ~ ${grooming.groomingEd }</span></td></tr>
                        
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
                    			<span>�ۼ��� :${grooming.groomingCd }</span>
                    		</td> 
                    	</tr>
                    	<tr>
							<td>
                    			<span>��ȸ�� : </span><span>${grooming.count}</span>
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
      	<div class="container">
			<div class="row">
				<div class="col-3">
				<!-- ��û�� ����Ʈ  Ȯ�� ��ư -->
				<button data-toggle="modal" data-target="#applicant">��û�� ����Ʈ</button>
				<!-- ����Ʈ ��� -->
				  <div class="modal fade" id="applicant" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
			        aria-hidden="true">
			        
			        <div class="modal-dialog" >
			        
			            <div class="modal-content" style="width: 800px; height: auto;">
			            	<!-- ��� ���� -->
			                <div class="modal-header">
			                    <h5 class="modal-title" id="exampleModalLabel">��û�� ����Ʈ</h5>
			                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                     <span aria-hidden="true">&times;</span>
			                    </button>
			                </div>
			                <!-- ��� ���� ���� -->
			                <div class="modal-body">
			                   <table class="table"  style="text-align:center">
                          		  <thead>
		                                <!-- ��� ���� ��� -->
		                                <tr>
		                                    <th scope="col" style="width: 100px;">������</th> 
		                                    <th scope="col" style="width: 100px;">�г���</th>
		                                    <th scope="col" style="width: 300px;">���</th>
		                                    <th scope="col">��û ����</th>
		                                    <th scope="col" stype="width: 200px">����/����</th>
		                                </tr>
		                           </thead>
		                           <tbody>
		                                <tr>
		                                    <td>
		                                        <div class="pimg" style="width:50px; height:50px; "><img src="${contextPath }/resources/views/images/�����.jpg"></div>
		                                    </td>
		                                    <td>������</td>
		                                    <td>��ǻ��Ȱ��ɷ�1��, �ѱ��� 1��, ������</td>
		                                    <td><button  data-toggle="modal" data-target="#open">��û�� ����</button>
		                                    	<div class="modal modal-xl fade" id="open" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
											        aria-hidden="true" >
											        
											        <div class="modal-dialog" >
											        
											            <div class="modal-content" style="width: 800px; height: auto;">
											            	<!-- ��� ���� -->
											                <div class="modal-header">
											                    <h5 class="modal-title" id="exampleModalLabel">��û�� ����Ʈ</h5>
											                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
											                     <span aria-hidden="true">&times;</span>
											                    </button>
											                </div>
											                <!-- ��� ���� ���� -->
											               <div class="modal-body">
											               
											               </div>
											            </div>
											         </div>
											      </div>
		                                    </td>
		                                    <td><button>����</button>&nbsp;&nbsp;<button>����</button></td>
		                                  
		                                </tr>
		                               
		                           </tbody>
                                </table>
			                </div>
			
			    	 	 </div>
			    	 	 
			        </div>
			        
			  	  </div>
			  	  <!-- ��û�� ����Ʈ ��� �� -->
				</div>
				
				<!-- ���� ���� ��ư -->
				<div class="col-6" style="text-align:center">
					<button>����</button>
					<button>����</button>
					<button>����</button>
				</div>
				
				<div class="col-3">
				<!-- ��û�ϱ� ��ư -->
				<button data-toggle="modal" data-target="#applyForm">��û�ϱ�</button>
				<!-- ��û�� ��� -->
				  <div class="modal fade" id="applyForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
			        aria-hidden="true">
			        
			        <div class="modal-dialog" >
			        
			            <div class="modal-content" style="width: auto; height: auto;">
			            
			                <!-- ��� ���� -->
			                <div class="modal-header">
			                    <h5 class="modal-title" id="exampleModalLabel">��û��</h5>
			                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                     <span aria-hidden="true">&times;</span>
			                    </button>
			                </div>
			                <!-- ��� ���� ���� -->
			                <div class="modal-body container">
			                    <div class="row">
			                    	<div cols="6">
			                    		
			                    	</div>
			                    	<div cols="6">
			                    	
			                    	</div>
			                    </div>
			                    <textarea cols="100" rows="10" placeholder="������ �Է��ϼ���. " id="summernote" name="editordata"
                                    class="form-control"></textarea></td>
			                </div>
			
			    	 	 </div>
			    	 	 
			        </div>
			        
			  	  </div>
			  	  <!-- ��û �� ��� �� -->
				</div>
				
			</div>      	
      	</div>
    </section>
	<script>
	 $("#open").draggable({
	      handle: ".modal-header"
	  });
	</script>
    <footer><jsp:include page="../common/footer.jsp" /> </footer>


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