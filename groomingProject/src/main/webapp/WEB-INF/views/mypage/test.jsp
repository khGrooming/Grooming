<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>

        section1 {
            display: none;
            padding: 20px 10px 10px 10px;
            border: 3px solid #ddd;
            height: 500px;
            }

        /*라디오버튼 숨김*/
          input {
              display: none;}

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

        label:hover {
            color: #2e9cdf;
            cursor: pointer;}

        /*input 클릭시, label 스타일*/
        input:checked + label {
              color: #555;
              border: 3px solid #ddd;
              /* border-top: 2px solid #2e9cdf; */
              border-bottom: 3px solid #ffffff;
              }

        #tab1:checked ~ #content1,
        #tab2:checked ~ #content2,
        #tab3:checked ~ #content3,
        #tab4:checked ~ #content4 {
            display: block;}
</style>
</head>
<body>
	<input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
            <label for="tab1">tab menu1</label>
        
            <input id="tab2" type="radio" name="tabs">
            <label for="tab2">tab menu2</label>
        
            <input id="tab3" type="radio" name="tabs">
            <label for="tab3">tab menu3</label>
        
            <input id="tab4" type="radio" name="tabs">
            <label for="tab4">tab menu4</label>
        
            <section1 id="content1">
                <p>tab menu1의 내용</p>
            </section1>
        
            <section1 id="content2">
                <span style="font-size: 25px;font-weight: 800;margin-right: 5%;">바난나킥</span><span>Lv.25</span>
                <p>tab menu2의 내용</p>
            </section1>
        
            <section1 id="content3">
                <div id="expBox" style="position: relative;">
                    <p style="font-size: 10px; position: absolute; z-index: 100;  margin-left: 45%;">250/1000</p>
                    <div id="expBar"></div>
                </div>
               
                <p>tab menu3의 내용</p>
            </section1>
        
            <section1 id="content4">
                <p>tab menu4의 내용</p>
            </section1>
</body>
</html>