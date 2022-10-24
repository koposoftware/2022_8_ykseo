<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!--
=========================================================
* Material Dashboard 2 - v3.0.0
=========================================================

* Product Page: https://www.creative-tim.com/product/material-dashboard
* Copyright 2021 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://www.creative-tim.com/license)
* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76" href="${ path }/resources/assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="${ path }/resources/assets/img/favicon.png">
<title>Material Dashboard 2 by Creative Tim</title>
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
<!-- Nucleo Icons -->
<link href="${ path }/resources/assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="${ path }/resources/assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
<!-- Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
<!-- CSS Files -->
<link id="pagestyle" href="${ path }/resources/assets/css/main.css" rel="stylesheet" />
<link id="pagestyle" href="${ path }/resources/assets/css/material-dashboard.css?v=3.0.0" rel="stylesheet" />
<link id="pagestyle" href="${ path }/resources/assets/css/loading-bar.css" rel="stylesheet" />
</head>

<style>
	input {
		padding: 0 20px;
	}
	textarea {
		padding: 20px;
	}
</style>
<body class="g-sidenav-show  bg-gray-200">
	<%@include file="/WEB-INF/jsp/include/sidebar_mail.jsp" %>
	
	<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
	
		<!-- Navbar -->
		<%@include file="/WEB-INF/jsp/include/navbar.jsp" %>
		<!-- End Navbar -->
		
			
		<div class="container-fluid py-4">
		
			<div class="row">
				<form method="post" action="${ path }/mail/${ project.projectSeq }">
					<div class="col-lg-10 col-md-6 mb-4">
						<div class="card z-index-2">
							<div class="card-body">
								<div class="row mt-3">
									<div class="col-lg-1">
										<p>받는이</p>
									</div>
									<div class="col-lg-11">
										<input name="toMail" type="text" class="rounded border border-gray"  style="width: 100%;height:50px" value="${ corpEmail }"/>
									</div>
								</div>
								<div class="row mt-3">
									<div class="col-lg-1">
										<p>제목</p>
									</div>
									<div class="col-lg-11">
										<input name="title" type="text" class="rounded border border-gray"  style="width: 100%;height:50px" />
									</div>
								</div>
								<div class="row mt-3">
									<div class="col-lg-1">
										<p>첨부파일</p>
									</div>
									<div class="col-lg-9">
										<input name="file" type="file" class="rounded border border-gray"  style="width: 100%;height:50px" hidden="hidden"/>
										<input name="fileType" type="text" class="rounded border border-gray"  style="width: 100%;height:50px" />
									</div>
									<div class="col-lg-2">
										<!-- <button class="w-100 h-100 mb-0 rounded rounded-3" type="button" style="border:none;color:white;background-color:gray;font-size:15px">파일선택</button> -->
										<button class="btn bg-gradient-secondary w-100 mb-0 toast-btn" type="button">파일선택</button>
									</div>
								</div>
								<div class="row mt-3">
									<div class="col-lg-1">
										<p>내용</p>
									</div>
									<div class="col-lg-11">
										<textarea name="content" class="rounded border border-gray" rows="20px" cols="100%" style="width: 100%;"></textarea>
									</div>
								</div>
								<div class="row mt-3">
									<div class="col-lg-8">
									</div>
									<div class="col-lg-2">
										<button class="btn bg-gradient-primary w-100 mb-0 toast-btn" type="submit" data-target="successToast">전송</button>
									</div>
									<div class="col-lg-2">
										<button class="btn bg-gradient-secondary w-100 mb-0 toast-btn" type="reset" data-target="successToast">취소</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			
			<%@include file="/WEB-INF/jsp/include/footer.jsp" %>
		</div>
	</main>
	<%@include file="/WEB-INF/jsp/include/sidecard.jsp" %>
	<!--   Core JS Files   -->
	<script src="${ path }/resources/assets/js/core/popper.min.js"></script>
	<script src="${ path }/resources/assets/js/core/bootstrap.min.js"></script>
	<script src="${ path }/resources/assets/js/plugins/perfect-scrollbar.min.js"></script>
	<script src="${ path }/resources/assets/js/plugins/smooth-scrollbar.min.js"></script>
	<script>
		var win = navigator.platform.indexOf('Win') > -1;
		if (win && document.querySelector('#sidenav-scrollbar')) {
			var options = {
				damping : '0.5'
			}
			Scrollbar.init(document.querySelector('#sidenav-scrollbar'),
					options);
		}
	</script>
	
	
	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="${ path }/resources/assets/js/material-dashboard.min.js?v=3.0.0"></script>
	
</body>

</html>