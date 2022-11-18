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
    <title>답변 하기</title>
    <jsp:include page="/head.jsp" />
	<link rel="stylesheet" href="${path1 }/resource/datatables.min.css">
	<script src="${path1 }/resource/datatables.min.js"></script>
  </head>
  <body>
  <jsp:include page="/header.jsp" />
  <section class="section">
    	<div class="container">
            <h2 class="title">온라인 상담 하기</h2>
            <br><hr><br>
            <p style="clear:both">작성하여 보내신 내용은 관리자 이메일로 보내지며, 내용을 확인 후 별도 개별적으로 3일 이내 연락드립니다.</p>
			<div class="frm1">
				<form name="frm" class="frm" action="onlinePro.jsp" method="post">
					<table class="table">
						<tbody>
							<tr>
								<th><label for="author">작성자</label></th>
								<td>
									<input type="text" name="name" id="name" class="input" value='${sid }' required>
								</td>
							</tr>
							<tr>
								<th><label for="from">이메일 주소</label></th>
								<td>
									<input type="email" name="from" id="from" class="input" value='' required >
								</td>
							</tr>
							<tr>
								<th><label for="tel">연락처</label></th>
								<td>
									<input type="tel" name="tel" id="tel" class="input" value='' required >
								</td>
							</tr>
							<tr>
								<th><label for="title">상담 제목</label></th>
								<td><input type="text" name="title" id="title" placeholder="제목 입력" maxlength="100" class="input" required></td>
							</tr>
							<tr>
								<th><label for="content">상담 내용</label></th>
								<td>
									<textarea cols="100" rows="6" name="content" id="content" maxlength="600" class="textarea"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btn_group">
						<button type="submit" class="button is-primary">상담 받기</button>
						<a href="${path1 }/GetQnaListCtrl.do" class="button is-info">질문 및 답변</a>
					</div>
				</form>
			</div>
		</div>
	</section>
  <jsp:include page="/footer.jsp"></jsp:include>
  </body>
</html>