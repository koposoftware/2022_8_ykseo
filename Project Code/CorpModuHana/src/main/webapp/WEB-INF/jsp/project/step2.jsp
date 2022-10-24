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

<title>UpConstruction Bootstrap Template - Index</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="${ path }/resources/assets/img/favicon.png" rel="icon">
<link href="${ path }/resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Roboto:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Work+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${ path }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${ path }/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="${ path }/resources/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="${ path }/resources/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="${ path }/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="${ path }/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
	
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
	<%@include file="/WEB-INF/jsp/include/header.jsp"%>
	<!-- End Header -->

	<main id="main">
		
		<!-- ======= apply-form Section ======= -->
		<section id="apply-form-section" class="apply-form-section">
			
			<div class="container" data-aos="fade-up" data-aos-delay="100">
				<div class="row justify-content-center">
				
					<div class="col-lg-2 mt-5">
						<%@include file="/WEB-INF/jsp/include/projectSidebar.jsp" %>
					</div>
					
					<div class="col-lg-10 mt-5">
						
						<!-- 프로젝트 내용 업로드하기 -->
						<form method="post" action="${ path }${requestScope['javax.servlet.forward.servlet_path']}"
							name="applyForm" class="apply-form" enctype="multipart/form-data">
								
							<h5 class="fw-bold border-bottom border-3 mt-5">프로젝트 정보</h5>
							
							<div class="row gy-4 mt-3">
								<div class="col-lg-3 form-group py-2">
									<p>프로젝트 분야</p>
								</div>
								<div class="col-lg-5 form-group">
									<label for="subjectNo" class="visually-hidden">장르 목록</label>
									<select aria-label="subjectNo"  name="subjectNo">
										<c:forEach items="${ subjectList }" var="subject">
											<c:choose>
											<c:when test="${ subject.code eq project.subjectNo }">
												<option value="${ subject.code }" selected>${ subject.name }</option>
											</c:when>
											<c:otherwise>
												<option value="${ subject.code }">${ subject.name }</option>
											</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
							</div>
							
							<div class="row gy-4">
								<div class="col-lg-3 form-group py-2">
									<p>프로젝트 제목</p>
								</div>
								<div class="col-lg-9 form-group">
									<input type="text" name="title" class="form-control p-2" value="${ project.title }">
								</div>
							</div>
							
							<div class="row gy-4">
								<div class="col-lg-3 form-group py-2">
									<p>프로젝트 대표이미지</p>
								</div>
								<div class="col-lg-7 form-group">
									<input type="file" id="imageInput" name="signImg" style="display:none" onchange="inputFileOnchange()"/>
									<input type="text" id="resultUploadPath" class="form-control bg-light p-2" 
										value="${ project.signImgName }" placeholder="권장 사이즈 692*418px, 이미지형식(jpg, png)" disabled>
								</div>
								<div class="col-lg-2 form-group text-end">
									<input type="button" style="width:100%" onclick="inputFileClick()" value="파일선택" />
								</div>
							</div>
							
							<div class="row gy-4">
								<div class="col-lg-3 form-group py-2">
									<p>프로젝트 간략소개</p>
								</div>
								<div class="col-lg-9 form-group">
									<input type="text" name="summary" class="form-control p-2" value="${ project.summary }">
								</div>
							</div>
							
							<div class="row gy-4">
								<div class="col-lg-12 form-group py-2 mt-5">
									<p>프로젝트 소개내용</p>
								</div>
							</div>
							
							<div class="row gy-4">
								<div class="col-lg-12 form-group py-2">
									<textarea name="content">
										${ project.content }
									</textarea>
								</div>
							</div>
							
							<div class="row gy-4 mt-3">
								<div class="col-lg-2 form-group">
									<button type="reset" class="sacondary-round-button">초기화</button>
								</div>
								<div class="col-lg-2 form-group">
									<button type="submit" class="sacondary-round-button">미리보기</button>
								</div>
								<div class="col-lg-2 form-group">
									<button type="submit" class="sacondary-round-button">임시저장</button>
								</div>
								<div class="col-lg-6 form-group">
									<button type="submit" class="primary-round-button" onsubmit="onchangeTextarea()">저장 후 다음 단계</button>
								</div>
							</div>
							
						</form>
						
					</div>
					<!-- End Submit Form -->
				</div>
			</div>
		</section>
		<!-- End Submit Section -->
		
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@include file="/WEB-INF/jsp/include/footer.jsp"%>
	<!-- End Footer -->

	<a href="#"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<div id="preloader"></div>

	<!-- Vendor JS Files -->
	<%-- <script
		src="${ path }/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> --%>
	<script src="${ path }/resources/assets/vendor/aos/aos.js"></script>
	<script src="${ path }/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="${ path }/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="${ path }/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="${ path }/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="${ path }/resources/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="${ path }/resources/assets/js/main.js"></script>
	
	<!-- My Javascript -->
	<script src="https://cdn.tiny.cloud/1/gzze4gql1evlx4y2hopdb3uxey3matl30r58ssm5u0uweypg/tinymce/6/tinymce.min.js"
		referrerpolicy="origin"></script>
	<script>
	tinymce.init({
		selector : 'textarea',
		plugins : 'a11ychecker advcode casechange export formatpainter image editimage linkchecker autolink lists checklist media mediaembed pageembed permanentpen powerpaste table advtable tableofcontents tinycomments tinymcespellchecker',
		toolbar : [
				'undo redo | bold italic underline strikethrough blockquote | fontfamily fontsize blocks',
				'alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist checklist | forecolor backcolor removeformat | image media pageembed table' ],
		toolbar_mode : 'floating',
		tinycomments_mode : 'embedded',
		tinycomments_author : 'Author name',
		file_picker_types: 'image',
		/* and here's our custom image picker*/
		file_picker_callback: (cb, value, meta) => {
			const input = document.createElement('input');
			input.setAttribute('type', 'file');
			input.setAttribute('accept', 'image/*');
			
			input.addEventListener('change', (e) => {
				const file = e.target.files[0];
				
				const reader = new FileReader();
				reader.addEventListener('load', () => {
				  /*
				    Note: Now we need to register the blob in TinyMCEs image blob
				    registry. In the next release this part hopefully won't be
				    necessary, as we are looking to handle it internally.
				  */
				  const id = 'blobid' + (new Date()).getTime();
				  const blobCache =  tinymce.activeEditor.editorUpload.blobCache;
				  const base64 = reader.result.split(',')[1];
				  const blobInfo = blobCache.create(id, file, base64);
				  blobCache.add(blobInfo);
				
				  /* call the callback and populate the Title field with the file name */
				  cb(blobInfo.blobUri(), { title: file.name });
			  });
			  reader.readAsDataURL(file);
		  });
		
		  input.click();
		},
		content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
	});
	
	</script>

	<script>
	function onchangeTextarea() {
		document.applyForm.content.innerHTML = document.getElementById('mce_0_ifr').contentWindow.document.body.innerHTML;
	}
	
	function inputFileClick() {
		document.applyForm.signImg.click();
	}
	function inputFileOnchange(num) {
		document.getElementById('resultUploadPath').value = document.applyForm.signImg.value;
	}
	</script>
</body>

</html>