<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script
  src="https://code.jquery.com/jquery-3.6.1.js"
  integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
  crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
		
	$.ajax({
		 
		url		:	'${pageContext.request.contextPath}/account',
		method	:	'post',
		data	:	{
			accountNo:	'41268802978822'
		},
		success:	function(res){
			alert('성공');
			console.log(res);
		},
		error	:	function(){
			alert('실패');
		},
		complete	:function(){
			alert('완료')
		}				
	})			
})

</script>
</body>
</html>