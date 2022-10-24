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
  
<style type="text/css">
a {
	 color:black
}
a:hover {
	 color:var(--color-primary);
}
input[type='date'] {
	border-color: darkgray;
    padding: 5px 10px;
    border-radius: 5px;
}
</style>
</head>

<body>

	<!-- ======= Modal ======== -->
	<div class="modal" id="transfer-modal" style="display:none">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">예치금 출금</h5>
					<button type="button" class="btn-close btn-modal-close" data-bs-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>
				<div class="modal-body">
					<form name="transferForm">
						<p>받을 계좌</p>
						<div class="d-flex">
							<select class="col-lg-5" name="dealBankCode">
								<c:forEach items="${ bankList }" var="bank">
									<option value="${ bank.code }"
										<c:if test="${ bank.code eq 81 }">
										selected
										</c:if>
									>${ bank.name }</option>
								</c:forEach>
							</select>
							<input class="col-lg-7 text-end" type="text" name="dealAcctNo">
						</div>
						<div>
							<p>금액 | <span>총 잔액: ${ myAccount.balance } 원</span></p>
							<input class="col-lg-12 text-end" type="text" name="amount" placeholder="출금할 금액(원)" style="display:none">
							<input class="col-lg-12 text-end" type="text" id="amountShow" name="amountShow" placeholder="출금할 금액(원)">
						</div>
						<div>
							<p>받는 계좌에 표기</p>
							<input class="col-lg-12 text-end" type="text" name="dealName" value="${ user.name }">
						</div>
						<div>
							<p>나에게 표기</p>
							<input class="col-lg-12 text-end" type="text" name="name" placeholder="미입력시 수취인명">
						</div>
						<div>
							<p>비밀번호 4자리</p>
							<input class="col-lg-12" name="password" type="password">
						</div>
					</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn primary-button" onclick="transfer()">이체</button>
						<button type="button" class="btn secondary-button btn-modal-close"
							data-bs-dismiss="modal">취소</button>
					</div>
			</div>
		</div>
	</div>
	<div class="modal" id="transfer-end-modal" style="display:none">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">예치금 출금</h5>
					<button type="button" class="btn-close btn-modal-close" data-bs-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>
				<div class="modal-body text-center">
					<div class="text-center">
						<img style="width:50%" alt="계좌 생성 이미지" src="${ path }/resources/assets/img/mypage/pay.gif">
					</div>
					<h5>이체가 완료되었습니다.</h5>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn primary-button" onclick="modalHidden('transfer-end-modal')">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- End Modal -->

	<!-- ======= Header ======= -->
	<%@include file="/WEB-INF/jsp/include/header.jsp" %>
	<!-- End Header -->

	<main id="main">

		<!-- ======= mypage-fund Section ======= -->
		<section id="mypage-fund" class="mypage-fund mt-5">
			<div class="container" data-aos="fade-up" data-aos-delay="100">

				<div class="row gy-4">
					<div class="col-lg-6">
						<div
							class="info-item  d-flex flex-column justify-content-center align-items-center">
							<i class="bi bi-activity"></i>
							<h3 class="mt-3">투자 중 ${ fundMap.inProgressFundSize }건</h3>
							<p>${ fundMap.inProgressCost } 원</p>
						</div>
					</div>
					<!-- End Info Item -->

					<div class="col-lg-3 col-md-6">
						<div
							class="info-item d-flex flex-column justify-content-center align-items-center">
							<i class="bi bi-check-circle"></i>
							<h3 class="mt-3">누적 투자 ${ fundMap.cumulativeFundSize }건</h3>
							<p>${ fundMap.cumulativeCost } 원</p>
						</div>
					</div>
					<!-- End Info Item -->

					<div class="col-lg-3 col-md-6">
						<div
							class="info-item  d-flex flex-column justify-content-center align-items-center">
							<i class="bi bi-piggy-bank"></i>
							<h3>현재까지 수익</h3>
							<p>${ fundMap.sumProceeds } 원</p>
						</div>
					</div>
					<!-- End Info Item -->

				</div>

			</div>
		</section>
		<!-- End Contact Section -->

		<!-- ======= Features Section ======= -->
		<section id="features" class="features section-bg">
			<div class="container" data-aos="fade-up">
		
				<ul class="nav nav-tabs row  g-2 d-flex">
		
					<li class="nav-item col-6"><a class="nav-link active show"
						data-bs-toggle="tab" data-bs-target="#tab-1">
							<h4>투자내역</h4>
						</a>
					</li>
					<!-- End tab nav item -->
		
					<li class="nav-item col-6"><a class="nav-link"
						data-bs-toggle="tab" data-bs-target="#tab-2">
							<h4>예치금 잔액</h4>
						</a>
					</li>
					<!-- End tab nav item -->
				</ul>
		
				<div class="tab-content">
		
					<div class="tab-pane active show" id="tab-1">
					
						<!-- ======= Servie Cards Section ======= -->
						<section id="services-cards" class="services-cards">
							<div class="container" data-aos="fade-up">
						
								<div class="px-5">
						
									<div class="col-lg-12" data-aos="zoom-in" data-aos-delay="100" style="margin-bottom:100px;">
										<h4>투자 현황</h4>
										
										<div class="row mt-3">
											<div class="col-lg-6" id="inProgressFundChart">
											</div>
											<div class="col-lg-6" id="cumulativeFundStatus">
											</div>
										</div>
										
									</div>
									<!-- End feature item-->
									
									<div class="col-lg-12 mb-5" data-aos="zoom-in" data-aos-delay="100">
										<h4>투자 중인 내역</h4>
										<!-- <input type="date" class="firstDayOfMonth"/> ~ <input type="date"  class="today"/> -->
										<table class="table my-3" style="background-color:white">
											<tr style="background-color:lightgray">
												<th scope="col">프로젝트명</th>
												<th scope="col" class="text-end" style="width:25%">신청금액</th>
												<th scope="col" class="text-end" style="width:25%">신청일</th>
												<th scope="col" class="text-end" style="width:25%">프로젝트 종료일</th>
											</tr>
											<c:if test="${ empty fundMap.inProgressFund }">
												<td class="text-center">현재 투자 중인 내역이 없습니다.</td>
											</c:if>
											<c:forEach items="${ fundMap.inProgressFund }" var="fund">		
											<tr>
												<td style="width:25%"><a href="${ path }/fund/detail/${ fund.fundSeq }"><c:out value="${ fund.projectTitle }"/></a></td>
												<td class="text-end" style="width:25%"><fmt:formatNumber value="${ fund.amount }" pattern="#,###"/>원</td>
												<td class="text-end" style="width:25%"><fmt:parseDate value="${ fund.fundDate }" pattern="yyyy-MM-dd HH:mm:ss" var="inProgressFundRegDate"/><fmt:formatDate value="${ inProgressFundRegDate }" pattern="yyyy-MM-dd" /></td>
												<td class="text-end" style="width:25%"><c:out value="${ fund.projectExpireDate }"/></td>
											</tr>
											</c:forEach>
										</table>
									</div>
									<!-- End feature item-->
						
									<div class="col-lg-12 mb-5" data-aos="zoom-in" data-aos-delay="100">
										<h4>누적 투자 내역</h4>
										<!-- <input type="date" class="firstDayOfMonth"/> ~ <input type="date" class="today"/> -->
										<table class="table my-3" style="background-color:white">
											<tr style="background-color:lightgray">
												<th scope="col" style="width:25%">프로젝트명</th>
												<th scope="col" class="text-end" style="width:25%">신청금액</th>
												<th scope="col" class="text-end" style="width:25%">신청일</th>
												<th scope="col" class="text-end" style="width:25%">프로젝트 종료일</th>
											</tr>
											<c:if test="${ empty fundMap.cumulativeFund }">
												<td class="text-center">종료된 투자 내역이 없습니다.</td>
											</c:if>
											<c:forEach items="${ fundMap.cumulativeFund }" var="fund">		
											<tr>
												<td style="width:25%"><a href="${ path }/fund/detail/${ fund.fundSeq }"><c:out value="${ fund.projectTitle }"/></a></td>
												<td class="text-end" style="width:25%"><fmt:formatNumber value="${ fund.amount }" pattern="#,###"/>원</td>
												<td class="text-end" style="width:25%"><fmt:parseDate value="${ fund.fundDate }" pattern="yyyy-MM-dd HH:mm:ss" var="cumulativeFundRegDate"/><fmt:formatDate value="${ cumulativeFundRegDate }" pattern="yyyy-MM-dd" /></td>
												<td class="text-end" style="width:25%"><c:out value="${ fund.projectExpireDate }"/></td>
											</tr>
											</c:forEach>
										</table>
									</div>
									<!-- End feature item-->
								</div>
						
							</div>
						</section>
						<!-- End Servie Cards Section -->
						
					</div>
					<!-- End tab content item -->
		
					<div class="tab-pane" id="tab-2">
						<!-- ======= Servie Cards Section ======= -->
						<section id="services-cards" class="services-cards">
							<div class="container" data-aos="fade-up">
						
								<div class="px-5">
						
									<div class="col-lg-12 mb-5" data-aos="zoom-in" data-aos-delay="100">
										<h4>예치금 계좌</h4>
										<div class="col-lg-6 bg-white p-4 my-4 rounded">
											<a href="#">
												<img alt="하나은행로고" src="${ path }/resources/assets/img/하나은행-트레이드-로고.jpg" width="21px">
												KEB하나은행
												<span class="fw-bold">${ myAccount.accountNo }</span> 
												<i class="bi bi-clipboard"></i>
											</a>
											<div class="text-end fs-4 my-4 bg-light px-4 py-3 rounded" id="account-balance-div">
												<fmt:formatNumber value="${ myAccount.balance }" pattern="#,###" /> 원
											</div>
											<!-- <div class="d-flex justify-content-center align-items-center"> -->
											<div class="d-flex justify-content-end align-items-end">
												<button class="primary-button" onclick="modalShow('transfer-modal')">출금하기</button>
											</div>
										</div>
									</div>
									<!-- End feature item-->
						
									<div class="col-lg-12 mb-5" data-aos="zoom-in" data-aos-delay="100">
										<h4>거래내역</h4>
										<input type="date" class="firstDayOfMonth"/> ~ <input type="date" class="today"/>
										<table class="table my-3" id="transaction-table" style="background-color:white">
											<tr style="background-color:lightgray">
												<th scope="col" style="width:25%">거래명</th>
												<th scope="col" class="text-end" style="width:25%">거래금액</th>
												<th scope="col" class="text-end" style="width:25%">잔액</th>
												<th scope="col" class="text-end" style="width:25%">거래일자</th>
											</tr>
											<c:if test="${ empty transactionList }">
												<td class="text-center">거래내역이 존재하지 않습니다.</td>
											</c:if>
											<c:forEach items="${ transactionList }" var="transaction">		
											<tr>
												<td style="width:25%"><c:out value="${ transaction.name }"/></td>
												<td class="text-end" style="width:25%"><fmt:formatNumber value="${ transaction.amount }" pattern="#,###"/>원</td>
												<td class="text-end" style="width:25%"><fmt:formatNumber value="${ transaction.balance }" pattern="#,###"/>원</td>
												<td  class="text-end" style="width:25%"><fmt:parseDate var="transactionRegDate" value="${ transaction.regDate }" pattern="yyyy-MM-dd HH:mm:ss"/><fmt:formatDate value="${ transactionRegDate }" pattern="yyyy-MM-dd" /></td>
											</tr>
											</c:forEach>
										</table>
									</div>
									<!-- End feature item-->
								</div>
							</div>
						</section>
						<!-- End Servie Cards Section -->
					</div>
					<!-- End tab content item -->
					
				</div>
			</div>
		</section>
		<!-- End Features Section -->

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
	<script>
		let todayInputs = document.getElementsByClassName('today');
		for(let i = 0; i<todayInputs.length; i++){
			todayInputs[i].value= getToday();
			//console.log(new Date());
		}
		
		let firstDayOfMonthInputs = document.getElementsByClassName('firstDayOfMonth');
		for(let i = 0; i<firstDayOfMonthInputs.length; i++){
			firstDayOfMonthInputs[i].value= getFirstDayOfMonth();
			//console.log(new Date());
		}
		
		function getToday(){
		    var date = new Date();
		    var year = date.getFullYear();
		    var month = ("0" + (1 + date.getMonth())).slice(-2);
		    var day = ("0" + date.getDate()).slice(-2);

		    return year + "-" + month + "-" + day;
		}
		
		function getFirstDayOfMonth(){
		    var date = new Date();
		    var year = date.getFullYear();
		    var month = ("0" + (1 + date.getMonth())).slice(-2);
		    var day = "01";

		    return year + "-" + month + "-" + day;
		}
	</script>
	
	<script src="${ path }/resources/assets/js/jquery-3.6.1.min.js"></script>
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
        
        function transfer(){
        	let f = document.transferForm;
        	let json = { 
        			apiKey : ''
        			, activeAcctNo : ${ myAccount.accountNo }
        			, typeCode : '1'
        			, name : f.name.value
		        	, amount : f.amount.value
	        		, dealBankCode : f.dealBankCode.value
		        	, dealAcctNo : f.dealAcctNo.value
        			, dealName : f.dealName.value
		        	, password : f.password.value
	        	}
					
        	$.ajax({

				url : 'http://13.209.81.235/HanaBank/transfer',
				method : 'put',
				data : JSON.stringify(json),
				contentType: "application/json",
				success : function() {
					console.log('성공');
					getAccountAndTransactionList();
					clearForm(f);
				},
				error : function() {
					alert('실패');
				}
			})
        }
        
        function getAccountAndTransactionList() {
        	let apiData = { 
        			apiKey : ''
            		, accountNo : '${ myAccount.accountNo }'
	        	}
        	
        	$.ajax({

				url : 'http://13.209.81.235/HanaBank/account',
				method : 'get',
				data : apiData,
				contentType: "application/json",
				success : function(res) {
					console.log('성공');
					console.log(res.data.balance);
					document.getElementById('account-balance-div').innerHTML = putComa(res.data.balance) + ` 원`;
				},
				error : function() {
					alert('실패');
				}
			})
			
        	$.ajax({

				url : 'http://13.209.81.235/HanaBank/transaction',
				method : 'get',
				data : apiData,
				contentType: "application/json",
				success : function(res) {
					console.log('성공');
					console.log(res);
					updateMyPageTranfer(res.data);
				},
				error : function() {
					alert('실패');
				}
			})
			
        }
        
        function updateMyPageTranfer(res) {
        	
        	let str = `<tr>`
					+ `<th scope="col" style="width:25%">거래명</th>`
					+ `<th scope="col" class="text-end" style="width:25%">거래금액</th>`
					+ `<th scope="col" class="text-end" style="width:25%">잔액</th>`
					+ `<th scope="col" class="text-end" style="width:25%">거래일자</th>`
					+ `</tr>`;
			
			let size = res.transactionList.length;
			for (let i = 0; i < size; i++) {
				let transaction = res.transactionList[i];
				console.log(transaction);
				str += `<tr>`
					+ `<td style="width:25%"><c:out value="` + transaction.name + `"/></td>`
					+ `<td class="text-end" style="width:25%">` + putComa(transaction.amount) + `원</td>`
					+ `<td class="text-end" style="width:25%">` + putComa(transaction.balance) + `원</td>`
					+ `<td  class="text-end" style="width:25%">` + transaction.regDate.split(' ')[0] + `</td>`
					+ `</tr>`;
					
					
					
					//`<tr>`
					//+ `<td><c:out value="` + transaction.name + `"/></td>`
					//+ `<td><c:out value="` + transaction.amount + `"/></td>`
					//+ `<td><c:out value="` + transaction.balance + `"/></td>`
					//+ `<td class="text-end"><c:out value="` + transaction.regDate + `"/></td>`
					//+ `</tr>`;
			}
			
			// console.log(str);
			document.getElementById('transaction-table').innerHTML = str;
			
			modalHidden('transfer-modal');
			modalShow('transfer-end-modal');
			
        }
        
        function clearForm(f) {
        	f.dealBankCode.value = '81';
        	f.dealAcctNo.value = '';
        	f.amount.value = '';
        	f.dealName.value = '${ user.name }';
        	f.name.value = '';
        	f.password.value = '';
        }

        function putComa(val){
        	return val.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        }
        $('#amountShow').change(function(){
        	let amountShowVal = $('#amountShow').val().replace(',', '');
        	$('input[name=amount]').val(amountShowVal);
        	$('#amountShow').val(putComa(amountShowVal));
		});
        
	</script>
	<!-- My Javascript -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
	<script src="https://code.highcharts.com/modules/series-label.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/color-js/1.0/color.min.js" integrity="sha512-RpdNjGMyXXWMxBLCPGQUUInZYVJjfS2w6SYCYHF4cBok/nIUV977C08RSRx0t5ABIIw9JxceiY7iwMPbXwX0yA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script>
	Highcharts.setOptions({
	    colors: [
	    	'#FFB319'
	    	, '#79B4B7'
		]
	});
	
	const inProgressFundChartData = [];
	<c:forEach items="${ fundMap.inProgressFund }" var="fund">
		inProgressFundChartData.push({ name:'${ fund.projectTitle }', y: ${ fund.amount } });
	</c:forEach>
	
	
	// Data retrieved from https://netmarketshare.com/
	Highcharts.chart('inProgressFundChart', {
	    chart: {
	    	backgroundColor: null,
	        plotBorderWidth: null,
	        plotShadow: false,
	        type: 'pie',
	        marginTop: 50
	    },
	    title: {
	        text: '<b>투자금 배분 현황</b>'
	    },
	    tooltip: {
	        pointFormat: ': <b>{point.percentage:.1f}%</b>'
	    },
	    accessibility: {
	        point: {
	            valueSuffix: '%'
	        }
	    },
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            colors: [
	            	'#FFB3B3'
	            	, '#96CEB4'
	            	, '#EAE3D2'
	            	, '#F8F5F1'
	            ],
	            dataLabels: {
	                enabled: true,
	                format: '<b>{point.name}</b><br>{point.percentage:.1f} %',
	                distance: -50,
	                filter: {
	                    property: 'percentage',
	                    operator: '>',
	                    value: 4
	                }
	            }
	        }
	    },
	    series: [{
	        name: 'Share',
	        data: inProgressFundChartData
	    }]
	});
	</script>
	
	<script>
	const titleData = [];
	const amountData = [];
	const payoffData = [];
	<c:forEach items="${ fundMap.cumulativeFund }" var="fund">
		titleData.push('${fund.projectTitle}');
		amountData.push(${fund.amount});
		payoffData.push(${fund.payoff});
	</c:forEach>
	console.log(amountData);
	console.log(payoffData);
	
	// Data retrieved from https://www.yr.no/nb
	Highcharts.chart('cumulativeFundStatus', {
	    chart: {
	    	backgroundColor: null,
	        type: 'column',
	        marginTop: 50
	    },
	    title: {
	        text: '<b>누적 투자 현황</b>'
	    },
	    subtitle: null,
	    xAxis: {
	        categories: titleData,
	        crosshair: true
	    },
	    yAxis: {
	        title: {
	            useHTML: true,
	            text: '금액(원)'
	        }
	    },
	    tooltip: {
	        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
	        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
	            '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
	        footerFormat: '</table>',
	        shared: true,
	        useHTML: true
	    },
	    plotOptions: {
	        column: {
	            pointPadding: 0.2,
	            borderWidth: 0
	        }
	    },
	    series: [{
	        name: '투자금',
	        data: amountData

	    }, {
	        name: '정산금',
	        data: payoffData

	    }]
	});
	</script>
</body>

</html>