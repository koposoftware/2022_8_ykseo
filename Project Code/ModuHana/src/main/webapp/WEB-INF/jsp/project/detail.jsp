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

<title>UpConstruction Bootstrap Template - About</title>
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
<script src="https://kit.fontawesome.com/3b179c433e.js" crossorigin="anonymous"></script>

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

		<!-- ======= About Section ======= -->
		<%@include file="/WEB-INF/jsp/include/aboutSection.jsp" %>
		<!-- End About Section -->
		
		<!-- ======= Features Section ======= -->
		<section id="features" class="features">
			<div class="container" data-aos="fade-up">
		
				<ul class="nav nav-tabs row  g-2 d-flex">
		
					<li class="nav-item col-3">
						<a class="nav-link active show" data-bs-toggle="tab" data-bs-target="#tab-1">
							<h4>상세소개</h4>
						</a>
					</li>
					<!-- End tab nav item -->
		
					<li class="nav-item col-3"><a class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-2">
							<h4>투자정보</h4>
						</a>
					</li>
					<!-- End tab nav item -->
					
					<li class="nav-item col-3">
						<a class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-3">
							<h4>공지사항</h4>
						</a>
					</li>
					<!-- End tab nav item -->
		
					<li class="nav-item col-3"><a class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-4">
							<h4>QnA</h4>
						</a>
					</li>
					<!-- End tab nav item -->
		
				</ul>
		
				<div class="tab-content">
		
					<!-- Start 상세소개 tab content item -->
					<div class="tab-pane active show" id="tab-1">
						<div class="row justify-content-center">
							<div class="text-start col-lg-8">
								<%-- <img style="width:70%" alt="설명이미지" src="${ path }/${ projectFileMap.content.path }/${ projectFileMap.content.saveName }"> --%>
								${ project.content }
							</div>
						</div>
					</div>
					<!-- End 상세소개 tab content item -->
		
					<!-- Start 투자정보 tab content item -->
					<div class="tab-pane" id="tab-2">
						<div class="row">
							<h4 class="fw-bold mt-5 mb-4">투자개요</h4>
							<div class="col-lg-6 px-5">
								<table class="table">
									<tr>
										<th scope="col">법인명</th>
										<td class="text-end"><c:out value="${ project.corpName }"/></td>
									</tr>
									<tr>
										<th scope="col">증권종류</th>
										<td class="text-end"><c:out value="${ project.securityName }"/></td>
									</tr>
									<tr>
										<th scope="col">1 계좌 가격</th>
										<td class="text-end"><fmt:formatNumber value="${ project.minFundUnit }" pattern="#,###" />원</td>
									</tr>
									<tr>
										<th scope="col">최소/최대 투자금액</th>
										<td class="text-end"><fmt:formatNumber value="${ project.minFundUnit }" pattern="#,###" />원 <c:out value="/"/> <fmt:formatNumber value="${ project.maxFundUnit }" pattern="#,###" />원</td>
									</tr>
									<tr>
										<th scope="col">모집총액</th>
										<td class="text-end"><fmt:formatNumber value="${ project.maxFundAmt }" pattern="#,###" />원</td>
									</tr>
								</table>
							</div>
							<div class="col-lg-6 px-5">
								<table class="table">
									<tr>
										<th scope="col">상환방법</th>
										<td class="text-end"><c:out value="${ project.repaymentName }"/></td>
									</tr>
									<tr>
										<th scope="col">모집 시작일</th>
										<td class="text-end"><c:out value="${ project.fundStart }"/></td>
									</tr>
									<tr>
										<th scope="col">모집 종료일</th>
										<td class="text-end"><c:out value="${ project.fundEnd }"/></td>
									</tr>
									<tr>
										<th scope="col">증권 발행일</th>
										<td class="text-end"><c:out value="${ project.securityDate }"/></td>
									</tr>
									<tr>
										<th scope="col">증권 만기일</th>
										<td class="text-end"><c:out value="${ project.securityExpire }"/></td>
									</tr>
								</table>
							</div>
							
							<h4 class="fw-bold mt-5 mb-4">참고자료</h4>
							<div class="col-lg-12 px-5">
								<c:forEach items="${ projectFileMap.reference }" var="file">
									<a class="file-link" href="${ path }/${ file.path }/${ file.saveName }" download="${ file.oriName }">${ file.oriName }</a>
								</c:forEach>
							</div>
							
							<h4 class="fw-bold mt-5 mb-4">투자 위험고지</h4>
							<div class="col-lg-12 px-5 ">
								<div class="p-5 lh-base bg-light">
									<p>
										본 투자위험고지서는 자본시장과 금융투자에 관한 법률(이하 “자본시장법”) 제117조의7 제4항에 의거하여 귀하가 모두하나 주식회사(이하 “모두하나㈜”)에 청약 주문을 하기 전, 투자 위험을 사전에 충분히 인지할 수 있도록 모두하나㈜가 귀하에게 교부하는 내용입니다.<br>
									</p>
									<p>
										1. 투자자는 모두하나㈜ 본 설명서 및 홈페이지에 게재된 증권의 발행조건, 발행기업의 재무상태가 기재된 서류 및 사업계획서의 내용 및 증권 취득에 따른 투자위험요소 등을 충분히 확인하였으며, 해당 게제된 사항은 청약기간 종료 전에 정정될 수 있다는 점을 확인합니다.
									</p>
									<p>
										2. 투자자는 본 금융투자상품이 자본시장법에 따른 “증권”에 해당되므로 원금손실 위험성이 있다는 것을 확인합니다. 따라서 투자한 자금의 원금손실 위험이 있으며, 해당 투자손실은 투자자에게 귀속된다는 사실을 확인합니다.
									</p>
									<p>
										3. 투자자는 금번에 발행되는 비상장 증권의 발행이 한국거래소의 상장을 목적으로 하는 것이 아니며, 따라서 증권의 환금성에 큰 제약이 있다는 점과 예상 회수금액에 대해 일부 혹은 전부를 회수할 수 없는 위험이 있음을 이해하며, 이를 감당할 수 있음을 확인합니다.
									</p>
									<p>
										4. 투자자는 자본시장법 제117조의10 제7항에 따라 전문투자자에 대한 매도 등 예외적인 경우를 제외하고는 원칙적으로 6개월간 전매가 제한된다는 점을 확인합니다.
									</p>
									<p>
										5. 투자자는 청약기간 중에는 청약의 철회를 할 수 있으나, 청약기간 종료일 이후에는 청약을 철회할 수 없으며, 모집예정금액의 80% 미달 시 증권발행이 취소된다는 점을 확인합니다.
									</p>
									<p>
										6. 투자자는 모두하나(주)이 자본시장법에 따른 온라인소액투자중개업자로서 발행인이 발행하는 증권에 대한 청약거래의 중개 역할만 수행하며, 이에 따라 직접 증권을 발행하거나 주금을 납입받지 않는 것을 확인합니다. 더불어, 모두하나(주)은 온라인소액투자중개 플랫폼으로 투자손실의 위험을 보전하는 당사자가 아님을 확인합니다.
									</p>
									<p>
										7. 투자자는 기타 아래 사항에 대해서도 충분히 인지하였음을 확인합니다.
									</p>
									<p>
										(1) 모두하나㈜는 온라인소액증권 청약 서비스를 제공하는 대가로 투자자에게 청약신청금액의 1.0%까지 거래수수료를 수취할 수 있습니다. 또한 투자예치금 계좌에서 청약증거금 용도의 자금 이체 시 이체 수수료가 발생할 수 있습니다.
									</p>
									<p>
										(2) 발행인이 증권의 발행조건과 관련하여 조기상환조건 등을 설정한 경우 이에 대한 구체적인 내용을 본 설명서 및 홈페이지를 통해 반드시 확인하여야 합니다.
									</p>
									<p>
										(3) 모두하나㈜는 발행인의 요청이 있는 경우, 청약 시 합리적이고 명확한 기준 (선착순, 금액순, 전문투자자순 등)에 따라 투자자의 자격 등을 제한할 수 있습니다. 이 경우 투자자는 위 기준과 조건에 따라 청약거래에 있어 차별을 받게 될 수 있습니다.
									</p>
								</div>
							</div>
						</div>
					</div>
					<!-- End 투자정보 tab content item -->
		
					<!-- End 공지사항 tab content item -->
					<div class="tab-pane" id="tab-3">
						<div class="col-lg-12 px-5">
							<table class="table">
								<tr>
									<th scope="col">제목</th>
									<th scope="col" class="text-end">등록일</th>
								</tr>
								<c:forEach items="${ noticeList }" var="notice">		
								<tr>
									<td><a href="${ path }/project/notice/${ notice.projectSeq }/${ notice.noticeSeq }"><c:out value="${ notice.title }"/></a></td>
									<td class="text-end"><c:out value="${ notice.regDate }"/></td>
								</tr>
								</c:forEach>
							</table>
						</div>
					</div>
					<!-- End 공지사항 tab content item -->
		
					<!-- End comment tab content item -->
					<div class="tab-pane" id="tab-4">
						<div class="row">
							<!-- Start comments -->
							<div class="comments">
							
								<h4 class="comments-count">${ replyListCnt } Comments</h4>
							
								<div class="reply-form">
							
									<h4 class="pb-3">Leave a Reply</h4>
									<form action="${ path }/project/detail/${ project.projectSeq }" method="post" name="replyForm">
										<input type="hidden" name="projectSeq" value="${ project.projectSeq }">
										<input type="hidden" name="userId" value="${ user.id }">
										<input type="hidden" name="depth" value="0">
										<div class="row">
											<div class="col form-group">
												<textarea name="content" class="form-control"
													placeholder="Your Comment"></textarea>
											</div>
										</div>
										<button type="submit" class="btn btn-primary" onsubmit="return checkForm()">Post Comment</button>
									</form>
							
								</div>
								
								<c:forEach items="${ replyList }" var="reply">
									<div id="comment-1" class="comment" style="margin-left:${ reply.depth * 50 }px">
										<div class="d-flex">
											<div>
												<h5>
													${ reply.userId }
													<a href="javascript:displayRereplyDiv(${ reply.replySeq })" class="reply">
														<i class="bi bi-reply-fill"></i> Reply
													</a>
												</h5>
												<time datetime="${ reply.regDate }">${ reply.regDate }</time>
												<p>${ reply.content }</p>
											</div>
										</div>
									</div>
									
									<div class="reply-form reReply-form" style="display:none;margin-left:${ reply.depth * 50 }px;" id="rereply-div-${ reply.replySeq }">
							
										<h4 class="pb-3">Leave a Reply</h4>
										<form action="${ path }/project/detail/${ project.projectSeq }" method="post" name="rereplyForm">
											<input type="hidden" name="projectSeq" value="${ project.projectSeq }">
											<input type="hidden" name="superReply" value="${ reply.replySeq }">
											<input type="hidden" name="userId" value="${ user.id }">
											<input type="hidden" name="depth" value="${ reply.depth + 1 }">
											<div class="row">
												<div class="col form-group">
													<textarea name="content" class="form-control"
														placeholder="Your Comment"></textarea>
												</div>
											</div>
											<button type="submit" class="btn btn-primary" onsubmit="return checkForm()">Post Comment</button>
										</form>
								
									</div>
								</c:forEach>
								<!-- End comment #1 -->
								
							</div>
							<!-- End comments -->
						</div>
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
	<script src="${ path }/resources/assets/js/jquery-3.6.1.min.js"></script>
	<script>
		function checkForm(formName) {
			let f = null;
			if(formName == 'replyForm')
				f = document.replyForm;
			else
				f = document.rereplyForm;
			
			if(f.writer == null)
				return false;
			if(f.content == null)
				return false;
			
			return true;
		}
		
		function displayRereplyDiv(replySeq) {
			let elements = document.getElementsByClassName("reReply-form");
			for (let i = 0; i < elements.length; i++) {
				elements[i].style.display = 'none';
			}
			document.getElementById("rereply-div-" + replySeq).style.display = "";
		}
	</script>
	<script src="${ path }/resources/assets/js/kakao.js"></script>
	<script src="${ path }/resources/assets/js/secure.js"></script>
	<script>
		Kakao.init(getKakaoJSKey());
		Kakao.isInitialized();
		
		Kakao.Share.createCustomButton({
			container : '#kakaotalk-sharing-btn',
			templateId: 83031,
			templateArgs: {
			    'key': '${ project.projectSeq }',
			    'title' : '${ project.title }',
			    'description' : '${ project.summary }'
			  }
		});
	</script>
</body>
</html>