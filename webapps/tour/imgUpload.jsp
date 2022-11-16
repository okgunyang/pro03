<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<%
	String no = request.getParameter("no");
	String tourno = request.getParameter("tourno");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 업로드</title>
<jsp:include page="../head.jsp" />
</head>
<body>
<form name="upload" id="upload" action="${path1 }/ImgUploadCtrl.do" method="post" enctype="multipart/form-data">
	<table class="table">
		<tr>
			<th>위치</th>
			<td>
				<input type="number" name="pos" id="pos" class="input" value="<%=no %>" />
			</td>
		</tr>
		<tr>
			<th>장소 번호</th>
			<td>
				<input type="text" name="tourno" id="tourno" class="input" value="<%=tourno %>" readonly />
			</td>
		</tr>
		<tr>
			<th>업로드 파일</th>
			<td>
				<div class="file">
				  <label class="file-label">
				    <input class="input" type="file" name="picname" id="picname" accept="image/*">
				  </label>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="field is-grouped">
				  <div class="control">
				    <button type="button" class="button is-link" onclick="fileUpload()">파일 업로드</button>
				  </div>
				  <div class="control">
				    <button type="reset" class="button is-link is-light">취소</button>
				  </div>
				  <div class="control">
				    <button type="button" class="button is-link is-light" onclick="picCheck()">확인</button>
				  </div>
				  <div class="control">
				    <button type="button" class="button is-link is-light" onclick="window.close()">닫기</button>
				  </div>
				</div>
			</td>
		</tr>
	</table>
	<div id="imgUpload">
		
	</div>
	<script>
	$(document).ready(function(){
		fileResearch();
	});
	</script>
	<script>
	function fileUpload(){
		if($("#picname").val()==""){
			alert("업로드할 파일을 지정하지 않으셨습니다.");
			return;
		}
		//파일 용량 제한
		var maxSize  = 10*1024*1024;    //10MB
		if ($('#picname').val() != "") { 
			var size = document.getElementById("picname").files[0].size;
			if(size > maxSize){
				alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다.");
				$('#picname').val("");
				$('#picname').focus();
				return false;
	        }
		}

		var form = $("#upload")[0];
		var indata = new FormData(form);
		$.ajax({
			url:"${path1 }/ImgUploadCtrl.do",
			type:"POST",
			enctype:"multipart/form-data",
			data:indata,
 			processData:false,
			contentType:false, 
			cache:false,
			success:function(data){
				var trans = $.parseJSON(data); 
				$("#imgUpload").empty();
								
				//console.log(key[1]+", "+key[2]);
				var tg = "";
				$.each(trans, function(key, value){
					if(key=="picList"){
						for(var i=0;i<value.length;i++){
							console.log(value[i].picname);
							tg = tg + "<div style='float:left;'><img src='${path1 }/upload/"+value[i].picname+"' alt='"+value[i].tourno+"' style='max-width:300px'/></div>";
						}
					}
				});
				$("#imgUpload").html(tg);
			}
		});
	}
	function fileResearch(){
		var params = {
				tourno : $("#tourno").val()
		};
		$.ajax({
			url:"${path1 }/ImgResearchCtrl.do",
			type:"post",
			encType:"UTF-8",
			data:params,
 			processData:false,
			contentType:false, 
			cache:false,
			success:function(data){
				var trans = $.parseJSON(data); 
				$("#imgUpload").empty();
				var tg = "";
				$.each(trans, function(key, value){
					if(key=="picList"){
						for(var i=0;i<value.length;i++){
							console.log(value[i].picname);
							tg = tg + "<div style='float:left'><img src='${path1 }/upload/"+value[i].picname+"' alt='"+value[i].tourno+"' style='max-width:300px' /></div>";
						}
					}
				});
				$("#imgUpload").html(tg);
			}
		});
	}
	</script>
	<script>
	function picCheck(){
		if(document.upload.pos.value=="1" || document.upload.pos.value==1){
			opener.document.frm1.pic_ck1.value = "yes";
			opener.document.frm1.pic1.value = document.upload.picname.value;
		} 
		window.close();
	}
	</script>
</form>
</body>
</html>