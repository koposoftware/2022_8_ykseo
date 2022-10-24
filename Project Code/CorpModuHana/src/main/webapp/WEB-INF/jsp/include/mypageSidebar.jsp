<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<div class="sidebar">

	<div class="sidebar-item tags">
		<h4 class="sidebar-title mt-3">마이페이지</h4>
		<ul class="mt-3">
			<li><a href="${ path }/mypage"><i class="bi bi-house-heart-fill"></i> 대시보드</a></li>
			<li><a href="${ path }/mypage/projects"><i class="bi bi-vector-pen"></i> 프로젝트</a></li>
			<li><a href="${ path }/mypage"><i class="bi bi-megaphone-fill"></i> 최근 소식</a></li>
			<li><a href="${ path }/mypage"><i class="bi bi-person-lines-fill"></i> 계정 정보</a></li>
		</ul>
	</div>
	<!-- End sidebar tags-->

</div>
<!-- End Blog Sidebar -->
