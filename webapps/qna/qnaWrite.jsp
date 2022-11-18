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
    <title>질문하기</title>
    <jsp:include page="/head.jsp" />
	<link rel="stylesheet" href="${path1 }/resource/datatables.min.css">
	<script src="${path1 }/resource/datatables.min.js"></script>
  </head>
  <body>
  <jsp:include page="/header.jsp" />
  <section class="section">
    	<div class="container">
			<h2 class="title">질문 하기</h2>
			<form name="frm1" id="frm1" action="${path1 }/AddQnaProCtrl.do" method="post">
				<table class="table">
					<tbody>
						<tr>
							<th><label for="title">질문 제목</label></th>
							<td><input type="text" name="title" id="title" placeholder="제목 입력" maxlength="100" class="input" required></td>
						</tr>
						<tr>
							<th><label for="content">질문 내용</label></th>
							<td>
								<textarea cols="100" rows="6" name="content" id="content" maxlength="600" class="textarea"></textarea>
							</td>
						</tr>
						<tr>
							<th><label for="author">작성자</label></th>
							<td>
								<input type="text" name="author" id="author" class="input" value='${sid }' readonly required>
								<input type="hidden" name="lev" id="lev" value="0">
							</td>
						</tr>
						<tr>
							<th><label for="sec1">비밀글 여부</label></th>
							<td>
								<input type="radio" name="sec" id="sec1" value="N" checked>
								<label for="">공개</label>
								<input type="radio" name="sec" id="sec2" value="Y">
								<label for="">비밀글</label>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btn-group">
					<button type="submit" class="button is-primary">글 쓰기</button>
					<a href="<%=request.getContextPath() %>/GetQnaListCtrl.do" class="button is-info">목록으로</a>
				</div>
			</form>
		</div>	
	</section>
  <jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>