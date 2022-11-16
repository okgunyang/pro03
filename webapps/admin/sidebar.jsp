<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<aside class="column is-2 has-background-primary-dark has-text-white" style="min-height:90vh" id="sidebar">
	<div class="navbar-menu">
		<div class="navbar">
			<a href="${path1 }/GetUserListCtrl.do" class="navbar-item">회원관리</a>
			<a href="${path1 }/tour/addTour.jsp" class="navbar-item">장소관리</a>
			<a href="${path1 }/GetTourListCtrl.do" class="navbar-item">장소목록</a>
		</div>
	</div>
</aside>