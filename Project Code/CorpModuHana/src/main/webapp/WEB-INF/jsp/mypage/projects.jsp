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

<title>UpConstruction Bootstrap Template - Blog</title>
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
<link href="${ path }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${ path }/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
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
	<%@include file="/WEB-INF/jsp/include/header.jsp" %>
	<!-- End Header -->

	<main id="main">
	
		<!-- ======= Blog Section ======= -->
		<section id="mypage" class="mypage mt-5">
			<div class="container">
			
				<div class="row gy-4">
						
					<div class="col-lg-2">
						<%@include file="/WEB-INF/jsp/include/mypageSidebar.jsp" %>
					</div>
					<div class="col-lg-10">
						<section id="category" class="category">
							<div class="container nav-item dropdown">
								<form action="${ path }/mypage/projects" method="post">
									<label for="selectedProgress" class="visually-hidden">장르 목록</label>
									<select class="col-lg-3" aria-label="selectedProgress" name="selectedProgress" onchange="this.form.submit()">
										<option value="all">전체</option>
										<c:forEach items="${ ProgressList }" var="progress">
											<c:if test="${ progress.code eq selectedProgress }">
												<option value="${ progress.code }" selected>${ progress.name }</option>
											</c:if>
											<c:if test="${ progress.code ne selectedProgress }">
												<option value="${ progress.code }">${ progress.name }</option>
											</c:if>
										</c:forEach>
									</select>
								</form>
							</div>
						</section>
						<section id="project-list" class="project-list">
							<div class="container" data-aos="fade-up" data-aos-delay="100">
				
								<div class="row gy-4 posts-list">
				
									<c:forEach items="${ projectList }" var="project">
									<div class="col-xl-4 col-md-6">
										<div class="post-item position-relative h-100">
				
											<div class="post-img position-relative overflow-hidden">
												<img src="http://localhost:9990/ModuHana${ project.signImgPath }/${ project.signImgName }" class="img-fluid" onerror="this.onerror=null; this.src='${ path }/resources/assets/img/mypage/default.jpg';" style="height: 230px;">
												<c:choose>
													<c:when test="${ project.progressCode eq 9 }">
														<span class="post-date" style="background-color:gray">
															${ project.progressName }
														</span>
													</c:when>
													<c:when test="${ project.progressCode eq 6 or project.progressCode eq 7 or project.progressCode eq 8 }">
														<span class="post-date" style="background-color:black">
															<td>${ project.progressName }</td>
														</span>
													</c:when>
													<c:when test="${ project.progressCode eq 1 or project.progressCode eq 2 or project.progressCode eq 11 }">
														<span class="post-date" style="background-color:blue">
															<td>${ project.progressName }</td>
														</span>
													</c:when>
													<c:when test="${ project.progressCode eq 3 or project.progressCode eq 4 }">
														<span class="post-date" style="background-color:#e90061">
															<td>모집 진행 중</td>
														</span>
													</c:when>
													<c:when test="${ project.progressCode eq 4 }">
														<span class="post-date" style="background-color:var(--primary-color)">
															<td>${ project.progressName }</td>
														</span>
													</c:when>
													<c:when test="${ project.progressCode eq 10 }">
														<span class="post-date">
															<td>모집 성공</td>
														</span>
													</c:when>
													<c:when test="${ project.progressCode eq 5 }">
														<span class="post-date" style="background-color:gray">
															<td>프로젝트 종료</td>
														</span>
													</c:when>
													<c:otherwise>
														<span class="post-date" style="background-color:gray">
															<td>${ project.progressName }</td>
														</span>
													</c:otherwise>
												</c:choose>
											</div>
				
											<div class="post-content d-flex flex-column">
				
												<a href="${ path }/mypage/detail/${ project.projectSeq }" class="readmore" target="_blank" style="height: 100px;">
													<h3 class="post-title">
															<c:out value="${ project.title }"/>
													</h3>
												</a>
				
												<div class="meta d-flex align-items-center">
													<div class="d-flex align-items-center">
														<i class="bi bi-person"></i> 
														<span class="ps-2">
															<c:out value="${ project.corpName }"/>
														</span>
													</div>
													<span class="px-3 text-black-50">/</span>
													<div class="d-flex align-items-center">
														<i class="bi bi-folder2"></i> 
														<span class="ps-2">
															<c:out value="${ project.subjectName }"/>
														</span>
													</div>
												</div>
				
												<hr>
												<p>
													펀딩기간 : ${ project.fundStart } ~ ${ project.fundEnd }<br>
													모집금액(최소/최대) : <br>&nbsp;&nbsp;&nbsp;<fmt:formatNumber value="${ project.minFundAmt }" pattern="###,###"/> / <fmt:formatNumber value="${ project.maxFundAmt }" pattern="###,###"/> 원
												</p>
												<button onclick="location.href='${ path }/project/apply/${ project.projectSeq }/step1'" type="button" class="mt-5 btn btn-primary bg-white border text-dark auto"> <i class="bi bi-pencil-square"></i> 수정 </button>
												<!-- 알림 신청 -->
												<%-- <c:if test="${ project.progressCode eq 9 }">
													<button onclick="location.href='${ path }/project/apply/${ project.projectSeq }/step1'" type="button" class="mt-5 btn btn-primary bg-white border text-dark auto"> <i class="bi bi-pencil-square"></i> 수정 </button>
												</c:if>
												
												<!-- 진행률 -->
												<c:if test="${ project.startDDay <= 0 and project.endDDay > 0 }">
													<p class="ps-2 text-end">
														<span class="fw-bold fs-5 me-2" style="color:#e90061"><c:out value="${ project.fundAmtPer }"/></span>
														<fmt:formatNumber value="${ project.fundAmt }" pattern="#,###" /> 원
													</p>
													<div class="progress">
														<div class="progress-bar" role="progressbar" style="width:${ project.fundAmtPer };background-color:#e90061" aria-valuenow="${ project.fundAmtPer }" aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</c:if>
												<c:if test="${ project.endDDay <= 0 }">
													<p class="ps-2 text-end">
														<span class="fw-bold fs-5 me-2 primary-color"><c:out value="${ project.fundAmtPer }"/></span>
														<fmt:formatNumber value="${ project.fundAmt }" pattern="#,###" /> 원
													</p>
													<div class="progress">
														<div class="progress-bar secondary-bg-color" role="progressbar" style="width: ${ project.fundAmtPer }" aria-valuenow="${ project.fundAmtPer }" aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</c:if> --%>
											</div>
				
										</div>
									</div>
									</c:forEach>
									<!-- End post list item -->
									
									<div class="project-list-pagination">
										<ul class="justify-content-center">
											<li class="active"><a href="#">1</a></li>
										</ul>
									</div>
									<!-- End project-list pagination -->
								</div>
							</div>
						</section>
						<!-- End Blog Section -->
					</div>
				</div>
			</div>
		</section>
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

	<!-- My Javascript -->
	<script src="${ path }/resources/assets/js/jquery-3.6.1.min.js"></script>
	<script>
		$('input[name=selectedProgress]').on('change', function(){
		    $(this).closest('form').submit();
		});
	</script>
</body>

</html>