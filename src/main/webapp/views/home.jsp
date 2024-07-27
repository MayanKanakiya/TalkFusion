<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en-US" dir="ltr">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- ===============================================-->
<!--    Document Title-->
<!-- ===============================================-->
<title>TalkFusion</title>

<!-- ===============================================-->
<!--    Favicons-->
<!-- ===============================================-->


<!-- ===============================================-->
<!--    Stylesheets-->
<!-- ===============================================-->
<link rel="stylesheet" href="vendors/swiper/swiper-bundle.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Figtree:ital,wght@0,300..900;1,300..900&amp;family=Rubik:ital,wght@0,300..900;1,300..900family=Rubik:ital,wght@0,300..900;1,300..900&amp;display=swap"
	rel="stylesheet">
<link href="assets/css/theme.min.css" rel="stylesheet"
	id="style-default">
<link href="assets/css/user-rtl.min.css" rel="stylesheet"
	id="user-style-rtl">
<link href="assets/css/user.min.css" rel="stylesheet"
	id="user-style-default">
<link rel="stylesheet"
	href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
</head>

<body>
	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->
	<main class="main" id="top">
		<div class="content">
			<nav class="navbar navbar-expand-md fixed-top" id="navbar"
				data-navbar-soft-on-scroll="data-navbar-soft-on-scroll">
				<div class="container-fluid px-0">
					<a href="/"><img class="navbar-brand w-75 d-md-none"
						src="assets/img/logos/logo.svg" alt="logo" /></a><a
						class="navbar-brand fw-bold d-none d-md-block" href="/">TalkFusion</a>
					<a
						class="btn btn-primary btn-sm ms-md-x1 mt-lg-0 order-md-1 ms-auto"
						href="/login">Login</a> <a
						class="btn btn-primary btn-sm ms-md-x1 mt-lg-0 order-md-1 ms-auto"
						href="/signup">Signup</a>
					<button class="navbar-toggler border-0 pe-0" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbar-content"
						aria-controls="navbar-content" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-md-end"
						id="navbar-content" data-navbar-collapse="data-navbar-collapse">
						<ul
							class="navbar-nav gap-md-2 gap-lg-3 pt-x1 pb-1 pt-md-0 pb-md-0"
							data-navbar-nav="data-navbar-nav">
							<li class="nav-item"><a class="nav-link lh-xl" href="#home">Home</a></li>
							<li class="nav-item"><a class="nav-link lh-xl" href="#about">About
									us</a></li>
						</ul>
					</div>
				</div>
			</nav>
			<div data-bs-target="#navbar" data-bs-spy="scroll" tabindex="0">
				<section
					class="hero-section overflow-hidden position-relative z-0 mb-4 mb-lg-0"
					id="home">
					<div class="hero-background">
						<div class="container">
							<div class="row gy-4 gy-md-8 pt-9 pt-lg-0">
								<div class="col-lg-6 text-center text-lg-start">
									<h1
										class="fs-2 fs-lg-1 text-white fw-bold mb-2 mb-lg-x1 lh-base mt-3 mt-lg-0">
										Stay Connected, Anytime, Anywhere</h1>
									<p class="fs-8 text-white mb-3 mb-lg-4 lh-lg">Experience
										seamless video calls, voice messages, and text chats all in
										one platform.</p>
									<div
										class="d-flex justify-content-center justify-content-lg-start">
										<a class="btn btn-primary btn-lg lh-xl mb-4 mb-md-5 mb-lg-7"
											href="#">Let's meet</a>
									</div>
								</div>
								<div class="col-lg-6 position-lg-relative">
									<div class="position-lg-absolute z-1 text-center">
										<img class="img-fluid chat-image"
											src="assets/img/Hero/Frame.webp" alt="" />
										<div class="position-absolute dots d-none d-md-block">
											<img class="img-fluid w-50 w-lg-75"
												src="assets/img/illustrations/Dots.webp" alt="" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="position-absolute bottom-0 start-0 end-0 z-1">
						<img class="wave mb-md-n2" src="assets/img/illustrations/Wave.svg"
							alt="" />
						<div class="bg-white py-2 py-md-5"></div>
					</div>
				</section>
				<section class="container mb-8 mb-lg-13" id="about">
					<div class="row align-items-center">
						<div class="col-12 col-lg-6 col-xl-7">
							<img class="img-fluid" src="assets/img/Hero/Team.webp"
								alt="Collaborate on TalkFusion" />
						</div>
						<div class="col-12 col-lg-6 col-xl-5">
							<div class="row justify-content-center justify-content-lg-start">
								<div class="col-sm-10 col-md-8 col-lg-12">
									<h2 class="fs-4 fs-lg-3 fw-bold mb-2 text-center text-lg-start">Your
										All-In-One Communication Hub</h2>
									<p
										class="fs-8 mb-4 mb-lg-5 lh-lg text-center text-lg-start fw-normal">
										TalkFusion offers a seamless platform for video calls, voice
										messages, and text chats, keeping you connected with ease.</p>
								</div>
								<div class="col-12">
									<div class="mb-x1 mb-lg-3">
										<h5 class="fs-8 fw-bold lh-lg mb-1">Easy Video Calls</h5>
										<p class="mb-0 lh-xl">Make high-quality video calls with
											friends, family, and colleagues effortlessly.</p>
									</div>
									<div class="mb-x1 mb-lg-3">
										<h5 class="fs-8 fw-bold lh-lg mb-1">Clear Voice Messages</h5>
										<p class="mb-0 lh-xl">Send and receive voice messages for
											quick and clear communication.</p>
									</div>
									<div>
										<h5 class="fs-8 fw-bold lh-lg mb-1">Instant Text Chats</h5>
										<p class="lh-xl mb-0">Chat instantly with anyone through
											text, ensuring you stay connected at all times.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<section class="container mb-8 mb-lg-11">
					<div class="row justify-content-center">
						<div class="col-md-8 col-lg-7">
							<h3 class="fs-4 fs-lg-3 fw-bold text-center mb-2 mb-lg-x1">
								How does <span class="text-nowrap">it work?</span>
							</h3>
							<p class="fs-8 mb-7 mb-lg-8 text-center lh-lg">You can use
								this as it is or tweak it as you seem necessary. you seem
								necessary.</p>
						</div>
						<div class="col-12">
							<div class="row g-sm-2 g-lg-3 align-items-center timeline">
								<div
									class="col-12 col-lg-4 d-flex flex-row flex-lg-column justify-content-center gap-2 gap-sm-x1 gap-md-4 gap-lg-0">
									<div class="timeline-step-1 w-25 w-lg-100 mb-4 mb-lg-5 mb-xl-6">
										<div class="timeline-item d-flex justify-content-center">
											<div
												class="timeline-icon bg-primary rounded-circle d-flex justify-content-center align-items-center">
												<span class="fs-6 fs-lg-5 fs-xl-4 text-white"> 1</span>
											</div>
										</div>
									</div>
									<div
										class="py-1 py-lg-0 px-lg-5 w-75 w-sm-50 w-lg-100 timeline-content">
										<h6 class="fs-8 fw-bold text-lg-center lh-lg mb-2">Register</h6>
										<p class="text-lg-center lh-xl mb-0">Register youself with
											username and password</p>
									</div>
								</div>
								<div
									class="col-12 col-lg-4 d-flex flex-row flex-lg-column justify-content-center gap-2 gap-sm-x1 gap-md-4 gap-lg-0">
									<div class="timeline-step-2 w-25 w-lg-100 mb-4 mb-lg-5 mb-xl-6">
										<div class="timeline-item d-flex justify-content-center">
											<div
												class="timeline-icon bg-success rounded-circle d-flex justify-content-center align-items-center">
												<span class="fs-6 fs-lg-5 fs-xl-4 text-white"> 2</span>
											</div>
										</div>
									</div>
									<div
										class="py-1 py-lg-0 px-lg-5 w-75 w-sm-50 w-lg-100 timeline-content">
										<h6 class="fs-8 fw-bold text-lg-center lh-lg mb-2">Add
											Member</h6>
										<p class="text-lg-center lh-xl mb-0">
											Start with adding team member to <span class="text-nowrap">your
												channels. </span>
										</p>
									</div>
								</div>
								<div
									class="col-12 col-lg-4 d-flex flex-row flex-lg-column justify-content-center gap-2 gap-sm-x1 gap-md-4 gap-lg-0">
									<div
										class="timeline-step-3 position-relative z-1 overflow-hidden w-25 w-lg-100 mb-4 mb-lg-5 mb-xl-6">
										<div class="timeline-item d-flex justify-content-center">
											<div
												class="timeline-icon bg-info rounded-circle d-flex justify-content-center align-items-center">
												<span class="fs-6 fs-lg-5 fs-xl-4 text-white"> 3</span>
											</div>
										</div>
									</div>
									<div
										class="py-1 py-lg-0 px-lg-5 w-75 w-sm-50 w-lg-100 timeline-content">
										<h6 class="fs-8 fw-bold text-lg-center lh-lg mb-2">Start
											Rolling</h6>
										<p class="text-lg-center lh-xl mb-0">
											Start operating your business in a simpler way <span
												class="text-nowrap">and grow!</span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<section class="experience position-relative overflow-hidden"
					id="service">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-12">
								<div
									class="position-relative z-1 text-center mb-8 mb-lg-9 video-player-paused"
									data-video-player-container="data-video-player-container">
									<video class="w-100 h-100 rounded-4"
										src="assets/video/Tech_video.mp4"
										poster="assets/img/Hero/experiences.webp" type="video/mp4"
										data-video-player="data-video-player"></video>
									<div
										class="overlay position-absolute top-0 bottom-0 start-0 end-0 rounded-4 bg-1100 object-cover"
										data-overlay="data-overlay"></div>
									<button
										class="btn play-button position-absolute justify-content-center align-items-center bg-white rounded-circle cursor-pointer"
										data-play-button="data-play-button">
										<img class="play-icon w-25"
											src="assets/img/illustrations/play-solid.svg" alt=""
											data-play-icon="data-play-icon" /><img
											class="pause-icon w-25"
											src="assets/img/illustrations/pause-solid.svg" alt=""
											data-pause-icon="data-pause-icon" />
									</button>
									<div class="position-absolute dots d-none d-sm-block">
										<img class="img-fluid w-100"
											src="assets/img/illustrations/Dots.webp" alt="" />
									</div>
								</div>
							</div>
							<div class="col-md-8 col-lg-7">
								<h2
									class="fs-4 fs-lg-3 fw-bold text-center text-white mb-5 mb-lg-9 lh-sm">We
									made this app to solve your problems.</h2>
							</div>
							<div class="col-12">
								<div class="row gy-4 g-md-3 pb-8 pb-lg-11 px-1">
									<div
										class="col-12 col-md-6 col-lg-4 d-flex align-items-start gap-2">
										<img src="assets/img/icons/chat (1).png" alt="" />
										<div>
											<h5 class="fs-8 text-white lh-lg fw-bold">Instant Chat</h5>
											<p class="text-white text-opacity-50 lh-xl mb-0">Chat
												instantly with anyone through text, ensuring you stay
												connected at all times.</p>
										</div>
									</div>
									<div
										class="col-12 col-md-6 col-lg-4 d-flex align-items-start gap-2">
										<img src="assets/img/icons/video.png" alt="" />
										<div>
											<h5 class="fs-8 text-white lh-lg fw-bold">Video Meeting</h5>
											<p class="text-white text-opacity-50 lh-xl mb-0">Make
												high-quality video calls with friends, family, and
												colleagues effortlessly.</p>
										</div>
									</div>
									<div
										class="col-12 col-md-6 col-lg-4 d-flex align-items-start gap-2">
										<img src="assets/img/icons/voice.png" alt="" />
										<div>
											<h5 class="fs-8 text-white lh-lg fw-bold">Voice Message</h5>
											<p class="text-white text-opacity-50 lh-xl mb-0">Send and
												receive voice messages for quick and clear communication.</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="position-absolute top-0 start-0 end-0">
						<div class="bg-white py-3 py-md-9 py-xl-10"></div>
						<img class="wave" src="assets/img/illustrations/Wave_2.svg" alt="" />
					</div>
				</section>
				<section class="bg-1100 mt-n1">
					<div class="mx-auto text-center">
						<hr class="horizontal-rule m-0 d-inline-block" />
					</div>
					<div class="container pb-8 pb-lg-10">
						<div class="row justify-content-center">
							<div class="col-md-8 col-lg-7">
								<h2
									class="fs-6 fs-lg-5 fw-bold text-white text-center pt-7 pb-4 pt-lg-9 pb-lg-6 lh-lg">
									<span class="underline"> 1,749 remote teams </span>have shared
									their experience with our website!
								</h2>
							</div>
							<div class="col-12 mb-4 mb-lg-6">
								<div class="row g-2">
									<div class="swiper-theme-container">
										<div class="swiper position-relative"
											data-swiper='{"spaceBetween":20,"mousewheel":{"forceToAxis":true,"sensitiviye":20,"releaseOnEdges":true},"autoplay":{"delay":3000,"disableOnInteraction":false},"breakpoints":{"0":{"slidesPerView":1,"direction":"horizontal","centeredSlide":true,"loop":true},"768":{"direction":"horizontal","centeredSlide":true,"slidesPerView":2,"loop":true},"992":{"slidesPerView":3,"direction":"vertical","loop":false}}}'>
											<div class="swiper-wrapper">
												<div class="col-12 swiper-slide">
													<div class="d-flex justify-content-center gap-2">
														<div
															class="d-flex flex-column flex-lg-row gap-2 px-4 py-x1 review-card-1">
															<div class="text-center text-lg-start">
																<img class="card-image rounded-circle object-fit-cover"
																	src="assets/img/feedback/reviewer_1.webp" alt="" />
															</div>
															<div class="text-center text-lg-start">
																<p class="fs-8 mb-2 lh-lg line-clamp-3 text-1100">&#8220;TalkFusion
																	has transformed the way I connect with friends and
																	family—seamless and user-friendly!&ldquo;</p>
																<p class="text-800 lh-xl mb-0">Krishna</p>
															</div>
														</div>
													</div>
												</div>
												<div class="col-12 swiper-slide">
													<div class="d-flex justify-content-center gap-2">
														<div
															class="d-flex flex-column flex-lg-row gap-2 px-4 py-x1 review-card-2">
															<div class="text-center text-lg-start">
																<img class="card-image rounded-circle object-fit-cover"
																	src="assets/img/feedback/reviewer_2.webp" alt="" />
															</div>
															<div class="text-center text-lg-start">
																<p class="fs-8 mb-2 lh-lg line-clamp-3 text-1100">&#8220;The
																	video call feature is crystal clear and incredibly
																	reliable. Highly recommend TalkFusion!&ldquo;</p>
																<p class="text-800 lh-xl mb-0">Radha</p>
															</div>
														</div>
													</div>
												</div>
												<div class="col-12 swiper-slide">
													<div class="d-flex justify-content-center gap-2">
														<div
															class="d-flex flex-column flex-lg-row gap-2 px-4 py-x1 review-card-3">
															<div class="text-center text-lg-start">
																<img class="card-image rounded-circle object-fit-cover"
																	src="assets/img/feedback/reviewer_3.webp" alt="" />
															</div>
															<div class="text-center text-lg-start">
																<p class="fs-8 mb-2 lh-lg line-clamp-3 text-1100">&#8220;Excellent
																	user experience with TalkFusion—everything just works
																	flawlessly. Great job!&ldquo;</p>
																<p class="text-800 lh-xl mb-0">Ranchhod</p>
															</div>
														</div>
													</div>
												</div>
												<div class="col-12 swiper-slide">
													<div class="d-flex justify-content-center gap-2">
														<div
															class="d-flex flex-column flex-lg-row gap-2 px-4 py-x1 review-card-4">
															<div class="text-center text-lg-start">
																<img class="card-image rounded-circle object-fit-cover"
																	src="assets/img/feedback/kakashi.webp" alt="" />
															</div>
															<div class="text-center text-lg-start">
																<p class="fs-8 mb-2 lh-lg line-clamp-3 text-1100">&#8220;I
																	love how easy it is to switch between voice messages
																	and text. TalkFusion is a game-changer!&ldquo;</p>
																<p class="text-800 lh-xl mb-0">Parvati</p>
															</div>
														</div>
													</div>
												</div>
												<div class="col-12 swiper-slide">
													<div class="d-flex justify-content-center gap-2">
														<div
															class="d-flex flex-column flex-lg-row gap-2 px-4 py-x1 review-card-5">
															<div class="text-center text-lg-start">
																<img class="card-image rounded-circle object-fit-cover"
																	src="assets/img/feedback/obito.webp" alt="" />
															</div>
															<div class="text-center text-lg-start">
																<p class="fs-8 mb-2 lh-lg line-clamp-3 text-1100">&#8220;TalkFusion's
																	intuitive design makes communication effortless. I
																	couldn't ask for a better platform!&ldquo;</p>
																<p class="text-800 lh-xl mb-0">Mohal</p>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="text-center">
								<a class="py-1 link-success" href="#!"><span>Read
										more reviews </span><span class="uil uil-arrow-right icon"></span></a>
							</div>
						</div>
					</div>
				</section>
			</div>
			<button
				class="btn scroll-to-top text-white rounded-circle d-flex justify-content-center align-items-center bg-primary"
				data-scroll-top="data-scroll-top">
				<span class="uil uil-angle-up"></span>
			</button>
			<footer class="pt-7 pt-lg-8">
				<div class="container">
					<div class="row gy-2 py-3 justify-content-center">
						<div class="col-auto text-center">
							<p class="lh-xl text-1100">
								&#169; 2024 Copyright, All Rights Reserved, Made by <a
									class="fw-semi-bold" href="https://themewagon.com/">TalkFusion</a>&#9829;
							</p>
						</div>
					</div>
				</div>
			</footer>

		</div>
	</main>
	<!-- ===============================================-->
	<!--    End of Main Content-->
	<!-- ===============================================-->



	<!-- ===============================================-->
	<!--    JavaScripts-->
	<!-- ===============================================-->
	<script src="vendors/popper/popper.min.js"></script>
	<script src="vendors/bootstrap/bootstrap.min.js"></script>
	<script src="vendors/is/is.min.js"></script>
	<script src="vendors/countup/countUp.umd.js"></script>
	<script src="vendors/swiper/swiper-bundle.min.js"></script>
	<script src="vendors/lodash/lodash.min.js"></script>
	<script
		src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
	<script src="assets/js/theme.js"></script>
</body>

</html>