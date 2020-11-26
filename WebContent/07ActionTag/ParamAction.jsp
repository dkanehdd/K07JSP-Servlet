<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
request.setAttribute("member", new MemberDTO("Sung","9999","성춘향",null));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParamAction.jsp</title>
</head>
<body>
	<h2>인클루드 되는 페이지로 파라미터 전달하기</h2>
	
	<jsp:include page="ParamActionIncludeResult.jsp">
		<jsp:param value="이몽룡" name="name"/>
		<jsp:param value="Lee" name="id"/>
	</jsp:include>
	
	<%
	String pageURL = "ParamActionForwardResult.jsp?query=반갑습니다";
	String paramValue = "KOSMO";
	
	request.setAttribute("member", new MemberDTO("Lee", "7777","이몽룡",null));
	%>
	<jsp:forward page="<%=pageURL %>">
		<jsp:param value="한국소프트웨어인재개발원" name="name"/>
		<jsp:param value="<%=paramValue %>" name="id"/>
	</jsp:forward>
</body>
</html>