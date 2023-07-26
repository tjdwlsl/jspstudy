<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTML 탐색 : children</title>
<style type="text/css">
.myclass * {
	display: block;
	border: 1px solid gray;
	padding: 5px;
	margin: 10px;
}
</style>
<%-- jQuery 라이브러리 CDN --%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//children(selector) : 어떤 요소의 자식 요소를 선택
		//find(selector) : 어떤 요소의 하위 요소 중 특정 요소를 찾을 때 사용
		
		//div 자식 요소 중 p 요소 선택 (여러개일 때는 복수 가능)
		
// 		$(".myclass").children("p").css({
// 			"color" : "red",
// 			"border" : "5px solid red"
// 		});
		
		$(".myclass").children(".p1").css({
			"background" : "skyblue"
		});
// 		$(".myclass").children(".p2").css({
// 			"color" : "orange",
// 			"border" : "5px solid red"
// 		});

		$(".myclass").find(".p1").css({
			"color" : "red",
			"border" : "5px solid red"
		});
	});
</script>
</head>
<body>
	<div class="myclass" style="width: 500px;">
		Mydiv
		<p class="p1">
			p(child) <span>span(grandchild)</span>
		</p>
		<p class="p2">
			p(child) <span>span(grandchild)</span>
		</p>
	</div>
</body>
</html>