<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Roboto:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Work+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${ path }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${ path }/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="${ path }/resources/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="${ path }/resources/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="${ path }/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="${ path }/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
	
<!-- Template Main CSS File -->
<link href="${ path }/resources/assets/css/main.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: UpConstruction - v1.1.0
  * Template URL: https://bootstrapmade.com/upconstruction-bootstrap-construction-website-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
	
	<!-- ======= Header ======= -->
	<%@include file="/WEB-INF/jsp/include/header.jsp"%>
	<!-- End Header -->

	<main id="main">
		
		<!-- ======= apply-form Section ======= -->
		<section id="apply-form-section" class="apply-form-section">
			
			<div class="container" data-aos="fade-up" data-aos-delay="100">
				<div class="row justify-content-center">
					
					<div class="col-lg-2 mt-5">
						<%@include file="/WEB-INF/jsp/include/projectSidebar.jsp" %>
					</div>
					
					<div class="col-lg-10 mt-5">

						<!-- 투자하기 -->
						<form method="post" action="${ path }${requestScope['javax.servlet.forward.servlet_path']}"
							class="apply-form" name="applyForm">
								
							<h5 class="fw-bold border-bottom border-3 mt-5">진행자 정보</h5>
							
							<div class="row gy-4 mt-3">
								<div class="col-lg-3 form-group py-2">
									<p>진행자명</p>
								</div>
								<div class="col-lg-9 form-group">
									<input type="text" name="name" class="form-control bg-light p-2" value="${ user.name }" readonly="readonly">
								</div>
							</div>
							
							<div class="row gy-4">
								<div class="col-lg-3 form-group py-2">
									<p>이메일</p>
								</div>
								<div class="col-lg-9 form-group">
									<input type="email" name="email" class="form-control p-2" value="${ user.email }">
								</div>
							</div>
							
							<div class="row gy-4">
								<div class="col-lg-3 form-group py-2">
									<p>전화번호</p>
								</div>
								<div class="col-lg-9 form-group">
									<input type="text" name="tel" class="form-control p-2" value="${ user.tel }">
								</div>
							</div>
							
							<div class="row gy-4">
								<div class="col-lg-3 form-group py-2">
									<p>주소</p>
								</div>
								<div class="col-lg-3 form-group">
									<input type="text" name="post" class="form-control bg-light p-2" value="${ user.post }">
								</div>
								<div class="col-lg-3 form-group text-end">
									<button style="width:100%">우편번호 검색</button>
								</div>
							</div>
							
							<div class="row gy-4">
								<div class="col-lg-3 form-group py-2">
								</div>
								<div class="col-lg-9 form-group">
									<input type="text" name="basicAddr" class="form-control bg-light p-2" value="${ user.basicAddr }">
								</div>
							</div>
							
							<div class="row gy-4">
								<div class="col-lg-3 form-group py-2">
								</div>
								<div class="col-lg-9 form-group">
									<input type="text" name="detailAddr" class="form-control p-2" value="${ user.detailAddr }">
								</div>
							</div>
							
							<div class="row gy-4 mt-3">
								<div class="col-lg-3 form-group">
									<button type="reset" class="sacondary-round-button">초기화</button>
								</div>
								<div class="col-lg-3 form-group">
									<button type="submit" class="sacondary-round-button">임시저장</button>
								</div>
								<div class="col-lg-6 form-group">
									<button type="submit" class="primary-round-button">저장 후 다음 단계</button>
								</div>
							</div>
							
						</form>
						
					</div>
					<!-- End Submit Form -->
				</div>
			</div>
		</section>
		<!-- End Submit Section -->
		
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@include file="/WEB-INF/jsp/include/footer.jsp"%>
	<!-- End Footer -->

	<a href="#"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<div id="preloader"></div>

	<!-- Vendor JS Files -->
	<script
		src="${ path }/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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