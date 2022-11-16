<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path2" value="${pageContext.request.contextPath }" />  
<nav class="navbar" role="navigation" aria-label="main navigation" id="nav">
  <div class="navbar-brand">
    <a class="navbar-item" id="logo" href="<%=request.getContextPath() %>/">
    </a>

    <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
    </a>
  </div>

  <div id="navbarBasicExample" class="navbar-menu">
    <div class="navbar-start" id="gnb">
    	<!-- ajax로 메뉴 로딩하여 추가하기 -->
		<div class="navbar-item has-dropdown is-hoverable">
	    	<a class="navbar-link cate" id="cate01">
		      	관광
		    </a>
		    
		</div>
		<div class="navbar-item has-dropdown is-hoverable">
	    	<a class="navbar-link cate" id="cate02">
		      	체험
		    </a>
		</div>
		<div class="navbar-item has-dropdown is-hoverable">
	    	<a class="navbar-link cate" id="cate03">
		      	행사
		    </a>
		    
		</div>
		<div class="navbar-item has-dropdown is-hoverable">
	    	<a class="navbar-link cate" id="cate04">
		      	축제
		    </a>
		</div>
		<div class="navbar-item has-dropdown is-hoverable">
	    	<a class="navbar-link cate" id="cate05">
		      	숙박
		    </a>
		    
		</div>	
		<div class="navbar-item has-dropdown is-hoverable">
	    	<a class="navbar-link cate" id="cate06">
		      	음식
		    </a>
		    
		</div>
		<div class="navbar-item has-dropdown is-hoverable">
	    	<a class="navbar-link cate" id="cate07">
		      	쇼핑
		    </a>
		    
		</div>
		<div class="navbar-item has-dropdown is-hoverable">
	    	<a class="navbar-link">
		      	관광안내
		    </a>
			<div class="navbar-dropdown">
			     <a class="navbar-item" href="<%=request.getContextPath() %>/GetNoticeListCtrl.do">
			       	공지사항
			     </a>
		    </div> 
		</div>
		<div class="navbar-item has-dropdown is-hoverable">
		    <a class="navbar-link">
		      	통영에 대하여
		    </a>
		
		    <div class="navbar-dropdown">
		      <a class="navbar-item">
		        About
		      </a>
		      <a class="navbar-item">
		        Jobs
		      </a>
		      <a class="navbar-item">
		        Contact
		      </a>
		      <hr class="navbar-divider">
		      <a class="navbar-item">
		        Report an issue
		      </a>
		    </div>
	  </div>
	</div>
	
	<div class="navbar-end" id="tnb">
	  <div class="navbar-item">
	  	<c:if test="${empty sid }">
	 <div class="buttons">
	   <a href="${path2 }/user/agree.jsp" class="button is-primary">
	     <strong>Sign up</strong>
	   </a>
	   <a href="${path2 }/user/login.jsp" class="button is-light">
	     Log in
	   </a>
	 </div>
	</c:if>
	<c:if test="${not empty sid }">
	 <div class="buttons">
	   <a href="${path2 }/UserInfoCtrl.do" class="button is-primary">
	     <strong>Member Info</strong>
	   </a>
	   <a href="${path2 }/UserLogoutCtrl.do" class="button is-light">
	     LogOut
	   </a>
		<c:if test='${sid.equals("admin")}'>
		   <a href="${path2 }/AdminCtrl.do" class="button is-danger">
		     <strong>Admin</strong>
		   </a>
		 </c:if>
	 </div>
	</c:if>
  </div>
</div>
  </div>
</nav>
<script>
$(document).ready(function(){
	$.ajax({
		url:"${path2 }/MemuLoadCtrl.do",
		type:"POST",
		enctype:"UTF-8",
		datatype:"json",
		processData:false,
		contentType:false, 
		cache:false,
		success:function(data){
			$("#cate01").nextAll().remove();
			var trans = data;
			var tg = "";
			$.each(trans, function(key, value){
				if(key=="data"){
					for(var i=0;i<value.length;i++){
						console.log(value[i]);
						tg = tg + "<div class='navbar-dropdown'>";
						tg = tg + "<a href=''>"+value[i].place+"</a>";
						tg = tg + "</div>";
						$(tg).insertAfter("#cate01");
					}
				}
			});
		}
	});
});
</script>