<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path0" value="<%=request.getContextPath() %>" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
body, html { font-family: 'Noto Sans KR', sans-serif; }
.table { min-width:960px; }
#logo { display:block; width:73px; height:67px; background-image:url("https://www.tongyeong.go.kr/_res/portal/img/inc/logo2022.png");
background-size:75% auto; background-repeat:no-repeat; background-position:center center; }
#nav-group { border-bottom:3px solid #ddd; }
#gnb .navbar-link::after { content:""; display:none; }
#sidebar .navbar { display:block; width:100%; background-color:transparent; }
#sidebar .navbar-item { float:none; clear:both; display:block; width:100%; }
#frm1 .inline { width:70%; float:left; margin-right:2%; }
.navbar-item.has-dropdown.is-hoverable { min-width:110px; position:static; }
.navbar-item.has-dropdown.is-hoverable a { font-weight:800; }
.navbar-item.has-dropdown.is-hoverable.single { position:relative; }
#nav .navbar-dropdown.cate { min-width:940px; width:940px; position:absolute; left:50px; }
#nav .navbar-dropdown.single { min-width:150px; width:150px; left:auto; top:68px; }
#nav .navbar-dropdown.cate a { display:inline-block; padding:8px; margin-right:20px;  
width:120px; text-overflow:ellipsis; overflow:hidden; white-space:nowrap; 
font-weight:500; }
#nav .navbar-dropdown.single a { display:inline-block; width:150px; text-overflow:ellipsis; overflow:hidden; white-space:nowrap; 
font-weight:500; }
p.title { font-size:1.4rem; }
p.subtitle { font-size:1.1rem; }
.item_com {   overflow: hidden;  text-overflow: ellipsis;  display: -webkit-box;
  -webkit-line-clamp: 3;  -webkit-box-orient: vertical; font-size:0.9rem; }
.breadcrumb ul li:last-child { padding-right:1.5rem; }
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>