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
<link id="pagestyle" href="${ path }/resources/assets/css/main.css" rel="stylesheet" />
<link id="pagestyle" href="${ path }/resources/assets/css/material-dashboard.css?v=3.0.0" rel="stylesheet" />
<link id="pagestyle" href="${ path }/resources/assets/css/loading-bar.css" rel="stylesheet" />
</head>

<body class="g-sidenav-show  bg-gray-200">
	<%@include file="/WEB-INF/jsp/include/sidebar_project.jsp" %>
	
	<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
	
		<div class="modal" id="payoff-end-modal" tabindex="-1" style="display:none">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">정산완료</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center">
						<img style="width:50%" alt="계좌 생성 이미지" src="${ path }/resources/assets/img/gif/payoff-complete.gif">
						<p id="p-complete"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="modalHidden('payoff-end-modal')">확인</button>
					</div>
				</div>
			</div>
		</div>
	
		<!-- Navbar -->
		<%@include file="/WEB-INF/jsp/include/navbar.jsp" %>
		<!-- End Navbar -->
		
			
		<div class="container-fluid py-4">
		
			<div class="row">
				<div class="col-lg-12 col-md-6 mb-4">
					<div class="card z-index-2">
						<div class="card-body">
							<h3 class="mb-0 ">${ project.title }</h3>
							<p class="mb-0 ">${ project.corpName }</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 mt-4 mb-4">
					<div class="card z-index-2 ">
						<div class="card-body" style="height:507px">
							<div class="row">
								<div style="width:130px;" class="ldBar label-center img-fluid rounded-3" data-type="fill" data-img="${ path }/resources/assets/img/index/man.png" data-value="${ sexRatio.man }"></div>   
								<div style="width:160px;" class="ldBar label-center img-fluid rounded-3" data-type="fill" data-img="${ path }/resources/assets/img/index/woman.png" data-value="${ sexRatio.woman }"></div>   
							</div>
							<hr class="dark horizontal my-3">
							<h6 class="mb-0 ">투자자 남여 성비</h6>
						</div>
					</div>
				</div>
				<div class="col-lg-9 mt-4 mb-3">
					<div class="card z-index-2 ">
						<div class="card-body">
							<div id="trendsInFundChart" class="align-middle">
						  		<%-- <canvas id="monthFundAmtChart"></canvas> --%>
							</div>
							<hr class="dark horizontal my-3">
							<h6 class="mb-0 ">누적 투자금</h6>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
					<div class="card">
						<div class="card-header p-3 pt-2">
							<div class="text-end pt-1">
								<p class="text-sm mb-0 text-capitalize">목표 모집금액</p>
								<h4 class="mb-0 mt-3"><fmt:formatNumber value="${ project.minFundAmt }" pattern="###,###"/>/<fmt:formatNumber value="${ project.maxFundAmt }" pattern="###,###"/> 원</h4>
							</div>
						</div>
						<div class="card-footer p-3">
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6">
					<div class="card">
						<div class="card-header p-3 pt-2">
							<div class="text-end pt-1">
								<p class="text-sm mb-0 text-capitalize">추정 손익분기점</p>
								<h4 class="mb-0 mt-3"><fmt:formatNumber value="${ project.estBep }" pattern="###,###"/> 원</h4>
							</div>
						</div>
						<div class="card-footer p-3">
							<p class="mb-0">
							</p>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
					<div class="card">
						<div class="card-header p-3 pt-2">
							<div class="text-end pt-1">
								<p class="text-sm mb-0 text-capitalize">모집 금액</p>
								<h4 class="mb-0 mt-3" style="color:blue"><fmt:formatNumber value="${ project.fundAmt }" pattern="###,###"/> 원</h4>
							</div>
						</div>
						<div class="card-footer p-3">
							<p class="mb-0">
							</p>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
					<div class="card">
						<div class="card-header p-3 pt-2">
							<div class="text-end pt-1">
								<p class="text-sm mb-0 text-capitalize">투자자 수</p>
								<h4 class="mb-0 mt-3">${ countFundList } 명</h4>
							</div>
						</div>
						<div class="card-footer p-3">
							<p class="mb-0">
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-xl-3 col-sm-6">
					<div class="card">
						<div class="card-header p-3 pt-2">
							<div class="text-end pt-1">
								<p class="text-sm mb-0 text-capitalize">증권명</p>
								<h4 class="mb-0 mt-3">${ project.securityName }</h4>
							</div>
						</div>
						<div class="card-footer p-3">
							<p class="mb-0">
							</p>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6">
					<div class="card">
						<div class="card-header p-3 pt-2">
							<div class="text-end pt-1">
								<p class="text-sm mb-0 text-capitalize">상환방법</p>
								<h4 class="mb-0 mt-3">${ project.repaymentName }</h4>
							</div>
						</div>
						<div class="card-footer p-3">
							<p class="mb-0">
							</p>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6">
					<div class="card">
						<div class="card-header p-3 pt-2">
							<div class="text-end pt-1">
								<p class="text-sm mb-0 text-capitalize">상환금액</p>
								<h4 class="mb-0 mt-3"><fmt:formatNumber value="${ project.repayment }" pattern="###,###,###"/> 원</h4>
							</div>
						</div>
						<div class="card-footer p-3">
							<p class="mb-0">
							</p>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6">
					<div class="card">
						<div class="card-header p-3 pt-2">
							<div class="text-end pt-1">
								<p class="text-sm mb-0 text-capitalize">수익률</p>
								<c:choose>
									<c:when test="${ not empty project.repayment }">
									<c:choose>
										<c:when test="${ (project.repayment / project.fundAmt - 1) le 0 }">
											<h4 class="mb-0 mt-3" style="color:red"><fmt:formatNumber value="${ (project.repayment / project.fundAmt - 1) * 100 }" pattern="##.0"/> %</h4>
										</c:when>
										<c:otherwise>
											<h4 class="mb-0 mt-3" style="color:blue"><fmt:formatNumber value="${ (project.repayment / project.fundAmt - 1) * 100 }" pattern="##.0"/> %</h4>
										</c:otherwise>
									</c:choose>
									</c:when>
									<c:otherwise>
										<h4 class="mb-0 mt-3">상환 전</h4>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="card-footer p-3">
							<p class="mb-0">
							</p>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="row mt-5">
				<div class="col-lg-8">
				</div>
				<div class="col-lg-2">
					<button class="btn bg-gradient-primary w-100 mb-0 toast-btn" type="submit" data-target="successToast" onclick="payoff()">정산하기</button>
				</div>
				<div class="col-lg-2">
					<button class="btn bg-gradient-secondary w-100 mb-0 toast-btn" type="button" data-target="successToast">투자자 화면으로 이동</button>
				</div>
			</div>
			
			<div class="row">
				<div class="col-12">
					<div class="card my-4">
						<div class="card-header pb-0">
							<div class="row">
								<div class="col-lg-6 col-7">
									<h6>투자자 현황</h6>
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
												<a class="dropdown-item border-radius-md" href="javascript:;">더보기</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="card-body px-0 pb-2">
							<div class="table-responsive p-0">
								<table class="table align-items-center mb-0">
									<thead>
										<tr>
											<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Name</th>
											<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">account no</th>
											<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">amount</th>
											<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">tax</th>
											<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">fee</th>
											<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">payoff</th>
											<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">status</th>
											<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">fund date</th>
										</tr>
									</thead>
									<tbody id="fundTableBodyList">
										<c:forEach items="${ fundList }" var="fund">
											<tr>
												<td class="ps-4">
													<h6 class="mb-0 text-sm">${ fund.memberName }</h6>
												</td>
												<td class="align-middle text-center">
													<span class="text-xs font-weight-bold mb-0">${ fund.memberAccountNo }</span>
												</td>
												<td class="align-middle text-center">
													<span class="text-xs text-center font-weight-bold mb-0"><fmt:formatNumber value="${ fund.amount }" pattern="###,###"/></span>
												</td>
												<td class="align-middle text-center">
													<span class="text-xs font-weight-bold mb-0"><fmt:formatNumber value="${ fund.tax }" pattern="###,###"/></span>
												</td>
												<td class="align-middle text-center">
													<span class="text-xs font-weight-bold mb-0"><fmt:formatNumber value="${ fund.fee }" pattern="###,###"/></span>
												</td>
												<td class="align-middle text-center">
													<span class="text-xs font-weight-bold mb-0" style="color:green"><fmt:formatNumber value="${ fund.payoff }" pattern="###,###"/></span>
												</td>
												<td class="align-middle text-center">
												<c:choose>
													<c:when test="${ fund.payoffStatus eq 'S' }">
														<span class="text-xs font-weight-bold mb-0" style="color:blue">성공</span>
													</c:when>
													<c:when test="${ fund.payoffStatus eq 'F' }">
														<span class="text-xs font-weight-bold mb-0" style="color:red">실패</span>
													</c:when>
													<c:otherwise>
														<span class="text-xs font-weight-bold mb-0">정산 전</span>
													</c:otherwise>
												</c:choose>
												</td>
												<td class="align-middle text-center">
													<span class="text-xs font-weight-bold mb-0">${ fund.fundDate }</span>
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
	<script src="${ path }/resources/assets/js/plugins/chartjs.min.js"></script>
	<script src="${ path }/resources/assets/js/loading-bar.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
	<script src="https://code.highcharts.com/modules/series-label.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/color-js/1.0/color.min.js" integrity="sha512-RpdNjGMyXXWMxBLCPGQUUInZYVJjfS2w6SYCYHF4cBok/nIUV977C08RSRx0t5ABIIw9JxceiY7iwMPbXwX0yA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="${ path }/resources/assets/js/utils.js"></script>
	<script src="${ path }/resources/assets/js/jquery-3.6.1.min.js"></script>
	<script>
		const trendsInFundLabel = [];
		const trendsInFundData = [];
		<c:forEach items="${ trendsInFund }" var="data">
			trendsInFundLabel.push('${ data.DAY }');
			trendsInFundData.push(${ data.AMOUNT });
		</c:forEach>
		
		// Data retrieved from https://www.ssb.no/statbank/table/10467/
		Highcharts.chart('trendsInFundChart', {
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

	</script>
	<script>
		function modalShow(modalName) {
			let modal = document.getElementById(modalName);
			modal.style.display = "block";
		}
		
		function modalHidden(modalName) {
			let modal = document.getElementById(modalName);
			modal.style.display = "none";
		}
		
		const modal = document.getElementsByClassName("modal")
        function modalOn() {
            modal[0].style.display = "flex"
        }
        function isModalOn() {
            return modal[0].style.display === "flex"
        }
        function modalOff() {
            modal[0].style.display = "none"
        }
        
        const closeBtns = document.getElementsByClassName("btn-modal-close");
        for (const closeBtn of closeBtns) {
        	closeBtn.addEventListener('click', function onClick() {
        		modalOff();
			});
		}
        
        function payoff() {
    		let json = { 
        			'projectSeq' : ${ project.projectSeq }
            	}
        	
    		$.ajax({

    			url : '${ path }/payoff',
    			method : 'post',
    			data : JSON.stringify(json),
    			contentType: "application/json",
    			success : function(data) {
    				console.log('성공');
    				console.log(data);
    				
    				
    				let str = ``;
    				let tmp = ``;
    				
    				for(let i=0; i<data.length; i++) {
    					
    					if(data[i].payoffStatus == 'B') {
    						tmp = `<span class="text-xs font-weight-bold mb-0">정산 전</span>`;
    					} else if (data[i].payoffStatus == 'S') {
    						tmp = `<span class="text-xs font-weight-bold mb-0" style="color:blue">성공</span>`;
    					} else {
    						tmp = `<span class="text-xs font-weight-bold mb-0" style="color:red">실패</span>`;
    					}
    					
    					str += `<tr>`
								+ `<td class="ps-4">`
								+ `	<h6 class="mb-0 text-sm">` + data[i].memberName + `</h6>`
								+ `</td>`
								+ `<td class="align-middle text-center">`
								+ `	<span class="text-xs font-weight-bold mb-0">` + data[i].memberAccountNo + `</span>`
								+ `</td>`
								+ `<td class="align-middle text-center">`
								+ `<span class="text-xs text-center font-weight-bold mb-0">` + putComma(data[i].amount) + `</span>`
								+ `</td>`
								+ `<td class="align-middle text-center">`
								+ `	<span class="text-xs font-weight-bold mb-0">` + putComma(data[i].tax) + `</span>`
								+ `</td>`
								+ `<td class="align-middle text-center">`
								+ `	<span class="text-xs font-weight-bold mb-0">` + putComma(data[i].fee) + `</span>`
								+ `</td>`
								+ `<td class="align-middle text-center">`
								+ `	<span class="text-xs font-weight-bold mb-0" style="color:green">` + putComma(data[i].payoff) + `</span>`
								+ `</td>`
								+ `<td class="align-middle text-center">`
								+ tmp
								+ `</td>`
								+ `<td class="align-middle text-center">`
								+ `	<span class="text-xs font-weight-bold mb-0">` + data[i].fundDate + `</span>`
								+ `</td>`
								+ `</tr>`;
    				}
    				
				
    				let fundTableBodyList = document.getElementById('fundTableBodyList');
    				fundTableBodyList.innerHTML = str;
    				
    			},
    			error : function() {
    				alert('실패');
    			}
    		});
    		
    		modalShow('payoff-end-modal');
    		setTimeout(function () {
    			document.getElementById('p-complete').innerHTML = '정산이 완료되었습니다.';
   			}, 2000);
    	}
        
        function putComma(num) {
        	return num.replace(/\B(?=(\d{3})+(?!\d))/g, ',')
        }
        
    </script>
    
	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="${ path }/resources/assets/js/material-dashboard.min.js?v=3.0.0"></script>
	
</body>

</html>