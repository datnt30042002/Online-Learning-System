<%-- 
    Document   : updateCourse
    Created on : Jun 10, 2023, 9:57:23 AM
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
                            <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                                <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                    <li class="breadcrumb-item"><h5 style="color: orangered ; font-family: inherit">Cập nhật thông tin khóa học</h5></li>
                                </ul>
                            </nav>
                            <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                                <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="course" style="color: darkblue">Quản lý danh sách khóa học</a></li>
                                </ul>
                            </nav>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 mt-4">
                                <div class="card border-0 p-4 rounded shadow">
                                    <form action="updateCourse" method="POST" class="mt-4">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Course ID</label>
                                                    <input type="text" name="id" value="${course.getCourseID()}" class="form-control" readonly>
                                                </div>
                                            </div><!--end col-->

                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Course Name</label>
                                                    <input type="text" name="name" value="${course.getName()}" class="form-control" placeholder="Course Name" required="">
                                                </div>
                                            </div><!--end col-->

                                            <!--                                            <div class="row align-items-center">
                                                                                            <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                                                                                <h5 class="">Course Image</h5>
                                                                                                <input name="Image" type="text" class="form-control" placeholder="Course Name" required="">
                                                                                                <p style="color: darkblue">For best results, use an image at least 600px by 600px in either .jpg or .png format</p>
                                                                                            </div>end col
                                                                                        </div>end row-->

                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Course Image</label>
                                                    <input type="text" name="image" value="${course.getImage()}" class="form-control" placeholder="Course Name" required="">
                                                </div>
                                            </div><!--end col-->

                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Course Information</label>
                                                    <textarea name="info" rows="4" class="form-control" placeholder="Course Information" required="">${course.getCourseInfo()}</textarea>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Description</label>
                                                    <textarea name="des" rows="4" class="form-control" placeholder="Description" required="">${course.getDescription()}</textarea>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Public Status</label>
                                                    <select name="status" class="form-control">
                                                        <option style="color: green;" value="1" ${course.getStatus() == 1 ? 'selected' : ''}>PUBLIC</option>
                                                        <option style="color: red;" value="0" ${course.getStatus() == 0 ? 'selected' : ''}>UN PUBLIC</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Category ID</label>
                                                    <select name="cid" class="form-control" required="">
                                                        <option style="color: orangered;" value="1" ${course.getCategory_CategoryID() == 1 ? 'selected' : ''}>FRONT END</option>
                                                        <option style="color: darkblue;" value="2" ${course.getCategory_CategoryID() == 2 ? 'selected' : ''}>BACK END</option>
                                                        <option style="color: green;" value="3" ${course.getCategory_CategoryID() == 3 ? 'selected' : ''}>BASIC</option>
                                                    </select>
                                                </div>
                                            </div><!--end col-->

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Fee Status</label>
                                                    <select name="fee" class="form-control">
                                                        <option style="color: orange;" value="1" ${course.getFeeStatus() == 1 ? 'selected' : ''}>FEE</option>
                                                        <option style="color: green;" value="0" ${course.getFeeStatus() == 0 ? 'selected' : ''}>FREE</option>
                                                    </select>
                                                </div>
                                            </div>


                                            <div class="col-md-6">${user.getFullName()}
                                                <div class="mb-3">
                                                    <label class="form-label">Admin Created</label>
                                                    <c:forEach items="${listUser}" var="user">
                                                        <c:if test="${user.getUserID() == course.getUser_UserID()}">
                                                            <input type="text" name="uid" hidden value="${course.getUser_UserID()}" placeholder="Admin Created" class="form-control" readonly="">
                                                            <input type="text" value="${user.getFullName()}" class="form-control" readonly="">
                                                        </c:if>
                                                    </c:forEach>     
                                                </div>
                                            </div><!--end col-->

                                            <p style="color: green">${param.messSuccess}</p>
                                            <button type="submit" class="btn btn-outline-success">Cập nhật</button>
                                        </div>
                                    </form>
                                </div><!--end col-->
                            </div><!--end row-->
                        </div>
                    </div><!--end container-->
                    <!-- End -->
                    <!-- Footer Start -->
                    <%@include file="/view/common/footer.jsp"%>
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