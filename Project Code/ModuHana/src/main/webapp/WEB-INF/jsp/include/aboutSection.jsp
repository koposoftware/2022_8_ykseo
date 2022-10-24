<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

		<section id="about" class="about mt-5">
			<div class="container mt-5" data-aos="fade-up">


				<div class="col-lg-12 text-center">
					<h3 class="mb-3" style="color: #aaaaaa;">
						<c:if test="${ project.subjectNo eq '2' }">
							<i class="fa-solid fa-hands"></i>
						</c:if> 
						${ project.subjectName }
					</h3>
					<h2 style="max-width: none;">${ project.title }</h2>
				</div>
				
				<div class="row">
					
					<c:choose>
						<c:when test="${ not empty projectFileMap.sign.path }">
							<div class="col-lg-7 rounded-start"
								style="background-image: url('${ path }/${ projectFileMap.sign.path }/${ projectFileMap.sign.saveName }'); background-repeat:no-repeat; background-size:cover;"></div>
						</c:when>
						<c:otherwise>
						<div class="col-lg-7 rounded-start"
								style="background-image: url('${ projectFileMap.sign.saveName }'); background-repeat:no-repeat; background-size:cover;"></div>
						</c:otherwise>
					</c:choose>

					<div class="col-lg-5">
						<div class="our-story rounded-end">
							<h4 class="text-center mb-5 mt-2">
								<c:choose>
									<c:when test="${ project.startDDay > 0 }">
										<span class="fw-bold rounded-pill p-2 mt-2">모집 예정</span>
									</c:when>
									<c:when test="${ project.endDDay > 0 }">
										<span class="fw-bold rounded-pill p-2 mt-2"><c:out value="${ project.endDDay }일 남음"/></span>
									</c:when>
									<c:otherwise>
										<span class="fw-bold rounded-pill p-2 mt-2">모집 마감</span>
									</c:otherwise>
								</c:choose>
							</h4>
							
							<p class="ps-2 text-end">
								<fmt:formatNumber value="${ project.fundAmt }" pattern="#,###" /> 원 모집 | 
								<span class="fw-bold fs-5 me-2 primary-color"><c:out value="${ project.fundAmtPer }"/></span>
							</p>
							<div class="progress progress-bg-color2">
								<div class="progress-bar progress-bar-striped progress-bar-animated primary-bg-color progress-animation" role="progressbar" style="width: ${ project.fundAmtPer }" aria-valuenow="${ project.fundAmtPer }" aria-valuemin="0" aria-valuemax="100"></div>
								<c:if test="${ project.fundAmt < project.minFundAmt }">
									<div class="progress-bar progress-bg-color1" role="progressbar" 
										style="width: ${ (project.minFundAmt / project.maxFundAmt - project.fundAmt / project.maxFundAmt) * 100  }%" aria-valuenow="${ project.fundAmtPer }" aria-valuemin="0" aria-valuemax="100"></div>
								</c:if>
							</div>
							<ul>
								<li>
									<i class="bi bi-circle-fill progress-color1"></i>
									<span><strong>최소 모집 금액</strong> | <fmt:formatNumber value="${ project.minFundAmt }" pattern="#,###" /> 원</span>
								</li>
								<li>
									<i class="bi bi-circle-fill progress-color2"></i>
									<span><strong>최대 모집 금액</strong> | <fmt:formatNumber value="${ project.maxFundAmt }" pattern="#,###" /> 원</span>
								</li>
							</ul>
							
							<h3>모집 기한</h3>
							<p>${ project.fundStart } ~ ${ project.fundEnd }</p>
							
							<h3>소개</h3>
							<p>${ project.summary }</p>

							<div class="row">
								
							</div>
							<div class="row text-center mt-3">
								<div class="col-lg-10">
								<c:choose>
									<c:when test="${ project.startDDay > 0 }">
										<a type="button" class="btn btn-primary bg-white border text-dark auto" style="width: 100%;margin: 10px;height: 52px;padding-top: 10px;" > <i class="bi bi-bell"></i> 알림신청 </a>
									</c:when>
									<c:when test="${ project.endDDay > 0 }">
										<a href="${ path }/fund/${ project.projectSeq }" data-aos="fade-up" data-aos-delay="200" class="btn-fund-started aos-init aos-animate fw-bold" style="width:100%">투자하기</a>
									</c:when>
								</c:choose>
								</div>
								<div class="col-lg-2">
									<a id="kakaotalk-sharing-btn" href="javascript:;">
										<img class="rounded-circle border border-3 border-danger" alt="" src="https://developers.kakao.com/assets/img/about/logos/kakaotalksharing/kakaotalk_sharing_btn_medium.png"
										style="height: 52px; margin-top: 10px;">
									</a>
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>
		</section>