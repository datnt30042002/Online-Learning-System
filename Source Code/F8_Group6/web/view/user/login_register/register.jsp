<%-- 
    Document   : register
    Created on : May 19, 2023, 10:07:38 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Đăng ký tài khoản F8 - Học lập trình để đi làm</title>
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
                                <img src="assets/images/logoF8.png" style="border-radius: 25%;" height="50" class="mx-auto d-block" alt="">
                                <h4 class="text-center">Đăng ký tài khoản F8</h4>  
                                <span style="color:red;">${msgHave}</span>
                                <form action="register" class="login-form mt-4" method="post">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="mb-3">                                               
                                                <label class="form-label">Tên của bạn ? <span class="text-danger">*</span></label>
                                                <span style="color:red;">${msgName}</span>
                                                <input type="text" class="form-control" placeholder="Họ và tên của bạn" name="fullname" value="${param["fullname"]}">
                                            </div>
                                        </div>

                                        <div class="col-lg-12">
                                            <div class="d-flex justify-content-between">
                                                <div class="mb-3">
                                                    <label class="form-label mb-0">Email <span class="text-danger">*</span></label> 
                                                    <span style="color:red;">${msgEmail}</span>
                                                </div>
                                                <a href="register-phone" class="text-dark h6 mb-0">Đăng ký với SĐT</a>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="mb-3">
                                                <input type="email" class="form-control" placeholder="Địa chỉ email" name="email" value="${param["email"]}">
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Password <span class="text-danger">*</span></label>
                                                <span style="color:red;">${msgPass}</span>
                                                <input type="password" class="form-control" placeholder="Mật khẩu" name="password" value="${param["password"]}">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <div class="form-check">
                                                    <input class="form-check-input align-middle" type="checkbox" value="" id="accept-tnc-check">
                                                    <label class="form-check-label" for="accept-tnc-check">Tôi chấp nhận <a href="#" class="text-primary">Điều khoản và điều kiện</a></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="d-grid">
                                                <button class="btn btn-primary">Đăng Ký</button>
                                            </div>
                                        </div>

                                        <div class="col-lg-12 mt-3 text-center">
                                            <h6 class="text-muted">Hoặc</h6>
                                        </div><!--end col-->

                                        <div class="col-6 mt-3">
                                            <div class="d-grid">
                                                <a href="login-facebook" 
                                                   class="btn btn-soft-primary"><i class="uil uil-facebook"></i> Facebook</a>
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-6 mt-3">
                                            <div class="d-grid">
                                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&&redirect_uri=http://localhost:9999/F8_Group6/loginwithgoogle&response_type=code&client_id=474696467188-912h3an6csb4sen30chpstfou05t4o77.apps.googleusercontent.com&approval_prompt=force" 
                                                   class="btn btn-soft-primary"><i class="uil uil-google"></i> Google</a>
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-lg-12 mt-3 text-center">
                                            <h6 class="d-grid"><a href="https://github.com/login/oauth/authorize?client_id=7546e46ad9badbdb19fe&redirect_uri=http://localhost:9999/F8_Group6/login-github" 
                                                                  class="btn btn-soft-primary"
                                                                  style="width: 189.5px; margin: 0 auto;"><i class="uil uil-github"></i> Github</a></h6>
                                        </div><!--end col-->

                                        <div class="col-12 text-center">
                                            <p class="mb-0 mt-3"><small class="text-dark me-2">Bạn đã có tài khoản ?</small> <a href="login" class="text-dark fw-bold">Đăng Nhập</a></p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div><!---->
                        <%-- Toast Success For Register --%>
                        <script>
                            $(document).ready(function () {
                                var message = '${msgSuccess}'; // Lấy giá trị từ biến message
                                if (message !== '') {
                                    // Hiển thị toast
                                    toastr.success(message, '', {
                                        timeOut: 4000,
                                        showMethod: 'slideDown', // Hiệu ứng trượt từ bên phải sang khi hiển thị
                                        hideMethod: 'slideUp'
                                    });
                                    // Chuyển hướng sau khi ẩn toast
                                    setTimeout(function () {
                                        window.location.href = '/F8_Group6/verify?email=' + encodeURIComponent('${email}') + '&action=verify_register'; // Chuyen huong nguoi dung => trang verify 
                                    }, 5000); // Đợi 5 giây trước khi chuyển hướng (4s + 1s)
                                }
                            });
                        </script>
                        <%-- Toast Fail Name Empty--%>
                        <script>
                            $(document).ready(function () {
                                var message = '${msgName}'; // Lấy giá trị từ biến message
                                if (message !== '') {
                                    // Hiển thị toast
                                    toastr.warning(message, '', {
                                        timeOut: 4000,
                                        showMethod: 'slideDown', // Hiệu ứng trượt từ bên phải sang khi hiển thị
                                        hideMethod: 'slideUp'});
                                }
                            });
                        </script>
                        <%-- Toast Fail Email--%>
                        <script>
                            $(document).ready(function () {
                                var message = '${msgEmail}'; // Lấy giá trị từ biến message
                                if (message !== '') {
                                    // Hiển thị toast
                                    toastr.warning(message, '', {
                                        timeOut: 4000,
                                        showMethod: 'slideDown', // Hiệu ứng trượt từ bên phải sang khi hiển thị
                                        hideMethod: 'slideUp'});
                                }
                            });
                        </script>
                        <%-- Toast Fail Pass--%>
                        <script>
                            $(document).ready(function () {
                                var message = '${msgPass}'; // Lấy giá trị từ biến message
                                if (message !== '') {
                                    // Hiển thị toast
                                    toastr.warning(message, '', {
                                        timeOut: 4000,
                                        showMethod: 'slideDown', // Hiệu ứng trượt từ bên phải sang khi hiển thị
                                        hideMethod: 'slideUp'});
                                }
                            });
                        </script>
                        <%-- Toast Fail Email Existed--%>
                        <script>
                            $(document).ready(function () {
                                var message = '${msgHave}'; // Lấy giá trị từ biến message
                                if (message !== '') {
                                    // Hiển thị toast
                                    toastr.warning(message, '', {
                                        timeOut: 4000,
                                        showMethod: 'slideDown', // Hiệu ứng trượt từ bên phải sang khi hiển thị
                                        hideMethod: 'slideUp'});
                                }
                            });
                        </script>
                        <%-- Toast Success For Register But Send Mail Fail--%>
                        <script>
                            $(document).ready(function () {
                                var message = '${msgSuccessSendFail}'; // Lấy giá trị từ biến message
                                if (message !== '') {
                                    // Hiển thị toast
                                    toastr.success(message, '', {
                                        timeOut: 4000,
                                        showMethod: 'slideDown', // Hiệu ứng trượt từ bên phải sang khi hiển thị
                                        hideMethod: 'slideUp'});
                                }
                            });
                        </script>
                        <%-- Toast Fail Send Mail --%>
                        <script>
                            $(document).ready(function () {
                                var message = '${msgSendFail}'; // Lấy giá trị từ biến message
                                if (message !== '') {
                                    // Hiển thị toast
                                    toastr.error(message, 'Hệ thống không gửi được email!', {
                                        timeOut: 7000,
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