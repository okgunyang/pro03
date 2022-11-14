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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>공지사항 상세보기</title>
    <jsp:include page="/head.jsp" />
  </head>
  <body>
  <jsp:include page="/header.jsp" />
  <section class="section">
    <div class="container">
      <h1 class="title">공지사항 상세보기</h1>
		<table class="table">
		   <tbody>
		    <tr>
		      <th>번호</th>
		      <td>${dto.no }</td>
		    </tr>
		    <tr>
		      <th>제목</th>
		      <td>${dto.title }</td>
		    </tr>
		    <tr>
		      <th>내용</th>
		      <td><p>${dto.content }</p></td>
		    </tr>
		    <tr> 
		      <th>작성일</th>
		      <td>
		      	<fmt:parseDate value="${dto.regDate }" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
		      	<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
		    </tr>
		    <tr>
		      <th>읽은 횟수</th>
		      <td><p>${dto.visited }</p></td>
		    </tr>
		  </tbody>
		</table>
		<div class="buttons">
		  <a href="${path1 }/GetNoticeListCtrl.do" class="button is-info">목록</a>
		  <c:if test='${sid.equals("admin") }'>
			  <a href="${path1 }/DelNoticeCtrl.do?no=${dto.no }" class="button is-danger">글 삭제</a>
			  <a href="${path1 }/ModifyNoticeCtrl.do?no=${dto.no }" class="button is-warning">글 수정</a>
		  </c:if>
		</div>
    </div>
  </section>
  <jsp:include page="/footer.jsp"></jsp:include>
  </body>
</html>