<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Charifit</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="${ path }/resources/img/favicon.png">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="${ path }/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${ path }/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${ path }/resources/css/magnific-popup.css">
<link rel="stylesheet"
	href="${ path }/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="${ path }/resources/css/themify-icons.css">
<link rel="stylesheet" href="${ path }/resources/css/nice-select.css">
<link rel="stylesheet" href="${ path }/resources/css/flaticon.css">
<link rel="stylesheet" href="${ path }/resources/css/gijgo.css">
<link rel="stylesheet" href="${ path }/resources/css/animate.css">
<link rel="stylesheet" href="${ path }/resources/css/slicknav.css">
<link rel="stylesheet" href="${ path }/resources/css/style.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>

<body>
	<!-- header-start -->
	<%@include file="/WEB-INF/jsp/include/header.jsp"%>
	<!-- header-end -->

	<!-- ================ contact section start ================= -->
	<section class="contact-section">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-8">
					<h2 class="contact-title">Login</h2>
				</div>
				<div class="col-lg-8">
					<form class="form-contact contact_form"
						action="contact_process.php" method="post" id="contactForm"
						novalidate="novalidate">
						<div class="row">
							<div class="col-sm-8">
								<div class="form-group">
									<input class="form-control valid" name="name" id="name"
										type="text" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter your name'"
										placeholder="Enter your name">
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<a href="#" class="genric-btn info radius">check</a>
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<input class="form-control valid" name="name" id="name"
										type="text" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter your name'"
										placeholder="Enter your name">
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<input class="form-control valid" name="name" id="name"
										type="text" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter your name'"
										placeholder="Enter your name">
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<input class="form-control valid" name="name" id="name"
										type="text" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter your name'"
										placeholder="Enter your name">
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<input class="form-control valid" name="email" id="email"
										type="email" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter email address'"
										placeholder="Email">
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<input class="form-control" name="subject" id="subject"
										type="text" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter Subject'"
										placeholder="Enter Subject">
								</div>
							</div>
						</div>
						<div class="form-group mt-3">
							<button type="submit" class="button button-contactForm boxed-btn">Send</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ contact section end ================= -->


	<!-- footer_start  -->
	<%@include file="/WEB-INF/jsp/include/footer.jsp"%>
	<!-- footer_end  -->

	<!-- JS here -->
	<script src="${ path }/resources/js/vendor/modernizr-3.5.0.min.js"></script>
	<script src="${ path }/resources/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="${ path }/resources/js/popper.min.js"></script>
	<script src="${ path }/resources/js/bootstrap.min.js"></script>
	<script src="${ path }/resources/js/owl.carousel.min.js"></script>
	<script src="${ path }/resources/js/isotope.pkgd.min.js"></script>
	<script src="${ path }/resources/js/ajax-form.js"></script>
	<script src="${ path }/resources/js/waypoints.min.js"></script>
	<script src="${ path }/resources/js/jquery.counterup.min.js"></script>
	<script src="${ path }/resources/js/imagesloaded.pkgd.min.js"></script>
	<script src="${ path }/resources/js/scrollIt.js"></script>
	<script src="${ path }/resources/js/jquery.scrollUp.min.js"></script>
	<script src="${ path }/resources/js/wow.min.js"></script>
	<script src="${ path }/resources/js/nice-select.min.js"></script>
	<script src="${ path }/resources/js/jquery.slicknav.min.js"></script>
	<script src="${ path }/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="${ path }/resources/js/plugins.js"></script>
	<script src="${ path }/resources/js/gijgo.min.js"></script>

	<!--contact js-->
	<script src="${ path }/resources/js/contact.js"></script>
	<script src="${ path }/resources/js/jquery.ajaxchimp.min.js"></script>
	<script src="${ path }/resources/js/jquery.form.js"></script>
	<script src="${ path }/resources/js/jquery.validate.min.js"></script>
	<script src="${ path }/resources/js/mail-script.js"></script>

	<script src="js/main.js"></script>
	<script>
		$('#datepicker').datepicker({
			iconsLibrary : 'fontawesome',
			icons : {
				rightIcon : '<span class="fa fa-caret-down"></span>'
			}
		});
		$('#datepicker2').datepicker({
			iconsLibrary : 'fontawesome',
			icons : {
				rightIcon : '<span class="fa fa-caret-down"></span>'
			}

		});
	</script>
</body>

</html>