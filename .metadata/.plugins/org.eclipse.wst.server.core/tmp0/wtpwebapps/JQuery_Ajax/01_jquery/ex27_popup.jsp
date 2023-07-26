<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		background-color: lightyellow;
	}
	
	#movie{
		position: absolute;
	}
	
	#close{
		padding: 30px;
		text-align: right;
	}
	
</style>
<%-- jQuery 라이브러리 CDN --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript"> 
$(document).ready(function(){
	
});
</script>
</head>
<body>
	<div id="movie">
	<h3>공지사항-One</h3>
		<img alt="" src="../images/pds4_z.jpg">
		<div id="close">닫기</div>
	</div>
	<h2>ICT 사진관</h2>
	<div>
		<p>사진관 오시는길</p>
		<p>2호선 신촌역</p>
	</div>
</body>
</html>