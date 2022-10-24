<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script>
		const myChart = new Chart(document.getElementById('myChart'), config);

		const data = {
			labels : [ 'Red', 'Blue', 'Yellow' ],
			datasets : [ {
				label : 'My First Dataset',
				data : [ 300, 50, 100 ],
				backgroundColor : [ 'rgb(255, 99, 132)', 'rgb(54, 162, 235)',
						'rgb(255, 205, 86)' ],
				hoverOffset : 4
			} ]
		};
	</script>
	<script type="text/javascript">
	let json =  { 
			apikey : ''
			, accountNo : 41207881249596
		}

	$.ajax({
			url : 'http://13.209.81.235/HanaBank/account',
			method : 'get',
			data : JSON.stringify(json),
			contentType: "application/json",
			success : function(res) {
			console.log('성공');
		},
		error : function() {
			console.log('실패');
		}
	})
	</script>
</body>
</html>