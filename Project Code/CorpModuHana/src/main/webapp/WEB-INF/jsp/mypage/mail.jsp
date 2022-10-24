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
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>UpConstruction Bootstrap Template - Contact</title>
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
  
<style type="text/css">
	input {
		padding: 0 20px;
	}
	textarea {
		padding: 20px;
	}
</style>
<body class="g-sidenav-show  bg-gray-200">
	
	<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
			
		<section id="mypage" class="mypage mt-5">
			<div class="container" data-aos="fade-up" data-aos-delay="100">
				<div class="row">
					<div class="col-lg-2">
						<%@include file="/WEB-INF/jsp/include/mypageSidebar.jsp" %>
					</div>
						
					<div class="col-lg-10">
		
						<div class="row">
							<form method="post" action="${ path }/mypage/detail/mail/${ project.projectSeq }">
								<div class="col-lg-12 col-md-6 mb-4">
									<div class="card z-index-2">
										<div class="card-body">
											<h3 class="mb-0 ">${ project.title }</h3>
										</div>
									</div>
								</div>
								<div class="col-lg-12 col-md-6 mt-4 mb-4">
									<div class="card z-index-2 ">
										<div class="card-body">
											<h4>제목</h4>
											<input name="title" type="text" class="rounded border border-gray"  style="width: 100%;height:50px" />
										</div>
										<div class="card-body">
											<h4>내용</h4>
											<textarea name="content" class="rounded border border-gray" rows="20px" cols="100%" style="width: 100%;"></textarea>
										</div>
										<div class="card-body">
											<div class="row">
												<div class="col-lg-8">
												</div>
												<div class="col-lg-2">
													<button class="btn bg-gradient-primary w-100 mb-0 toast-btn" type="submit" data-target="successToast" style="background-color:var(--color-primary);color:white">전송</button>
												</div>
												<div class="col-lg-2">
													<button class="btn bg-gradient-secondary w-100 mb-0 toast-btn" type="reset" data-target="successToast" style="background-color:lightgray">초기화</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				<%@include file="/WEB-INF/jsp/include/footer.jsp" %>
			</div>
		</section>
	</main>
	
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
	
	<!-- My Javascript -->
	<script src="${ path }/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${ path }/resources/assets/vendor/aos/aos.js"></script>
	<script src="${ path }/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="${ path }/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="${ path }/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="${ path }/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="${ path }/resources/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="${ path }/resources/assets/js/main.js"></script>
	
	<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="${ path }/resources/assets/js/material-dashboard.min.js?v=3.0.0"></script>
	
</body>

</html>