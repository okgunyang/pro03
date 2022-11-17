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
	<link rel="stylesheet" type="text/css" href="http://s1.daumcdn.net/svc/attach/U03/cssjs/mapapidoc/1421136453605/service.min.css">
	<style>
	body { background:white; }
	</style>	
	<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/v3.js"></script>
	<script type="text/javascript" src="http://s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-1.11.0.js"></script>	
	<script type="text/javascript" src="http://s1.daumcdn.net/svc/original/U0301/cssjs/JSON-js/fc535e9cc8/json2.min.js"></script>
  </head>
  <body class="web guide" data-page_section="web" data-page_type="guide" data-title="Daum 지도 Web API 가이드">
  <jsp:include page="/header.jsp" />
	<nav class="breadcrumb" aria-label="breadcrumbs" style="border-bottom:2px solid #ddd; padding-bottom:8px; min-height:48px; line-height:48px;">
	  <ul style="float:right;">
	    <li><a href="${path1 }/">Home</a></li>
	    <li><a href="${path1 }/GetTourListCtrl.do">전체 장소</a></li>
	    <li><a href="${path1 }/GetTourCateListCtrl.do?cate=${dto.cate }">
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
	    </a></li>
	    <li class="is-active"><a href="#" aria-current="page">${dto.place }</a></li>
	  </ul>
	</nav>
  <section class="section">
    <div class="container">
      <h1 class="title">${dto.place } 상세보기</h1>
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
      	</div>
		<table class="table">
		   <tbody>
		    <tr>
		      <th style="min-width:180px;">번호</th>
		      <td>${dto.no }</td>
		    </tr>
		    <tr>
		      <th>분류</th>
		      <td>
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
				<c:if test="${cate eq 'D' }">
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
		      </td>
		    </tr>
		    <tr>
		      <th>장소 번호</th>
		      <td><p>${dto.tourno }</p>
		      	<input type="hidden" name="tourno" id="tourno" value="${dto.tourno }" />
		      </td>
		    </tr>
		    <tr> 
		      <th>장소명</th>
		      <td>
				${dto.place }
		      </td>	
		    </tr>
		    <tr>
		      <th>장소 주요 설명</th>
		      <td><p>${dto.comment1 }</p></td>
		    </tr>
		    <tr>
		      <th>장소 상세 설명</th>
		      <td><p>${dto.comment2 }</p></td>
		    </tr>
		    <tr>
		    	<th>주소</th>
		    	<td>${dto.addr }
		    		<input type="hidden" name="addr" id="addr" value="${dto.addr }" />
		    		<input type="hidden" name="place" id="place" value="${dto.place }" />
		    	</td>
		    </tr>
		  </tbody>
		</table>
		<div style="clear:both; margin-bottom:20px; padding-bottom:20px; ">
			<div id="map" style="margin-left:120px;	margin-top:50px; width:800px;height:600px; background:white; "></div>
			<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<!-- https://developers.kakao.com/ 회원가입 후 -> 내 애플리케이션 -> 애플리케이션 추가 -> 추가된 해당 앱을 클릭하면 발급받은  API키를 확인할 수 있음  -->			
			<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은API키&​libraries=services"></script>
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { //128.433182, 34.8544227
			        center: new kakao.maps.LatLng(34.8544227, 128.433182), // 지도의 중심좌표
			        level: 7 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch($("#addr").val(), function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
					
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+$('#place').val()+'</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
			</script>
		</div>
		<div class="buttons">
		  <a href="${path1 }/GetTourListCtrl.do" class="button is-info">전체 목록</a>
		  <a href="${path1 }/GetTourCateListCtrl.do?cate=${dto.cate }" class="button is-info">카테고리 목록</a>
		  <c:if test='${sid.equals("admin") }'>
			  <a href="${path1 }/DelTourCtrl.do?no=${dto.no }" class="button is-danger">장소 삭제</a>
			  <a href="${path1 }/ModifyTourCtrl.do?no=${dto.no }" class="button is-warning">장소 수정</a>
		  </c:if>
		</div>
    </div>
  </section>
  <script>
  //image Lazy Loading : 실제로 사용자 화면에 보여질 필요가 있을 때까지 이미지 로딩을 지연하는 것으로 네트워크 대역폭을 줄이는 방법
  /* document.addEventListener("DOMContentLoaded", function() {
	  var lazyloadImages = document.querySelectorAll("img.lazy");    
	  var lazyloadThrottleTimeout;
	  
	  function lazyload () {
	    if(lazyloadThrottleTimeout) {
	      clearTimeout(lazyloadThrottleTimeout);
	    }    
	    
	    lazyloadThrottleTimeout = setTimeout(function() {
	        var scrollTop = window.pageYOffset;
	        lazyloadImages.forEach(function(img) {
	            if(img.offsetTop < (window.innerHeight + scrollTop)) {
	              img.src = img.dataset.src;
	              img.classList.remove('lazy');
	            }
	        });
	        if(lazyloadImages.length == 0) { 
	          document.removeEventListener("scroll", lazyload);
	          window.removeEventListener("resize", lazyload);
	          window.removeEventListener("orientationChange", lazyload);
	        }
	    }, 20);
	  }
	  
	  document.addEventListener("scroll", lazyload);
	  window.addEventListener("resize", lazyload);
	  window.addEventListener("orientationChange", lazyload);
	}); */
  </script>
	
  <jsp:include page="/footer.jsp"></jsp:include>
  </body>
</html>