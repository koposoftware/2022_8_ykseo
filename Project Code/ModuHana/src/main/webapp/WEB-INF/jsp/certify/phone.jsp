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
					<div class="col-lg-8 mt-5">

						<form class="idcard-form" action="${ path }/certify/phone" method="post" name="phoneForm">
							<div class="text-center">
								<img style="width:40%" alt="본인인증" src="${ path }/resources/assets/img/account/message.gif">
							</div>
							
							<div style="margin-left:25%;margin-right:25%;widht:50%">
								<div class="row mt-3">
									<div class="col-lg-8 form-group">
										<input type="text" class="form-control" name="name" 
										id="name" placeholder="이름" required >
									</div>
									<div class="col-lg-4 form-group">
										<select name="korean">
											<option value="Y">내국인</option>
											<option value="N">외국인</option>
										</select>
									</div>
								</div>
								
								<div class="row form-group gy-4">
									<div class="col-lg-8 form-group">
										<input type="text" name="birth" class="form-control" 
										placeholder="생년월일 (ex.19990101)" required>
									</div>
									<div class="col-lg-4 form-group">
										<select name="sex">
											<option value="M">남</option>
											<option value="F">여</option>
										</select>
									</div>
								</div>
								
								<div class="row gy-4">
									<div class="col-lg-8 form-group">
										<input type="text" name="phone" class="form-control"
											placeholder="휴대폰번호 ('-'제외하고 숫자만 입력)" required>
									</div>
									<div class="col-lg-4 form-group">
										<button type="button" style="width:100%;padding-right:20px;padding-left:20px" onclick="javascript:authMessage();">인증하기</button>
									</div>
								</div>
								
								<div class="row gy-4">
									<div class="col-lg-12 form-group">
										<input type="text" class="form-control" name="authNum"
											placeholder="인증번호를 입력하세요" required>
									</div>
								</div>
							</div>
							
							<div class="text-center mt-3">
								<button type="submit">Next</button>
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
	
	<!-- My JavaScript -->
	<script src="${ path }/resources/assets/js/jquery-3.6.1.min.js"></script>
	<script>
		function authMessage() {
			let telnum = document.phoneForm.phone.value;
			let json = { 
		        			'tel' : telnum.toString()
			        	}
			
			$.ajax({

				url : '${ path }/auth',
				method : 'post',
				data : JSON.stringify(json),
				contentType: "application/json",
				success : function() {
					console.log('성공');
				},
				error : function() {
					alert('실패');
				}
			})
		}
	</script>
</body>

</html>