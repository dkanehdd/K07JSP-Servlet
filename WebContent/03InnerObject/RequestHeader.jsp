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
	<h2>요청 헤더정보 출력하기</h2>
	<%
	Enumeration headers = request.getHeaderNames();
	while(headers.hasMoreElements()){
		
		String headerName = (String)headers.nextElement();
		
		String headerValue = 
			request.getHeader(headerName);
		out.println(String.format("헤더명:%s, 헤더값:%s<br/>",headerName 
				, headerValue));
	}
	%>
	<h2>요청헤더명으로 브라우저 종류 알아내기</h2>
<%
	String webBrowser = request.getHeader("user-agent");
	if(webBrowser.toUpperCase().contains("MSIE")){
		out.println("인터넷익스플로러");
	}
	else if(webBrowser.toUpperCase().contains("FIREFOX")){
		out.println("파이어폭스");
	}
	else if(webBrowser.toUpperCase().contains("CHROME")){
		out.println("크롬");
	}
	else{
		out.println("기타브라우져");
	}
%>	

</body>
</html>