<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");

MemberDTO member1 = new MemberDTO();

member1.setId(id);
member1.setPass(pass);
member1.setName(name);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>useBean 액션태그로 폼의 하위요소값 받기</h2>
	
	<h3>자바코드를 통해 받기</h3>
	<ul>
		<li><%=member1.getId() %></li>
		<li><%=member1.getPass() %></li>
		<li><%=member1.getName() %></li>
	</ul>
	
	<h3>액션태그로 폼값받기</h3>
	<jsp:useBean id="actionMember" class="model.MemberDTO"/>
	<jsp:setProperty property="*" name="actionMember"/>
	<ul>
		<li><%=actionMember.getId() %></li>
		<li><%=actionMember.getPass() %></li>
		<li><%=actionMember.getName() %></li>
	</ul>
</body>
</html>