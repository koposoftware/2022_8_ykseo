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

<body class="g-sidenav-show  bg-gray-200">
	<%@include file="/WEB-INF/jsp/include/sidebar_project.jsp" %>
	
	<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
	
		<!-- Navbar -->
		<%@include file="/WEB-INF/jsp/include/navbar.jsp" %>
		<!-- End Navbar -->
		
			
		<div class="container-fluid py-4">
		
			<div class="row">
				<div class="col-lg-12 col-md-6 mb-4">
					<div class="card z-index-2">
						<div class="card-body text-center">
							<img alt="대표이미지" src="${ project.signImgName }" onerror="this.src='http://localhost:9990/ModuHana/${ project.signImgPath }/${ project.signImgName }'"
									style="width:50%">
							<h3 class="mb-0 mt-3 ">${ project.title }</h3>
							<p class="mb-0 ">${ project.corpName }</p>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				
				<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
					<div class="card">
						<div class="card-header card-footer p-3 pt-2">
							<div class="text-end pt-1">
								<p class="text-sm mb-0 text-capitalize">목표 모집금액(최소/최대)</p>
								<h4 class="mb-0 mt-3"><fmt:formatNumber value="${ project.minFundAmt }" pattern="###,###"/>원</h4>
								<h4><fmt:formatNumber value="${ project.maxFundAmt }" pattern="###,###"/> 원</h4>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6">
					<div class="card" style="height:100%">
						<div class="card-header card-footer p-3 pt-2">
							<div class="text-end pt-1">
								<p class="text-sm mb-0 text-capitalize">추정 손익분기점</p>
								<h4 class="mb-0 mt-3"><fmt:formatNumber value="${ project.estBep }" pattern="###,###"/> 원</h4>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6">
					<div class="card" style="height:100%">
						<div class="card-header card-footer p-3 pt-2">
							<div class="text-end pt-1">
								<p class="text-sm mb-0 text-capitalize">증권명</p>
								<h4 class="mb-0 mt-3">${ project.securityName }</h4>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6">
					<div class="card" style="height:100%">
						<div class="card-header card-footer p-3 pt-2">
							<div class="text-end pt-1">
								<p class="text-sm mb-0 text-capitalize">상환방법</p>
								<h4 class="mb-0 mt-3">${ project.repaymentName }</h4>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row mt-3">
				<div class="col-lg-10">
				</div>
				<div class="col-lg-2">
					<a href="${ path }/mail/${ project.projectSeq }" class="btn bg-gradient-primary w-100 mb-0 toast-btn"> 
						메일 보내기
					</a>
				</div>
			</div>			
			<div class="row justify-content-center mt-3">
				<div class="col-xl-12 col-sm-6">
					<div class="card">
						<div class="card-header p-3 pt-2">
							<div class="text-center col-lg-12">
								<%-- <img style="width:70%" alt="설명이미지" src="${ path }/${ projectFileMap.content.path }/${ projectFileMap.content.saveName }"> --%>
								${ project.content }
							</div>
						</div>
					</div>
				</div>
			</div>
							
			<!-- <div class="row mt-5">
				<div class="col-lg-10">
				</div>
				<div class="col-lg-2">
					<button class="btn bg-gradient-primary w-100 mb-0 toast-btn" type="button" data-target="successToast">미리보기</button>
				</div>
			</div> -->
			
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