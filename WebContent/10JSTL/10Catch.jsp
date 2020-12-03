<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10Catch.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>catch 태 그</h2>
	<c:set var="fnum" value="100"/>
	<c:set var="snum" value="0"/>
	
	<h3>에러가 안나는 경우 : 에러내용이 저장안됨</h3>
	
	<h4>catch태그 밖에서 실행</h4>
	fnum / snum : ${fnum/snum }
	<br />
	
	<h4>catch태그 안에서 실행</h4>
	<c:catch var="errorMessage">
		fnum / snum : ${fnum/snum } <br />
	</c:catch>
	에러내용 : ${errorMessage }
	
	<h3>에러가 나는 경우 : 원하는 위치에 에러내용 표시</h3>
	
	<c:catch var="errorMessage">
		${"백" + 100 }
	</c:catch>
	에러내용 : ${errorMessage }
</body>
</html>