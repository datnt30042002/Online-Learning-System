<%-- 
    Document   : addUser
    Created on : Jun 28, 2023, 9:42:13 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!Doctype html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="utf-8" />
        <title>Thông tin tài khoản</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 5 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="https://shreethemes.in" />
        <meta name="Version" content="v1.4.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="assets/images/logoF8.png">

        <!-- Css -->
        <link href="../../assets/libs/simplebar/simplebar.min.css" rel="stylesheet">
        <!-- Bootstrap Css -->
        <link href="../../assets/css/bootstrap.min.css" class="theme-opt" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="../../assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="../../assets/libs/remixicon/fonts/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="../../assets/libs/@iconscout/unicons/css/line.css" type="text/css" rel="stylesheet" />
        <!-- Style Css-->
        <link href="../../assets/css/style.min.css" class="theme-opt" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">


        <style>
            .uppercase {
                text-transform: uppercase;
            }
        </style>
    </head>

    <body>
        <%@include file="/view/common/header-back.jsp"%>
        <div class="page-wrapper doctris-theme">
            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Thông tin tài khoản</h5>
                        </div>

                        <div class="row">
                            <div class="col-lg-12 mt-4">
                                <div class="card border-0 p-4 rounded">
                                    <!-- khong duoc chinh sua thong tin ca nhan cua admin -->
                                    <form action="userDetail" method="POST" enctype="multipart/form-data" class="mt-4">
                                        <div class="row align-items-center">
                                            <h5 class="">Avatar</h5>
                                            <div class="col-lg-2 col-md-4">
                                                <img src="" class="avatar avatar-md-md rounded-pill mx-auto d-block" alt="Avatar">
                                            </div><!--end col-->

                                            <div class="col-md-12">
                                                <p class="text-muted mb-0">Ảnh đẹp kích thước tối thiểu 600px x 600px ở định dạng .jpg hoặc .png</p>
                                            </div><!--end col-->

                                            <div class="col-md-4">
                                                <input type="file" id="input-file" name="image" accept="image/*" onchange="handleChange()" hidden />
                                                <label class="btn btn-warning" for="input-file">Tải lên</label>
                                                <!--<a href="#" class="btn btn-warning">Tải lên</a>-->
                                                <a href="#" class="btn btn-soft-warning ms-2">Xóa ảnh</a>
                                            </div><!--end col-->
                                        </div><!--end row-->

                                        <br>
                                        <input hidden name="UserID" value="" />
                                        <div class="row">
                                            <h5 class="">Thông tin tài khoản</h5>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Họ Tên</label>
                                                    <input name="FullName" id="name" type="text" class="form-control" value="" required="" placeholder="Full Name" required="" <c:if test="${user.getUserRole_RoleID() == '1'}">disabled</c:if>>
                                                    </div>
                                                </div><!--end col-->

                                                <div class="col-md-6"></div><!--end col-->

                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label class="form-label">Địa chỉ Email</label>
                                                        <input name="Email" id="email" type="email" class="form-control" value="" required=""  placeholder="Your email" <c:if test="${user.getUserRole_RoleID() == '1'}">disabled</c:if>>
                                                    </div> 
                                                </div><!--end col-->

                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label class="form-label">Số điện thoại</label>
                                                        <input name="PhoneNumber" id="number" type="text" class="form-control" value="" placeholder="Chưa liên kết với số điện thoại" <c:if test="${user.getUserRole_RoleID() == '1'}">disabled</c:if>>
                                                    </div>                                                                               
                                                </div><!--end col-->

                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label class="form-label">Vai trò</label>
                                                        <select name="UserRole" class="form-select uppercase" required="" 
                                                        <c:if test="${user.getUserRole_RoleID() == '1'}">
                                                            disabled
                                                        </c:if>
                                                        >
                                                        <c:forEach var="role" items="${listUserRole}">
                                                            <option value="${role.getRoleID()}" 
                                                                    <c:if test="${role.getRoleID() == user.getUserRole_RoleID()}">
                                                                        selected
                                                                    </c:if>
                                                                    >${role.getName()}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Trạng thái</label>
                                                    <select name="Status" class="form-select uppercase" required="" <c:if test="${user.getUserRole_RoleID() == '1'}">disabled</c:if>>
                                                        <option value="1" style="color: green;" <c:if test="${user.getStatus() == 1}">selected</c:if>>Active</option>
                                                        <option value="0" style="color: red;" <c:if test="${user.getStatus() == 0}">selected</c:if>>Unactive</option>
                                                        </select>
                                                    </div>
                                                </div>

                                            </div><!--end row-->
                                            <button type="submit" class="btn btn-warning">Lưu thông tin</button>
                                            <button type="cancel" class="btn btn-soft-warning ms-2">Hủy</button>
                                        </form>
                                        <br>

                                        <!-- form password neu laadmin se bii an di khong duoc chinh sua -->
                                    <c:if test="${user.getUserRole_RoleID() != '1'}">
                                        <form action="pasworduser" method="POST" class="mt-4">
                                            <input hidden name="UserID" value="${user.getUserID()}" />
                                            <div class="row">
                                                <h5 class="">Mật khẩu</h5>
                                                <div>
                                                    <p hide id="toggleCurrentPassword"></p>
                                                    <div class="col-md-6"></div>
                                                    <div class="col-lg-6">
                                                        <div class="mb-3">
                                                            <label class="form-label">Mật khẩu mới</label>
                                                            <div class="input-group">
                                                                <input name="pass" id="newPassword" type="password" class="form-control" placeholder="Mật khẩu mới" required="" value="">
                                                                <button id="toggleNewPassword" class="btn btn-outline-secondary" type="button">Xem</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6"></div>
                                                    <div class="col-lg-6">
                                                        <div class="mb-3">
                                                            <label class="form-label">Xác nhận mật khẩu mới</label>
                                                            <div class="input-group">
                                                                <input name="re_pass" id="confirmPassword" type="password" class="form-control" placeholder="Xác nhận mật khẩu mới" required="" value="">
                                                                <button id="toggleConfirmPassword" class="btn btn-outline-secondary" type="button">Xem</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><!--end row-->
                                            <p style="color: red">${param.mess}</p>
                                            <p style="color: green">${param.messSuccess}</p>
                                            <button type="submit" class="btn btn-warning">Đổi mật khẩu</button>
                                            <button type="cancel" class="btn btn-soft-warning ms-2">Hủy</button>
                                        </form>
                                    </c:if>

                                </div>
                            </div><!--end col-->
                        </div><!--end row-->
                    </div>
                </div><!--end container-->
                <br><br>
                <!-- Footer Start -->
                <%@include file="/view/common/footer.jsp"%>
                <!--end footer-->
                <!-- End -->
            </main>
            <!--End page-content" -->
        </div>
        <!-- page-wrapper -->        
        <!-- javascript -->
        <script src="../../../assets/libs/simplebar/simplebar.min.js"></script>
        <script src="../../../assets/libs/feather-icons/feather.min.js"></script>
        <!-- Main Js -->
        <!-- JAVASCRIPT -->
        <script src="../../assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../../assets/js/plugins.init.js"></script>
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