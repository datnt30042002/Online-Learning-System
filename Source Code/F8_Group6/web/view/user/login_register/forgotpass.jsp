<%-- 
    Document   : forgotpass
    Created on : May 26, 2023, 7:25:14 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <meta name="website" content="https://shreethemes.in" />
        <meta name="Version" content="v1.2.0" />
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        <style>
            .toast-top-right {
                top: 90px !important;
                right: 30px;
            }
            .toast {
                font-size: 15px; /* Điều chỉnh font chữ theo ý muốn */
                display: flex; /* Sử dụng Flexbox */
                flex-direction: column; /* Đặt hướng chính là dọc */
                justify-content: center; /* Căn giữa theo chiều dọc */
                align-items: center; /* Căn giữa theo chiều ngang */
            }
        </style>
    </head>

    <body>
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

        <div class="back-to-home rounded d-none d-sm-block">
            <a href="home" class="btn btn-icon btn-primary"><i data-feather="home" class="icons"></i></a>
        </div>

        <!-- Hero Start -->
        <section class="bg-home d-flex bg-light align-items-center" style="background: url('assets/images/bg/f8_bg.png') center;">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5 col-md-8">

                        <div class="card login-page bg-white shadow mt-4 rounded border-0">
                            <div class="card-body">
                                <img style="border-radius: 25%;" src="assets/images/logoF8.png" height="50" class="mx-auto d-block" alt="">
                                <h4 class="text-center">Lấy lại mật khẩu</h4>  
                                <form class="login-form mt-4" action="forgotpassword" method="post">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <p class="text-muted">Vui lòng nhập địa chỉ email của bạn. Bạn sẽ nhận được một liên kết để tạo mật khẩu mới qua email.</p>
                                            <div class="mb-3">
                                                <label class="form-label">Email address <span class="text-danger">*</span></label>
                                                <input type="email" class="form-control" placeholder="Địa chỉ email" value="${email}" name="email" required="">
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="d-grid">
                                                <button type="submit" class="btn btn-primary">Gửi</button>
                                            </div>
                                        </div>

                                        <div class="col-12 text-center">
                                            <p class="mb-0 mt-3"><small class="text-dark me-2">Nhớ mật khẩu của bạn?</small> <a href="login" class="text-dark fw-bold">Đăng Nhập</a></p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div><!---->
                        <%-- Toast Success For ForgotPassword --%>
                        <script>
                            $(document).ready(function () {
                                var message = '${message}'; // Lấy giá trị từ biến message
                                if (message !== '') {
                                    // Hiển thị toast
                                    toastr.success(message, '', {
                                        timeOut: 4000,
                                        showMethod: 'slideDown', // Hiệu ứng trượt từ bên phải sang khi hiển thị
                                        hideMethod: 'slideUp'});
                                }
                            });
                        </script>
                        <%-- Toast Fail --%>
                        <script>
                            $(document).ready(function () {
                                var message = '${error}'; // Lấy giá trị từ biến message
                                if (message !== '') {
                                    // Hiển thị toast
                                    toastr.warning(message, '', {
                                        timeOut: 4000,
                                        showMethod: 'slideDown', // Hiệu ứng trượt từ bên phải sang khi hiển thị
                                        hideMethod: 'slideUp'});
                                }
                            });
                        </script>
                        <%-- Toast Fail Send Mail --%>
                        <script>
                            $(document).ready(function () {
                                var message = '${messageError}'; // Lấy giá trị từ biến message
                                if (message !== '') {
                                    // Hiển thị toast
                                    toastr.error(message, 'Hệ thống không gửi được email!', {
                                        timeOut: 4000,
                                        showMethod: 'slideDown', // Hiệu ứng trượt từ bên phải sang khi hiển thị
                                        hideMethod: 'slideUp'});
                                }
                            });
                        </script>
                    </div> <!--end col-->
                </div><!--end row-->
            </div> <!--end container-->
        </section><!--end section-->
        <!-- Hero End -->

        <!-- javascript -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <!-- Icons -->
        <script src="assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="assets/js/app.js"></script>

    </body>

</html>
