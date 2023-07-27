<%-- 
    Document   : userProfile
    Created on : May 28, 2023, 3:53:04 AM
    Author     : admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Trang cá nhân</title>
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
            <div class="container">
                <div class="row justify-content-center">
                    <!-- profile -->
                    <div class="layout-specing">
                        <div class="card bg-white rounded shadow overflow-hidden mt-4 border-0">
                            <!--Back Ground-->
                            <img src="${user.getBackgroundImage()}" width="1150px" height="300px" alt="Chưa có ảnh bìa">
                            <!-- End Back Ground-->
                            <div class="avatar-profile d-flex margin-nagative mt-n5 position-relative ps-3">
                                <img src="${user.getImage()}" class="rounded-circle shadow-md avatar avatar-medium" alt="">
                                <div class="mt-4 ms-3 pt-3">
                                    <h5 class="mt-3 mb-1">${user.getFullName()}</h5>
                                </div>
                            </div>

                            <c:choose>
                                <c:when test="${customer != null}">
                                    <div class="row">
                                        <div class="col-12 mt-4">
                                            <div class="card border-0 rounded-0 p-4">
                                                <ul class="nav nav-pills nav-justified flex-column flex-sm-row rounded shadow overflow-hidden bg-light" id="pills-tab" role="tablist">
                                                    <!-- Overview -->
                                                    <li class="nav-item">
                                                        <a class="nav-link rounded-0 active" id="overview-tab" data-bs-toggle="pill" role="tab" aria-controls="pills-overview" aria-selected="true">
                                                            <div class="text-center pt-1 pb-1">
                                                                <h4 class="title fw-normal mb-0">Tổng quan</h4>
                                                            </div>
                                                        </a>
                                                    </li>
                                                    <!-- End Overview -->
                                                </ul>

                                                <div class="tab-content mt-2" id="pills-tabContent">
                                                    <!-- Show Overview -->
                                                    <div class="tab-pane fade active show" id="pills-overview" role="tabpanel" aria-labelledby="overview-tab">
                                                        <h6 class="mb-0" style="font-size: 16px"><a style="font-family: unset">Giới thiệu</a></h6>
                                                        <p style="text-align: center;">${user.getBio()}</p>
                                                        <h6 style="font-size: 13px"><h6 style="color: #333333">
                                                                <!-- member icon -->
                                                                <img src="assets/images/header/member.jpg" style="border-radius: 20%" width="25" height="25" alt="member">
                                                                Thành viên của <a style="color: orangered;"> F8 - Học lập trình để đi làm</a></h6></h6><br/>

                                                        <!-- Activities  -->
                                                        <h6 class="mb-0" style="font-size: 16px"><a style="font-family: unset">Hoạt động</a></h6>
                                                        <h6 style="font-size: 13px"><h6 style="color: #333333">
                                                                <!-- Act icon -->
                                                                <img src="assets/images/header/act.jpg" style="border-radius: 20%" width="25" height="25" alt="act">
                                                                Tham gia vào cộng đồng <a style="color: orangered">F8 - Học lập trình để đi làm</a></h6></h6><br/>
                                                        <!-- End Activities  -->

                                                        <!-- Enroll Courses Details -->
                                                        <h6 class="mb-0" style="font-size: 16px"><a style="font-family: unset">Các khóa học đã tham gia</a></h6>

                                                       <!-- <div class="row row-cols-md-2 row-cols-lg-5">
                                                            Courses 
                                                            <div class="col mt-4">
                                                                <div class="card team border-0 rounded shadow overflow-hidden">
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
                                                                <div class="card team border-0 rounded shadow overflow-hidden">
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
                                                                <div class="card team border-0 rounded shadow overflow-hidden">
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
                                                        </div> End Enroll Courses Details -->

                                                    </div><!-- End Overview Details -->
                                                </div>
                                            </c:when>
                                            <c:when test="${admin != null}">
                                                <div class="row">
                                                    <div class="col-12 mt-4">
                                                        <div class="card border-0 rounded-0 p-4">
                                                            <h2 class="mb-0"><a style="font-family: monospace;">Xin chào Admin</a></h2>
                                                            <div class="tab-content mt-2" id="pills-tabContent">
                                                                <!-- Show Overview -->
                                                                <div class="tab-pane fade active show" id="pills-overview" role="tabpanel" aria-labelledby="overview-tab">
                                                                    <h6 class="mb-0" style="font-size: 16px"><a style="font-family: unset">Giới thiệu</a></h6>
                                                                    <p style="text-align: center;">${user.getBio()}</p>
                                                                    <h6 style="font-size: 13px"><h6 style="color: #333333">
                                                                            <!-- member icon -->
                                                                            <img src="assets/images/header/member.jpg" style="border-radius: 20%" width="25" height="25" alt="member">
                                                                            Admin System của<a style="color: orangered;"> F8 - Học lập trình để đi làm</a></h6></h6><br/>

                                                                    <!-- Activities  -->
                                                                    <h6 class="mb-0" style="font-size: 16px"><a style="font-family: unset">Hoạt động</a></h6>
                                                                    <h6 style="font-size: 13px"><h6 style="color: #333333">
                                                                            <!-- Act icon -->
                                                                            <img src="assets/images/header/act.jpg" style="border-radius: 20%" width="25" height="25" alt="act">
                                                                            Cộng đồng <a style="color: orangered">F8 - Học lập trình để đi làm</a></h6></h6><br/>
                                                                </div><!-- End Overview Details -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:when test="${expert != null}">
                                                <div class="row">
                                                    <div class="col-12 mt-4">
                                                        <div class="card border-0 rounded-0 p-4">
                                                            <h2 class="mb-0"><a style="font-family: monospace;">Xin chào Expert</a></h2>
                                                            <div class="tab-content mt-2" id="pills-tabContent">
                                                                <!-- Show Overview -->
                                                                <div class="tab-pane fade active show" id="pills-overview" role="tabpanel" aria-labelledby="overview-tab">
                                                                    <h6 class="mb-0" style="font-size: 16px"><a style="font-family: unset">Giới thiệu</a></h6>
                                                                    <p style="text-align: center;">${user.getBio()}</p>
                                                                    <h6 style="font-size: 13px"><h6 style="color: #333333">
                                                                            <!-- member icon -->
                                                                            <img src="assets/images/header/member.jpg" style="border-radius: 20%" width="25" height="25" alt="member">
                                                                            Expert của<a style="color: orangered;"> F8 - Học lập trình để đi làm</a></h6></h6><br/>

                                                                    <!-- Activities  -->
                                                                    <h6 class="mb-0" style="font-size: 16px"><a style="font-family: unset">Nhiệm vụ</a></h6>
                                                                    <h6 style="font-size: 13px; color: #333333;">
                                                                        <!-- Act icon -->
                                                                        <img src="assets/images/header/act.jpg" style="border-radius: 20%" width="25" height="25" alt="act">
                                                                        Quản lý tất cả thông tin và bài giảng của các khóa học tại<a style="color: orangered"> F8 - Học lập trình để đi làm</a></h6></h6><br/>
                                                                </div><!-- End Overview Details -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:when test="${sales != null}">
                                                <div class="row">
                                                    <div class="col-12 mt-4">
                                                        <div class="card border-0 rounded-0 p-4">
                                                            <h2 class="mb-0"><a style="font-family: monospace;">Xin chào Saler</a></h2>
                                                            <div class="tab-content mt-2" id="pills-tabContent">
                                                                <!-- Show Overview -->
                                                                <div class="tab-pane fade active show" id="pills-overview" role="tabpanel" aria-labelledby="overview-tab">
                                                                    <h6 class="mb-0" style="font-size: 16px"><a style="font-family: unset">Giới thiệu</a></h6>
                                                                    <p style="text-align: center;">${user.getBio()}</p>
                                                                    <h6 style="font-size: 13px"><h6 style="color: #333333">
                                                                            <!-- member icon -->
                                                                            <img src="assets/images/header/member.jpg" style="border-radius: 20%" width="25" height="25" alt="member">
                                                                            Expert của<a style="color: orangered;"> F8 - Học lập trình để đi làm</a></h6></h6><br/>

                                                                    <!-- Activities  -->
                                                                    <h6 class="mb-0" style="font-size: 16px"><a style="font-family: unset">Nhiệm vụ</a></h6>
                                                                    <h6 style="font-size: 13px; color: #333333;">
                                                                        <!-- Act icon -->
                                                                        <img src="assets/images/header/act.jpg" style="border-radius: 20%" width="25" height="25" alt="act">
                                                                        Giá thành các khóa học tại<a style="color: orangered"> F8 - Học lập trình để đi làm</a></h6></h6><br/>
                                                                </div><!-- End Overview Details -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:when test="${marketing != null}">
                                                <div class="row">
                                                    <div class="col-12 mt-4">
                                                        <div class="card border-0 rounded-0 p-4">
                                                            <h2 class="mb-0"><a style="font-family: monospace;">Xin chào Marketing</a></h2>
                                                            <div class="tab-content mt-2" id="pills-tabContent">
                                                                <!-- Show Overview -->
                                                                <div class="tab-pane fade active show" id="pills-overview" role="tabpanel" aria-labelledby="overview-tab">
                                                                    <h6 class="mb-0" style="font-size: 16px"><a style="font-family: unset">Giới thiệu</a></h6>
                                                                    <p style="text-align: center;">${user.getBio()}</p>
                                                                    <h6 style="font-size: 13px"><h6 style="color: #333333">
                                                                            <!-- member icon -->
                                                                            <img src="assets/images/header/member.jpg" style="border-radius: 20%" width="25" height="25" alt="member">
                                                                            Expert của<a style="color: orangered;"> F8 - Học lập trình để đi làm</a></h6></h6><br/>

                                                                    <!-- Activities  -->
                                                                    <h6 class="mb-0" style="font-size: 16px"><a style="font-family: unset">Nhiệm vụ</a></h6>
                                                                    <h6 style="font-size: 13px; color: #333333;">
                                                                        <!-- Act icon -->
                                                                        <img src="assets/images/header/act.jpg" style="border-radius: 20%" width="25" height="25" alt="act">
                                                                        Đưa các khóa học của F8 tiếp cận với các bạn học dễ dàng hơn.<a style="color: orangered"> F8 - Học lập trình để đi làm</a></h6></h6><br/>
                                                                </div><!-- End Overview Details -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="row">
                                                    <div class="col-12 mt-4">
                                                        <div class="card border-0 rounded-0 p-4">
                                                            <ul class="nav nav-pills nav-justified flex-column flex-sm-row rounded shadow overflow-hidden bg-light" id="pills-tab" role="tablist">
                                                                <!-- Overview -->
                                                                <li class="nav-item">
                                                                    <a class="nav-link rounded-0 active" id="overview-tab" data-bs-toggle="pill" role="tab" aria-controls="pills-overview" aria-selected="true">
                                                                        <div class="text-center pt-1 pb-1">
                                                                            <h4 class="title fw-normal mb-0">Tổng quan</h4>
                                                                        </div>
                                                                    </a>
                                                                </li>
                                                                <!-- End Overview -->
                                                            </ul>

                                                            <div class="tab-content mt-2" id="pills-tabContent">
                                                                <!-- Show Overview -->
                                                                <div class="tab-pane fade active show" id="pills-overview" role="tabpanel" aria-labelledby="overview-tab">
                                                                    <h6 class="mb-0" style="font-size: 16px"><a style="font-family: unset">Giới thiệu</a></h6>
                                                                    <p style="text-align: center;">${user.getBio()}</p>
                                                                    <h6 style="font-size: 13px"><h6 style="color: #333333">
                                                                            <!-- member icon -->
                                                                            <img src="assets/images/header/member.jpg" style="border-radius: 20%" width="25" height="25" alt="member">
                                                                            Thành viên của <a style="color: orangered;"> F8 - Học lập trình để đi làm</a></h6></h6><br/>
                                                                    <!-- Activities  -->
                                                                    <h6 class="mb-0" style="font-size: 16px"><a style="font-family: unset">Hoạt động</a></h6>
                                                                    <h6 style="font-size: 13px"><h6 style="color: #333333">
                                                                            <!-- Act icon -->
                                                                            <img src="assets/images/header/act.jpg" style="border-radius: 20%" width="25" height="25" alt="act">
                                                                            Tham gia vào cộng đồng <a style="color: orangered">F8 - Học lập trình để đi làm</a></h6></h6><br/>
                                                                    <!-- End Activities  -->

                                                                    <!-- Enroll Courses Details -->
                                                                    <h6 class="mb-0" style="font-size: 16px"><a style="font-family: unset">Các khóa học đã tham gia</a></h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- End Profile -->
                    </div> 
                </div> 
        </section>     
        <!-- End Section -->

        <!-- Javascript -->
        <!-- Profile -->
        <!-- Back to top -->
        <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>
        <!-- Back to top -->
        <!-- javascript -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <!-- javascript -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <!-- Icons -->
        <script src="assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="assets/js/app.js"></script>

        <!-- Footer -->
        <%@include file="/view/common/footer.jsp"%>
        <!-- End footer -->

        <!-- JavaScript -->
        <!-- Home -->
        <!-- javascript -->
        <script src="../assets/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/bootstrap.bundle.min.js"></script>
        <!-- SLIDER -->
        <script src="../assets/js/tiny-slider.js"></script>
        <script src="../assets/js/tiny-slider-init.js"></script>
        <!-- Chart -->
        <script src="../assets/js/apexcharts.min.js"></script>
        <script src="../assets/js/areachart.init.js"></script>
        <!-- Icons -->
        <script src="../assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="../assets/js/app.js"></script>

        <!-- Header -->
        <!-- javascript -->
        <script src="../assets/js/bootstrap.bundle.min.js"></script>
        <!-- Icons -->
        <script src="../assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="../assets/js/app.js"></script>

        <!-- back to top -->
        <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>
        <!-- end back to top -->
    </body>
</html>