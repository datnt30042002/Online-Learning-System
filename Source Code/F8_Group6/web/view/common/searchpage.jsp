<%-- 
    Document   : blog
    Created on : May 19, 2023, 10:05:52 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>
            Danh sách bài viết về lĩnh vực IT / CNTT / Phần mềm / lập trình tại F8
        </title>
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
        <!-- SLIDER -->
        <link rel="stylesheet" href="assets/css/tiny-slider.css"/>
        <!-- Css -->
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <style>
            .blog-detail-container {
                max-height: 100px; /* Đặt chiều cao tối đa của BlogDetail */
                overflow: hidden; /* Ẩn nội dung vượt quá */
            }
            .copy-success-alert {
                position: fixed;
                top: 80px;
                left: 50%;
                transform: translate(-50%, -50%);
                margin-top: 30px;
                padding: 8px 60px;
                background-color: #333333;
                color: whitesmoke;
                font-weight: 400;
                font-family: var(--bs-font-sans-serif);
                border-radius: 3px;
                opacity: 0;
                transition: opacity 0.3s;
            }
            .copy-success-alert.show {
                opacity: 1;
            }
            #inputContainer input[type="text"]:focus {
                outline: none; /* Loại bỏ viền khi trạng thái focus */
            }
            #inputContainer input[type="text"]::placeholder {
                font-size: 35px; /* Thay đổi kích thước chữ tại đây */
                font-weight: 500;
            }
            #inputContainer input[type="text"] {
                font-size: 40px; /* Kích thước chữ placeholder */
                caret-color: black; /* Màu con trỏ */
                padding: 5px; /* Khoảng cách từ con trỏ đến viền của ô nhập liệu */
                font-weight: 500;
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
        <%@include file="/view/common/header-back.jsp"%>

        <!-- End Hero -->

        <!-- Start -->
        <section class="bg-dashboard">         
            <div class="container-fluid">            
                <div class="row">
                    <div class="col-xl-2 col-lg-2 col-md-3 col-6">
                        <div class="rounded overflow-hidden sticky-bar">
                            <%@include file="/view/common/navbar.jsp"%>
                        </div>
                    </div>     
                    <div class="col-xl-7 col-lg-8 col-md-6 mt-4 mt-sm-0">
<!--                        <strong><a style="color: #000 ; font-size: 35px;">Kết quả tìm kiếm cho: ${name}</a></strong>-->
<!--                        <form action="searchPage" method="get">-->
                            <div id="inputContainer" style="width: 100%">
                                <input type="text" class="form-control" value="${name}" style="border-top: 0px; border-left: 0px;border-right: 0px; height: 60px" placeholder="Tìm kiếm...">
<!--                                <input type="submit" value="" style="display: none"/>-->
                            </div>
