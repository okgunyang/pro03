<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="${request.getContextPath() }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>관리자 메인 페이지</title>
    <jsp:include page="/head.jsp" />
</head>
<body>
  	<jsp:include page="${path1 }/header.jsp" />
	<section class="section">
	    <div class="columns is-full">
			<jsp:include page="${path1 }/admin/sidebar.jsp" />
			<div class="column is-10">
				<h2>${admin }테스트 입니다.</h2>
				<h3>관리자 메인 페이지</h3>
			</div>
		</div>
	</section>
	<jsp:include page="${path1 }/footer.jsp" />
</body>
</html>