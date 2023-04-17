<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rest</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
<% request.setCharacterEncoding("UTF-8");%>
$(document).ready(function(){
	
	$.ajaxSetup({
		success:function(result){
			alert(result);	
		},
		error:function(jqXHR){
			alert("jqXHR status code:"+jqXHR.status+" message:"+jqXHR.responseText);
		}//error
	});//ajaxSetup
	
	$("#testGetListBtn").click(function(){
		$.ajax({
			type:"get",
			url:"products",
			success:function(productList){
				$("#listView").empty();
				$.each(productList,function(i,product){
					$("#listView").append(product.id+" "+product.name+" "+product.maker+" "+product.price+"<br>").css("background","pink")
				});//each
			}//success
		});//ajax
	});//#testGetlistBtn
	
	$("#testGetBtn").click(function(){
		$.ajax({
			type:"get",
			url:"products/"+$("#pid").val(),
			success:function(product){
				alert(product.id+" "+product.name+" "+product.maker+" "+product.price);
			}//success
		});//ajax
		
	});//#testGetBtn
	
	$("#testCreateBtn").click(function(){
		
		$.ajax({
			type:"post",
			url:"products",
			data : $("#createProductForm").serialize()
		}).done(function(){
			$("#createProductForm")[0].rest();
		});//ajax
	});//#testCreateBtn
	
	$("#testPutBtn").click(function(){
		$.ajax({
			type:"put",
			url:"products?"+$("#updateProductForm").serialize()
			
			
		}).always(function(){
			$("#updateProductForm")[0].reset();
		});//ajax//always
	});//#testPutBtn
	
	$("#testDeleteBtn").click(function(){
		$.ajax({
			type : "delete",
			url:"products/"+$("#deleteId").val()
			
		});//ajax
	});//#testDeleteBtn
	
	
	
});//ready
</script>
</head>
<body>
	<h3>REST 적용 웹어플리케이션 구현</h3>
	<ul>
		<li>HTTP Request Method <br><br> 
		GET : 리스트 조회 <input type="button" value="testGetListBtn" id="testGetListBtn"><br>
		<div id="listView"></div> <br> <br> 
		GET : 조회 <input type="button" value="testGetBtn" id="testGetBtn"><input type="text" id="pid"><br><br> 
		POST :생성 <input type="button" value="testCreateBtn" 	id="testCreateBtn"><br>
			<form id="createProductForm">
				상품번호 <input type="text" name="id" size="5"> 
				상품명 <input type="text" name="name" size="5"> 
				제조사 <input type="text"	name="maker" size="5"> 
				가격 <input type="number" name="price">
			</form> <br><br> 
		PUT : 수정 <input type="button" value="testPutBtn" id="testPutBtn"><br>
			<form id="updateProductForm">
				상품번호 <input type="text" name="id" size="3" id="updateId">
				상품명 <input type="text" name="name" size="5"> 
				제조사 <input	type="text" name="maker" size="5"> 
				가격 <input type="number" name="price">
			</form> <br> DELETE : 삭제 <input type="button" value="testDeleteBtn"	id="testDeleteBtn"> <input type="text" id="deleteId">
		</li>
	</ul>
	<%-- src/main/resources/static 아래에 images/rest-api.png 가 있다  --%>
	<img class="restImg" src="image/img.png">



</body>
</html>
<!-- jqXHR(jquery Xml Http Request) : XML을 포함한 모든 유형의 데이터 호환--> 
<!-- ajaxSetup : 실행된 ajax 요청에 대한 기본 속성등의 정의 -->
<!-- serialize : form 태그 안에 값들을 한번에 전송 -->