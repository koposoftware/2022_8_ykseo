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
						
						<!-- 프로젝트 내용 업로드하기 -->
						<form method="post" action="${ path }${requestScope['javax.servlet.forward.servlet_path']}"
							name="applyForm" class="apply-form" enctype="multipart/form-data">
								
							<h5 class="fw-bold border-bottom border-3 mt-5">서류 제출</h5>
							
							<div class="row gy-4">
								<div class="col-lg-3 form-group py-2">
									<p>사업자등록증</p>
								</div>
								<div class="col-lg-7 form-group">
									<input type="file" id="uploadFile0" name="businessLicense" style="display:none" onchange="inputFileOnchange(0)"/>
									<input type="text" id="resultUploadPath0" class="form-control bg-light p-2" disabled>
								</div>
								<div class="col-lg-2 form-group text-end">
									<input type="button" style="width:100%" onclick="inputFileClick(0)" value="파일선택" />
								</div>
							</div>
							
							<div class="row gy-4">
								<div class="col-lg-3 form-group py-2">
									<p>법인등기부등본</p>
								</div>
								<div class="col-lg-7 form-group">
									<input type="file" id="uploadFile1" name="corporateRegistration" style="display:none" onchange="inputFileOnchange(1)"/>
									<input type="text" id="resultUploadPath1" class="form-control bg-light p-2" disabled>
								</div>
								<div class="col-lg-2 form-group text-end">
									<input type="button" style="width:100%" onclick="inputFileClick(1)" value="파일선택" />
								</div>
							</div>
							
							<div class="row gy-4">
								<div class="col-lg-3 form-group py-2">
									<p>정관</p>
								</div>
								<div class="col-lg-7 form-group">
									<input type="file" id="uploadFile2" name="association" style="display:none" onchange="inputFileOnchange(2)"/>
									<input type="text" id="resultUploadPath2" class="form-control bg-light p-2" disabled>
								</div>
								<div class="col-lg-2 form-group text-end">
									<input type="button" style="width:100%" onclick="inputFileClick(2)" value="파일선택" />
								</div>
							</div>
							
							<div class="row gy-4">
								<div class="col-lg-3 form-group py-2">
									<p>임시주총의사록</p>
								</div>
								<div class="col-lg-7 form-group">
									<input type="file" id="uploadFile3" name="shareholdersMeeting" style="display:none" onchange="inputFileOnchange(3)"/>
									<input type="text" id="resultUploadPath3" class="form-control bg-light p-2" disabled>
								</div>
								<div class="col-lg-2 form-group text-end">
									<input type="button" style="width:100%" onclick="inputFileClick(3)" value="파일선택" />
								</div>
							</div>
							
							<div class="row gy-4">
								<div class="col-lg-3 form-group py-2">
									<p>사채청약서</p>
								</div>
								<div class="col-lg-7 form-group">
									<input type="file" id="uploadFile4" name="bondSubscription" style="display:none" onchange="inputFileOnchange(4)"/>
									<input type="text" id="resultUploadPath4" class="form-control bg-light p-2" disabled>
								</div>
								<div class="col-lg-2 form-group text-end">
									<input type="button" style="width:100%" onclick="inputFileClick(4)" value="파일선택" />
								</div>
							</div>
							
							<div class="row gy-4">
								<div class="col-lg-3 form-group py-2">
									<p>투자상품설명서</p>
								</div>
								<div class="col-lg-7 form-group">
									<input type="file" id="uploadFile5" name="signImg" style="display:none" onchange="inputFileOnchange(5)"/>
									<input type="text" id="resultUploadPath5" class="form-control bg-light p-2" disabled>
								</div>
								<div class="col-lg-2 form-group text-end">
									<input type="button" style="width:100%" onclick="inputFileClick(5)" value="파일선택" />
								</div>
							</div>
							
							<div class="row gy-4">
								<div class="col-lg-3 form-group py-2">
									<p>재무제표</p>
								</div>
								<div class="col-lg-7 form-group">
									<input type="file" id="uploadFile6" name="signImg" style="display:none" onchange="inputFileOnchange(6)"/>
									<input type="text" id="resultUploadPath6" class="form-control bg-light p-2" disabled>
								</div>
								<div class="col-lg-2 form-group text-end">
									<input type="button" style="width:100%" onclick="inputFileClick(6)" value="파일선택" />
								</div>
							</div>
							
							<div class="row gy-4 mt-3">
								<div class="col-lg-2 form-group">
									<button type="reset" class="sacondary-round-button">초기화</button>
								</div>
								<div class="col-lg-2 form-group">
									<button type="submit" class="sacondary-round-button">미리보기</button>
								</div>
								<div class="col-lg-2 form-group">
									<button type="submit" class="sacondary-round-button">임시저장</button>
								</div>
								<div class="col-lg-6 form-group">
									<button type="submit" class="primary-round-button" onsubmit="onchangeTextarea()">신청하기</button>
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
	<%-- <script
		src="${ path }/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> --%>
	<script src="${ path }/resources/assets/vendor/aos/aos.js"></script>
	<script src="${ path }/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="${ path }/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="${ path }/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="${ path }/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="${ path }/resources/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="${ path }/resources/assets/js/main.js"></script>
	
	<!-- My Javascript -->
	<script>
	function inputFileClick(num) {
		document.getElementById('uploadFile' + num).click();
	}
	function inputFileOnchange(num) {
		document.getElementById('resultUploadPath' + num).value = document.getElementById('uploadFile' + num).value;
	}
	</script>
</body>

</html>