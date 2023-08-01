<%-- 
    Document   : courseDetail
    Created on : Jul 13, 2023, 6:55:48 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>${CourseByID.getName()}</title>
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
                        <div class="row">
                            <div class="col-xl-8 col-lg-10 col-md-9 mt-4 mt-sm-0">
                                <strong style="font-size: 40px; color: #000;">${CourseByID.getName()}</strong>
                                <br><br>
                                <p>
                                    ${CourseByID.getDescription()}
                                </p>
                                <br>

                                <strong style="font-size: 15px; color: #000;">Bạn sẽ học được gì?</strong>
                                <div class="row" style="margin-top: 1%;">
                                    <div class="col-8">
                                        <a style="color: orangered;"><i class="uil uil-check"></i></a>${CourseByID.getCourseInfo()}<br>
                                    </div>
                                </div><br>

                                <div class="col-12">
                                    <strong style="color: #000; font-size: 20px;">Nội dung khóa học</strong><br><br>
                                    <div class="row">
                                        <div class="col-12">
                                            <p class=justify-content-start">
                                                <a style="color: orangered;"><i class="uil uil-check"></i></a>Bài giảng video cực kỳ chất lượng đến từ <a href="home" style="color: orangered">F8-Học lập trình để đi làm</a>
                                            </p>
                                        </div>
                                    </div>

                                    <div class="card team border-0 rounded overflow-hidden">
                                        <a style="color: #0a2d86;">${ld.getTitle()}</a><br>
                                        <c:forEach items="${listLesson}" var="l">
                                            <c:if test="${l.getCourse_CourseID() == CourseByID.getCourseID()}">
                                                <select class="form-select form-control" style="margin-bottom: 1%;">
                                                    <option>Chương: ${l.getName()}</option>
                                                    <c:forEach items="${listLessonDetail}" var="ld">
                                                        <c:if test="${ld.getLesson_LessonID() == l.getLessonID()}">
                                                            <option>Bài giảng: ${ld.getTitle()}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-4 col-lg-10 col-md-9 mt-4 mt-sm-0 d-flex justify-content-end">
                                <div class="col-xl-12 col-lg-2 col-md-3 col-6">
                                    <video class="img-fluid" id="video" style="border-radius: 4%; width: 400px;" controls>
                                        <source src="${CourseByID.getVideoIntro()}" type="video/mp4">
                                    </video>

                                    <div class="col mt-4">
                                        <div class="card team border-0 rounded overflow-hidden">
                                            <!-- trang thai khi select fessStatus = 0 || !=0 -->
                                            <div class="container d-flex justify-content-center">

                                                <c:if test="${CourseByID.getFeeStatus()==0}">
                                                    <a style="color: orangered; font-size: 30px;">Miễn phí</a>
                                                </c:if>
                                                <c:if test="${CourseByID.getFeeStatus()!=0}">
                                                    <a style="color: orangered; font-size: 30px;">
                                                        <script>
                                                            var fee = ${CourseByID.getFeeStatus()};
                                                            var formattedFee = (fee / 1).toLocaleString('en-US');
                                                            document.write(formattedFee + 'đ');
                                                        </script>
                                                    </a>
                                                </c:if>
                                            </div>
                                            <br>
                                            <!--  button dang ky -->
                                            <c:if test="${CourseByID.getFeeStatus()==0}">
                                                <div class="container d-flex justify-content-center">
                                                    <a href="videoLesson?LessonDetailID=1&CourseID=${CourseByID.getCourseID()}" class="btn btn-pills btn-danger"> Đăng ký học </a>
                                                </div>
                                            </c:if>
                                            <c:if test="${CourseByID.getFeeStatus()!=0}">
                                                <div class="container d-flex justify-content-center">
                                                    <a href="courseDetail?CourseID=${CourseByID.getCourseID()}" class="btn btn-pills btn-danger"> Đăng ký học </a>
                                                </div>
                                            </c:if>
                                            <br>
                                            <!--  button dang ky -->
                                            <!-- icon mau chua chinh sua -->
                                            <div style="margin-left: 25%;">
                                                <a style="color: orangered;"><i class="uil uil-check"></i></a>Trình độ cho mọi người</a><br>
                                                <a style="color: orangered;"><i class="uil uil-check"></i></a>Bài học chất lượng</a><br>
                                                <a style="color: orangered;"><i class="uil uil-check"></i></a>Thời gian linh hoạt</a><br>
                                                <a style="color: orangered;"><i class="uil uil-check"></i></a>Học mọi lúc, mọi nơi</a><br>
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