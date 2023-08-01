<%-- 
    Document   : programTraining
    Created on : Jun 21, 2023, 5:11:08 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lộ trình học lập trình cho người mới tại F8 | Tự học lập trình từ đầu ở nhà</title>
        <!-- F8logo -->
        <!-- favicon -->
        <link rel="shortcut icon" href="assets/images/logoF8.png">
        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- SLIDER -->
        <link rel="stylesheet" href="assets/css/tiny-slider.css"/>
        <!-- Icons -->
        <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">

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
        <!-- End Loader -->

        <!-- start section -->
        <section class="bg-dashboard">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-2 col-lg-2 col-md-3 col-6">
                        <div class="rounded overflow-hidden sticky-bar">
                            <%@include file="/view/common/navbar.jsp"%>
                        </div>
                    </div>

                    <div class="col-xl-10 col-lg-10 col-md-9 mt-4 mt-sm-0">
                        <strong style="font-size: 25px">Lộ trình học</strong>
                        <p>
                            Để bắt đầu một cách thuận lợi, bạn nên tập trung vào một lộ trình học. Ví dụ: Để đi làm với vị trí "Lập trình viên Front-end" 
                            <br>bạn nên tập trung vào lộ trình "Front-end".
                        </p>
                        <br><br>
                        <div class="row">
                            <!-- show lo trinh, form lo trinh chinh - co the dung form de add jstl vao --> 
                            <br>
                            <div class="row">
                                <!-- Courses -->
                                <div class="col-5" style="border: 1px solid wheat; border-radius: 8%; margin-right: 2%;"> <!-- shadow-sm -->
                                    <div class="col mt-4" style="margin: 4%;">
                                        <strong style="color: #000; font-size: 20px;">Lộ trình học Front-End</strong><br><br>
                                        <div class="card team border-0 rounded overflow-hidden">
                                            <div class="container-right">
                                                <div class="content-right">
                                                    <img src="assets/images/course/frontend.jpg" class="img-fluid" style="height: 130px; width: 150px;" alt="">
                                                </div>
                                                <p>Lập trình viên Front-end là người xây dựng ra giao diện websites. Trong phần này F8 sẽ chia sẻ cho bạn lộ trình để trở thành lập trình viên <br>Front-end nhé.</p>
                                            </div>
                                            <!-- icon mau chua chinh sua -->
                                            <p>
                                                <a href="#" class="btn btn-icon btn-pills btn-outline-dark"><i data-feather="github" class="fea icon-sm"></i></a>
                                                <a href="#" class="btn btn-icon btn-pills btn-outline-dark"><i data-feather="facebook" class="fea icon-sm"></i></a>
                                                <a href="#" class="btn btn-icon btn-pills btn-outline-dark"><i data-feather="instagram" class="fea icon-sm"></i></a>
                                            </p>
                                            <!-- icon mau chua chinh sua -->
                                            <div>
                                                <a href="#" class="btn btn-pills btn-danger"> Xem chi tiết </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-5" style="border: 1px solid wheat; border-radius: 8%; margin-right: 2%;"> <!-- shadow-sm -->
                                    <div class="col mt-4" style="margin: 4%;">
                                        <strong style="color: #000; font-size: 20px;">Lộ trình học Back-End</strong><br><br>
                                        <div class="card team border-0 rounded overflow-hidden">
                                            <div class="container-right">
                                                <div class="content-right">
                                                    <!--                                                    <div class="team-person position-relative overflow-hidden">-->
                                                    <img src="assets/images/course/backend.jpg" class="img-fluid" style="height: 130px; width: 150px;" alt="">
                                                    <!--                                                    </div>-->
                                                </div>
                                                <p>Trái với Front-end thì lập trình viên Back-end là người làm việc với dữ liệu, công việc thường nặng tính logic hơn. Chúng ta sẽ cùng tìm hiểu thêm về lộ trình học Back-end nhé.</p>
                                            </div>
                                            <!-- icon mau chua chinh sua -->
                                            <p>
                                                <a href="#" class="btn btn-icon btn-pills btn-outline-dark"><i data-feather="github" class="fea icon-sm"></i></a>
                                                <a href="#" class="btn btn-icon btn-pills btn-outline-dark"><i data-feather="facebook" class="fea icon-sm"></i></a>
                                                <a href="#" class="btn btn-icon btn-pills btn-outline-dark"><i data-feather="instagram" class="fea icon-sm"></i></a>
                                            </p>
                                            <!-- icon mau chua chinh sua -->
                                            <div>
                                                <a href="#" class="btn btn-pills btn-danger"> Xem chi tiết </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- end show lo trinh -->
                        </div>
                        <br><br><br><!-- tam thoi -->

                        <div class="row">
                            <div class="col-4">
                                <br><br><br><br>
                                <strong><a style="color: #000 ; font-size: 27px">Tham gia cộng đồng học viên F8 trên Facebook</a></strong>
                                <p>Hàng nghìn người khác đang học lộ trình giống như bạn. Hãy tham gia hỏi đáp, chia sẻ và hỗ trợ nhau trong quá trình học nhé.</p>
                                <a href="https://www.facebook.com/groups/f8official" class="btn btn-pills btn-outline-dark">Tham gia nhóm</a>
                            </div>

                            <div class="col-4">
                            </div>

                            <div class="col-4">
                                <div class="container-right">
                                    <div class="content-right">
                                        <div class="card team border-0 rounded overflow-hidden">
                                            <div class="team-person position-relative overflow-hidden">
                                                <img style="height: 400px; width: 600px;" src="assets/images/course/intro.jpg" class="img-fluid" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- End section -->
    <!-- back to top -->
    <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>
    <!-- end back to top -->

    <!-- JavaScript -->
    <!-- Home -->
    <!-- javascript -->
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <!-- SLIDER -->
    <script src="assets/js/tiny-slider.js"></script>
    <script src="assets/js/tiny-slider-init.js"></script>
    <!-- Chart -->
    <script src="assets/js/apexcharts.min.js"></script>
    <script src="assets/js/areachart.init.js"></script>
    <!-- Icons -->
    <script src="assets/js/feather.min.js"></script>
    <!-- Main Js -->
    <script src="assets/js/app.js"></script>
    
    <!-- javascript -->
    <script src="https://kit.fontawesome.com/4ec0e85a31.js" crossorigin="anonymous"></script>
    <script src="../../../assets/js/bootstrap.bundle.min.js"></script>
    <!-- SLIDER -->
    <script src="../../../assets/js/tiny-slider.js"></script>
    <script src="../../../assets/js/tiny-slider-init.js"></script>
    <!-- Icons -->
    <script src="../../../assets/js/feather.min.js"></script>
    <!-- Main Js -->
    <script src="../../../assets/js/app.js"></script>
    <br><br>
    <!-- footer -->
    <%@include file="/view/common/footer.jsp"%>
    <!-- end footer -->
</body>
</html>
