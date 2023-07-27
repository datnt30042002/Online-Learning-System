<%-- 
    Document   : myCourse
    Created on : Jun 11, 2023, 12:58:53 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Khóa học của tôi</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="https://shreethemes.in" />
        <meta name="Version" content="v1.2.0" />
        <!-- f8logo -->
        <link rel="shortcut icon" href="assets/images/logoF8.png">
        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

        <style>
            .tns-outer [aria-controls], .tns-outer[data-action]{
                cursor: var;
                background: black;
                width: 50px;
            }

            .tns-nav{
                text-align: center;
                margin-top: 10px;
                margin-right: 1070px;
            }

            .row {
                --bs-gutter-x: 1.5rem;
                --bs-gutter-y: 0;
                display: flex;
                flex-wrap: wrap;
                margin-top: calc(var(--bs-gutter-y) * -1);
                margin-right: calc(var(--bs-gutter-x) * -.5);
                margin-left: calc(var(--bs-gutter-x) * -.5);
                width: 1350px;
            }

            .container-right {
                width: 100%;
                overflow: hidden; /* Clear floats */
            }

            .content-right {
                float: right;
                margin-right: 25px;
            }

        </style>        
    </head>
    <body>
        <%@include file="/view/common/header-back.jsp"%>
        <!-- Loader -->
        <div id="preloader">
            <div id="status">
                <div class="spinner">
                    <div class="double-bounce1"></div>
                    <div class="double-bounce2"></div>
                </div>
            </div>
        </div>
        <!-- Loader -->

        <!-- Section -->
        <section class="bg-dashboard">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-2 col-lg-2 col-md-3 col-6">
                        <div class="rounded overflow-hidden sticky-bar">
                            <%@include file="/view/common/navbar.jsp"%>
                        </div>
                    </div>

                    <div class="col-xl-10 col-lg-10 col-md-9 mt-4 mt-sm-0">
                        <div class="row"> 
                            <!-- show khoa hoc pro --> 
                            <br>
                            <div class="row">
                                <h5 style="color: #000">Khóa học của tôi</h5> 
                                <!--                                <strong><a style="color: #000 ; font-size: 27px">Khóa học Pro</a><span class="badge bg-danger rounded-pill ms-1"><strong>New</strong></span></strong>-->
                                <div class="row row-cols-md-2 row-cols-lg-4">
                                    <!-- My Courses -->
                                    <div class="col mt-4">
                                        <div class="card team border-0 rounded overflow-hidden">
                                            <div class="team-person position-relative overflow-hidden">
                                                <img src="assets/images/home/freec1.jpg" class="img-fluid" alt="">
                                            </div>
                                            <div class="card-body">
                                                <a href="#" class="title text-dark h5 d-block mb-0">HTML CSS PRO từ Zero đến Hero</a>
                                                <small class="text-muted speciality">
                                                    Trong khóa này chúng ta sẽ cùng nhau xây dựng giao diện 2 trang web là The Band & Shopee.</small>
                                                <div class="d-flex justify-content-between align-items-center mt-2">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col mt-4">
                                        <div class="card team border-0 rounded overflow-hidden">
                                            <div class="team-person position-relative overflow-hidden">
                                                <img src="assets/images/home/freec2.jpg" class="img-fluid" alt="">
                                            </div>
                                            <div class="card-body">
                                                <a href="#" class="title text-dark h5 d-block mb-0">HTML CSS PRO từ Zero đến Hero</a>
                                                <small class="text-muted speciality">
                                                    Trong khóa này chúng ta sẽ cùng nhau xây dựng giao diện 2 trang web là The Band & Shopee.</small>
                                                <div class="d-flex justify-content-between align-items-center mt-2">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col mt-4">
                                        <div class="card team border-0 rounded overflow-hidden">
                                            <div class="team-person position-relative overflow-hidden">
                                                <img src="assets/images/home/freec3.jpg" class="img-fluid" alt="">
                                            </div>
                                            <div class="card-body">
                                                <a href="#" class="title text-dark h5 d-block mb-0">HTML CSS PRO từ Zero đến Hero</a>
                                                <small class="text-muted speciality">
                                                    Trong khóa này chúng ta sẽ cùng nhau xây dựng giao diện 2 trang web là The Band & Shopee.</small>
                                                <div class="d-flex justify-content-between align-items-center mt-2">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col mt-4">
                                        <div class="card team border-0 rounded shadow-sm overflow-hidden" style="text-align: center;">
                                            <br>
                                            <div class="card-body">
                                                <a href="#" class="title text-dark h5 d-block mb-0"><p style="color: orangered; font-size: 40px;">+</p></a>
                                                <img src="#" class="img-fluid" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Enroll Courses Details -->
                            </div>
                            <!-- End Overview Details -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- end show khoa hoc pro -->
        </section>
        <!-- end S-->

        <!-- Java script -->
        <!-- Profile -->
        <!-- Back to top -->
        <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>
        <!-- Back to top -->
        <!-- java script -->
        <script src="../../assets/js/bootstrap.bundle.min.js"></script>
        <!-- java script -->
        <script src="../../assets/js/bootstrap.bundle.min.js"></script>
        <!-- Icons -->
        <script src="../../assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="../../assets/js/app.js"></script>

        <!-- Footer -->
        <%@include file="/view/common/footer.jsp"%>
        <!-- End footer -->

        <!-- Header -->
        <!-- java script -->
        <script src="../../assets/js/bootstrap.bundle.min.js"></script>
        <!-- Icons -->
        <script src="../../assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="../../assets/js/app.js"></script>
    </body>
</html>
