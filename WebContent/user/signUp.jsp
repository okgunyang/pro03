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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>회원가입</title>
<jsp:include page="/head.jsp" />
<style>
.title { padding-top:36px; padding-bottom:20px; }
#id { width:780px; float:left; margin-right:30px; margin-left:6px; }
</style>
</head>
<body>
<jsp:include page="/header.jsp" />
  <section class="section">
    <div class="container">
	<h2 class="title">회원가입</h2>
	<form name="frm1" id="frm1" action="${path1 }/AddUserCtrl.do" method="post" onsubmit="return joinCheck(this)">
		<table class="table">
			<tbody>
				<tr>
					<th>아이디</th>
					<td>
						<div class="form-row">
							<input type="text" name="id" id="id" placeholder="아이디 입력" class="input" autofocus required />
							<input type="button" class="button is-info" value="아이디 중복 확인" onclick="idCheck()">
							<input type="hidden" name="idck" id="idck" value="no">
						</div>
						<div>
							<c:if test="${empty qid }">
							<p id="msg" style="padding-left:0.5rem">아직 아이디 중복 체크를 하지 않으셨습니다.</p>
							</c:if>
							<c:if test="${not empty qid }">
							<p id="msg" style="padding-left:0.5rem">아이디 중복 체크후 수정하였습니다.</p>
							</c:if>
						</div>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw" id="pw" placeholder="비밀번호 입력" class="input" required /></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="pw2" id="pw2" placeholder="비밀번호  확인 입력" class="input" required /></td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td><input type="text" name="name" id="name" placeholder="이름 입력" class="input" required /></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" name="email" id="email" placeholder="이메일 입력" class="input" required></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" name="birth" id="birth" placeholder="생년월일 입력" class="input" required></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="tel" name="tel" id="tel" maxlength="11" placeholder="전화번호 숫자만 입력 00000000000" class="input" required></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address1" id="address1" placeholder="기본 주소 입력" class="input" required /><br>
					<input type="text" name="address2" id="address2" placeholder="상세 주소 입력" class="input" required /><br>
					<input type="text" name="postcode" id="postcode" style="width:160px;float:left;margin-right:20px;" placeholder="우편번호" class="input">
					<button id="post_btn" onclick="findAddr()" class="button is-info">우편번호 검색</button>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="btn-group">
			<input type="submit" name="submit-btn" class="button button-info" value="회원가입">
			<input type="reset" name="reset-btn" class="button button-info" value="취소">
			<a href="<%=request.getContextPath() %>/user/login.jsp" class="button button-danger">로그인</a>
		</div>
	</form>	
	<script>
	$(document).ready(function(){
		$("#id").keyup(function(){
			$("#idck").val("no");
			if($(this).val()!=""){
				$("#msg").html("<strong>아이디 입력중입니다.</strong>");
			} else {
				$("#msg").html("아직 아이디 중복 체크를 하지 않으셨습니다.");
			}
		});
	});
	</script>
	<script>
	function idCheck(){
		if($("#id").val()==""){
			alert("아이디를 입력하지 않으셨습니다.");
			$("#id").focus();
			return;
		} 
		var params = {	id : $("#id").val()	} //전송되어질 데이터를 객체로 묶음
		$.ajax({
			url:"${path1 }/IdCheckCtrl.do",	//아이디가 전송되어질 곳
			type:"post",		//전송방식
			dataType:"json",	//데이터 반환 방식
			data:params,		//전송방식이 post인 경우 객체로 묶어서 전송
			success:function(result){
				console.log(result.result);
				var idChk = result.result;	//true 또는 false를 받음
				if(idChk==false){	//사용할 수 없는 아이디
					$("#idck").val("no");
					$("#msg").html("<strong style='color:red'>기존에 사용되고 있는 아이디 입니다. 다시 입력하시기 바랍니다.</strong>");
					$("#id").focus();
				} else if(idChk==true){	//사용 가능한 아이디
					$("#idck").val("yes");
					$("#msg").html("<strong style='color:blue'>사용가능한 아이디 입니다.</strong>");
				} else if(idck==""){
					$("#msg").html("<strong>아이디가 확인되지 않았습니다. 다시 시도해주시기 바랍니다.</strong>");
				}
			}
		});
	}
	function joinCheck(f){
		if(f.pw.value!=f.pw2.value){
			alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
			f.pw.focus();
			return false;
		}
		if(f.idck.value!="yes"){
			alert("아이디 중복 체크를 하지 않으셨습니다.");
			return false;
		}
	}
	</script>
	<script>
	function findAddr() {
		new daum.Postcode({
			oncomplete: function(data) {
				console.log(data);
				var roadAddr = data.roadAddress;
				var jibunAddr = data.jibunAddress;
				document.getElementById("postcode").value = data.zonecode;
				if(roadAddr !== '') {
					document.getElementById("address1").value = roadAddr;				
				} else if(jibunAddr !== ''){
					document.getElementById("address1").value = jibunAddr;
				}
				document.getElementById("address2").focus();
			}
		}).open();
	}
	</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</div>
</section>
<%@ include file="../footer.jsp" %>
</body>
</html>