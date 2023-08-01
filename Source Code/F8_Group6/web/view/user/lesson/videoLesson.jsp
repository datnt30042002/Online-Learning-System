<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : videoLesson
    Created on : Jul 5, 2023, 2:37:12 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8" />
        <title>${lessonDetail.getTitle()}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="index.html" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="assets/images/logoF8.png">
        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="assets/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

        <style>

            .Header_wrapper {
                height: 40px;
                align-items: center;
                background-color: #000; /*#29303b*/
                display: flex;
                justify-content: center;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                z-index: 10000;
            }

            .ActionBar_wrapper {
                align-items: center;
                background-color: #001123;
                height: 40px;
                display: flex;
                justify-content: center;
                position: fixed;
                left: 0;
                right: 0;
                bottom: 0;
                z-index: 1000;
            }
        </style>
    </head>

    <body>
        <div class="Header_wrapper"> 
            <div class="col-lg-7">
                <div class="logo">

                    <a href="javascript:history.back()" style="color: white;">
                        <i class="uil uil-angle-left"></i>
                    </a>
                    <a href="home">
                        <img style="border-radius: 25%; margin-top: 5px;" src="assets/images/logoF8.png" height="30" width="30" class="logo-light-mode" alt="F8 logo">
                    </a>

                    <strong style="color: white; font-size: 13px;">
                        ${CourseByID.getName()}
                    </strong>
                </div>
            </div>

            <div class="col-lg-2 d-flex align-items-center justify-content-end" style="color: white;"></div> <!--<a href="#" class="btn btn-outline-danger"> % </a> 7/11 bài học-->
            <div class="col-lg-1 d-flex align-items-center justify-content-end">
                <a href="#" style="color: orangered;">
                    Nhận chứng chỉ
                </a>
            </div>
            <div class="col-lg-1 d-flex align-items-center justify-content-end">
                <a href="#" style="color: white;">
                    <i class="uil uil-pen"></i> Ghi chú 
                </a>
            </div>
            <div class="col-lg-1 d-flex align-items-center justify-content-end"> 
                <a href="#" style="color: white;">
                    <i class="uil uil-question-circle"></i> Hướng dẫn
                </a>
            </div>
        </div>

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

        <div class="page-wrapper doctris-theme toggled">
            <!-- sidebar-wrapper -->
            <nav id="sidebar" class="sidebar-wrapper toggled">
                <div class="sidebar-content" data-simplebar style="height: calc(100% - 60px);">
                    <br><br>
                    <div class="sidebar-brand">
                        <strong>NỘI DUNG KHÓA HỌC</strong>
                    </div>
                    <ul class="sidebar-menu">
                        <li class="sidebar-dropdown">
                            <c:forEach items="${LessonList}" var="l">
                                <c:if test="${l.getCourse_CourseID() == CourseByID.getCourseID()}">
                                    <a href="javascript:void(0)">${l.getName()}</a>
                                    <div class="sidebar-submenu">
                                        <ul>
                                            <c:forEach items="${LessonDetailList}" var="c">
                                                <c:if test="${c.getLesson_LessonID() == l.getLessonID()}">
                                                    <li>
                                                        <strong><a href="videoLesson?LessonDetailID=${c.getLessonDetailID()}&CourseID=${CourseByID.getCourseID()}">${c.getTitle()} <br> ${c.getTime()} <i class="uil uil-play"></i> </a></strong>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </li>
                    </ul>
                    <!-- sidebar-menu  -->
                </div>
                <!-- Sidebar Footer -->
                <ul class="sidebar-footer list-unstyled mb-0">
                    <li class="list-inline-item mb-0 ms-1">
                        <a href="#" class="btn btn-icon btn-pills btn-soft-danger">
                            <i class="uil uil-comment"></i>
                        </a>
                    </li>
                </ul>
                <!-- Sidebar Footer -->
            </nav>
            <!-- sidebar-wrapper  -->

            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <div class="container-fluid">
                    <br><br>
                    <video style="display: flex; justify-content: center; width: 100%; height: 500px;" controls>
                        <source src="${lessonDetail.getVideo()}" type="video/mp4">
                    </video>

                    <br><br>
                    <div class="d-flex">
                        <div class="flex-1 overflow-hidden ms-3">
                            <div class="row">
                                <div class="col-lg-9">
                                    <h5 class="mb-0" style="font-size: 27px;">${lessonDetail.getTitle()}</h5>
                                </div>
                            </div>

                            <!--                            <h5 class="mb-0">Video Lesson LessonDetailID = 1</h5>-->
                            <input hidden name="LessonDetailID" value="${lessonDetail.getLessonDetailID()}" />
                            <br><br>
                            <p>Tham gia các cộng đồng để cùng học hỏi, chia sẻ và "thám thính" xem F8 sắp có gì mới nhé!</p>
                            <ul>
                                <li>Fanpage: <a style="color: orangered;" href="https://www.facebook.com/f8vnofficial" target="_blank" rel="noreferrer">https://www.facebook.com/f8vnofficial</a></li>
                                <li>Group: <a style="color: orangered;" href="https://www.facebook.com/groups/649972919142215" target="_blank" rel="noreferrer">https://www.facebook.com/groups/649972919142215</a></li>
                                <li>Youtube: <a style="color: orangered;" href="https://www.youtube.com/F8VNOfficial" target="_blank" rel="noreferrer">https://www.youtube.com/F8VNOfficial</a></li>
                                <li>Sơn Đặng: <a style="color: orangered;" href="https://www.facebook.com/sondnf8" target="_blank" rel="noreferrer">https://www.facebook.com/sondnf8</a></li>
                            </ul>
                        </div>
                    </div>
                </div><!--end container-->

                <!--                <div>
                                    Course ID da co:
                                    Course ID = ${CourseByID.getCourseID()}
                                    <br>
                                    Lesson có Course ID = 1: 
                                    <br>
                <c:forEach items="${LessonList}" var="l">
                    <c:if test="${l.getCourse_CourseID() == CourseByID.getCourseID()}">
                        <a style="font-size: 30px; color: red;">${l.getName()}</a><br>
                        <c:forEach items="${LessonDetailList}" var="c">
                            <c:if test="${c.getLesson_LessonID() == l.getLessonID()}">
                                <a>${c.getTitle()}</a><br>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </c:forEach>
            </div>-->

                <br><br>
                <!-- Footer Start -->
                <div class="d-flex align-items-center justify-content-end">
                    <strong class="btn btn-pills btn-light">
                        <a href="#" style="color: orangered;"> <i class="uil uil-comment"></i> Hoi dap </a>
                    </strong>
                </div>
                <p class="mb-0 text-muted" style="display: flex; justify-content: center;">Made with <i class="mdi mdi-heart text-danger"></i> . Powered by F8</p>
                <br><br>

                <!-- ActionBar_wrapper Start -->
                <div class="ActionBar_wrapper" style="color: white;">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4" style="display: flex; justify-content: center;">
                        <a id="btnPrev" href="videoLesson?LessonDetailID=${lessonDetail.getLessonDetailID() - 1}&CourseID=${CourseByID.getCourseID()}" class="btn btn-outline" style="color: white;"> <i class="uil uil-angle-left"></i> BÀI TRƯỚC </a>
                        <a id="btnNext" href="videoLesson?LessonDetailID=${lessonDetail.getLessonDetailID() + 1}&CourseID=${CourseByID.getCourseID()}" class="btn btn-outline-danger"> BÀI TIẾP THEO <i class="uil uil-angle-right"></i> </a>
                    </div>

                    <div class="col-lg-4">
                        <div class="col-auto ms-auto">
                            <div class="d-flex align-items-center justify-content-end"> <!-- Đặt justify-content-end để biểu tượng nằm bên phải -->
                                <a>${CourseByID.getName()}</a>
                                <a id="close-sidebar" class="btn btn-icon btn-pills btn-soft-danger ms-2" href="#">
                                    <i class="uil uil-bars"></i>
                                </a>
                            </div>
                        </div><!--end col-->
                    </div>
                </div>
                <!-- End -->
            </main>
            <!--End page-content" -->
        </div>

        <!-- javascript -->
        <script src="assets/libs/simplebar/simplebar.min.js"></script>
        <script src="assets/libs/apexcharts/apexcharts.min.js"></script>
        <script src="assets/js/admin-apexchart.init.js"></script>
        <script src="assets/libs/feather-icons/feather.min.js"></script>
        <!-- Main Js -->
        <!-- JAVASCRIPT -->
        <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/plugins.init.js"></script>
        <script src="assets/js/app.js"></script>

    </body>
</html>