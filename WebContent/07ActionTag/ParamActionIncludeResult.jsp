<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>인클루드 된 페이지</h2>
	
	<h3>param액션태그로 전달된 값 출력하기</h3>
	<ul>
		<li>queryString : <%=request.getParameter("query") %></li>
		<li>name : <%=request.getParameter("name") %></li>
		<li>id : <%=request.getParameter("id") %></li>
	</ul>
	
	<h2>영역에 저장된 데이터 읽기</h2>
	<%=request.getAttribute("member") %>
</body>
</html>