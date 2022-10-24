<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Roboto:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Work+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${ path }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${ path }/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
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

	<!-- ======= Hero Section ======= -->
	<section id="hero" class="hero">

		<div class="info d-flex align-items-center">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-6 text-center">
						<h2 data-aos="fade-down">
							K-콘텐츠 투자 플랫폼 <br><span>모두하나</span>
						</h2>
						<p data-aos="fade-up">누구나 문화콘텐츠에 투자할 수 있는 기회. <br>모두하나를 통해 콘텐츠에 투자하세요. <br> 드라마, 영화, 뮤지컬, 음악, 공연 등 여러 분야의 상품이 여러분을 기다립니다.</p>
						<a data-aos="fade-up" data-aos-delay="200" href="${ path }/project/list"
							class="btn-get-started">모두하나에서 투자하기</a>
					</div>
				</div>
			</div>
		</div>

		<div id="hero-carousel" class="carousel slide" data-bs-ride="carousel"
			data-bs-interval="5000">

			<div class="carousel-item active"
				style="background-image: url(${ path }/resources/assets/img/hero-carousel/hero-carousel-1.jpg)"></div>
			<div class="carousel-item"
				style="background-image: url(${ path }/resources/assets/img/hero-carousel/hero-carousel-2.jpg)"></div>
			<div class="carousel-item"
				style="background-image: url(${ path }/resources/assets/img/hero-carousel/hero-carousel-3.jpg)"></div>
			<div class="carousel-item"
				style="background-image: url(${ path }/resources/assets/img/hero-carousel/hero-carousel-4.jpg)"></div>
			<div class="carousel-item"
				style="background-image: url(${ path }/resources/assets/img/hero-carousel/hero-carousel-5.jpg)"></div>

			<a class="carousel-control-prev" href="#hero-carousel" role="button"
				data-bs-slide="prev"> <span
				class="carousel-control-prev-icon bi bi-chevron-left"
				aria-hidden="true"></span>
			</a> <a class="carousel-control-next" href="#hero-carousel" role="button"
				data-bs-slide="next"> <span
				class="carousel-control-next-icon bi bi-chevron-right"
				aria-hidden="true"></span>
			</a>

		</div>

	</section>
	<!-- End Hero Section -->

	<main id="main">

		<!-- ======= Stats Counter Section ======= -->
		<section id="stats-counter" class="stats-counter section-bg">
			<div class="container">

				<div class="row gy-4">

					<div class="col-lg-3 col-md-6">
						<div class="stats-item d-flex align-items-center w-100 h-100">
							<i class="bi bi-emoji-smile color-blue flex-shrink-0"></i>
							<div>
								<span data-purecounter-start="0" data-purecounter-end="232"
									data-purecounter-duration="1" class="purecounter"></span>
								<p>Happy Clients</p>
							</div>
						</div>
					</div>
					<!-- End Stats Item -->

					<div class="col-lg-3 col-md-6">
						<div class="stats-item d-flex align-items-center w-100 h-100">
							<i class="bi bi-journal-richtext color-orange flex-shrink-0"></i>
							<div>
								<span data-purecounter-start="0" data-purecounter-end="521"
									data-purecounter-duration="1" class="purecounter"></span>
								<p>Projects</p>
							</div>
						</div>
					</div>
					<!-- End Stats Item -->

					<div class="col-lg-3 col-md-6">
						<div class="stats-item d-flex align-items-center w-100 h-100">
							<i class="bi bi-headset color-green flex-shrink-0"></i>
							<div>
								<span data-purecounter-start="0" data-purecounter-end="1463"
									data-purecounter-duration="1" class="purecounter"></span>
								<p>Hours Of Support</p>
							</div>
						</div>
					</div>
					<!-- End Stats Item -->

					<div class="col-lg-3 col-md-6">
						<div class="stats-item d-flex align-items-center w-100 h-100">
							<i class="bi bi-people color-pink flex-shrink-0"></i>
							<div>
								<span data-purecounter-start="0" data-purecounter-end="15"
									data-purecounter-duration="1" class="purecounter"></span>
								<p>Hard Workers</p>
							</div>
						</div>
					</div>
					<!-- End Stats Item -->

				</div>

			</div>
		</section>
		<!-- End Stats Counter Section -->

		<!-- ======= Recent Blog Posts Section ======= -->
		<section id="recent-blog-posts" class="recent-blog-posts">
			<div class="container" data-aos="fade-up">

				<div class=" section-header">
					<h2>추천 프로젝트</h2>
					<p>In commodi voluptatem excepturi quaerat nihil error autem
						voluptate ut et officia consequuntu</p>
				</div>

				<div class="row gy-5">

					<div class="col-xl-4 col-md-6" data-aos="fade-up"
						data-aos-delay="100">
						<div class="post-item position-relative h-100">

							<div class="post-img position-relative overflow-hidden">
								<img src="${ path }/resources/assets/img/blog/blog-1.jpg"
									class="img-fluid" alt=""> <span class="post-date">December
									12</span>
							</div>

							<div class="post-content d-flex flex-column">

								<h3 class="post-title">Eum ad dolor et. Autem aut fugiat
									debitis</h3>

								<div class="meta d-flex align-items-center">
									<div class="d-flex align-items-center">
										<i class="bi bi-person"></i> <span class="ps-2">Julia
											Parker</span>
									</div>
									<span class="px-3 text-black-50">/</span>
									<div class="d-flex align-items-center">
										<i class="bi bi-folder2"></i> <span class="ps-2">Politics</span>
									</div>
								</div>

								<hr>

								<a href="blog-details.html" class="readmore stretched-link"><span>Read
										More</span><i class="bi bi-arrow-right"></i></a>

							</div>

						</div>
					</div>
					<!-- End post item -->

					<div class="col-xl-4 col-md-6" data-aos="fade-up"
						data-aos-delay="200">
						<div class="post-item position-relative h-100">

							<div class="post-img position-relative overflow-hidden">
								<img src="${ path }/resources/assets/img/blog/blog-2.jpg"
									class="img-fluid" alt=""> <span class="post-date">July
									17</span>
							</div>

							<div class="post-content d-flex flex-column">

								<h3 class="post-title">Et repellendus molestiae qui est sed
									omnis</h3>

								<div class="meta d-flex align-items-center">
									<div class="d-flex align-items-center">
										<i class="bi bi-person"></i> <span class="ps-2">Mario
											Douglas</span>
									</div>
									<span class="px-3 text-black-50">/</span>
									<div class="d-flex align-items-center">
										<i class="bi bi-folder2"></i> <span class="ps-2">Sports</span>
									</div>
								</div>

								<hr>

								<a href="blog-details.html" class="readmore stretched-link"><span>Read
										More</span><i class="bi bi-arrow-right"></i></a>

							</div>

						</div>
					</div>
					<!-- End post item -->

					<div class="col-xl-4 col-md-6">
						<div class="post-item position-relative h-100" data-aos="fade-up"
							data-aos-delay="300">

							<div class="post-img position-relative overflow-hidden">
								<img src="${ path }/resources/assets/img/blog/blog-3.jpg"
									class="img-fluid" alt=""> <span class="post-date">September
									05</span>
							</div>

							<div class="post-content d-flex flex-column">

								<h3 class="post-title">Quia assumenda est et veritati
									tirana ploder</h3>

								<div class="meta d-flex align-items-center">
									<div class="d-flex align-items-center">
										<i class="bi bi-person"></i> <span class="ps-2">Lisa
											Hunter</span>
									</div>
									<span class="px-3 text-black-50">/</span>
									<div class="d-flex align-items-center">
										<i class="bi bi-folder2"></i> <span class="ps-2">Economics</span>
									</div>
								</div>

								<hr>

								<a href="blog-details.html" class="readmore stretched-link"><span>Read
										More</span><i class="bi bi-arrow-right"></i></a>

							</div>

						</div>
					</div>
					<!-- End post item -->

				</div>

			</div>
		</section>
		<!-- End Recent Blog Posts Section -->

		<!-- ======= Alt Services Section ======= -->
		<section id="alt-services" class="alt-services">
			<div class="container" data-aos="fade-up">

				<div class="row justify-content-around gy-4">
					<div class="col-lg-6 img-bg"
						style="background-image: url(${ path }/resources/assets/img/alt-services.jpg);"
						data-aos="zoom-in" data-aos-delay="100"></div>

					<div class="col-lg-5 d-flex flex-column justify-content-center">
						<h3>Enim quis est voluptatibus aliquid consequatur fugiat</h3>
						<p>Esse voluptas cumque vel exercitationem. Reiciendis est hic
							accusamus. Non ipsam et sed minima temporibus laudantium. Soluta
							voluptate sed facere corporis dolores excepturi</p>

						<div class="icon-box d-flex position-relative" data-aos="fade-up"
							data-aos-delay="100">
							<i class="bi bi-easel flex-shrink-0"></i>
							<div>
								<h4>
									<a href="" class="stretched-link">Lorem Ipsum</a>
								</h4>
								<p>Voluptatum deleniti atque corrupti quos dolores et quas
									molestias excepturi sint occaecati cupiditate non provident</p>
							</div>
						</div>
						<!-- End Icon Box -->

						<div class="icon-box d-flex position-relative" data-aos="fade-up"
							data-aos-delay="200">
							<i class="bi bi-patch-check flex-shrink-0"></i>
							<div>
								<h4>
									<a href="" class="stretched-link">Nemo Enim</a>
								</h4>
								<p>At vero eos et accusamus et iusto odio dignissimos
									ducimus qui blanditiis praesentium voluptatum deleniti atque</p>
							</div>
						</div>
						<!-- End Icon Box -->

						<div class="icon-box d-flex position-relative" data-aos="fade-up"
							data-aos-delay="300">
							<i class="bi bi-brightness-high flex-shrink-0"></i>
							<div>
								<h4>
									<a href="" class="stretched-link">Dine Pad</a>
								</h4>
								<p>Explicabo est voluptatum asperiores consequatur magnam.
									Et veritatis odit. Sunt aut deserunt minus aut eligendi omnis</p>
							</div>
						</div>
						<!-- End Icon Box -->

						<div class="icon-box d-flex position-relative" data-aos="fade-up"
							data-aos-delay="400">
							<i class="bi bi-brightness-high flex-shrink-0"></i>
							<div>
								<h4>
									<a href="" class="stretched-link">Tride clov</a>
								</h4>
								<p>Est voluptatem labore deleniti quis a delectus et. Saepe
									dolorem libero sit non aspernatur odit amet. Et eligendi</p>
							</div>
						</div>
						<!-- End Icon Box -->

					</div>
				</div>

			</div>
		</section>
		<!-- End Alt Services Section -->



		<!-- ======= Testimonials Section ======= -->
		<section id="testimonials" class="testimonials section-bg">
			<div class="container" data-aos="fade-up">

				<div class="section-header">
					<h2>Testimonials</h2>
					<p>Quam sed id excepturi ccusantium dolorem ut quis dolores
						nisi llum nostrum enim velit qui ut et autem uia reprehenderit
						sunt deleniti</p>
				</div>

				<div class="slides-2 swiper">
					<div class="swiper-wrapper">

						<div class="swiper-slide">
							<div class="testimonial-wrap">
								<div class="testimonial-item">
									<img
										src="${ path }/resources/assets/img/testimonials/testimonials-1.jpg"
										class="testimonial-img" alt="">
									<h3>Saul Goodman</h3>
									<h4>Ceo &amp; Founder</h4>
									<div class="stars">
										<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
											class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
											class="bi bi-star-fill"></i>
									</div>
									<p>
										<i class="bi bi-quote quote-icon-left"></i> Proin iaculis
										purus consequat sem cure digni ssim donec porttitora entum
										suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam
										eget nibh et. Maecen aliquam, risus at semper. <i
											class="bi bi-quote quote-icon-right"></i>
									</p>
								</div>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-wrap">
								<div class="testimonial-item">
									<img
										src="${ path }/resources/assets/img/testimonials/testimonials-2.jpg"
										class="testimonial-img" alt="">
									<h3>Sara Wilsson</h3>
									<h4>Designer</h4>
									<div class="stars">
										<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
											class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
											class="bi bi-star-fill"></i>
									</div>
									<p>
										<i class="bi bi-quote quote-icon-left"></i> Export tempor
										illum tamen malis malis eram quae irure esse labore quem
										cillum quid cillum eram malis quorum velit fore eram velit
										sunt aliqua noster fugiat irure amet legam anim culpa. <i
											class="bi bi-quote quote-icon-right"></i>
									</p>
								</div>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-wrap">
								<div class="testimonial-item">
									<img
										src="${ path }/resources/assets/img/testimonials/testimonials-3.jpg"
										class="testimonial-img" alt="">
									<h3>Jena Karlis</h3>
									<h4>Store Owner</h4>
									<div class="stars">
										<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
											class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
											class="bi bi-star-fill"></i>
									</div>
									<p>
										<i class="bi bi-quote quote-icon-left"></i> Enim nisi quem
										export duis labore cillum quae magna enim sint quorum nulla
										quem veniam duis minim tempor labore quem eram duis noster
										aute amet eram fore quis sint minim. <i
											class="bi bi-quote quote-icon-right"></i>
									</p>
								</div>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-wrap">
								<div class="testimonial-item">
									<img
										src="${ path }/resources/assets/img/testimonials/testimonials-4.jpg"
										class="testimonial-img" alt="">
									<h3>Matt Brandon</h3>
									<h4>Freelancer</h4>
									<div class="stars">
										<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
											class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
											class="bi bi-star-fill"></i>
									</div>
									<p>
										<i class="bi bi-quote quote-icon-left"></i> Fugiat enim eram
										quae cillum dolore dolor amet nulla culpa multos export minim
										fugiat minim velit minim dolor enim duis veniam ipsum anim
										magna sunt elit fore quem dolore labore illum veniam. <i
											class="bi bi-quote quote-icon-right"></i>
									</p>
								</div>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-wrap">
								<div class="testimonial-item">
									<img
										src="${ path }/resources/assets/img/testimonials/testimonials-5.jpg"
										class="testimonial-img" alt="">
									<h3>John Larson</h3>
									<h4>Entrepreneur</h4>
									<div class="stars">
										<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
											class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
											class="bi bi-star-fill"></i>
									</div>
									<p>
										<i class="bi bi-quote quote-icon-left"></i> Quis quorum aliqua
										sint quem legam fore sunt eram irure aliqua veniam tempor
										noster veniam enim culpa labore duis sunt culpa nulla illum
										cillum fugiat legam esse veniam culpa fore nisi cillum quid. <i
											class="bi bi-quote quote-icon-right"></i>
									</p>
								</div>
							</div>
						</div>
						<!-- End testimonial item -->

					</div>
					<div class="swiper-pagination"></div>
				</div>

			</div>
		</section>
		<!-- End Testimonials Section -->

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
	<script src="${ path }/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${ path }/resources/assets/vendor/aos/aos.js"></script>
	<script src="${ path }/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="${ path }/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="${ path }/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="${ path }/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="${ path }/resources/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="${ path }/resources/assets/js/main.js"></script>

</body>

</html>