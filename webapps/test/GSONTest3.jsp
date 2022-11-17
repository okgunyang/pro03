<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonParser" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="java.io.FileReader" %>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<%!
//불러올 개별 DTO(VO) 선언
class TestUser {
	private String userId;
	private String firstName;
	private String lastName;
	private String phoneNumber;
	private String emailAddress;
	private String homepage;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	@Override
	public String toString() {
		return "TestUser [userId=" + userId + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", phoneNumber=" + phoneNumber
				+ ", emailAddress=" + emailAddress + ", homepage=" + homepage
				+ "]";
	}
}

//불러올 그룹 DTO(VO) 선언
public class TestUsers {
	private TestUser[] users;
	public TestUser[] getTests() {
		return users;
	}
	public void setTests(TestUser[] users) {
		this.users = users;
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GSONTest3</title>
<jsp:include page="/head.jsp" />
</head>
<body>
<div class="container">
<%
	JsonParser parser = new JsonParser();
	Gson gson = new Gson();
	
	try {
		out.println("<br><hr><br><h2 class='title'>JSON 파일을 읽어와서 데이터 출력</h2>");
		String jsonFilePath = request.getSession().getServletContext().getRealPath("/test/test.json");
		Object obj = parser.parse(new FileReader(jsonFilePath));
		JsonObject jsonObject = (JsonObject) obj;
		out.println(jsonObject.toString());
		
		out.println("<br><hr><br><h2 class='title'>JSON 파일을 읽어와 객체로 변환하여 데이터 출력</h2>");
		TestUsers tests = gson.fromJson(jsonObject, TestUsers.class);
 		for(TestUser t : tests.getTests()){
			out.println(t.toString()+"<br>");
			out.println(t.getHomepage()+"<br>");
		} 
	} catch(Exception e){
		e.printStackTrace();
	}
%>
</div>
</body>
</html>