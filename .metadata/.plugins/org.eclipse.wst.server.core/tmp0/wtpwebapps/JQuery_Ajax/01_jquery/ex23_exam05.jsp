<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한 줄 뉴스 - 자바스크립트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
	var news=[
		"이화영 말 바꾸자…이재명 검찰이 수사 아닌 정치 한다"
		
		
		]
				
		
	var index = 0;
	setInterval(() => {
		$("#mydiv").text(news[index++]);
		if(index==news.length) index = 0;
	}, 2000);
	});

	
</script>
</head>
<body>
	<div id="mydiv"></div>
	
</body>
</html>