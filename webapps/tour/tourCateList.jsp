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
    <title>장소 상세보기</title>
    <jsp:include page="/head.jsp" />
  </head>
  <body>
  <jsp:include page="/header.jsp" />
	<nav class="breadcrumb" aria-label="breadcrumbs" style="border-bottom:2px solid #ddd; padding-bottom:8px; min-height:48px; line-height:48px;">
	  <ul style="float:right;">
	    <li><a href="${path1 }/">Home</a></li>
	    <li><a href="${path1 }/GetTourListCtrl.do">전체 장소</a></li>
	    <li class="is-active"><a href="#" aria-current="page">
 			<c:set var="cate" value="${placeCate }" /> 
			<c:if test="${cate eq 'A' }">
			<span>관광</span>
			</c:if>
			<c:if test="${cate eq 'B' }">
			<span>체험</span>
			</c:if>
			<c:if test="${cate eq 'C' }">
			<span>행사</span>
			</c:if>
			<c:if test="${grade eq 'D' }">
			<span>축제</span>
			</c:if>
			<c:if test="${cate eq 'E' }">
			<span>숙박</span>
			</c:if>
			<c:if test="${cate eq 'F' }">
			<span>음식</span>
			</c:if>
			<c:if test="${cate eq 'G' }">
			<span>쇼핑</span>
			</c:if>
			<c:if test="${cate eq 'H' }">
			<span>기타</span>
			</c:if>
	    </a></li>
	  </ul>
	</nav>
  <section class="section">
    <div class="container">
      <h1 class="title">장소 상세보기</h1>
      	<div id="con">
      		<div class="tile is-ancestor columns" style="padding-bottom:40px;">
      			<c:if test="${not empty list }">
				<c:forEach items="${list }" var="dto" varStatus="status">
			      <div class="tile is-3" style="box-sizing:border-box;">
			        <article class="tile is-child is-one-third notification" style="background-color:transparent; border:1px solid #eee; margin-right:10px!important;">
			          <p class="title">${dto.place }</p>
			          <p class="subtitle">
			 			<c:set var="cate" value="${placeCate }" /> 
						<c:if test="${cate eq 'A' }">
						<span>관광</span>
						</c:if>
						<c:if test="${cate eq 'B' }">
						<span>체험</span>
						</c:if>
						<c:if test="${cate eq 'C' }">
						<span>행사</span>
						</c:if>
						<c:if test="${grade eq 'D' }">
						<span>축제</span>
						</c:if>
						<c:if test="${cate eq 'E' }">
						<span>숙박</span>
						</c:if>
						<c:if test="${cate eq 'F' }">
						<span>음식</span>
						</c:if>
						<c:if test="${cate eq 'G' }">
						<span>쇼핑</span>
						</c:if>
						<c:if test="${cate eq 'H' }">
						<span>기타</span>
						</c:if>
			          </p>
			          <figure class="image is-4by3">
			            <img src="${path1 }/upload/${dto.imgURL }" alt="${dto.place }">
			          </figure>
			          <div class="content" style="margin:10px;">
			          	<p class="item_com">${dto.comment2 }</p>
			          </div>
			          <a href="${path1 }/GetTourDetailCtrl.do?no=${dto.no }" class="button is-primary">자세히 보기</a>
			        </article>
			      </div>
				</c:forEach>	
		    	</c:if>
				<c:if test="${empty list }">
			      <div class="tile is-parent">
			        <article class="tile is-child notification is-info">
			          <p class="title">해당 아이템이 존재하지 않습니다.</p>
			        </article>
			      </div>
			    </c:if>
			</div>
      	</div>
		<div class="buttons">
		  <a href="${path1 }/GetTourListCtrl.do" class="button is-info">전체 목록</a>
		</div>
    </div>
  </section>
	
  <jsp:include page="/footer.jsp"></jsp:include>
  </body>
</html>