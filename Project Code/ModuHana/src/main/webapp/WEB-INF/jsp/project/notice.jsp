<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>UpConstruction Bootstrap Template - Blog Details</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="${ path }/resources/assets/img/favicon.png" rel="icon">
<link href="${ path }/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Roboto:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Work+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${ path }/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${ path }/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="${ path }/resources/assets/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link href="${ path }/resources/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="${ path }/resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
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
	<%@include file="/WEB-INF/jsp/include/header.jsp" %>
	<!-- End Header -->

	<main id="main">

		<!-- ======= About Section ======= -->
		<%@include file="/WEB-INF/jsp/include/aboutSection.jsp" %>
		<!-- End About Section -->

		<!-- ======= Blog Details Section ======= -->
		<section id="blog" class="blog">
			<div class="container features" data-aos="fade-up" data-aos-delay="100">
				
				<ul class="nav nav-tabs row  g-2 d-flex">
		
					<li class="nav-item col-3">
						<a href="${ path }/project/detail/${ projectSeq }" class="nav-link">
							<h4>상세소개</h4>
						</a>
					</li>
					<!-- End tab nav item -->
		
					<li class="nav-item col-3">
						<a href="${ path }/project/detail/${ projectSeq }" class="nav-link">
							<h4>투자정보</h4>
						</a>
					</li>
					
					<!-- End tab nav item -->
					<li class="nav-item col-3">
						<a href="${ path }/project/detail/${ projectSeq }" class="nav-link active show">
							<h4>공지사항</h4>
						</a>
					</li>
					<!-- End tab nav item -->
		
					<li class="nav-item col-3">
						<a href="${ path }/project/detail/${ projectSeq }" class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-4">
							<h4>QnA</h4>
						</a>
					</li>
					<!-- End tab nav item -->
		
				</ul>
				
				<div class="wrap-blog">

					<div class="col-lg-12 mt-5">

						<article class="blog-details">

							<h2 class="title">${ notice.title }</h2>

							<div class="meta-top">
								<ul>
									<li class="d-flex align-items-center">
										<i class="bi bi-building"></i> 
										<a href="blog-details.html">${ notice.writer }</a>
									</li>
									<li class="d-flex align-items-center">
										<i class="bi bi-clock"></i>
										<a href="blog-details.html">
										<time datetime="${ notice.regDate }">${ notice.regDate }</time></a>
									</li>
								</ul>
							</div>
							<!-- End meta top -->

							<div class="content mt-5">
								<p>${ notice.content }</p>
							</div>
							
							<div class="mt-5">
								<c:forEach items="${ noticefileList }" var="file">
									<a class="file-link" href="${ path }/${ file.path }/${ file.saveName }" download="${ file.oriName }">${ file.oriName }</a>
								</c:forEach>
							</div>
							<!-- End post content -->

						</article>
						<!-- End blog post -->

					</div>
				</div>
			</div>
		</section>
		<!-- End Blog Details Section -->

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@include file="/WEB-INF/jsp/include/footer.jsp" %>
	<!-- End Footer -->

	<a href="#" class="scroll-top d-flex align-items-center justify-content-center">
		<i class="bi bi-arrow-up-short"></i>
	</a>

	<div id="preloader"></div>

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