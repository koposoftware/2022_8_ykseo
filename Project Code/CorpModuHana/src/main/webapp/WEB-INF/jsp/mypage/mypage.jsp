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
</head>

<body>

	<!-- ======= Header ======= -->
	<%@include file="/WEB-INF/jsp/include/header.jsp" %>
	<!-- End Header -->

	<main id="main">

		<!-- ======= mypage Section ======= -->
		<section id="mypage" class="mypage mt-5">
			<div class="container" data-aos="fade-up" data-aos-delay="100">
				<div class="row gy-4">
					
					<div class="col-lg-2">
						<%@include file="/WEB-INF/jsp/include/mypageSidebar.jsp" %>
					</div>
					<div class="col-lg-10">
						<div class="row gy-4">
							<div class="col-lg-6">
								<div
									class="info-item  d-flex flex-column justify-content-center align-items-center">
									<i class="bi bi-piggy-bank"></i>
									<h3 class="mt-3">총 펀딩 금액 <span style="color:#e90061">${ mypageMap.totalFundAmt }</span> 원</h3>
								</div>
							</div>
							<!-- End Info Item -->
		
							<div class="col-lg-3 col-md-6">
								<div
									class="info-item d-flex flex-column justify-content-center align-items-center">
									<i class="bi bi-check-circle"></i>
									<h3 class="mt-3">모집 중 프로젝트 <span style="color:#e90061">${ mypageMap.inProgressProjectSize }</span> 건</h3>
								</div>
							</div>
							<!-- End Info Item -->
		
							<div class="col-lg-3 col-md-6">
								<div
									class="info-item  d-flex flex-column justify-content-center align-items-center">
									<i class="bi bi-activity"></i>
									<h3>작성 중 프로젝트 <span style="color:#e90061">${ mypageMap.writingProjectSize }</span> 건</h3>
								</div>
							</div>
							<!-- End Info Item -->
		
						</div>
						
						<c:forEach items="${ inprogressProjects }" var="project">
							<div class="col-lg-12 mt-3">
								<div class="info-item  d-flex flex-column justify-content-center align-items-center">
									<h3 class="mt-3">"${ project.title }" 누적 투자금액</h3>
									<div id="graph${ project.projectSeq }" style="width:80%">
									</div>
								</div>
							</div>
							<!-- End Info Item -->
							
						</c:forEach>
					</div>
				</div>
			</div>
		</section>
		<!-- End Contact Section -->

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@include file="/WEB-INF/jsp/include/footer.jsp" %>
	<!-- End Footer -->

	<a href="#"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

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
	
	<!-- My Javascript --><script src="${ path }/resources/assets/js/plugins/chartjs.min.js"></script>
	<script src="${ path }/resources/assets/js/loading-bar.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
	<script src="https://code.highcharts.com/modules/series-label.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/color-js/1.0/color.min.js" integrity="sha512-RpdNjGMyXXWMxBLCPGQUUInZYVJjfS2w6SYCYHF4cBok/nIUV977C08RSRx0t5ABIIw9JxceiY7iwMPbXwX0yA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="${ path }/resources/assets/js/utils.js"></script>
	<script>

	let trendsInFundLabel = [];
	let trendsInFundData = [];
	
	<c:forEach items="${ inprogressProjects }" var="project">
	
		<c:forEach items="${ project.accomulateFundAmt }" var="data">
			trendsInFundLabel.push('${ data.DAY }');
			trendsInFundData.push(${ data.AMOUNT });
		</c:forEach>
		
		// Data retrieved from https://www.ssb.no/statbank/table/10467/
		Highcharts.chart('graph${ project.projectSeq }', {
		    chart: {
		        type: 'area',
		        marginTop: 100
		    },
		    title: {
		        text: ''
		    },
		    subtitle: {
		        text: '',
		        align: 'right',
		        verticalAlign: 'bottom'
		    },
		    tooltip: {
		        pointFormat: ': <b>{point.y} 원</b>'
		    },
		    legend: {
		        layout: 'vertical',
		        align: 'left',
		        verticalAlign: 'top',
		        x: 150,
		        y: 60,
		        floating: true,
		        borderWidth: 1,
		        backgroundColor:
		            Highcharts.defaultOptions.legend.backgroundColor || '#FFFFFF'
		    },
		    yAxis: {
		        title: {
		            text: 'Amount'
		        }
		    },
		    xAxis: {
	            categories: trendsInFundLabel
    		},
		    credits: {
		        enabled: false
		    },
		    series: [{
		        name: 'Arvid',
		        data: trendsInFundData
		    }]
		});
		

		trendsInFundLabel = [];
		trendsInFundData = [];

	</c:forEach>
	</script>
</body>

</html>