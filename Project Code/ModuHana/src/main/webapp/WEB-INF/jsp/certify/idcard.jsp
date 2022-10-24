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
		
		<!-- ======= Submit Section ======= -->
		<section id="submitForm" class="submitForm">
			
			<div class="container" data-aos="fade-up" data-aos-delay="100">
				<div class="row justify-content-center">
					<div class="col-lg-6 mt-5">

						<!-- 신분증 업로드 -->
						<form class="idcard-form"  method="post" action="${ path }/certify/idcard" 
								enctype="multipart/form-data" name="idcardUploadForm">
							<input type="hidden" name="whatIs" value="idcardUpload">
							<input type="file" name="uploadfile" multiple="multiple" style="display:none" /> 
							
							<div class="text-center">
								<img style="width:50%" alt="증명사진 업로드" src="${ path }/resources/upload/idcard/default.gif">
							</div>
							<div class="text-center">
								<button onclick="idcardUpload()" type="button">
									<c:if test="${ empty idcard }"> IDCard UPLOAD </c:if>
									<c:if test="${ not empty idcard }"> IDCard Re-Upload </c:if>
								</button>
								<button name="idcardSubmitBtn" type="submit" style="display:none"> Submit </button>
							</div>
						</form>
						
						<!-- 신분증 업로드 후 -->
						<c:if test="${ not empty idcard }">
							
							<form class="idcard-form" action="${ path }/certify/account" method="post">
								<input type="hidden" name="whatIs" value="idcardInfo">
								<div class="text-center">
									<img class="border-img" style="width:50%" alt="idcard" src="${ path }/resources/upload/idcard/${ idcard }">
								</div>
								<div class="text-center mt-3 text">
									정보를 확인 후 잘못된 경우 수정해주세요
								</div>
								
								<div style="margin-left:25%;margin-right:25%;widht:50%">
									<div class="form-group mt-3">
										<input type="text" class="form-control" name="name" value="${ idcardInfo.name }" 
											id="name" placeholder="Your Name" required >
									</div>
									
									<div class="row gy-4">
										<div class="col-lg-6 form-group">
											<input type="text" name="regNoFront" class="form-control" value="${ idcardInfo.regNoFront }"
											placeholder="Your register # front" required>
										</div>
										<div class="col-lg-6 form-group">
											<input type="text" name="regNoBack" class="form-control" value="${ idcardInfo.regNoBack }"
											placeholder="Your register # back" required>
										</div>
									</div>
									
									<div class="row gy-4">
										<div class="col-lg-4 form-group">
											<input type="text" name="year" class="form-control" value="${ idcardInfo.year }"
												placeholder="Year" required>
										</div>
										<div class="col-lg-4 form-group">
											<input type="text" name="month" class="form-control" value="${ idcardInfo.month }"
												placeholder="Month" required>
										</div>
										<div class="col-lg-4 form-group">
											<input type="text" name="day" class="form-control" value="${ idcardInfo.day }"
												placeholder="Day" required>
										</div>
									</div>
								</div>
								
								<div class="text-center mt-3">
									<button type="submit">Next</button>
								</div>
								
							</form>
						</c:if>
	
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
	
	<!-- My JavaScript -->
	<script>
		function idcardUpload() {
			let form = document.idcardUploadForm;
			form.uploadfile.click();
			//form.submit();
			let btn = form.idcardSubmitBtn;
			btn.style.display = "";
		}
	</script>

</body>

</html>