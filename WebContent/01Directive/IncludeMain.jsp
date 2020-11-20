<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	include지시어 : 공통으로 사용할 jsp파일을 생성한후
		현재문서에 포함시킬때 사용한다. 각각의 jsp파일 상단에는
		반드시 page지시어가 삽입되어야 한다.
		단, 하나의 jsp파일에서는 page지시어가 중복선언되면 안된다.
 --%>
<%@ include file = "IncludePage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- CSS코드는 양이 많으므로 외부파일로 선언하여 현재문서에 링크시킨다. -->
<link rel="stylesheet" href="./css/div_layout.css" />
</head>
<body>
	<div class="AllWrap">
		<div class="header">
			<!-- GNB영역 (Global Navigation Bar) -->
			<%@ include file="../common/Top.jsp" %>
		</div>
		<div class="body">
			<div class="left_menu">
				<!-- LNB영역(Local Navigation Bar) -->
				<%@ include file="../common/Left.jsp" %>
			</div>
			<div class="contents">
				<!-- Contents 영역 -->
				<%-- 
				해당 변수는 외부파일에 선언하여 본 문서에 include처리 되었다.
				include는 문서자체를 포함시키는 개념이므로 에러가 발생하지 않는다.
				 --%>
				<h2>오늘의 날짜 : <%=todayStr %></h2>
				<br /><br />
				이연희 임재희 기자 = 정부가 서울의 신종 코로나바이러스 감염증(코로나19) 지역사회 감염 확산 속도가 빨라 지난 2~3월, 8월에 이어 3차 유행이 진행되고 있다고 진단했다.

				또한 수도권 거리두기 1.5단계 기간인 2주 내라도 확산세가 꺾이지 않아 사회적 거리두기 2단계 격상 기준을 충족하면 2단계로 상향 조정할 수 있다는 뜻을 밝혔다.
				
				<br /><br />
			</div>
		</div>
		<div class="copyright">
			<%@ include file="../common/Copyright.jsp" %>
		</div>
	</div>
</body>
</html>