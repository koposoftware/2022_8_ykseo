<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>UpConstruction Bootstrap Template - Index</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="${ path }/resources/assets/img/favicon.png" rel="icon">
<link href="${ path }/resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Roboto:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Work+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${ path }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${ path }/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="${ path }/resources/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="${ path }/resources/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="${ path }/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="${ path }/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${ path }/resources/assets/css/main.css" rel="stylesheet">
<style type="text/css">
	#start-button:hover {
		background-color: #008485;
		color: white;
	}
</style>

<!-- =======================================================
  * Template Name: UpConstruction - v1.1.0
  * Template URL: https://bootstrapmade.com/upconstruction-bootstrap-construction-website-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	<!-- ======= Header ======= -->
	<%@include file="/WEB-INF/jsp/include/header.jsp" %>
	<!-- End Header -->

	
	<main id="main">

		<!-- ======= Index Section ======= -->
		<section id="index" class="index">
			<div class="container" data-aos="fade-up" data-aos-delay="100">
				<div class="row gy-4">
					<div class="col-lg-6">
						<img alt="" src="${ path }/resources/assets/img/gif/corp-index.gif" style="width:100%;">
					</div>
					<div class="col-lg-5 d-flex align-items-center">
						<div>
							<h1 data-aos="fade-down" style="margin-bottom: 30px;">
								Welcome to ModuHana<span  style="color:#008485">.</span>
							</h1>
							<p data-aos="fade-up" style="font-size: 20px;">
								지금 모두하나에서 여러분의 프로젝트를 시작해보세요!</p>
							<p style="margin-bottom: 50px;font-size: 20px;">
								모두하나는 국내 대표적인 펀딩 플랫폼으로 한국 콘텐츠의 도약과 성장을 위해 투자자 모집을 돕습니다.
							</p>
							
							<a id="start-button" data-aos="fade-up" data-aos-delay="200" href="${ path }/login" class="btn-get-started fw-bolder border border-2 py-2 px-3 rounded-pill" style="border-color:#008485;font-size: 20px;">투자 신청하기</a>
						</div>
					</div>
				</div>
			</div>
		</section>
		
	</main>
	
	<!-- ======= Footer ======= -->
	<%@include file="/WEB-INF/jsp/include/footer.jsp" %>
	<!-- End Footer -->
	
	<!-- Vendor JS Files -->
	<script src="${ path }/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${ path }/resources/assets/vendor/aos/aos.js"></script>
	<script src="${ path }/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="${ path }/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="${ path }/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="${ path }/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="${ path }/resources/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="${ path }/resources/assets/js/main.js"></script>

</body>

</html>