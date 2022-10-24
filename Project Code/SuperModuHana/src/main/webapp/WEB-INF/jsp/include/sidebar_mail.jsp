<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-dark" id="sidenav-main">
	<div class="sidenav-header">
		<i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
		<a class="navbar-brand m-0 text-center"
			href="${ path }/main"
			target="_blank"> 
			<span class="ms-1 font-weight-bold text-white" style="font-size: 30px;">ModuHana<span style="color:#e90061">.</span></span>
		</a>
	</div>
	<hr class="horizontal light mt-0 mb-2">
	<div class="collapse navbar-collapse  w-auto  max-height-vh-100"
		id="sidenav-collapse-main">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link text-white" href="${ path }/main">
					<div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
						<i class="material-icons opacity-10">dashboard</i>
					</div>
					<span class="nav-link-text ms-1">Dashboard</span>
			</a></li>
			<li class="nav-item">
				<a class="nav-link text-white " href="${ path }/projects">
					<div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
						<i class="material-icons opacity-10">table_view</i>
					</div>
					<span class="nav-link-text ms-1">프로젝트 관리</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link text-white " href="#">
					<div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
						<span class="material-icons">&#xE87C;</span>
					</div>
					<span class="nav-link-text ms-1">회원 관리</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link text-white " href="#">
					<div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
						<i class="material-icons opacity-10">receipt_long</i>
					</div>
					<span class="nav-link-text ms-1">결제 관리</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link text-white active bg-gradient-primary" href="#">
					<div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
						<i class="material-icons opacity-10">email</i>
					</div>
					<span class="nav-link-text ms-1">메일함</span>
				</a>
			</li>
			<%-- <li class="nav-item mt-3">
				<h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">Account pages</h6>
			</li>
			<li class="nav-item"><a class="nav-link text-white " href="./pages/profile.html">
					<div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
						<i class="material-icons opacity-10">person</i>
					</div>
					<span class="nav-link-text ms-1">Profile</span>
				</a>
			</li>
			<c:if test="${ empty user }">
				<li class="nav-item">
					<a class="nav-link text-white " href="${ path }/login">
						<div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
							<i class="material-icons opacity-10">login</i>
						</div>
						<span class="nav-link-text ms-1">Sign In</span>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link text-white " href="#">
						<div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
							<i class="material-icons opacity-10">assignment</i>
						</div>
						<span class="nav-link-text ms-1">Sign Up</span>
					</a>
				</li>
			</c:if> --%>
		</ul>
	</div>
	<div class="sidenav-footer position-absolute w-100 bottom-0 ">
		<div class="mx-3">
			<a class="btn bg-gradient-primary mt-4 w-100"
				href="https://www.creative-tim.com/product/material-dashboard-pro?ref=sidebarfree"
				type="button">Upgrade to pro</a>
		</div>
	</div>
</aside>