<%-- 
    Document   : courseManagement
    Created on : Jun 10, 2023, 8:49:26 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Quản lý danh sách Blog</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="index.html" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="../../assets/images/logoF8.png">
        <!-- Bootstrap -->
        <link href="../../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="../../assets/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="../../assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="../../assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- SweetAlert2 CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.min.css">

        <!-- SweetAlert2 JS -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.min.js"></script>

        <!-- Css -->
        <link href="../../assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>
            function confirmDelete(blogId) {
                Swal.fire({
                    title: 'Xác nhận cấm',
                    text: 'Bạn có chắc là muốn cấm bài viết này ?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Xác Nhận',
                    cancelButtonText: 'Hủy'
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Gửi yêu cầu xóa bài viết bằng AJAX
                        $.ajax({
                            url: "blogmanager",
                            type: "POST",
                            data: {blogId: blogId},
                            success: function () {
                                // Xử lý thành công
                                Swal.fire('Thành Công!', 'Bài viết đã bị cấm').then(() => {
                                    location.reload();
                                });
                            },
                            error: function (xhr, status, error) {
                                // Xử lý lỗi
                                console.log("Lỗi cấm bài viết:", error);
                                Swal.fire('Cảnh báo!', 'Có lỗi xảy ra khi cấm bài viết', 'error');
                                // Hiển thị thông báo lỗi hoặc thực hiện các thao tác khác
                            }
                        });
                    }
                });
            }
        </script>


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
                            <h2 style="color: orangered ; font-family: inherit">Quản lý danh sách blog</h2>
                        </div>
                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="table-responsive shadow rounded">                             
                                    <table class="table table-center bg-white mb-0">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" >Blog ID</th>
                                                <th class="border-bottom p-3" >Blog Title</th>   
                                                <th class="border-bottom p-3" >Blog Image</th>
                                                <th class="border-bottom p-3" >Blog Detail</th>
                                                <th class="border-bottom p-3" >Post Date</th>
                                                <th class="border-bottom p-3" >User ID</th>                                             
                                            </tr>
                                        </thead>                                     
                                        <tbody>
                                            <c:forEach items="${listBlog}" var="c">
                                                <tr>                                                    
                                                    <td class="p-3">${c.getBlogID()}</td>
                                                    <td class="p-3">${c.getBlogTitle()}</td>
                                                    <td class="p-3"><img width="200px"
                                                                         height= "200px" src="assets/images/blog/${c.getBlogImage()}" alt"/></td>
                                                    <td class="p-3">${c.getBlogDetail()}</td>    
                                                    <td class="p-3"><fmt:formatDate value="${c.getPostDate()}" pattern="dd/MM/yyyy" /></td> 
                                                    <td class="p-3">${c.getUserID()}</td>                                                                                              
                                                    <td class="text-end p-3">
                                                        <a href="#" onclick="confirmDelete(${c.getBlogID()})" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-ban"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row text-center mt-2 mb-3">
                                <div class="col-12">
                                    <ul class="pagination justify-content-center mb-0 list-unstyled">
                                        <c:choose>
                                            <c:when test="${page > 1}">
                                                <li class="page-item">
                                                    <a class="page-link" href="blogmanager?page=${page - 1}" aria-label="Previous">&lt; Trang trước</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item disabled">
                                                    <a class="page-link" href="#" aria-label="Previous">&lt; Trang trước</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>

                                        <c:forEach begin="1" end="${totalPage}" var="i">
                                            <li class="page-item">
                                                <a class="page-link" href="blogmanager?page=${i}">${i}</a>
                                            </li>
                                        </c:forEach>   

                                        <c:choose>
                                            <c:when test="${page < totalPage}">
                                                <li class="page-item">
                                                    <a class="page-link" href="blogmanager?page=${page + 1}" aria-label="Next">Trang sau &gt;</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item disabled">
                                                    <a class="page-link" href="#" aria-label="Next">Trang sau &gt;</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </ul><!--end pagination-->

                                </div><!--end col-->
                            </div>
                        </div>

                    </div><!--end container-->
                </div>

                <!-- Footer Start -->
                <%@include file="/view/common/footer.jsp"%>
                <!-- End -->
            </main>
            <!--End page-content" -->
        </div>
        <!-- page-wrapper -->

        <!-- java script -->
        <script src="../../assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="../../assets/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="../../assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="../../assets/js/app.js"></script>

        <!-- tham khao chat gpt -->
        <script>
                                                            // Lấy tất cả các hàng trong bảng
                                                            var tableRows = document.getElementsByTagName('tr');

                                                            // Duyệt qua từng hàng (bỏ qua hàng đầu tiên vì nó chứa tiêu đề)
                                                            for (var i = 1; i < tableRows.length; i++) {
                                                                var row = tableRows[i];

                                                                // Lấy nội dung cột "Course Information"
                                                                var courseInfoCell = row.cells[3];
                                                                var courseInfo = courseInfoCell.innerText;

                                                                // Giới hạn độ dài của chuỗi "Course Information" thành 100 ký tự
                                                                var maxLength = 70;
                                                                if (courseInfo.length > maxLength) {
                                                                    courseInfo = courseInfo.substring(0, maxLength) + '...';
                                                                }

                                                                // Gán lại giá trị cho cột "Course Information"
                                                                courseInfoCell.innerText = courseInfo;
                                                                courseInfoCell.setAttribute("title", courseInfo);

                                                                // Lấy nội dung cột "Description"
                                                                var descriptionCell = row.cells[4];
                                                                var description = descriptionCell.innerText;

                                                                // Giới hạn độ dài của chuỗi "Description" thành 100 ký tự
                                                                if (description.length > maxLength) {
                                                                    description = description.substring(0, maxLength) + '...';
                                                                }

                                                                // Gán lại giá trị cho cột "Description"
                                                                descriptionCell.innerText = description;
                                                                descriptionCell.setAttribute("title", description);
                                                            }
        </script>     
    </body>
</html>