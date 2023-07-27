<%-- 
    Document   : updateLessonDetail
    Created on : Jul 6, 2023, 9:47:05 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Cập nhật bài giảng</title>
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
                                    <li class="breadcrumb-item"><h5 style="color: orangered ; font-family: inherit">Cập nhật bài giảng</h5></li>
                                </ul>
                            </nav>

                            <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                                <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="lessonDetailManager" style="color: darkblue">Lesson Detial Manager</a></li>
                                </ul>
                            </nav>
                        </div>

                        <div class="row">
                            <div class="col-lg-12 mt-4">
                                <div class="card border-0 p-4 rounded">
                                    <form action="updateLessonDetail" method="POST" class="mt-4" enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">ID</label>
                                                    <input hidden type="text" name="LessonDetailID" value="${lessonDetail.getLessonDetailID()}" class="form-control" readonly>
                                                </div>
                                            </div><!--end col-->

                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Title Name</label>
                                                    <input type="text" name="Title" value="${lessonDetail.getTitle()}" class="form-control" placeholder="Course Name" required="">
                                                </div>
                                            </div><!--end col-->

                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <video id="original-video" src="${lessonDetail.getVideo()}" style="height: 200px; width: 200px;" type="video/mp4" controls></video>
                                                </div>
                                            </div><!--end col-->

                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Video</label>
                                                    <input name="Video" id="video-input" type="file" class="form-control" accept="video/mp4" required="">
                                                </div>
                                            </div><!--end col-->

                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Preview</label>
                                                </div>
                                            </div><!--end col-->
                                            
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <video id="video-preview" style="height: 200px; width: 200px;" type="video/mp4" controls></video>
                                                </div>
                                            </div><!--end col-->

                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">time time</label>
                                                    <input id="time-input" type="text" name="Time" value="${lessonDetail.getTime()}" class="form-control" placeholder="Course Name" readonly>
                                                </div>
                                            </div><!--end col-->

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Note</label>
                                                    <input id="time-input" type="text" name="Note" value="${lessonDetail.getNote()}" class="form-control" placeholder="Course Name">
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Lesson_LessonID</label>
                                                    <input id="time-input" type="text" name="Lesson_LessonID" value="${lessonDetail.getLesson_LessonID()}" class="form-control" placeholder="Course Name" readonly="">
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Dicuss_DicussID</label>
                                                    <input id="time-input" type="text" name="Dicuss_DicussID" value="${lessonDetail.getDicuss_DicussID()}" class="form-control" placeholder="Course Name" readonly="">
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
            window.addEventListener('DOMContentLoaded', function () {
                var video = document.getElementById('original-video');
                video.addEventListener('loadedmetadata', function () {
                    var duration = video.duration;
                    var timeInput = document.getElementById('time-input');
                    var minutes = Math.floor(duration / 60);
                    var seconds = Math.floor(duration % 60);
                    var hours = Math.floor(minutes / 60);
                    minutes = minutes % 60;
                    var formattedTime = ('0' + hours).slice(-2) + ':' + ('0' + minutes).slice(-2) + ':' + ('0' + seconds).slice(-2);
                    timeInput.value = formattedTime;
                });
            });
        </script>

        <script>
            // Function to handle file input change event
            function handleFileInputChange() {
                var fileInput = document.getElementById('video-input');
                var videoPreview = document.getElementById('video-preview');

                if (fileInput.files && fileInput.files[0]) {
                    var fileReader = new FileReader();

                    fileReader.onload = function (e) {
                        videoPreview.src = e.target.result;
                    };

                    fileReader.readAsDataURL(fileInput.files[0]);
                }
            }

            // Attach file input change event handler
            var fileInput = document.getElementById('video-input');
            fileInput.addEventListener('change', handleFileInputChange);
        </script>

    </body>

</html>