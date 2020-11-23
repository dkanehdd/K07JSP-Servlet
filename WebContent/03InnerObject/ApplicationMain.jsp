<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h3>web.xml에 설정한 내용 읽어오기</h3>
	<ul>
		<li>오라클드라이버:
		<%=application.getInitParameter("JDBCDriver") %></li>
		<li>오라클접속URL :
		<%=application.getInitParameter("ConnectionURL") %></li>
	</ul>
	
	<h3>컨텍스트 초기화 파라미터명 전체목록보기</h3>
	<ul>
	<%
	Enumeration<String> names = application.getInitParameterNames();
	while(names.hasMoreElements()){
		
		String name = names.nextElement();
		String value = application.getInitParameter(name);
	%>
		<li><%=name %> : <%=value %></li>
	<%} %>
	</ul>
	
	<h2>서버의 물리적 경로 얻어오기</h2>
	<ul>
		<li>application내장객체 : 
			<%=application.getRealPath("/images") %></li>
		<li>request내장객체 :
			<%=request.getServletContext().getRealPath("/images") %></li>
		<li>request내장객체(주로 서블릿에서 사용) : 
			<%=request.getRealPath("/images")%></li>
		<li>session 내장객체 :
			<%=session.getServletContext().getRealPath("/images") %></li>
		<li>config내장객체 : 
			<%=config.getServletContext().getRealPath("/images") %></li>
		<li>this키워드(주로선언부에서사용) : 
			<%=this.getServletContext().getRealPath("/images") %></li>
	</ul>
	
	<h2>선언부에서 물리적경로 사용하기</h2>
	<%!
	String getRealPath(){
		return this.getServletContext().getRealPath("/images");
	}
	
	String getRealPath(ServletContext app1){
		return app1.getRealPath("/images");
	}
	%>
	
</body>
</html>