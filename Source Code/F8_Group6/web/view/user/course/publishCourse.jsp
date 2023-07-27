<%-- 
    Document   : coursePublic
    Created on : Jun 21, 2023, 5:19:20 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Danh sách các khóa học lập trình tại F8 | by F8</title>
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
        <!-- all fixed but no database added yet -->
        <section class="bg-dashboard">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-2 col-lg-2 col-md-3 col-6">
                        <div class="rounded overflow-hidden sticky-bar">
                            <%@include file="/view/common/navbar.jsp"%>
                        </div>
                    </div>

                    <div class="col-xl-10 col-lg-10 col-md-9 mt-4 mt-sm-0">
                        <strong style="font-size: 25px">Khóa học</strong>
                        <p>Các khóa học được thiết kế phù hợp cho cả người mới, nhiều khóa học miễn phí, chất lượng, nội dung dễ hiểu.</p>
                        <br><br>
                        <div class="row">
                            <!-- show khoa hoc pro --> 
                            <br>
                            <div class="row">
                                <strong><a style="color: #000 ; font-size: 27px">Khóa học Pro</a><span class="badge bg-danger rounded-pill ms-1"><strong>New</strong></span></strong>
                                <div class="row row-cols-md-2 row-cols-lg-4">
                                    <!-- Courses -->
                                    <c:forEach items="${listCourse}" var="c">
                                        <c:if test="${c.getFeeStatus() != 0}">
                                            <div class="col mt-4">
                                                <div class="card team border-0 rounded overflow-hidden">
                                                    <div class="team-person position-relative overflow-hidden">
                                                        <img src="${c.getImage()}" class="img-fluid">
<!--                                                        <a href="courseDetail?CourseID=${c.getCourseID()}"></a>-->
                                                    </div>
                                                    <div>
                                                        <br/>
                                                        <a href="courseDetail?CourseID=${c.getCourseID()}" class="title text-dark h6 d-block mb-0">
                                                            ${c.getName()}
                                                        </a>
                                                        <small class="text-muted speciality">
                                                            <p style="color: orangered">
                                                                <script>
                                                                    var fee = ${c.getFeeStatus()};
                                                                    var formattedFee = (fee / 1).toLocaleString('en-US');
                                                                    document.write(formattedFee + 'đ');
                                                                </script>
                                                            </p>
                                                        </small>

<!--                                                        <a style="color: red;">check status dang ky = 1</a><br>          
                                                        <a href="videoLesson?LessonDetailID=1&CourseID=${c.getCourseID()}" class="title text-dark h6 d-block mb-0">
                                                            ${c.getName()} <i style="color: green;"><i class="uil uil-check-circle"></i></i>
                                                        </a>      -->
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            <!-- end show khoa hoc pro -->

                            <!-- show khoa hoc mien phi -->
                            <br>
                            <div class="row">
                                <div class="col-6">
                                    <strong><a style="color: #000 ; font-size: 27px">Khóa học miễn phí</a></strong>
                                </div>
                                <div class="row row-cols-md-2 row-cols-lg-4">
                                    <!-- Courses -->
                                    <c:forEach items="${listCourse}" var="c">
                                        <c:if test="${c.getFeeStatus() == 0}">
                                            <div class="col mt-4">
                                                <div class="card team border-0 rounded overflow-hidden">
                                                    <div class="team-person position-relative overflow-hidden">
                                                        <img src="${c.getImage()}" class="img-fluid">
<!--                                                        <a href="courseDetail?CourseID=${c.getCourseID()}"></a>-->
                                                    </div>
                                                    <div>
                                                        <br>
                                                        <a href="courseDetail?CourseID=${c.getCourseID()}" class="title text-dark h6 d-block mb-0">
                                                            ${c.getName()}
                                                        </a>
                                                        <br>
<!--                                                        <a style="color: red;">check status dang ky = 1</a><br>        
                                                        <a href="videoLesson?LessonDetailID=1&CourseID=${c.getCourseID()}" class="title text-dark h6 d-block mb-0">
                                                            ${c.getName()} <i style="color: green;"><i class="uil uil-check-circle"></i></i>
                                                        </a>-->
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            <!-- end show khao hoc mien phi -->
                        </div>
                        <br><br><br><!-- tam thoi -->

                        <div class="row">
                            <div class="col-4">
                                <br><br><br><br>
                                <strong><a style="color: #000 ; font-size: 27px">Bạn đang tìm kiếm lộ trình học cho người mới?</a></strong>
                                <p>Các khóa học được thiết kế phù hợp cho người mới, lộ trình học rõ ràng, nội dung dễ hiểu.</p>
                                <a href="programTraining" class="btn btn-pills btn-outline-dark"> Xem lộ trình </a>
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
                    <!-- end show khao hoc mien phi -->
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
