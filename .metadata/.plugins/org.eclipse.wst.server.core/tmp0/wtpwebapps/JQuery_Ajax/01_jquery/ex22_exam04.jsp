<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한 줄 뉴스 - 자바스크립트</title>
<script type="text/javascript">
	var news=[
		"이화영 말 바꾸자…이재명 검찰이 수사 아닌 정치 한다"
		
		"인터파크트리플 올 상반기 송출객 123만명, 역대 최대"
		"골칫덩이 전락한 1600억 FW, 포체티노도 손놓았다" ]
				
		
	var index = 0;
	var timer;
	function start_news(){
		//2초마다 showNews()를 실행 하자(showNews() 콜백함수)
		timer = setInterval(showNews, 2000);
	}
	function showNews() {
		var div = document.getElementById("mydiv");
		div.innerHTML = news[index++];
		if(index == news.length){
			index=0;
		}
	}
	function stop_news() {
		//setInterval()을 중지 시키는 함수
		clearInterval(timer);
	}
	
</script>
</head>
<body>
	<div id="mydiv"></div>
	<button onclick="start_news()">뉴스보기</button>
	<button onclick="stop_news()">뉴스중지</button>
</body>
</html>