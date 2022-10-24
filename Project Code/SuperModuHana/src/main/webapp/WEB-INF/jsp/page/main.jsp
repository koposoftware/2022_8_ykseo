<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
<!-- CSS Files -->
<link id="pagestyle" href="${ path }/resources/assets/css/material-dashboard.css?v=3.0.0" rel="stylesheet" />
<script src="https://kit.fontawesome.com/3b179c433e.js" crossorigin="anonymous"></script>
<link id="pagestyle" href="${ path }/resources/assets/css/loading-bar.css" rel="stylesheet" />


<style>
.ldBar-label {
   color: white;
   font-family: 'varela round';
   font-size: 1.5rem;
   font-weight: 700;
 }
</style>
</head>

<body class="g-sidenav-show  bg-gray-200">
	
	<!-- sidebar! -->
	<%@include file="/WEB-INF/jsp/include/sidebar.jsp" %>
	<!-- sidebar end -->
	
	<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
		<!-- Navbar -->
		<%@include file="/WEB-INF/jsp/include/navbar.jsp" %>
		<!-- End Navbar -->
		<div class="container-fluid py-4">
			<div class="row">
				<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
					<div class="card">
						<div class="card-header p-3 pt-2">
							<div class="icon icon-lg icon-shape bg-gradient-dark shadow-dark text-center border-radius-xl mt-n4 position-absolute">
								<i class="fa-solid fa-won-sign" style="opacity: 1;"></i>
							</div>
							<div class="text-end pt-1">
								<p class="mb-0 text-capitalize">총 투자모집금액</p>
								<h4 class="mb-0">${ totalFundAmt } 원</h4>
							</div>
						</div>
						<hr class="dark horizontal my-0">
						<div class="card-footer p-3">
							<p class="mb-0">
								<span class="text-success font-weight-bolder">+3,050,000￦
								</span>than yesterday
							</p>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
					<div class="card">
						<div class="card-header p-3 pt-2">
							<div class="icon icon-lg icon-shape bg-gradient-primary shadow-primary text-center border-radius-xl mt-n4 position-absolute">
								<i class="fa-solid fa-users"  style="opacity: 1;"></i>
							</div>
							<div class="text-end pt-1">
								<p class="mb-0 text-capitalize">총 회원 수</p>
								<h4 class="mb-0">${ totalMember } 명</h4>
							</div>
						</div>
						<hr class="dark horizontal my-0">
						<div class="card-footer p-3">
							<p class="mb-0">
								<span class="text-success font-weight-bolder">+3
								</span>than yesterday
							</p>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
					<div class="card">
						<div class="card-header p-3 pt-2">
							<div class="icon icon-lg icon-shape bg-gradient-success shadow-success text-center border-radius-xl mt-n4 position-absolute">
								<i class="fa-solid fa-money-bill-trend-up" style="opacity: 1;"></i>
							</div>
							<div class="text-end pt-1">
								<p class="mb-0 text-capitalize">평균 수익률</p>
								<h4 class="mb-0">${ avgPayoff } %</h4>
							</div>
						</div>
						<hr class="dark horizontal my-0">
						<div class="card-footer p-3">
							<p class="mb-0">
								<span class="text-danger font-weight-bolder">-2%</span>
								than yesterday
							</p>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6">
					<div class="card">
						<div class="card-header p-3 pt-2">
							<div class="icon icon-lg icon-shape bg-gradient-warning shadow-warning text-center border-radius-xl mt-n4 position-absolute">
								<i class="fa-solid fa-pause" style="opacity: 1;"></i>
							</div>
							<div class="text-end pt-1">
								<p class="mb-0 text-capitalize">승인 대기</p>
								<h4 class="mb-0"><a href="${ path }/projects">${ countAwaitingProjects } 개</a></h4>
							</div>
						</div>
						<hr class="dark horizontal my-0">
						<div class="card-footer p-3">
							<p class="mb-0">
								<span class="text-danger font-weight-bolder">-5
								</span>than yesterday
							</p>
						</div>
					</div>
				</div>
			</div>
			
			
			
			<div class="row mt-4">
				<div class="col-lg-3 col-md-6 mt-4 mb-4">
					<div class="card z-index-2 ">
						<div class="card-body" style="height:507px">
							<div class="row">
								<div style="width:130px;" class="ldBar label-center img-fluid rounded-3" data-type="fill" data-img="${ path }/resources/assets/img/index/man.png" data-value="${ sexRatio.man }"></div>   
								<div style="width:160px;" class="ldBar label-center img-fluid rounded-3" data-type="fill" data-img="${ path }/resources/assets/img/index/woman.png" data-value="${ sexRatio.woman }"></div>   
							</div>
							<hr class="dark horizontal my-3">
							<h5 class="mb-0 ">회원 남여 성비</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 mt-4 mb-4">
					<div class="card z-index-2">
						<div class="card-body">
							<div id="subjectChart">
								<%-- <canvas id="subjectChart"></canvas> --%>
							</div>
							<hr class="dark horizontal my-3">
							<h5 class="mb-0 ">콘텐츠 비율</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-5 mt-4 mb-3">
					<div class="card z-index-2 ">
						<div class="card-body">
							<div id="monthFundAmtChart" class="align-middle">
						  		<%-- <canvas id="monthFundAmtChart"></canvas> --%>
							</div>
							<hr class="dark horizontal my-3">
							<h5 class="mb-0 ">월별 투자금 수</h5>
						</div>
					</div>
				</div>
			</div>
			<div class="row mb-4">
				<div class="col-lg-12 col-md-6 mb-md-0 mb-4">
					<div class="card">
						<div class="card-header pb-0">
							<div class="row">
								<div class="col-lg-6 col-7">
									<h5>Projects</h5>
									<p class="text-sm mb-0">
										<i class="fa fa-check text-info" aria-hidden="true"></i> <span
											class="font-weight-bold ms-1">3 done</span> this month
									</p>
								</div>
								<div class="col-lg-6 col-5 my-auto text-end">
									<div class="dropdown float-lg-end pe-4">
										<a class="cursor-pointer" id="dropdownTable"
											data-bs-toggle="dropdown" aria-expanded="false"> <i
											class="fa fa-ellipsis-v text-secondary"></i>
										</a>
										<ul class="dropdown-menu px-2 py-3 ms-sm-n4 ms-n5"
											aria-labelledby="dropdownTable">
											<li>
												<a class="dropdown-item border-radius-md" href="javascript:;">Action</a>
											</li>
											<li>
												<a class="dropdown-item border-radius-md" href="javascript:;">Another action</a>
											</li>
											<li>
												<a class="dropdown-item border-radius-md" href="javascript:;">Something else here</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="card-body px-0 pb-2">
							<div class="table-responsive px-3">
								<table class="table align-items-center mb-0">
									<thead>
										<tr>
											<th class="text-uppercase text-secondary font-weight-bolder opacity-7">Title</th>
											<th class="text-center text-uppercase text-secondary font-weight-bolder opacity-7 ps-2">Corp.</th>
											<th class="text-center text-uppercase text-secondary font-weight-bolder opacity-7">Target amt.<br>(MIN/MAX)</th>
											<th class="text-center text-uppercase text-secondary font-weight-bolder opacity-7">fund amt.</th>
											<th class="text-center text-uppercase text-secondary font-weight-bolder opacity-7">Progress</th>
											<th class="text-end text-uppercase text-secondary font-weight-bolder opacity-7">fund period</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ inProgressProjects }" var="project">
											<tr>
												<td class="ps-4" rowspan='2'>
													<h6 class="mb-0">
														<a href="http://192.168.217.59:9990/ModuHana/project/detail/${ project.projectSeq }">
															<c:out value="${ fn:substring( project.title ,0,20) }" />
															<c:if test="${ fn:length( project.title ) gt 20 }">
															...
															</c:if>
														</a>
													</h6>
												</td>
												<td class="align-middle text-center" rowspan='2'>
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
	<script src="${ path }/resources/assets/js/plugins/chartjs.min.js"></script>
	<script src="${ path }/resources/assets/js/loading-bar.js"></script>
	
	<!-- My Javascript -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
	<script src="https://code.highcharts.com/modules/series-label.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/color-js/1.0/color.min.js" integrity="sha512-RpdNjGMyXXWMxBLCPGQUUInZYVJjfS2w6SYCYHF4cBok/nIUV977C08RSRx0t5ABIIw9JxceiY7iwMPbXwX0yA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="${ path }/resources/assets/js/utils.js"></script>
	<script>
	
		const monthFundAmtLabels = [];
		const today = new Date();
		for (var i = today.getMonth() - 5; i < today.getMonth() + 1; i++) {
			monthFundAmtLabels.push(window.months[i]);	
		}
		
		const monthFundAmtData = [];
		<c:forEach items="${ monthFundAmt }" var="value">
			monthFundAmtData.push(${ value });
		</c:forEach>
		
		Highcharts.setOptions({
		    colors: ['#e90061',
		    	'#EB1970',
		    	'#ED3380',
		    	'#EF4C90',
		    	'#F166A0',
		    	'#F37FB0',
		    	'#F699BF',
		    	'#F8B2CF',
		    	'#FACCDF',
		    	'#FCE5EF',
		    	'#FEFFFF'
			]
		});
		
		Highcharts.chart('monthFundAmtChart', {
			chart: {
		        type: 'line',
		        marginTop: 100
		    },
		    
		    title: {
		        text: ''
		    },

		    subtitle: {
		        text: ''
		    },

		    yAxis: {
		        title: {
		            text: '월별 투자금'
		        }
		    },

		    xAxis: {
		            categories: monthFundAmtLabels
		    },

		    legend: {
		        layout: 'vertical',
		        align: 'right',
		        verticalAlign: 'middle'
		    },

		    series: [{
		    	showInLegend: false,
		        name: '',
		        data: monthFundAmtData
		    }],

		    responsive: {
		        rules: [{
		            condition: {
		                maxWidth: 500
		            },
		            chartOptions: {
		                legend: {
		                    layout: 'horizontal',
		                    align: 'center',
		                    verticalAlign: 'bottom'
		                }
		            }
		        }]
		    }

		});
		
	</script>
	<script>
		const subjectData = [];
		<c:forEach items="${ subjectRatio }" var="subject">
			subjectData.push(['${ subject.subjectName }', ${ subject.ratio }]);
		</c:forEach>
			
		// Data retrieved from https://netmarketshare.com/
		Highcharts.chart('subjectChart', {
		    chart: {
		        plotBackgroundColor: null,
		        plotBorderWidth: 0,
		        plotShadow: false
		    },
		    title: {
		        text: '',
		        align: 'center',
		        verticalAlign: 'middle',
		        y: 60
		    },
		    tooltip: {
		        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		    },
		    accessibility: {
		        point: {
		            valueSuffix: '%'
		        }
		    },
		    plotOptions: {
		        pie: {
		            dataLabels: {
		                enabled: true,
		                distance: -50,
		                style: {
		                    fontWeight: 'bold',
		                    color: 'white'
		                }
		            },
		            startAngle: -90,
		            endAngle: 90,
		            center: ['50%', '75%'],
		            size: '110%'
		        }
		    },
		    series: [{
		        type: 'pie',
		        name: '',
		        innerSize: '50%',
		        data: subjectData
		    }]
		});
	</script>
	
	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="${ path }/resources/assets/js/material-dashboard.min.js?v=3.0.0"></script>
</body>

</html>