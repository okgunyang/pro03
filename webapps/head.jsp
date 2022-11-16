<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path0" value="<%=request.getContextPath() %>" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<style>
.table { min-width:960px; }
#logo { display:block; width:73px; height:67px; background-image:url("https://www.tongyeong.go.kr/_res/portal/img/inc/logo2022.png");
background-size:75% auto; background-repeat:no-repeat; background-position:center center; }
#nav { border-bottom:3px solid #ddd; }
#gnb .navbar-link::after { content:""; display:none; }
#sidebar .navbar { display:block; width:100%; background-color:transparent; }
#sidebar .navbar-item { float:none; clear:both; display:block; width:100%; }
#frm1 .inline { width:70%; float:left; margin-right:2%; }
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>