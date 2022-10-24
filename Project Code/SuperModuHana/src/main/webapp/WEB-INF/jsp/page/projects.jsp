<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76" href="${ path }/resources/assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="${ path }/resources/assets/img/favicon.png">
<title>Material Dashboard 2 by Creative Tim</title>
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
<!-- Nucleo Icons -->
<link href="${ path }/resources/assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="${ path }/resources/assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
<!-- Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
<!-- CSS Files -->
<link id="pagestyle" href="${ path }/resources/assets/css/material-dashboard.css?v=3.0.0" rel="stylesheet" />
<link id="pagestyle" href="${ path }/resources/assets/css/main.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/3b179c433e.js" crossorigin="anonymous"></script>

</head>

<body class="g-sidenav-show  bg-gray-200">

	<c:if test="${ empty projects.awaitingProjectList }">
		비었어...
	</c:if>

	<%@include file="/WEB-INF/jsp/include/sidebar_project.jsp" %>
	<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
		<!-- Navbar -->
		<%@include file="/WEB-INF/jsp/include/navbar.jsp" %>
		<!-- End Navbar -->
		
		<div class="container-fluid py-4">
			<div class="row">
				<div class="col-12 pb-4">
					<div class="card my-4 pb-5">
						<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2" style="width:100px">
							<div class="icon icon-lg icon-shape bg-gradient-warning shadow-dark text-center border-radius-xl mt-n4 position-absolute">
								<i class="fa-solid fa-pause" style="opacity: 1;"></i>
							</div>
						</div>
						<h5 class="font-weight-bolder mb-0" style="margin-left:90px;">새로운 프로젝트</h5>
						<div class="card-body px-0 pt-5 pb-2">
							<div class="table-responsive p-0 px-3">
								<table class="table align-items-center mb-0">
									<thead>
										<tr>
											<th class="text-uppercase text-secondary font-weight-bolder opacity-7">Title</th>
											<th class="text-uppercase text-secondary font-weight-bolder opacity-7 ps-2">Corp.</th>
											<th class="text-center text-uppercase text-secondary font-weight-bolder opacity-7">Status</th>
											<th class="text-center text-uppercase text-secondary font-weight-bolder opacity-7">Register Date</th>
											<th class="text-center text-uppercase text-secondary font-weight-bolder opacity-7">status</th>
											<th class="text-secondary opacity-7"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ projects.awaitingProjectList }" var="project">
											<tr>
												<td class="ps-4">
													<h6 class="mb-0">
														<a href="${ path }/detail2/${ project.projectSeq }">
															<c:out value="${ fn:substring( project.title ,0,20) }" />
															<c:if test="${ fn:length( project.title ) gt 20 }">
															...
															</c:if>
														</a>
													</h6>
												</td>
												<td>
													<p class="text-sm font-weight-bold mb-0">${ project.corpName }</p>
												</td>
												<td class="align-middle text-center text-sm" id="projectProgress${ project.projectSeq }">
													<c:if test="${ project.progressCode eq 0 }">
														<span class="badge badge-sm bg-gradient-warning">승인대기</span>
													</c:if>
													<c:if test="${ project.progressCode eq 1 }">
														<span class="badge badge-sm bg-gradient-success">${ project.progressName }</span>
													</c:if>
													<c:if test="${ project.progressCode eq 2 }">
														<span class="badge badge-sm bg-gradient-info">${ project.progressName }</span>
													</c:if>
												</td>
												<td class="align-middle text-center">
													<span class="text-sm font-weight-bold mb-0"><fmt:parseDate value="${ project.regDate }" pattern="yyyy-MM-dd HH:mm:ss" var="regDate"/><fmt:formatDate value="${ regDate }" pattern="yyyy-MM-dd" /></span>
												</td>
												<td class="align-middle text-center" id="projectStatus${ project.projectSeq }">
													<c:choose>
														<c:when test="${ project.progressCode eq 0 }">
															<a href="javascript:approveProject(${ project.projectSeq });" class="badge badge-sm bg-gradient-success" 
																data-toggle="tooltip" data-original-title="Edit user"> 
																승인 
															</a>
															<a href="javascript:refuseProject(${ project.projectSeq });" class="badge badge-sm bg-gradient-secondary" 
																data-toggle="tooltip" data-original-title="Edit user"> 
																거절
															</a>
														</c:when>
														<c:when test="${ project.progressCode eq 1 }">
															<a href="javascript:uploadProject(${ project.projectSeq });" class="badge badge-sm bg-gradient-info" 
																data-toggle="tooltip" data-original-title="Edit user"> 
																업로드
															</a>
															<a href="javascript:cancelApprovedProject(${ project.projectSeq });" class="badge badge-sm bg-gradient-secondary" 
																data-toggle="tooltip" data-original-title="Edit user"> 
																취소
															</a>
														</c:when>
														<c:otherwise>
															<a href="javascript:cancelApprovedProject(${ project.projectSeq });" class="badge badge-sm bg-gradient-secondary" 
																data-toggle="tooltip" data-original-title="Edit user"> 
																취소
															</a>
														</c:otherwise>
													</c:choose>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								
							</div>
						</div>
						<div class="blog-pagination">
							<ul class="justify-content-center">
								<li class="active"><a href="#">1</a></li>
								<!-- <li><a href="#">2</a></li> -->
							</ul>
						</div>
						
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12 pb-4">
					<div class="card my-4 pb-4">
						<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2" style="width:100px">
							<div class="icon icon-lg icon-shape bg-gradient-success shadow-dark text-center border-radius-xl mt-n4 position-absolute">
								<i class="fa-solid fa-play" style="opacity: 1;"></i>
							</div>
						</div>
						<h5 class="font-weight-bolder mb-0" style="margin-left:90px;">모집 진행 중</h5>
						<div class="card-body px-0 pt-5 pb-2">
							<div class="table-responsive p-0 px-3">
								<table class="table align-items-center mb-0">
									<thead>
										<tr>
											<th class="text-uppercase text-secondary font-weight-bolder opacity-7">Title</th>
											<th class="text-uppercase text-secondary font-weight-bolder opacity-7 ps-2">Corp.</th>
											<th class="text-center text-uppercase text-secondary font-weight-bolder opacity-7">Target amt.<br>(MIN/MAX)</th>
											<th class="text-center text-uppercase text-secondary font-weight-bolder opacity-7">fund amt.</th>
											<th class="text-center text-uppercase text-secondary font-weight-bolder opacity-7">Progress</th>
											<th class="text-center text-uppercase text-secondary font-weight-bolder opacity-7">fund period<br>(start/end)</th>
											<th class="text-secondary opacity-7"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ projects.inProgressProjectList }" var="project">
											<tr>
												<td class="ps-4" rowspan='2'>
													<h6 class="mb-0">
														<a href="${ path }/detail/${ project.projectSeq }">
															<c:out value="${ fn:substring( project.title ,0,20) }" />
															<c:if test="${ fn:length( project.title ) gt 20 }">
															...
															</c:if>
														</a>
													</h6>
												</td>
												<td rowspan='2'>
													<p class="text-sm font-weight-bold mb-0">${ project.corpName }</p>
												</td>
												<td class="align-middle text-center">
													<span class="text-sm font-weight-bold mb-0">￦<fmt:formatNumber value="${ project.minFundAmt }" pattern="#,###" /></span>
												</td>
												<td class="align-middle text-center" rowspan='2'>
													<span class="text-sm font-weight-bold mb-0">￦<fmt:formatNumber value="${ project.fundAmt }" pattern="#,###" /></span>
												</td>
												<td class="align-middle text-center" rowspan='2'>
													<div class="d-flex align-items-center justify-content-center">
														<span class="me-2 text-sm font-weight-bold">${ project.fundAmtPer }%</span>
														<div>
															<div class="progress">
																<c:if test="${ project.fundAmt ge project.minFundAmt }">
																	<div class="progress-bar bg-gradient-info" role="progressbar" aria-valuenow="${ project.fundAmtPer }" aria-valuemin="0" aria-valuemax="${ project.fundAmtPer }" style="width: 100%;"></div>
																</c:if>
																<c:if test="${ project.fundAmt lt project.minFundAmt }">
																	<div class="progress-bar bg-gradient-danger" role="progressbar" aria-valuenow="${ project.fundAmtPer }" aria-valuemin="0" aria-valuemax="${ project.fundAmtPer }" style="width: ${ project.fundAmtPer }%;"></div>
																</c:if>
															</div>
														</div>
													</div>
												</td>
												<td class="align-middle text-center">
													<span class="text-sm font-weight-bold mb-0">${ project.fundStart }</span>
												</td>
											</tr>
											<tr>
												<td class="align-middle text-center">
													<span class="text-sm font-weight-bold mb-0">￦<fmt:formatNumber value="${ project.maxFundAmt }" pattern="#,###" /></span>
												</td>
												<td class="align-middle text-center">
													<span class="text-sm font-weight-bold mb-0">${ project.fundEnd }</span>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						
						<div class="blog-pagination">
							<ul class="justify-content-center">
								<li class="active"><a href="#">1</a></li>
								<!-- <li><a href="#">2</a></li> -->
							</ul>
						</div>
						
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12 pb-4">
					<div class="card my-4 pb-4">
						<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2" style="width:100px">
							<div class="icon icon-lg icon-shape bg-gradient-danger shadow-dark text-center border-radius-xl mt-n4 position-absolute" style="background-image:linear-gradient(195deg, #F56B6D 0%, #F35C5E 100%)">
								<i class="fa-solid fa-heart" style="opacity: 1;"></i>
							</div>
						</div>
						<h5 class="font-weight-bolder mb-0" style="margin-left:90px;">모집성공</h5>
						<div class="card-body px-0 pt-5 pb-2">
							<div class="table-responsive p-0 px-3">
								<table class="table align-items-center mb-0">
									<thead>
										<tr>
											<th class="text-uppercase text-secondary font-weight-bolder opacity-7">Title</th>
											<th class="text-uppercase text-secondary font-weight-bolder opacity-7 ps-2">Corp.</th>
											<th class="text-center text-uppercase text-secondary font-weight-bolder opacity-7">Target amt.<br>(MIN/MAX)</th>
											<th class="text-center text-uppercase text-secondary font-weight-bolder opacity-7">fund amt.</th>
											<th class="text-center text-uppercase text-secondary font-weight-bolder opacity-7">Status</th>
											<th class="text-center text-uppercase text-secondary font-weight-bolder opacity-7">project Period<br>(start/end)</th>
											<th class="text-secondary opacity-7"></th>

										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ projects.successProjectList }" var="project">
											<tr>
												<td class="ps-4" rowspan='2'>
													<h6 class="mb-0">
														<a href="${ path }/detail/${ project.projectSeq }">
															<c:out value="${ fn:substring( project.title ,0,20) }" />
															<c:if test="${ fn:length( project.title ) gt 20 }">
															...
															</c:if>
														</a>
													</h6>
												</td>
												<td rowspan='2'>
													<p class="text-sm font-weight-bold mb-0">${ project.corpName }</p>
												</td>
												<td class="align-middle text-center">
													<span class="text-sm font-weight-bold mb-0">￦<fmt:formatNumber value="${ project.minFundAmt }" pattern="#,###" /></span>
												</td>
												<td class="align-middle text-center" rowspan='2'>
													<span class="text-sm font-weight-bold mb-0">￦<fmt:formatNumber value="${ project.fundAmt }" pattern="#,###" /></span>
												</td>
												<td class="align-middle text-center text-sm" id="projectStatus${ project.projectSeq }"  rowspan='2'>
													<c:if test="${ project.progressCode eq 4 }">
														<div class="mt-1" style="display:flex;align-items:center;justify-content:space-evenly;">
															<span class="badge badge-sm bg-gradient-success">${ project.progressName }</span>
															<%-- <a href="javascript:pay(${ project.projectSeq });" class="text-secondary font-weight-bold text-sm" 
																data-toggle="tooltip" data-original-title="Edit user"> 
																지급 
															</a> --%>
														</div>
													</c:if>
													<c:if test="${ project.progressCode eq 10 }">
														<span class="badge badge-sm bg-gradient-info">프로젝트 진행 중</span>
													</c:if>
													<c:if test="${ project.progressCode eq 11 }">
														<div class="mt-1" style="display:flex;align-items:center;justify-content:space-evenly;">
															<span class="badge badge-sm bg-gradient-warning">${ project.progressName }</span>
														</div>
													</c:if>
												</td>
												<td class="align-middle text-center">
													<span class="text-sm font-weight-bold mb-0">${ project.fundStart }</span>
												</td>
											</tr>
											<tr>
												<td class="align-middle text-center">
													<span class="text-sm font-weight-bold mb-0">￦<fmt:formatNumber value="${ project.maxFundAmt }" pattern="#,###" /></span>
												</td>
												<td class="align-middle text-center">
													<span class="text-sm font-weight-bold mb-0">${ project.fundEnd }</span>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						
						<div class="blog-pagination">
							<ul class="justify-content-center">
								<li class="active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li>。。。</li>
								<li><a href="#">7</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12 pb-4">
					<div class="card my-4 pb-4">
						<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2" style="width:100px">
							<div class="icon icon-lg icon-shape bg-gradient-info shadow-dark text-center border-radius-xl mt-n4 position-absolute">
								<i class="fa-solid fa-flag-checkered" style="opacity: 1;" ></i>
							</div>
						</div>
						<h5 class="font-weight-bolder mb-0" style="margin-left:90px;">종료</h5>
						<div class="card-body px-0 pt-5 pb-2">
							<div class="table-responsive p-0 px-3">
								<table class="table align-items-center mb-0">
									<thead>
										<tr>
											<th class="text-uppercase text-secondary font-weight-bolder opacity-7">Title</th>
											<th class="text-uppercase text-secondary font-weight-bolder opacity-7 ps-2">Corp.</th>
											<th class="text-center text-uppercase text-secondary font-weight-bolder opacity-7">fund amt.</th>
											<th class="text-center text-uppercase text-secondary font-weight-bolder opacity-7">repayment</th>
											<th class="text-center text-uppercase text-secondary font-weight-bolder opacity-7">rate of return</th>
											<th class="text-center text-uppercase text-secondary font-weight-bolder opacity-7">repayment Date</th>
											<th class="text-secondary opacity-7"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ projects.finishedProjectList }" var="project">
											<tr>
												<td class="ps-4">
													<h6 class="mb-0">
														<a href="${ path }/detail/${ project.projectSeq }">
															<c:out value="${ fn:substring( project.title ,0,20) }" />
															<c:if test="${ fn:length( project.title ) gt 20 }">
															...
															</c:if>
														</a>
													</h6>
												</td>
												<td>
													<p class="text-sm font-weight-bold mb-0">${ project.corpName }</p>
												</td>
												<td class="align-middle text-center">
													<span class="text-sm font-weight-bold mb-0">￦<fmt:formatNumber value="${ project.fundAmt }" pattern="#,###" /></span>
												</td>
												<td class="align-middle text-center">
													<span class="text-sm font-weight-bold mb-0">￦<fmt:formatNumber value="${ project.repayment }" pattern="#,###" /></span>
												</td>
												<td class="align-middle text-center">
													<c:choose>
														<c:when test="${ (project.repayment / project.fundAmt - 1) le 0 }">
															<span class="text-sm font-weight-bold mb-0" style="color:red"><fmt:formatNumber value="${ (project.repayment / project.fundAmt - 1) * 100 }" pattern=".00"/>%</span>
														</c:when>
														<c:otherwise>
															<span class="text-sm font-weight-bold mb-0" style="color:blue"><fmt:formatNumber value="${ (project.repayment / project.fundAmt - 1) * 100 }" pattern=".00"/>%</span>
														</c:otherwise>
													</c:choose>
												</td>
												<td class="align-middle text-center">
													<span class="text-sm font-weight-bold mb-0"><fmt:parseDate value="${ project.repaymentDate }" pattern="yyyy-MM-dd HH:mm:ss" var="repaymentDate"/><fmt:formatDate value="${ repaymentDate }" pattern="yyyy-MM-dd" /></span>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						
						<div class="blog-pagination">
							<ul class="justify-content-center">
								<li class="active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li>。。。</li>
								<li><a href="#">15</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12 pb-4">
					<div class="card my-4 pb-4">
						<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2" style="width:100px">
							<div class="icon icon-lg icon-shape bg-gradient-dark shadow-dark text-center border-radius-xl mt-n4 position-absolute">
								<i class="fa-solid fa-stop" style="opacity: 1;"></i>
							</div>
						</div>
						<h5 class="font-weight-bolder mb-0" style="margin-left:90px;">중단 거절 모집실패</h5>
						<div class="card-body px-0 pt-5 pb-2">
							<div class="table-responsive p-0 px-3">
								<table class="table align-items-center mb-0">
									<thead>
										<tr>
											<th class="text-uppercase text-secondary font-weight-bolder opacity-7">Title</th>
											<th class="text-uppercase text-secondary font-weight-bolder opacity-7 ps-2">Corp.</th>
											<th class="text-center text-uppercase text-secondary font-weight-bolder opacity-7">Status</th>
											<th class="text-secondary opacity-7"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ projects.cancelledProjectList }" var="project">
											<tr>
												<td class="ps-4">
													<h6 class="mb-0">
														<a href="http://192.168.217.59:9990/ModuHana/project/detail/${ project.projectSeq }">
															<c:out value="${ fn:substring( project.title ,0,20) }" />
															<c:if test="${ fn:length( project.title ) gt 20 }">
															...
															</c:if>
														</a>
													</h6>
												</td>
												<td>
													<p class="text-sm font-weight-bold mb-0">${ project.corpName }</p>
												</td>
												<td class="align-middle text-center text-sm"  id="projectProgress${ project.projectSeq }">
													<c:if test="${ project.progressCode eq 6 }">
														<span class="badge badge-sm bg-gradient-dark">${ project.progressName }</span>
													</c:if>
													<c:if test="${ project.progressCode eq 7 }">
														<span class="badge badge-sm bg-gradient-danger">${ project.progressName }</span>
													</c:if>
													<c:if test="${ project.progressCode eq 8 }">
														<span class="badge badge-sm bg-gradient-dark">${ project.progressName }</span>
													</c:if>
												</td>
												<td class="align-middle" id="projectStatus${ project.projectSeq }">
													<c:if test="${ project.progressCode eq 6 }">
														<a href="javascript:cancelApprovedProject(${ project.projectSeq });" class="text-secondary font-weight-bold text-sm" 
															data-toggle="tooltip" data-original-title="Edit user"> 
															취소
														</a>
													</c:if>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="blog-pagination">
							<ul class="justify-content-center">
								<li class="active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li>。。。</li>
								<li><a href="#">5</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<%@include file="/WEB-INF/jsp/include/footer.jsp" %>
		</div>
	</main>
	<%@include file="/WEB-INF/jsp/include/sidecard.jsp" %>
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
	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="${ path }/resources/assets/js/material-dashboard.min.js?v=3.0.0"></script>
	
	<!-- My Javascript -->
	<script src="${ path }/resources/assets/js/jquery-3.6.1.min.js"></script>
	<script>
	function approveProject(projectSeq) {
		let json = { 
    			'projectSeq' : projectSeq
        	}
    	
		$.ajax({

			url : '${ path }/project/approve',
			method : 'post',
			data : JSON.stringify(json),
			contentType: "application/json",
			success : function() {
				console.log('성공');
				
				let status = document.getElementById('projectStatus' + projectSeq);
				status.innerHTML = `<a href="javascript:uploadProject(` 
									+ projectSeq 
									+ `);" class="badge badge-sm bg-gradient-info" ` 
									+ `data-toggle="tooltip" data-original-title="Edit user"> `
									+ `업로드 `
									+ `</a> `
									+ `<a href="javascript:cancelApprovedProject(` 
									+ projectSeq 
									+ `);" class="badge badge-sm bg-gradient-secondary" ` 
									+ `data-toggle="tooltip" data-original-title="Edit user"> `
									+ `취소`
									+ `</a>`;
									
				let progress = document.getElementById('projectProgress' + projectSeq);
				progress.innerHTML = `<span class="badge badge-sm bg-gradient-success">승인완료</span>`;
			},
			error : function() {
				alert('실패');
			}
		});
	}
	
	function refuseProject(projectSeq) {
		let json = { 
    			'projectSeq' : projectSeq
        	}
    	
		$.ajax({

			url : '${ path }/project/refuse',
			method : 'post',
			data : JSON.stringify(json),
			contentType: "application/json",
			success : function() {
				console.log('성공');
				
				let status = document.getElementById('projectStatus' + projectSeq);
				status.innerHTML = `<a href="javascript:cancelApprovedProject(` 
									+ projectSeq 
									+ `);" class="badge badge-sm bg-gradient-secondary" ` 
									+ `data-toggle="tooltip" data-original-title="Edit user"> `
									+ `취소`
									+ `</a>`;
				
				let progress = document.getElementById('projectProgress' + projectSeq);
				progress.innerHTML = `<span class="badge badge-sm bg-gradient-dark">거절</span>`;
			},
			error : function() {
				alert('실패');
			}
		});
	}
	
	function uploadProject(projectSeq) {
		let json = { 
    			'projectSeq' : projectSeq
        	}
    	
		$.ajax({

			url : '${ path }/project/upload',
			method : 'post',
			data : JSON.stringify(json),
			contentType: "application/json",
			success : function() {
				console.log('성공');
				
				let status = document.getElementById('projectStatus' + projectSeq);
				status.innerHTML = `<a href="javascript:cancelApprovedProject(` 
									+ projectSeq 
									+ `);" class="badge badge-sm bg-gradient-secondary" ` 
									+ `data-toggle="tooltip" data-original-title="Edit user"> `
									+ `취소`
									+ `</a>`;
				
				let progress = document.getElementById('projectProgress' + projectSeq);
				progress.innerHTML = `<span class="badge badge-sm bg-gradient-info">모집예정</span>`;
			},
			error : function() {
				alert('실패');
			}
		});
	}
	
	function cancelApprovedProject(projectSeq) {
		let json = { 
    			'projectSeq' : projectSeq
        	}
    	
		$.ajax({

			url : '${ path }/project/cancelApprove',
			method : 'post',
			data : JSON.stringify(json),
			contentType: "application/json",
			success : function() {
				console.log('성공');
				
				let status = document.getElementById('projectStatus' + projectSeq);
				status.innerHTML = `<a href="javascript:approveProject(` 
									+ projectSeq 
									+ `);" class="badge badge-sm bg-gradient-success" ` 
									+ `data-toggle="tooltip" data-original-title="Edit user"> `
									+ `승인 `
									+ `</a> `
									+ `<a href="javascript:refuseProject(` 
									+ projectSeq 
									+ `);" class="badge badge-sm bg-gradient-secondary" ` 
									+ `data-toggle="tooltip" data-original-title="Edit user"> `
									+ `거절`
									+ `</a>`;
				
				let progress = document.getElementById('projectProgress' + projectSeq);
				progress.innerHTML = `<span class="badge badge-sm bg-gradient-warning">승인대기</span>`;
			},
			error : function() {
				alert('실패');
			}
		});
	}
	
	function pay(projectSeq) {
		let json = { 
    			'projectSeq' : projectSeq
        	}
    	
		$.ajax({

			url : '${ path }/project/pay',
			method : 'post',
			data : JSON.stringify(json),
			contentType: "application/json",
			success : function() {
				console.log('성공');
				
				let status = document.getElementById('projectStatus' + projectSeq);
				status.innerHTML = `<span class="badge badge-sm bg-gradient-info">지급완료</span>`;
				
			},
			error : function() {
				alert('실패');
			}
		});
	}
	</script>
</body>

</html>