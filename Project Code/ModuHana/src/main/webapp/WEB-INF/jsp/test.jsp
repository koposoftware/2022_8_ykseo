<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${ path }/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
	
</head>
<body>
	<script src="${ path }/resources/assets/js/jquery-3.6.1.min.js"></script>
	<script>	
	let json = { 
			apiKey : ''
    		, accountNo : 000
    	}
	console.log(JSON.stringify(json));
	
	$.ajax({

		url : 'http://localhost:9990/HanaBank/account',
		type : 'GET',
		data : json,
		contentType: "application/json",
		success : function(res) {
			console.log('성공');
			console.log(res);
		},
		error : function(res) {
			console.log(res)
			alert('실패');
		}
	})
	</script>
<!-- 	<script>	
	let json = { 
			apiKey : ''
    		, accountNo : '41209465170991'
    	}
	
	$.ajax({

		url : 'http://localhost:9990/HanaBank/account',
		type : 'GET',
		data : json,
		dataType: "json",
		contentType: "application/json",
		success : function(res) {
			console.log('성공');
			console.log(res);
		},
		error : function() {
			alert('실패');
		}
	})
	</script> -->
</body>
</html>

