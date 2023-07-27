<%-- 
    Document   : updatePro
    Created on : Jun 10, 2023, 8:01:24 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Thông tin cá nhân</title>
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
                                <div class="col-12 mt-4">
                                    <div class="card border-0 rounded-0 p-4">            
                                        <div class="tab-content mt-2" id="pills-tabContent">                                            
                                            <div class="tab-pane fade show active" id="pills-overview" role="tabpanel" aria-labelledby="overview-tab">
                                                <c:choose>
                                                    <c:when test="${customer != null}">
                                                        <h5 class="mb-1">Thông tin cá nhân</h5>
                                                    </c:when>
                                                    <c:when test="${admin != null}">
                                                        <h5 class="mb-1">Thông tin Admin</h5>
                                                    </c:when>
                                                    <c:when test="${expert != null}">
                                                        <h5 class="mb-1">Thông tin Expert</h5>
                                                    </c:when>
                                                    <c:when test="${sales != null}">
                                                        <h5 class="mb-1">Thông tin Saler</h5>
                                                    </c:when>
                                                    <c:when test="${marketing != null}">
                                                        <h5 class="mb-1">Thông tin Marketer</h5>
                                                    </c:when>
                                                </c:choose>
                                                <!-- Settings Details -->
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="rounded mt-4">
                                                            <div class="p-4">
                                                                <form action="updateProfile" method="POST" class="mt-4" enctype="multipart/form-data">
                                                                    <input hidden name="UserID" value="${user.getUserID()}" />
                                                                    <div class="row">
                                                                        <div class="col-md-12">
                                                                            <div class="mb-3">
<!--                                                                                <input name="Image" id="name" type="text" class="form-control" value="${user.getImage()}">-->
                                                                            </div>
                                                                        </div>

                                                                        <!-- avatar -->
                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Avatar</label>
                                                                                <img src="${user.getImage()}" class="avatar avatar-md-md rounded-pill mx-auto d-block" style="height: 150px; width: 150px;" alt="Avatar">
                                                                            </div>
                                                                        </div>
                                                                        <!-- end avatar -->

                                                                        <!-- BackgroundImage -->
                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Background Image</label>
                                                                                <img src="${user.getBackgroundImage()}" class="avatar avatar-md-md mx-auto d-block" style="height: 200px; width: 400px;" alt="Back Ground">
                                                                            </div>
                                                                        </div>
                                                                        <!-- End BackgroundImage -->
                                                                        
                                                                        <!-- upload avatar -->
                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <input name="Image" type="file" class="form-control" accept="image/*" required="">
                                                                            </div>
                                                                        </div>
                                                                        <!--end upload avatar -->

                                                                        <!-- upload BackgroundImage -->
                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <input name="BackgroundImage" type="file" class="form-control" accept="image/*" required="">
                                                                            </div>
                                                                        </div>
                                                                        <!-- end upload BackgroundImage -->

                                                                        <div class="col-md-12">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Bio</label>
                                                                                <textarea name="Bio" rows="4" class="form-control" placeholder="Bio">${user.getBio()}</textarea>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-md-12">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Họ tên</label>
                                                                                <input name="Name" id="name" type="text" class="form-control" value="${user.getFullName()}">
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-md-12">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Email</label>
                                                                                <input name="Email" id="email" type="email" class="form-control" value="${user.getEmail()}" placeholder="Chưa liên kết" readonly="">
                                                                            </div> 
                                                                        </div>

                                                                        <div class="col-md-12">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Số điện thoại</label>
                                                                                <input name="Phone" id="phone" type="text" class="form-control" value="${user.getPhone()}" placeholder="Chưa liên kết" readonly="">
                                                                            </div>                                                                               
                                                                        </div>
                                                                    </div>

                                                                    <p style="color: green">${param.messSuccess}</p>
                                                                    <div class="row">
                                                                        <div class="col-sm-12 d-flex justify-content-between">
                                                                            <input type="submit" id="submit" name="send" class="btn btn-soft-primary ms-2" value="Lưu thay đổi">
                                                                            <a href="updateProfile?UserID=${customer.getUserID()}" class="btn btn-soft-primary ms-2">Hủy</a>
                                                                        </div>
                                                                    </div>
                                                                </form>   

                                                                <form action="changePass" method="POST" class="mt-4">
                                                                    <input hidden name="UserID" value="${user.getUserID()}" />
                                                                    <br>
                                                                    <h5 class="mb-1">Mật khẩu</h5>
                                                                    <div>
                                                                        <div class="col-lg-12">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Mật khẩu hiện tại (mã hóa MD5)</label>
                                                                                <div class="input-group">
                                                                                    <input name="Password" id="currentPassword" type="password" class="form-control" value="${user.getPassword()}" readonly>
                                                                                    <button id="toggleCurrentPassword" class="btn btn-outline-secondary" type="button">Xem</button>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-lg-12">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Mật khẩu mới</label>
                                                                                <div class="input-group">
                                                                                    <input name="pass" id="newPassword" type="password" class="form-control" placeholder="Mật khẩu mới" required="" value="">
                                                                                    <button id="toggleNewPassword" class="btn btn-outline-secondary" type="button">Xem</button>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-lg-12">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Xác nhận mật khẩu mới</label>
                                                                                <div class="input-group">
                                                                                    <input name="re_pass" id="confirmPassword" type="password" class="form-control" placeholder="Xác nhận mật khẩu mới" required="" value="">
                                                                                    <button id="toggleConfirmPassword" class="btn btn-outline-secondary" type="button">Xem</button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <p style="color: red">${param.mess}</p>
                                                                    <p style="color: green">${param.messSuccess}</p>
                                                                    <div class="row">
                                                                        <div class="col-sm-12 d-flex justify-content-between">
                                                                            <input type="submit" id="submit" name="send" class="btn btn-soft-primary ms-2" value="Lưu thay đổi">
                                                                            <a href="changePass?UserID=${user.getUserID()}" class="btn btn-soft-primary ms-2">Hủy</a>
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- End Settings Details -->
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

        <script>
            // Mã JavaScript để thay đổi kiểu của trường input từ "password" thành "text"
            function togglePasswordVisibility(inputId, buttonId) {
                var toggleButton = document.getElementById(buttonId);
                var passwordInput = document.getElementById(inputId);

                toggleButton.addEventListener("click", function () {
                    if (passwordInput.type === "password") {
                        passwordInput.type = "text";
                        toggleButton.textContent = "Ẩn";
                    } else {
                        passwordInput.type = "password";
                        toggleButton.textContent = "Xem";
                    }
                });
            }

            togglePasswordVisibility("currentPassword", "toggleCurrentPassword");
            togglePasswordVisibility("newPassword", "toggleNewPassword");
            togglePasswordVisibility("confirmPassword", "toggleConfirmPassword");
        </script>
    </body>

</html>