<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		width: 800px; margin-top: 50px; border-collapse: collapse;
	}
	table, th, td {
	    border: 1px solid red; text-align: center;
    }
    #out{
    	width:800px;
    	margin: auto;
    }
</style>
<%-- jQuery 라이브러이 CDN --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
	 $("#btn1").on("click", function() {
		$("#out").empty();
		$.ajax({
			url: "/TestXML",
			dataType: "xml",
			method : "get",
			success : function(data){
				// console.log(data);
				var table ="<table>";
				table += "<thead><tr><th>지역</th><th>온도</th><th>상태</th><th>아이콘</th></tr></thead>";
				table +="<tbody>";
				$(data).find("local").each(function() {
					table += "<tr>";
					table += "<td>" + $(this).text() +"</td>";
					table += "<td>" + $(this).attr("ta") +"</td>";
					table += "<td>" + $(this).attr("desc") +"</td>";
					table += "<td><img src='http://www.kma.go.kr/images/icon/NW/NB"+ $(this).attr("icon") +".png'></td>";
					table += "</tr>";
				});
				table += "</tbody></table>";
				$("#out").append(table);
			},
			error :function(){
				alert("읽기실패");
			},
		});
	});
	/* 
	 js를 활용한 천단위 콤마
	 정규식  (예)
	 const ori_val = 12345.6789;
	 const changed_val = ori_val.toString().replace(/\B(?<!.\d*)(?=(\d{3})+(?!\d))/g, ",");
	 내장함수사용(예)
	  toLocaleString('ko-KR', {maximumFractionDigits: 2}) 
	 */
	 $("#btn2").on("click", function() {
			$("#out").empty();
			$.ajax({
				url: "/MyController7",
				dataType: "json",
				method : "get",
				success : function(data){
					// console.log(data);
					var table ="<table>";
					table += "<thead><tr><th>시·도별</th><th>총인구</th><th>1차 접종 누계</th><th>1차 접종 퍼센트</th><th>2차 접종 누계</th><th>2차 접종 퍼센트</th></tr></thead>";
					table +="<tbody>";
					$.each(data, function(k,v) {
						table += "<tr>";
						table += "<td>" + v["시·도별(1)"] + "</td>";
						table += "<td>" + v["총인구 (명)"].toLocaleString() + "</td>";
						table += "<td>" + v["1차 접종 누계"].toLocaleString() + "</td>";
						table += "<td>" + v["1차 접종 퍼센트"].toLocaleString('ko-KR', {maximumFractionDigits: 2}) + "% </td>";
						table += "<td>" + v["2차 접종 누계"].toLocaleString() + "</td>";
						table += "<td>" + v["2차 접종 퍼센트"].toLocaleString('ko-KR', {maximumFractionDigits: 2}) + "% </td>";
						table += "</tr>";
					});
					
					table += "</tbody></table>";
					$("#out").append(table);
					
				},
				error :function(){
					alert("읽기실패");
				},
			});
		});
 });
 </script>
</head>
<body>
	<div style="width: 800px; margin: auto">
		<button id="btn1">xml 정보가져오기</button>		
		<button id="btn2">json 정보가져오기</button>		
	</div>
	<br><br><br>
	<div id="out"></div>
</body>
</html>










