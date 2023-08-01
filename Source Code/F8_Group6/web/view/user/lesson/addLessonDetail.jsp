<%-- 
    Document   : addLessonDetail
    Created on : Jul 6, 2023, 9:46:54 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Thêm bài giảng mới</title>
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
                                    <li class="breadcrumb-item"><h5 style="color: orangered ; font-family: inherit">Thêm bài giảng mới</h5></li>
                                </ul>
                            </nav>
                            <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                                <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="lessonDetailManager" style="color: darkblue">Lesson Detail Manager</a></li>
                                </ul>
                            </nav>
                        </div>

                        <div class="row">
                            <div class="col-lg-12 mt-4">
                                <div class="card border-0 p-4 rounded">
                                    <form action="addLessonDetail" method="POST" class="mt-4" enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">LessonDetail ID</label>
                                                    <input id="lessonDetailID" name="LessonDetailID" type="text" class="form-control" placeholder="LessonDetail ID" readonly>
                                                </div>
                                            </div><!--end col-->

                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Title</label>
                                                    <input name="Title" type="text" class="form-control" placeholder="Title" required="">
                                                </div>
                                            </div><!--end col-->

                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Video</label>
                                                    <input name="Video" type="file" class="form-control" accept="video/mp4" required="" onchange="handleFileSelect(event)">
                                                </div>
                                            </div><!--end col-->

                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <h3>Preview Video:</h3>
                                                    <video id="preview-video" style="max-width: 500px;" controls></video>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Time</label>
                                                    <input id="time-input" type="text" name="Time" class="form-control" placeholder="Time" required="" readonly>
                                                </div>
                                            </div><!--end col-->

                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Note</label>
                                                    <textarea name="Note" rows="4" class="form-control" placeholder="Note"></textarea>
                                                </div>
                                            </div><!--end col-->

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Lesson_LessonID</label>
                                                    <textarea name="Lesson_LessonID" rows="4" class="form-control" placeholder="Lesson_LessonID" required=""></textarea>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Dicuss_DicussID</label>
                                                    <textarea name="Dicuss_DicussID" rows="4" class="form-control" placeholder="Dicuss_DicussID"></textarea>
                                                </div>
                                            </div>

                                            <p style="color: green">${messSuccess}</p> 
                                            <p style="color: red">${mess}</p>
                                            <button type="submit" class="btn btn-primary" onclick="generateLessonDetailID()">Add New Lesson Detail</button>
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

        <script>
                                                var lessonDetailID = 0;

                                                function generateLessonDetailID() {
                                                    var randomID = Math.floor(Math.random() * 100); // Tạo số ngẫu nhiên từ 0 đến 99
                                                    lessonDetailID++;
                                                    document.getElementById('lessonDetailID').value = randomID + lessonDetailID;
                                                }

                                                function handleFileSelect(event) {
                                                    var file = event.target.files[0];
                                                    var videoElement = document.getElementById('preview-video');
                                                    var videoURL = URL.createObjectURL(file);
                                                    videoElement.src = videoURL;

                                                    videoElement.addEventListener('loadedmetadata', function () {
                                                        var duration = videoElement.duration;
                                                        var timeInput = document.getElementById('time-input');
                                                        var minutes = Math.floor(duration / 60);
                                                        var seconds = Math.floor(duration % 60);
                                                        var hours = Math.floor(minutes / 60);
                                                        minutes = minutes % 60;
                                                        var formattedTime = ('0' + hours).slice(-2) + ':' + ('0' + minutes).slice(-2) + ':' + ('0' + seconds).slice(-2);
                                                        timeInput.value = formattedTime;
                                                    });
                                                }
        </script>

    </body>

</html>
