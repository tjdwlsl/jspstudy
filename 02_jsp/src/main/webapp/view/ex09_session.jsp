<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 : session</title>
</head>
<body>
<%--
	세션과 쿠키
	세션(서버) : 서버와 클라이언트간의 접속을 유지 시켜주기 위한 객체
		  (http는 요청을 하고 응답을 하면 접속이 끊어짐)
		  클라이언트에서 서비스를 요청하면 서버측에서 클라이언트에게
		  서비스를 제공하면서 클라이언트를 구별할 수 있는 세션 ID부여 
		  서버측에서 해당 ID로 이전 접속 여부를 구별함
	
	쿠키 : 클라이언트에서 정보를 저장 공간
		  팝업창에 오늘하루만 보기
		  
	-- 주요메서드
	데이터 저장 : session.setAttribute("이름", 데이터);
	데이터 호출 : session.getAttribute("이름);
	
	**해당 속성만 삭제 : session.remoteAttribute("이름");
	
	getID() : 세션의 고유ID 추출
	getCreateTime() : 세션이 생성된 시간을 반환
	getLastAccessedTime() : 마지막에 접근한 시간 반환
	invalidate() : 세션전체초기화
	setMaxInativeInterval(시간) : 세션 시간 제한
	
	** 세션에 생명 주기는 제한시간을 지정하지 않으면 브라우저가 종료되면 세션 데이터도 사라짐
 --%>

	<% Date time = new Date(); %>
	<h1>세션 연습</h1>
	<h2>
		<p>세션 ID : <%=session.getId() %></p>	
		<p>현재시간 : <%=time %></p>
		
		<% time.setTime(session.getCreationTime()); %>
		<p>생성된 시간 : <%=time %></p>	

		<% time.setTime(session.getLastAccessedTime()); %>
		<p>최근 접근시간 : <%=time %></p>	
	</h2>

</body>
</html>