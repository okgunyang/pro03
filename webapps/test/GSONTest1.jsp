<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<%@ page import="com.google.gson.Gson" %>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GSONTest1</title>
<jsp:include page="/head.jsp" />
</head>
<body>
<div class="container">
<%
	int[] arr = {10,20,30,40,50,60,70,80,90};
	
	Gson gson = new Gson();
	
	String jsonArray = gson.toJson(arr);  //배열요소를 json 객체로 변경하기
	out.println("<h2>배열 요소를 JSON 요소로 변경된 데이터 출력</h2>");
	out.println(jsonArray + "<br>");
	
	int[] arr2 = gson.fromJson(jsonArray, int[].class);	//json 객체를 배열요소로 변경하기
	out.println("<h2>JSON 요소를 배열 요소로 변경된 데이터 출력</h2>");
	out.print("[");
	for(int val : arr2){
		out.print(val+",");	
	}
	out.print("]");
%>
</div>
</body>
</html>