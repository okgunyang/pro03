<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<%-- <c:set var="path1" value="${pageContext.request.contextPath }" />   --%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>묻고 답하기</title>
    <jsp:include page="/head.jsp" />
	<link rel="stylesheet" href="${path1 }/resource/datatables.min.css">
	<script src="${path1 }/resource/datatables.min.js"></script>
	<script>
	$(document).ready( function () {
	    $('#tb1').DataTable({
	    	  aaSorting: []
	    	  //, order : [[ 0, "asc" ]]
	   	});
	});
	</script>
  </head>
  <body>
  <jsp:include page="/header.jsp" />
  <section class="section">
    <div class="container">
		<h2 class="title">묻고 답하기</h2>
		<table class="table" id="tb1">
			<thead>
				<tr>
					<th style="max-width:5px"></th><th>연번</th><th>제목</th><th>작성자</th><th>작성일</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${qnaList }" var="vo" varStatus="status">
			<tr>
				<td><span style="color:transparent">${vo.parno }</span></td>
				<td>
					<c:if test="${vo.lev==0}">
						<span>${vo.no }</span>
					</c:if>
					<c:if test="${vo.lev==1}">
						<span style="color:white">${vo.no }</span>
					</c:if>
				</td>
				<td>
				<c:if test="${vo.lev==0}">
					<c:if test='${vo.sec.equals("Y")}'>
						<c:if test='${sid.equals(vo.author) || sid.equals("admin")}'>
							<a href="${path1 }/GetQnaDetailCtrl.do?no=${vo.no }">${vo.title }</a>
						</c:if>
						<c:if test='${empty sid }'>
							<span>${vo.title }</span>
						</c:if>	
					</c:if>		
					<c:if test='${vo.sec.equals("N") && not empty sid}'>	
						<a href="${path1 }/GetQnaDetailCtrl.do?no=${vo.no }">${vo.title }</a>
					</c:if>		
					<c:if test='${vo.sec.equals("N") && empty sid}'>
						<span>${vo.title }</span>
					</c:if>
				</c:if>
				<c:if test="${vo.lev==1}">
					<c:if test='${vo.sec.equals("Y")}'>
						<c:if test='${sid.equals(vo.author) || sid.equals("admin")}'>
							<a href="${path1 }/GetQnaDetailCtrl.do?no=${vo.no }">${vo.title }</a>
						</c:if>
						<c:if test='${empty sid }'>
							<span style="padding-left:60px;">${vo.title }</span>				
						</c:if>
					</c:if>
					<c:if test='${vo.sec.equals("N") && not empty sid}'>	
						<a href="${path1 }/GetQnaDetailCtrl.do?no=${vo.no }" style="padding-left:60px;">${vo.title }</a>
					</c:if>							
					<c:if test='${vo.sec.equals("N") && empty sid}'>
				 		<span style="padding-left:60px;">${vo.title }</span>
					</c:if>
				</c:if>
				</td>
				<td>${vo.author }</td>
				<td>
					<fmt:parseDate value="${dto.regDate }" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
		      		<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
		      	</td>
			</tr>
			</c:forEach>	
			</tbody>
		</table>
		<c:if test='${not empty sid}'>
		<div class="btn-group">
			<a href="${path1 }/qna/qnaWrite.jsp" class="button is-danger">글 등록</a>
		</div>
		</c:if>
		</div>	
	</section>
  <jsp:include page="/footer.jsp"></jsp:include>
  </body>
</html>