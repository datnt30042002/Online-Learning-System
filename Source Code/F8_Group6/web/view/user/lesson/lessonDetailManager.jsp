<%-- 
    Document   : lessonDetailManager
    Created on : Jul 6, 2023, 9:46:35 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8" />
        <title>Quản lý bài học</title>
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

        <style>
            .confirm-delete-popup .swal2-modal {
                width: 400px;
                max-width: 80%;
            }

            .confirm-delete-popup .swal2-title {
                font-size: 20px;
                margin-bottom: 10px;
            }

            .confirm-delete-popup .swal2-content {
                font-size: 16px;
                margin-bottom: 20px;
            }

            .confirm-delete-popup .swal2-actions {
                display: flex;
                justify-content: center;
            }
        </style>

    </head>

    <body>
        <%@include file="/view/common/header-back.jsp"%>
        <div class="page-wrapper doctris-theme">
            <!-- Start Page Content -->
            <main class="page-content bg-light">                
                <div class="container-fluid">
                    <div class="layout-specing"><div class="card rounded border-0 mt-4 overflow-hidden">
                            <div class="card rounded border-0 mt-4 overflow-hidden">
                                <div class="card rounded border-0 mt-4 overflow-hidden">
                                    <div class="row g-1">
                                        <div class="col-xl-2 col-lg-3 col-md-4 col-12">
                                            <div class="card rounded-0 border-0 p-4">
                                                <!-- title -->
                                                <div class="d-md-flex justify-content-between">
                                                    <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                                                        <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                                            <li class="breadcrumb-item" style="width: 300px;"><a href="lessonDetailManager" style="color: #000;"><h5 class="mb-0" style="font-size: 25px;">Quản lý bài học</h5></a></li>
                                                        </ul>
                                                    </nav>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Search --> 
                                        <div class="header-bar d-flex justify-content-between border-bottom">
                                            <div class="d-flex align-items-center">
                                                <div class="tab-pane fade bg-white show active" id="inbox" role="tabpanel" aria-labelledby="inbox-tab">
                                                    <div class="search-bar p-0 d-none d-lg-block ms-2">
                                                        <label>Tìm kiếm</label>
                                                        <div id="search" class="menu-search mb-0" class="searchform">
                                                            <form method="get" action="searchLessonDetail" class="searchform">
                                                                <input type="text" name="txtSearchLessonDetail" class="form-control border rounded-pill" placeholder="Tìm kiếm tiêu đề bài học...">
                                                                <input type="submit" id="searchsubmit" value="Search">
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Search --> 

                                            <!-- Sort -->
                                            <div class="col-xl-4 col-lg-3 col-md-4 col-12 d-flex justify-content-end" style="margin-right: 2%; margin-bottom: 1%;">
                                                <form action="sortLessonDetail" method="post" class="d-flex">
                                                    <div class="me-2">
                                                        <label for="sortBy">Sắp xếp bởi</label>
                                                        <select name="sortBy" id="sortBy" class="form-select">
                                                            <option value="sortLessonDetail">Lựa chọn</option> ID
                                                            <option value="ID">STT</option>
                                                            <option value="Time">Thời lượng bài học</option>
                                                            <option value="Title">Tiêu đề bài học</option>
                                                        </select>
                                                    </div>
                                                    <div class="mt-2 mt-md-0">
                                                        <label for="sortOrder" class="me-2">Thứ tự</label>
                                                        <select name="sortOrder" id="sortOrder" class="form-select">
                                                            <option value="sortLessonDetail">Lựa chọn</option> 
                                                            <option value="asc">Tăng dần</option>
                                                            <option value="desc">Giảm dần</option>
                                                        </select>
                                                    </div>
                                                    <input type="submit" value="Sắp xếp" class="btn btn-danger ms-2 mt-auto">
                                                </form>
                                            </div>
                                            <!-- End Sort -->
                                        </div>

                                        <div class="card rounded border-0 mt-4 overflow-hidden">
                                            <div class="row g-1">
                                                <!-- Table -->
                                                <div class="col-xl-12 col-lg-3 col-md-4 col-12">
                                                    <div class="card rounded-0 border-0 p-4">
                                                        <div class="tab-pane fade bg-white show active" id="inbox" role="tabpanel" aria-labelledby="inbox-tab">
                                                            <div class="table-responsive bg-white rounded">
                                                                <div class="col-xl-12 d-flex justify-content-end">
                                                                    <a href="addLessonDetail" class="btn btn-outline-danger">Thêm bài học mới</a>
                                                                </div>
                                                                <table class="table table-center bg-white mb-0">
                                                                    <thead>
                                                                        <tr>
                                                                            <th class="border-bottom p-3" style="width: 10px;">STT</th>
                                                                            <th class="border-bottom p-3" style="width: 2400px;">Tiêu đề bài học</th>
                                                                            <th class="border-bottom p-3" style="width: 500px;">Thời lượng video bài học</th>
                                                                            <th class="border-bottom p-3" style="width: 10px;"></th>
                                                                        </tr>
                                                                    </thead>

                                                                    <c:choose>
                                                                        <c:when test="${empty listLessonDetailByPage}">
                                                                            <tr>
                                                                                <td colspan="7" style="color: red;">Không có thông tin về bài học này.</td>
                                                                            </tr>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <tbody>
                                                                                <c:forEach var="LessonDetailList" items="${listLessonDetailByPage}" varStatus="loop">
                                                                                    <tr>
                                                                                        <th class="p-3" id="stt_${loop.index + 1}"></th>
                                                                                        <!--<th class="p-3">${LessonDetailList.getLessonDetailID()}</th> <!-- user id -->
                                                                                        <td class="p-3">
                                                                                            <a href="updateLessonDetail?LessonDetailID=${LessonDetailList.getLessonDetailID()}" style="color: orangered;">${LessonDetailList.getTitle()}</a>
                                                                                        </td>
                                                                                        <td class="p-3">${LessonDetailList.getTime()} phút</td>
                                                                                        <td class="p-3">
                                                                                            <a href="deleteLessonDetail?LessonDetailID=${LessonDetailList.getLessonDetailID()}" onclick="return confirmDelete()" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a>
                                                                                        </td>
                                                                                    </tr>
                                                                                </c:forEach>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <%-- Hiển thị phân trang --%>
                                                            <div class="pagination justify-content-center">
                                                                <c:choose>
                                                                    <%-- Kiểm tra nếu currentPage > 1 thì hiển thị nút Previous --%>
                                                                    <c:when test="${currentPage > 1}">
                                                                        <a href="lessonDetailManager?page=${currentPage - 1}" class="btn btn-soft-dark page-link">< Trang trước</a>
                                                                    </c:when>
                                                                    <%-- Ngược lại, không hiển thị nút Previous --%>
                                                                    <c:otherwise>
                                                                        <span class="btn btn-soft-dark page-link disabled">< Trang trước </span>
                                                                    </c:otherwise>
                                                                </c:choose>

                                                                <%-- Hiển thị các trang --%>
                                                                <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                                                    <%-- Kiểm tra nếu là trang hiện tại thì đánh dấu là active --%>
                                                                    <c:choose>
                                                                        <c:when test="${currentPage == loop.index}">
                                                                            <a href="lessonDetailManager?page=${loop.index}" class="btn btn-soft-dark page-link active">${loop.index}</a>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <a href="lessonDetailManager?page=${loop.index}" class="btn btn-soft-dark page-link">${loop.index}</a>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:forEach>

                                                                <c:choose>
                                                                    <%-- Kiểm tra nếu currentPage < totalPages thì hiển thị nút Next --%>
                                                                    <c:when test="${currentPage < totalPages}">
                                                                        <a href="lessonDetailManager?page=${currentPage + 1}" class="btn btn-soft-dark page-link">Trang sau ></a>
                                                                    </c:when>
                                                                    <%-- Ngược lại, không hiển thị nút Next --%>
                                                                    <c:otherwise>
                                                                        <span class="btn btn-soft-dark disabled">Trang sau ></span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Table -->
                                            </div><!--end row-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!--end container-->
                        <!-- Footer Start -->
                        <br><br>
                        <%@include file="/view/common/footer.jsp"%>
                        <!-- End -->
                    </div>
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.20/dist/sweetalert2.all.min.js"></script>


        <script>
                                                                                        // Lấy tất cả các thẻ th có id bắt đầu bằng "stt_"
                                                                                        var sttElements = document.querySelectorAll("[id^='stt_']");

                                                                                        // Gán số thứ tự tăng dần cho từng thẻ th
                                                                                        for (var i = 0; i < sttElements.length; i++) {
                                                                                            sttElements[i].textContent = i + 1;
                                                                                        }

        </script>

        <script>
            function confirmDelete() {
                Swal.fire({
                    title: 'Xác nhận',
                    text: 'Có chắc chắn muốn xóa bài học này?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#dc3545',
                    cancelButtonColor: '#6c757d',
                    confirmButtonText: 'Xóa',
                    cancelButtonText: 'Hủy',
                    customClass: {
                        popup: 'confirm-delete-popup',
                    },
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Delete logic here
                        // You can redirect or perform any other action after deletion
                    }
                });
                // Prevent form submission
                return false;
            }
        </script>
    </body>
</html>
