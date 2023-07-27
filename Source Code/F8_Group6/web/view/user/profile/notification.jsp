<%-- 
    Document   : notification
    Created on : Jun 10, 2023, 7:12:50 PM
    Author     : admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Thông báo</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="index.html" />
        <meta name="Version" content="v1.2.0" />
        <!-- F8logo -->
        <link rel="shortcut icon" href="assets/images/logoF8.png">
        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="assets/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- SLIDER -->
        <link href="assets/css/tiny-slider.css" rel="stylesheet" />
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

        <div class="page-wrapper doctris-theme toggled">
            <%@include file="/view/common/navbarSetting.jsp"%>
            <!-- sidebar-wrapper  -->

            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                        </div>

                        <div class="card bg-white rounded overflow-hidden mt-4 border-0">
                            <div class="row">
                                <div class="col-12">
                                    <div class="card border-0 rounded-0 p-4">            
                                        <div class="tab-content mt-2" id="pills-tabContent">                                            
                                            <div class="tab-pane fade show active" id="pills-overview" role="tabpanel" aria-labelledby="overview-tab">
                                                <h5 class="mb-1" style="font-family: inherit">Thông báo</h5>
                                                <p style="color: #000">
                                                    Thông tin về những khóa học mới nhất sẽ được thông báo đến với bạn. 
                                                    Cảm ơn bạn đã đồng hành cùng <a style="color: orangered" href="home"> F8 - Học lập trình để đi làm. </a>
                                                </p>
                                            </div><!--end teb pane-->
                                        </div><!--end tab content-->
                                    </div>
                                </div><!--end col-->
                            </div><!--end row-->
                        </div>
                    </div>
                </div><!--end container-->
                <!-- End -->
            </main>
            <!--End page-content" -->
        </div>
        <!-- page-wrapper -->

        <!-- javascript -->
        <script src="../../assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="../../assets/js/simplebar.min.js"></script>
        <!-- SLIDER -->
        <script src="../../assets/js/tiny-slider.js"></script>
        <script src="../../assets/js/tiny-slider-init.js"></script>
        <!-- Icons -->
        <script src="../../assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="../../assets/js/app.js"></script>    
    </body>
</html>







