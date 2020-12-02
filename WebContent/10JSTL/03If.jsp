<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03If.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>if태그</h2>
	<c:set var="numVar" value="100"/>
	<c:set var="strVar" value="JAVA"/>
	
	<h3>JSTL의 if태그로 짝수/홀수 판단하기</h3>
	<c:if test="${numVar mod 2 eq 1 }" var="result">
		${numVar }는 짝수입니다. <br />
	</c:if>
	\${result } : ${result } <br/>
	
	<h3>위 if문을 EL식의 삼항식으로 표현</h3>
	${numVar } : ${numVar mod 2 == 0 ? "는 짝수" : "는 홀수" }
	
	<h3>문자열 비교</h3>
	<c:if test="${JAVA eq '자바' }">
		${strVar }는 자바다 <br />
	</c:if>
	<c:if test="${JAVA ne '자바' }">
		${strVar }는 자바가 아니다 <br />
	</c:if>
	
	<h2>if문 사용시 주의사항</h2>
	<h3>항상 출력되거나 출력되지 않는 조건식</h3>
	<c:if test="${true }">
		난 항상 출력되~~!
	</c:if>
	<c:if test="${false }">
		난 절되 출력되지 않음~
	</c:if>
	
	<h3>test속성에 일반값으로 조건지정</h3>
	<c:if test="100" var="result">
		100은 일반값이므로 무조건 false반환
	</c:if>
	\${result } : ${result } <br />
	
	<c:if test="tRuE" var="result">
		TRUE(true) 대소문자 구분없음. 항상 참임 <br />
	</c:if>
	\${result } : ${result } <br />
	
	<h3>EL식으로 조건판단시 {}양쪽에 공백이 있으면 무조건 false로 판단됨</h3>
	<c:if test=" \${변수 eq 값 } " var="result">
		빈 공백이 있어서 무조건 false처리됨
	</c:if>
	\${result } : ${result } <br />
	
	<!-- 
	아이디, 패스워드를 입력후 submit 한후 EL식을 통해 파라미터로 받은후
	"kosmo", "1234" 인 경우에는 "kosmo님 하이룽~" 이라고 출력한다. 
	만약 틀렸다면 "아이디와 비번을 확인하세요" 를 출력한다. 
	EL과 JSTL의 if태그만을 이용해서 구현하시오.
	 -->

	<h3>연습문제 : if태그</h3>
	<form method="get">
		아이디 : <input type="text" name="user" />
		<br />
		패스워드 : <input type="text" name="pass" />
		<br />
		<input type="submit" value="로그인" />
	</form>	
	<c:if test="${param.user=='kosmo' && param.pass=='1234' }">
		kosmo님 하이룽~
	</c:if>
	<c:if test="${param.user!='kosmo' || param.pass!='1234' }">
		아이디와 비번을 확인하세요
	</c:if>
	
</body>
</html>