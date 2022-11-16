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
    <title>장소 수정하기</title>
    <jsp:include page="/head.jsp" />
  </head>
  <body>
  <jsp:include page="/header.jsp" />
  <section class="section">
    <div class="container">
      <h2 class="title">이미지 추가하기</h2>
		<form name="frm1" id="frm1" action="${path1 }/ModifyProTourCtrl.do" method="post" onsubmit="return tourCheck(this)">
	      	<div id="con">
	      		<table class="table">
	      			<c:if test="${not empty list }">
	      			<tr>
					<c:forEach items="${list }" var="pic" varStatus="status">
					<td>
						<img src="upload/${pic.picname }" class="lazy" onerror="this.style.display='none'" alt="배너" />
						<!-- onerror="this.style.display='none'"  -->
		      		</td>
					</c:forEach>	
			    	</tr>
			    	</c:if>
					<c:if test="${empty list }">
				    <tr>
				    	<td>해당 이미지가 없습니다.</td>
				    </tr>
				    </c:if>
				  </tbody>
				</table>
				<div class="field">
				  <div class="control">
					<input type="hidden" name="pic_ck1" id="pic_ck1" value="no"/>
					<button type="button" class="button is-link" onclick="imgUpload(2)">이미지 추가</button>
				  </div>
				</div>
	      	</div>
	      	<br><hr><br>
	      	<h2 class="title">장소 수정하기</h2>
			<table class="table">
			   <tbody>
			    <tr>
			      <th style="min-width:180px;"><label class="label"></label>번호</th>
			      <td><input type="text" name="no" id="no" class="input" value="${dto.no }" readonly required /></td>
			    </tr>
			    <tr>
			      <th><label for="cate" class="label">분류</label></th>
			      <td>
			      	<input type="hidden" name="cate0" id="cate0" value="${dto.cate }" />
	   				<c:set var="cate" value="${dto.cate }" /> 
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
					<div class="field">
					  	<div class="select">
						  <select name="cate" id="cate" class="select" onchange="changeTourNo()" required>
						  	<option value="">선택</option>
						    <option value="A">관광</option>
						    <option value="B">체험</option>
						    <option value="C">행사</option>
						    <option value="D">축제</option>
						    <option value="E">숙박</option>
						    <option value="F">음식</option>
						    <option value="G">쇼핑</option>
						    <option value="H">기타</option>
						  </select>
						</div>
					</div>
			      </td>
			    </tr>
			    <tr>
			      <th><label class="label">장소 번호</label></th>
			      <td><p>${dto.tourno }</p>
			      	<input type="hidden" name="tourno0" id="tourno0" value="${dto.tourno }" />
			      	<input type="text" name="tourno" id="tourno" class="input" value="${dto.tourno }" readonly/>
			      </td>
			    </tr>
			    <tr> 
			      <th><label for="place" class="label">장소명</label></th>
			      <td>
					<input type="text" name="place" id="place" class="input" value="${dto.place }" />
			      </td>	
			    </tr>
			    <tr>
			      <th><label for="comment1" class="label">장소 주요 설명</label></th>
			      <td><textarea class="textarea" name="comment1" id="comment1" cols="80" rows="8" maxlength="500" required>${dto.comment1 }</textarea></td>
			    </tr>
			    <tr>
			      <th><label for="comment2" class="label">장소 상세 설명</label></th>
			      <td><textarea class="textarea" name="comment2" id="comment2" cols="80" rows="8" maxlength="500" required>${dto.comment2 }</textarea></td>
			    </tr>
			  </tbody>
			</table>
			<div class="buttons">
			  <a href="${path1 }/GetTourListCtrl.do" class="button is-info">목록</a>
			  <c:if test='${sid.equals("admin") }'>
				  <a href="${path1 }/GetTourDetailCtrl.do?no=${dto.no }" class="button is-danger">장소 보기</a>
				  <button type="submit" class="button is-warning">장소 수정</button>
			  </c:if>
			</div>
		</form>
    </div>
  </section>
	<script>
	function imgUpload(pos){
		var tourno = $("#tourno").val();
		var win1 = window.open("${path1 }/tour/imgUpload.jsp?no="+pos+"&tourno="+tourno,"win","width=850, height=400");
	}
	function changeTourNo(){
		if($("#cate").val()=="" || $("#cate").val()==$("#cate0").val()){
			$("#tourno").val($("#tourno0").val());
		} else {
			listLoading();
		}
	}
	function listLoading(){
		//ajax로 현재 마지막 레코드의 번호를 불러옴
		$.ajax({
			url:"${path1 }/NoLoadCtrl.do",
			type:"post",
			dataType:"json",
			success:function(data){
				console.log(data.no);
				$("#tourno").val($("#cate").val() + data.no);
			}
		});
	}
	</script>
	
  <jsp:include page="/footer.jsp"></jsp:include>
  </body>
</html>