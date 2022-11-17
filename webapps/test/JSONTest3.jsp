<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<%-- <c:set var="path1" value="${pageContext.request.contextPath }" />   --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSON Test3</title>
<jsp:include page="/head.jsp" />
</head>
<body>
<div class="container">
	<h1 class="title">JSON(JavaScript Object Notation)</h1>
	<p>자바스크립의 객체 형태로 데이터를 교환하는 방식</p>
	<br><hr><br>
	<h2 class="title">JSON 리스트 객체 데이터 받기</h2>
	<div id="con3">
	
	</div>
	<script>
	$(document).ready(function(){
		$.ajax({
			url:"${path1 }/JSONTest3.do",	//아이디가 전송되어질 곳
			type:"post",		//전송방식
			enctype:"UTF-8",
			dataType:"json",
 			processData:false,
			contentType:false, 
			cache:false,
			success:function(data){
				var trans = data;
				console.log(trans.data);	
				var tg = "";
				$.each(trans, function(key, value){
					if(key=="data"){
						for(var i=0;i<value.length;i++){
							console.log(value[i].name);
							tg = tg + "<div>이름 : "+value[i].name+"</div>";
							tg = tg + "<div>점수 : "+value[i].point+"</div>";
						}
					}
				});
				$("#con3").html(tg);
			}
		});
	});
	</script>
</div>
</body>
</html>