<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>07Redirect.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<c:set var="requestVar" value="리퀘스트영역저장" scope="request"/>
	
	<h3>자바 코드로 리다이렉트</h3>
	<%
	response.sendRedirect(request.getContextPath() +
			"/10JSTL/inc/ImportPage.jsp?user_id="+
			URLEncoder.encode("KOREA[한국]")+"&user_pw="+
			URLEncoder.encode("Fighting[화이팅]"));
	%>
	
	<h3>JSTL로 리다이렉트</h3>
	<c:redirect url="/10JSTL/inc/ImportPage.jsp">
		<c:param name="user_id" value="Korea[한국]"/>
		<c:param name="user_pw" value="Germany[독일]"/>
	</c:redirect>
</body>
</html>