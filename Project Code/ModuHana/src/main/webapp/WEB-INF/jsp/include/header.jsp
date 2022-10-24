<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<header id="header" class="header d-flex align-items-center">
	<div
		class="container-fluid container-xl d-flex align-items-center justify-content-between">

		<a href="${ path }/" class="logo d-flex align-items-center">
			<h1>
			<!-- Uncomment the line below if you also wish to use an image logo -->
			<!-- <img src="${ path }/resources/assets/img/logo.png" alt=""> -->
				ModuHana<span>.</span>
			</h1>
		</a>
		<i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
		<i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>
		<nav id="navbar" class="navbar">
			<ul>
				<li><a href="${ path }/project/list">투자하기</a></li>
				
				<!-- 로그아웃 -->
				<c:if test="${ empty user }">
					<li><a href="${ path }/login">로그인/회원가입</a></li>
				</c:if>
				
				<!-- 로그인 -->
				<c:if test="${ not empty user }">
					<li class="dropdown">
						<a href="#">
							<span><b>${ user.name }</b> 님 안녕하세요!</span>
							<!-- <i class="bi bi-chevron-down dropdown-indicator"></i> -->
						</a>
						<ul>
							<!-- 사용자 인증 전 -->
							<c:if test="${ empty myAccount }">
								<li><a href="${ path }/certify/phone">투자자 인증하기</a></li>
							</c:if>
							<!-- 사용자 인증 후 -->
							<c:if test="${ not empty myAccount }">
								<li><a href="${ path }/mypage">나의 투자보기</a></li>
							</c:if>
							
							<li><a href="${ path }/logout">로그아웃</a></li>
						</ul>
					</li>
				</c:if>
			</ul>
		</nav>
		<!-- .navbar -->

	</div>
</header>