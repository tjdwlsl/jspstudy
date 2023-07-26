<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type = "text/javascript">
		<%-- XMLHttpRequest 객체 : ajax를 실행 할 때 사용하는 객체--%>
		
		//1.객체 생성
		var request = new XMLHttpRequest();
		
		//2. open("전송방식", "경로", "비동기 여부")
		request.open("POST", "data.html", false);
		
		//3. send() : 실행
		request.send();
		
		//4. 화면에 출력 : innerHTML or append
		//document.body.append(request.responseText);
		//append를 사용하면 코드 자체를 가져옴
		document.body.innerHTML += request.responseText;
	</script>
</body>
</html>