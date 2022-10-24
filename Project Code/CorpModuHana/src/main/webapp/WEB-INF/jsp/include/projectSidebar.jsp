<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<div class="sidebar">

	<div class="sidebar-item tags">
		<h4 class="sidebar-title mt-3">프로젝트 신청하기</h4>
		<ul class="mt-3">
			<li><a href="${ path }/project/apply/${ projectSeq }/step1" style="padding:10px 10px"><i class="bi bi-1-circle"></i> 진행자 정보</a></li>
			<li><a href="${ path }/project/apply/${ projectSeq }/step2" style="padding:10px 10px"><i class="bi bi-2-circle"></i> 프로젝트 내용</a></li>
			<li><a href="${ path }/project/apply/${ projectSeq }/step3" style="padding:10px 10px"><i class="bi bi-3-circle"></i> 프로젝트 정보</a></li>
			<li><a href="${ path }/project/apply/${ projectSeq }/step4" style="padding:10px 10px"><i class="bi bi-4-circle"></i> 서류 제출</a></li>
		</ul>
	</div>
	<!-- End sidebar tags-->

</div>
<!-- End Blog Sidebar -->
