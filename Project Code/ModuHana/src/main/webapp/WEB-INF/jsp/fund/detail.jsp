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
		
		<!-- ======= fund-form Section ======= -->
		<section id="fund-form-section" class="fund-form-section">
			
			<div class="container" data-aos="fade-up" data-aos-delay="100">
				<div class="row justify-content-center">
					<div class="col-lg-6 mt-5">

						<!-- 투자하기 -->
						<div class="fund-form">
							<h5 class="fw-bold border-bottom border-3 mt-5">투자 내역</h5>
							<table class="table my-3" id="transaction-table">
								<tr>
									<th scope="col">콘텐츠명</th>
									<td class="text-end"><c:out value="${ fund.projectTitle }"/></td>
								</tr>
								<tr>
									<th scope="col">투자 신청일</th>
									<td class="text-end"><c:out value="${ fund.fundDate }"/></td>
								</tr>
								<tr>
									<th scope="col">투자금액</th>
									<td class="text-end"><fmt:formatNumber value="${ fund.amount }" pattern="#,###"/>원</td>
								</tr>
							</table>
							
							<c:if test="${ project.progressCode eq 5 }">
							<h5 class="fw-bold border-bottom border-3 mt-5">세부정산내역</h5>
							<table class="table my-3" id="transaction-table">
								<tr>
									<th scope="col">투자금액[A]</th>
									<td class="text-end"><fmt:formatNumber value="${ fund.amount }" pattern="#,###"/>원</td>
								</tr>
								<tr style="color:#bbbbbb">
									<th scope="col">투자 수익금(수익률)</th>
									<td class="text-end"><fmt:formatNumber value="${ fund.payoff - fund.amount + fund.tax + fund.fee }" pattern="#,###"/>원(${ fund.proceeds }%)</td>
								</tr>
								<tr style="color:#bbbbbb">
									<th scope="col">비용(제세공과금/수수료)</th>
									<td class="text-end"><fmt:formatNumber value="${ fund.tax + fund.fee }" pattern="#,###"/>원</td>
								</tr>
								<tr>
									<th scope="col">비용 공제 후 수익금[B]</th>
									<td class="text-end"><fmt:formatNumber value="${ fund.payoff - fund.amount  }" pattern="#,###"/>원</td>
								</tr>
								<tr>
									<th scope="col">총 지급액([A]+[B])</th>
									<td class="text-end"><fmt:formatNumber value="${ fund.payoff }" pattern="#,###"/>원</td>
								</tr>
							</table>
							</c:if>
							
							<h5 class="fw-bold border-bottom border-3 mt-5">프로젝트 진행도</h5>
							<c:choose>
							<c:when test="${ project.progressCode eq '3' }">
							<img class="mt-3" alt="" src="${ path }/resources/assets/img/gif/step1.png" style="width:100%">
							</c:when>
							<c:when test="${ project.progressCode eq '5' }">
							<img class="mt-3" alt="" src="${ path }/resources/assets/img/gif/step3.png" style="width:100%">
							</c:when>
							<c:otherwise>
							<img class="mt-3" alt="" src="${ path }/resources/assets/img/gif/step2.png" style="width:100%">
							</c:otherwise>
							</c:choose>
							<div class="row gy-4">
								<div class="col-lg-4 form-group" style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
									<div class="mt-3">투자신청</div>
									<div><fmt:parseDate value="${ fund.fundDate }" pattern="yyyy-MM-dd HH:mm:ss" var="fundDate"/><fmt:formatDate value="${ fundDate }" pattern="yyyy-MM-dd"/></div>
								</div>
								<c:choose>
								<c:when test="${ project.progressCode eq '3' }">
									<div class="col-lg-4 form-group" style="opacity:0.4; display: flex; flex-direction: column; justify-content: center; align-items: center;">
										<div class="mt-3">투자종료</div>
										<div>${ project.fundEnd }</div>
									</div>
									<div class="col-lg-4 form-group" style="opacity:0.4; display: flex; flex-direction: column; justify-content: center; align-items: center;">
										<div class="mt-3">투자금정산</div>
										<div><fmt:parseDate value="${ project.repaymentDate }" pattern="yyyy-MM-dd HH:mm:ss" var="repaymentDate"/><fmt:formatDate value="${ repaymentDate }" pattern="yyyy-MM-dd"/></div>
									</div>
								</c:when>
								<c:when test="${ project.progressCode eq '5' }">
									<div class="col-lg-4 form-group" style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
										<div class="mt-3">투자종료</div>
										<div>${ project.fundEnd }</div>
									</div>
									<div class="col-lg-4 form-group" style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
										<div class="mt-3">투자금정산</div>
										<div><fmt:parseDate value="${ project.repaymentDate }" pattern="yyyy-MM-dd HH:mm:ss" var="repaymentDate"/><fmt:formatDate value="${ repaymentDate }" pattern="yyyy-MM-dd"/></div>
									</div>								</c:when>
								<c:otherwise>
									<div class="col-lg-4 form-group" style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
										<div class="mt-3">투자종료</div>
										<div>${ project.fundEnd }</div>
									</div>
									<div class="col-lg-4 form-group" style="opacity:0.4; display: flex; flex-direction: column; justify-content: center; align-items: center;">
										<div class="mt-3">투자금정산</div>
										<div><fmt:parseDate value="${ project.repaymentDate }" pattern="yyyy-MM-dd HH:mm:ss" var="repaymentDate"/><fmt:formatDate value="${ repaymentDate }" pattern="yyyy-MM-dd"/></div>
									</div>
								</c:otherwise>
								</c:choose>
							</div>
							
							<div class="row gy-4">
								<div class="col-lg-4 form-group">
									<button type="button" class="sacondary-round-button"  onclick="location.href = '#'">투자신청취소</button>
								</div>
								<div class="col-lg-4 form-group">
									<button type="button" class="primary-round-button" onclick="location.href = '${ path }/mypage'">마이페이지</button>
								</div>
								<div class="col-lg-4 form-group">
									<button type="button" class="primary-round-button" onclick="location.href = '${ path }/project/detail/${ project.projectSeq }'">상세페이지</button>
								</div>
							</div>
						</div>
						
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