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
<link href="${ path }/resources/assets/css/login.css" rel="stylesheet">

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
		<form action="${ path }/apiLogin" method="post"
			onsubmit="return checkForm()" name="ApiLoginForm" class="pt-3">
			<input type="hidden" name="id" />
			<input type="hidden" name="name" />
			<input type="hidden" name="email" />
		</form>
		<div class="limiter">
			<div class="container-login100">
				<div class="wrap-login100">
					<div class="login100-pic js-tilt" style="display: flex;align-items:center;width: 60%;" data-tilt>
						<img src="${ path }/resources/assets/img/login/login-pana.png"
							alt="IMG">
					</div>

					<form class="login100-form validate-form"
						action="${ path }/login" method="post" id="contactForm">
						<span class="login100-form-title"> Login </span>

						<div class="wrap-input100 validate-input"
							data-validate="ID is required">
							<input class="input100" type="text" name="id" placeholder="ID">
							<span class="focus-input100"></span>
							<span class="symbol-input100"> 
								<i class="bi bi-person-heart"></i>
							</span>
						</div>

						<div class="wrap-input100 validate-input"
							data-validate="Password is required">
							<input class="input100" type="password" name="pwd"
								placeholder="Password"> <span class="focus-input100"></span>
							<span class="symbol-input100"> <i class="fa fa-lock"
								aria-hidden="true"></i>
							</span>
						</div>

						<div class="container-login100-form-btn">
							<button class="login100-form-btn">Login</button>
						</div>

						<div class="text-center p-t-12">
							<span class="txt1"> Forgot </span> 
							<a class="txt2" href="#"> Username / Password? </a>
						</div>

						<div class="text-center p-t-12">
							<a class="txt2" href="#"> Create your Account 
								<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
							</a>
						</div>
						
						<div class="text-center p-t-50"><span class="txt1">Connect with SNS</span></div>
						<button type="button" class="sns-form-btn kakao-form-btn p-t-50" onclick="kakaoLogin()" class="genric-btn btn-kakao circle w-100">
	                 		<span class="wrap-sns-login-icon"><img class="sns-login-icon" src="${ path }/resources/assets/img/login/kakao_login_icon.png" /></span>
	                 		<span class="sns-login-span">Kakao Login</span>
	                	</button>
						<button type="button" class="sns-form-btn naver-form-btn p-t-50" onclick="#" class="genric-btn btn-kakao circle w-100">
	                 		<span class="wrap-sns-login-icon"><img class="sns-login-icon" src="${ path }/resources/assets/img/login/naver_login_icon.png" /></span>
	                 		<span class="sns-login-span">Naver Login</span>
	                	</button>
					</form>
				</div>
			</div>
		</div>

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
	<script
		src="${ path }/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${ path }/resources/assets/vendor/aos/aos.js"></script>
	<script src="${ path }/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="${ path }/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="${ path }/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="${ path }/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="${ path }/resources/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="${ path }/resources/assets/js/main.js"></script>
	
	
	<!-- ModuHana JS File -->
	<script src="${ path }/resources/assets/js/secure.js"></script>
    <script src="${ path }/resources/assets/js/myJS.js"></script>
    <script src="${ path }/resources/assets/js/kakao.js"></script>
    <script>
    	/* general login */
    	function checkForm() {
    		let f = document.loginForm;

    		if (isNull(f.id, "아이디를 입력하세요") || isNull(f.password, "패스워드를 입력하세요"))
    			return false;

    		return true;
    	}
    	
    	/* kakao login */
    	
    	Kakao.init(getKakaoJSKey());
	    Kakao.isInitialized();
    	function kakaoLogin() {	
			Kakao.Auth.login({
				success: kakaoGetToken,
				fail: function(err) {
					alert(JSON.stringify(err))
				},
		})}
		
    	function kakaoGetToken(result) {
			//alert(JSON.stringify(result))
			
			var accessToken = Kakao.Auth.getAccessToken(); // 액세스 토큰 할당
            Kakao.Auth.setAccessToken(accessToken); // 액세스 토큰 사용하게 등록
            
            //console.log(result.id);
            //console.log(accessToken);
            
            let scope = result.scope.split(" ");
			console.log(scope);
	      
	      	Kakao.API.request({
	    	    url: '/v2/user/me',
	    	    data: {
	    	    	 property_keys: ["kakao_account.email","kakao_account.profile.nickname"]
	    	    },
	    	    success: function(response) {
	    	    	//alert(JSON.stringify(response))
	    	    	//alert(JSON.stringify(response.kakao_account.profile.nickname))
	    	    	//alert(JSON.stringify(response.kakao_account.email))
	    	        
	    	        sendApiIdForLogin(response);
	    	    },
	    	    fail: function(error) {
	    	        console.log(error);
	    	    }
	    	});
		}
    	
    	function sendApiIdForLogin(response){
	        let form = document.ApiLoginForm;
	  		form.id.value = response.id;
	  		form.name.value = response.kakao_account.profile.nickname;
	  		form.email.value = response.kakao_account.email;
	  		
			form.submit();
		}
		
	</script>

</body>

</html>