<!--                        </form>-->
                        <br><br><br>
                        <a href="#" class="link-secondary" id="BlogBorder" style="font-weight: bold; margin-left: 1px; ${page eq 'blog' ? 'border-bottom:2px solid ':''}" onclick="openPage('Blog', 'Course', 'BlogBorder', 'CourseBorder')">Bài viết</a>
                        <a href="#" class="link-secondary" id="CourseBorder" style="font-weight: bold; margin-left: 17px; ${page eq 'course' ? 'border-bottom:2px solid ':''}" onclick="openPage('Course', 'Blog', 'CourseBorder', 'BlogBorder')">Khóa học</a>
                        <hr>
                        <div class="col-lg-12">
                            <div class="col-lg-12">
                                <div id="Blog" class="w3-container-fluid"  style="${page eq 'blog' ? 'display:block':'display:none'}">
                                    <c:forEach var="b" items="${listBlog}">
                                        <div class=" rounded mb-4" style="width: 75%;border-bottom: 1px solid rgba(0,0,0,.079)">
                                            <div class="card blog blog-primary border-0">
                                                <div class="row">
                                                    <div class="col-lg-12" style="height: 50%;">
                                                        <a href="blogview?id=${b.getBlogID()}"><img style="width: 100%;height: 200px; margin-bottom: 20px;border: 1px white; border-radius: 20px" src="http://localhost:9999/F8_Group6/assets/images/blog/${b.getBlogImage()}"/></a>    
                                                        <div class="mt-2"><a href="blogview?id=${b.getBlogID()}" class="text-dark title h5" style="font-size: 22px; font-weight: 500">${b.getBlogTitle()}</a></div>
                                                        <div class="mt-2"><a href="blogview?id=${b.getBlogID()}" class="link-secondary" style="text-decoration: none;font-size: 15px;font-weight: 500">Đọc tiếp ...</a></div>
                                                        <div class="mb-4 mt-2" style="padding-top: 10px">
                                                            <i class="mdi mdi-heart me-1" style="color: #666; font-size: large"></i><span style="color:#666; font-size: 16px; font-weight: 500">${b.getLikes()}</span>
                                                            <span style="color:#666;float: right; font-size: 15px; font-weight: 500">${b.getComments()} bình luận</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <div class="row text-center mt-2 mb-3">
                                        <div class="col-12">
                                            <ul class="pagination justify-content-center mb-0 list-unstyled">
                                                <c:choose>
                                                    <c:when test="${indexBlog > 1}">
                                                        <li class="page-item"><a class="page-link" href="searchPage?indexBlog=${indexBlog - 1}&page=blog&name=${name}" aria-label="Previous">< Trang trước</a></li>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <li class="page-item disabled"><a class="page-link" href="#" aria-label="Previous">< Trang trước</a></li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <c:forEach begin="1" end="${totalPageBlog}" var="i">
                                                    <li class="page-item ${indexBlog == i ? 'active':''}" ><a class="page-link" href="searchPage?indexBlog=${i}&page=blog&name=${name}">${i}</a></li>
                                                    </c:forEach>   
                                                    <c:choose>
                                                        <c:when test="${indexBlog < totalPageBlog}">
                                                        <li class="page-item"><a class="page-link" href="searchPage?indexBlog=${indexBlog + 1}&page=blog&name=${name}" aria-label="Next">Trang sau ></a></li>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <li class="page-item disabled"><a class="page-link" href="#" aria-label="Next">Trang sau ></a></li>
                                                        </c:otherwise>
                                                    </c:choose>
                                            </ul><!--end pagination-->
                                        </div><!--end col-->
                                    </div>
                                </div>
                                <div id="Course" style="${page eq 'course' ? 'display:block':'display:none'}" style="display:none">
                                    <c:forEach var="c" items="${listCourse}">
                                        <div class="tiny-slide rounded mb-4">
                                            <div class="card blog blog-primary border-0">
                                                <div class="card-body p-1" style="padding: 0px;">
                                                    <div class="row">
                                                        <div class="col-lg-4">
                                                            <div class="text-lg-end">
                                                                <a href="courseDetail?CourseID=${c.getCourseID()}">
                                                                    <img style="width: 100%; height: 180px; border: 1px solid white; border-radius: 25px;" src="http://localhost:9999/F8_Group6/${c.getImage()}" alt="alt"/>   
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-8" style="margin-top: 30px;">                                                      
                                                            <a href="courseDetail?CourseID=${c.getCourseID()}" class="text-dark title h5" style="font-size: 23px; font-weight: 500">${c.getName()}</a>
                                                            <div class="blog-detail-container" style="margin-top: 10px">
                                                                <p style="color: #6c757d!important; font-weight: 300">${c.getCourseInfo()}</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <div class="row text-center mt-2 mb-3">
                                        <div class="col-12">
                                            <ul class="pagination justify-content-center mb-0 list-unstyled">
                                                <c:choose>
                                                    <c:when test="${indexCourse > 1}">
                                                        <li class="page-item"><a class="page-link" href="searchPage?indexCourse=${indexBlog - 1}&page=course&name=${name}" aria-label="Previous">< Trang trước</a></li>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <li class="page-item disabled"><a class="page-link" href="#" aria-label="Previous">< Trang trước</a></li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <c:forEach begin="1" end="${totalPageCourse}" var="i">
                                                    <li class="page-item ${indexCourse == i ? 'active':''}"><a class="page-link" href="searchPage?indexCourse=${i}&page=course&name=${name}">${i}</a></li>
                                                    </c:forEach>   
                                                    <c:choose>
                                                        <c:when test="${indexCourse < totalPageCourse}">
                                                        <li class="page-item"><a class="page-link" href="searchPage?indexCourse=${indexBlog + 1}&page=course&name=${name}" aria-label="Next">Trang sau ></a></li>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <li class="page-item disabled"><a class="page-link" href="#" aria-label="Next">Trang sau ></a></li>
                                                        </c:otherwise>
                                                    </c:choose>
                                            </ul><!--end pagination-->
                                        </div><!--end col-->
                                    </div>
                                </div>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->
                    <div class="col-xl-3 col-lg-2 col-md-3 col-6" style="margin-top: 170px; margin-left: 30px">
                        <div class="sidebar sticky-bar rounded shadow overflow-hidden">
                            <%@include file="/view/common/sidebar.jsp"%>
                            <div class="col-xl-1 col-lg-8 col-md-6 mt-4 mt-sm-0"></div>
                        </div>
                    </div>
                </div><!--end container-->
            </div>
        </section>
        <!-- Offcanvas End -->

        <!-- javascript -->
        <script src="https://kit.fontawesome.com/4ec0e85a31.js" crossorigin="anonymous"></script>
        <script src="../../../assets/js/bootstrap.bundle.min.js"></script>
        <!-- SLIDER -->
        <script src="../../../assets/js/tiny-slider.js"></script>
        <script src="../../../assets/js/tiny-slider-init.js"></script>
        <!-- Icons -->
        <script src="../../../assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="../../../assets/js/app.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.8/clipboard.min.js"></script>
        <script>
                            // Xu ly do dai cua blog details               
                            const detailContainers = document.querySelectorAll('.blog-detail-container');
                            detailContainers.forEach((container) => {
                                const detailText = container.querySelector('p').textContent;
                                const maxLength = 100; // Độ dài tối đa của đoạn văn bản
                                if (detailText.length > maxLength) {
                                    const truncatedText = detailText.substring(0, maxLength) + '...';
                                    container.querySelector('p').textContent = truncatedText;
                                }
                            });
                            //  Xu ly Open Page for Blog / Course
                            function openPage(Name, non, border, noneBorder) {
                                var i;
                                var x = document.getElementById(Name);
                                x.style.display = 'block';
                                document.getElementById(non).style.display = 'none';
                                document.getElementById(Name).style.display = "block";
                                document.getElementById(border).style.setProperty("border-bottom", "2px solid gray");

                                document.getElementById(noneBorder).style.setProperty("border-bottom", "none");
                            }
        </script>
    </body>
    <%@include file="/view/common/footer.jsp"%>
</html>
