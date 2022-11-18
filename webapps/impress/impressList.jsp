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
    <title>이용후기 목록</title>
    <jsp:include page="/head.jsp" />
	<link rel="stylesheet" href="${path1 }/resource/datatables.min.css">
	<script src="${path1 }/resource/datatables.min.js"></script>
	<script>
	$(document).ready( function () {
	    $('#tb1').DataTable();
	} );
	</script>
  </head>
  <body>
  <jsp:include page="/header.jsp" />
  <section class="section">
    <div class="container">
      <h1 class="title">이용후기</h1>
		<table class="table" id="tb1">
			<thead>
				<tr>
					<th>장소</th><th>내용</th><th>작성자</th><th>작성일</th><th></th>
				</tr>
			</thead>
			<tbody>
		   <c:forEach items="${list }" var="dto" varStatus="status">
		    <tr>
		      <td>
		      	<input type="hidden" name="no" id="no" value="${ato.no }" />
		      	<h3>${dto.place }</h3>
		      	<br>
		      	<img src="${path1 }/upload/${dto.imgSrc }" alt="${dto.tourno }" style="width:40px;" />
		      </td>
		      <td>
		      	<div>${dto.content }</div>
		      </td>
		      <td>
		      	<div>
		      		<c:set var="string1" value="${dto.id }"/>
		      		<c:set var="length" value="${fn:length(string1)}"/>
		      		<c:set var="string2" value="${fn:substring(string1, 0, length-3)}" />
		      		${string2}<c:forEach var="i" begin="1" end="${length - 2 }"><span>*</span></c:forEach>
		      	</div>
		      	<div>
		      		<input type="hidden" name="star" id="star" />
		      		<div class="star_data" style="width:${dto.star*20 }px"></div>
		      	</div>
		      </td>
		      <td>
		      	<fmt:parseDate value="${dto.regdate }" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
		      	<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
		      </td>
		      <td>
		      	<c:if test='${sid.equals("admin")}'>
		      		<a href="${path1 }/DelImpressCtrl.do?no=${dto.no }" class="button is-success">글 삭제</a>
		      	</c:if>
		      </td>	
		    </tr>
		    </c:forEach>
			<c:if test="${empty list }">
		    <tr>
		    	<td colspan="4">이용 후기 목록이 없습니다.</td>
		    </tr>
		    </c:if>
		  </tbody>
		</table>
		<hr style="height:4px; background-color:#ccc;">
		<c:if test='${not empty sid || sid.equals("admin")}'>		
		<table class="table">
			<tbody>
				<tr>
					<td style="width:160px">
						<div class="select" style="width:150">
						  <select name="cate" id="cate" class="select" onchange="changeTourNo()" style="width:150" required>
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
						<br>
						<div class="select" style="width:150">
							<select name="tourno" id="tourno" style="width:150" required>
								<option value="">선택</option>
								
							</select>
						</div>
					</td>
					<td style="width:100px">
						<input type="radio" name="star" id="star10" class="hidden_item" value="5" checked>
						<input type="radio" name="star" id="star9" class="hidden_item" value="4.5">
						<input type="radio" name="star" id="star8" class="hidden_item" value="4">
						<input type="radio" name="star" id="star7" class="hidden_item" value="3.5">
						<input type="radio" name="star" id="star6" class="hidden_item" value="3">
						<input type="radio" name="star" id="star5" class="hidden_item" value="2.5">
						<input type="radio" name="star" id="star4" class="hidden_item" value="2">
						<input type="radio" name="star" id="star3" class="hidden_item" value="1.5">
						<input type="radio" name="star" id="star2" class="hidden_item" value="1">
						<input type="radio" name="star" id="star1" class="hidden_item" value="0.5">
						<input type="hidden" name="starpoint" id="starpoint" value="">
						<div id="star_group">
							<div id="stardate">
								<div id="starrate"></div>
							</div>
							<div class="star_btn" id="star_btn">
								<label for="star1"></label>
								<label for="star2"></label>
								<label for="star3"></label>
								<label for="star4"></label>
								<label for="star5"></label>
								<label for="star6"></label>
								<label for="star7"></label>
								<label for="star8"></label>
								<label for="star9"></label>
								<label for="star10"></label>
							</div>
						</div>
					</td>
					<td style="min-width:400px">
						<input type="text" name="content" id="content" class="input" placeholder="남기고 싶은 말을 쓰시오." required>
					</td>
					<td>
						<div class="buttons">
						  <button type="button" class="button is-danger" onclick="addImpress()">글 등록</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		</c:if>
    </div>
    <script>
    $(document).ready(function(){
    	
    	$("#content").on("click", function(){
    		if($("#tourno").val()==""){
    			alert("방문 장소를 먼저 고르시기 바랍니다.");
    		}
    	});
    	
    	$("#star_btn label").click(function(){
    		if($("#tourno").val()==""){
    			alert("방문 장소를 먼저 고르시기 바랍니다.");
    			$("#tourno").focus();
    		} else {
    			$("#starpoint").val(($(this).index()+1)/2);
    		}
    	});
    });
    
    function changeTourNo(){
    	var ct = $("#cate").val(); 
    	if(ct==""){
    		alert("카테고리를 먼저 선택하시기 바랍니다.");
    		return;
    	}
    	var params = {	cate : ct	}
		$.ajax({
			url:"${path1 }/CateLoadCtrl.do",
			type:"POST",
			enctype:"application/json",
			data:params,
			datatype:"json",
			success:function(result){
				$("#tourno").empty();
				$("#tourno").append("<option value=''>선택</option>");
				var trans = result;
				console.log(trans);
				$.each(trans, function(key, value){
					if(key=="result"){
						for(var i=0;i<value.length;i++){
							$("#tourno").append("<option value='"+value[i].tourno+"'>"+value[i].place+"</option>");
						}
					}
				});				
			}
		});
    }
    function addImpress(){
    	var ct = $("#cate").val();
    	var tour = $("#tourno").val();
    	var con = $("#content").val();
    	var starpoint = $("#starpoint").val();
    	if(ct==""){
    		alert("카테고리를 먼저 선택하시기 바랍니다.");
    		return;
    	}
    	if(tour==""){
    		alert("방문 장소를 먼저 선택하시기 바랍니다.");
    		return;
    	}
    	if(con==""){
    		alert("내용을 입력하시기 바랍니다.");
    		return;
    	}
    	if(starpoint==""){
    		alert("별점을 먼저 선택하여 주시기 바랍니다.");
    		return;
    	}
    	var params = {	cate : ct, tourno : tour, content : con, star :	starpoint }
		$.ajax({
			url:"${path1 }/AddImpressCtrl.do",
			type:"POST",
			enctype:"application/json",
			data:params,
			datatype:"json",
			success:function(result){
				var trans = result;
				location.href = "${path1 }/GetImpressListCtrl.do";				
			}
		});
    }
    //href="${path1 }/notice/AddImpressCtrl.do" 
    </script>
  </section>
  <jsp:include page="/footer.jsp"></jsp:include>
  </body>
</html>