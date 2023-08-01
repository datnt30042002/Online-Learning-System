<%-- 
    Document   : addCourse
    Created on : Jun 10, 2023, 9:21:06 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>F8 - Học lập trình để đi làm</title>
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
        <!-- Select2 -->
        <link href="assets/css/select2.min.css" rel="stylesheet" />
        <!-- Icons -->
        <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

        <style>
            .list-inline-item:not(:last-child){
                margin-right:.5rem;
                margin-left: 280px;
            }

            .subcribe-form input{
                padding:12px 20px;
                width:470px;
                color:#343a40 !important;
                border:none;
                outline:none !important;
                padding-right:160px;
                padding-left:20px;
                background-color:rgba(255,255,255,0.8)
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

        <div class="page-wrapper doctris-theme">
            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                            <h4 style="color: orangered ; font-family: inherit">Thêm lộ trình mới</h4>
                                <h7 class="mb-0">
                                    <a href="ptmanager" style="color: darkblue">Quản lý danh sách lộ trình</a>
                                </h7>
                        </div>

                        <div class="row">
                            <div class="col-lg-12 mt-4">
                                <div class="card border-0 p-4 rounded shadow">
                                    <form action="addprogram" method="POST" enctype="multipart/form-data" class="mt-4">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Program ID</label>
                                                    <input readonly name="ProgramID" type="text" class="form-control" placeholder="Course ID" required="" >
                                                </div>
                                            </div><!--end col-->

                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Program Name</label>
                                                    <input name="Name" type="text" class="form-control" placeholder="Program Name" required="">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Program Image</label>
                                                    <input name="Image" type="file"  accept="image/png, image/jpeg" >
                                                </div>
                                            </div><!--end col-->
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Description</label>
                                                    <textarea name="Description" rows="4" class="form-control" placeholder="Description" required=""></textarea>
                                                </div>
                                            </div><!--end col-->
                                            <button type="submit" class="btn btn-primary">Thêm lộ trình mới</button>
                                        </div>
                                    </form>
                                </div><!--end col-->
                            </div><!--end row-->
                        </div>
                    </div><!--end container-->

                    <!-- Footer Start -->
                    <%@include file="/view/common/footer.jsp"%>
                    <!-- End -->
                    <!-- End -->
            </main>
            <!--End page-content" -->
        </div>
        <!-- page-wrapper -->
        <!-- javascript -->
        <script src="../../../assets/js/jquery.min.js"></script>
        <script src="../../../assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="../../../assets/js/simplebar.min.js"></script>
        <!-- Select2 -->
        <script src="../../../assets/js/select2.min.js"></script>
        <script src="../../../assets/js/select2.init.js"></script>
        <!-- Icons -->
        <script src="../../../assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="../../../assets/js/app.js"></script>

    </body>

</html>
