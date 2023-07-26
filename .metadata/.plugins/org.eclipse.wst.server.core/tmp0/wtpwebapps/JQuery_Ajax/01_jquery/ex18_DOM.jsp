<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTML 탐색(필터링) : first, last, eq, filter, not</title>
<style type="text/css">
div {
	border: 1px solid black;
	width: 150px;
	padding: 5px;
	margin: 15px;
}
</style>
<%-- jQuery 라이브러리 CDN --%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	//first : 지정한 요소의 첫번째 요소
	//last : 지정한 요소의 마지막 요소
	//eq(index) : 해당 index에 해당하는 요소
	//filter : 선택된 요소들의 일부분을 추출
	//not : filter의 반대
	
	$(document).ready(function() {
		$("div").first().css("background", "yellow");
	});
	
	$(document).ready(function() {
		$("div").last().css("background", "orange");
	});
	
	$(document).ready(function() {
		$("div").eq(2).css({"background": "skyblue", "color" : "red"});
	});
	
	// :odd => 홀수 :even => 짝수
	$(document).ready(function() {
		$("div").filter(":odd").css({"background": "pink", "color" : "#ffffff"});
	});
	$(document).ready(function() {
		$("div").not(":odd").css({"border" : "2px solid gray", "color" : "#eecc99"});
	});
</script>
</head>
<body>
	<div>
		<p>여기는 문서 태그</p>
		<p>여기는 문서 태그</p>
	</div>
	<div>
		<p>여기는 문서 태그</p>
		<p>여기는 문서 태그</p>
	</div>
	<div>
		<p>여기는 문서 태그</p>
		<p>여기는 문서 태그</p>
	</div>
	<div>
		<p>여기는 문서 태그</p>
		<p>여기는 문서 태그</p>
	</div>
	<div>
		<p>여기는 문서 태그</p>
		<p>여기는 문서 태그</p>
	</div>
</body>
</html>