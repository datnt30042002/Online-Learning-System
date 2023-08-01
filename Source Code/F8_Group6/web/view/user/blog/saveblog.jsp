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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
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
            .toast-top-right {
                top: 90px !important;
                left: 40%;
            }
            .toast {
                width: 280px !important;
                height: 43px;
                font-size: 15px !important; /* Điều chỉnh font chữ theo ý muốn */
                display: flex; /* Sử dụng Flexbox */
                flex-direction: column; /* Đặt hướng chính là dọc */
                justify-content: center; /* Căn giữa theo chiều dọc */
                align-items: center; /* Căn giữa theo chiều ngang */
                color: whitesmoke !important;
                font-family: var(--bs-font-sans-serif) !important;
                background-color: black !important;
                font-weight: 400 !important;
                border-radius: 3px !important;
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

                        <strong><a style="color: #000 ; font-size: 35px;">Bài viết đã lưu</a></strong>
                        <br><br><br>
                        <a href="#" style="font-weight: bold; color: black">Bài viết (${list.size()})</a>
                        <hr>
                        <div class="col-lg-12 ">
                            <div class="col-lg-12">
                                <c:forEach var="b" items="${list}">
                                    <div class="tiny-slide rounded mb-4">
                                        <div class="card blog blog-primary border-0 shadow sidebar rounded overflow-hidden m-1">
                                            <div class="card-body p-4">
                                                <div class="row">
                                                    <div class="col-lg-8">
                                                        <ul class="list-unstyled mb-2">
                                                            <li class="list-inline-item text-muted small me-3">
                                                                <i class="uil uil-calendar-alt text-dark h6 me-1"></i>
                                                                <script>
                                                                    var postDate = new Date("${b.getPostDate()}");
                                                                    var day = postDate.getDate();
                                                                    var month = postDate.getMonth() + 1; //Js tháng được đánh số từ 0 đến 11
                                                                    var year = postDate.getFullYear();
                                                                    // Đảm bảo rằng ngày và tháng có định dạng 2 chữ số
                                                                    if (day < 10) {
                                                                        day = "0" + day;
                                                                    }
                                                                    if (month < 10) {
                                                                        month = "0" + month;
                                                                    }
                                                                    var formattedDate = day + "/" + month + "/" + year;
                                                                    document.write(formattedDate);
                                                                </script>
                                                            </li>
                                                            <li class="list-inline-item text-muted small">
                                                                <i class="uil uil-clock text-dark h6 me-1"></i>${b.getTimeToRead()} phút đọc
                                                            </li>
                                                        </ul>                                                       
                                                        <a href="blogview?id=${b.getBlogID()}" class="text-dark title h5" style="font-size: 23px; font-weight: bold">${b.getBlogTitle()}</a>
                                                        <br><br>
                                                        <div class="blog-detail-container">
                                                            <p style="color: #6c757d!important">${b.getBlogDetail()}</p>
                                                        </div>
                                                        <div class="post-meta d-flex justify-content-between mt-3">
                                                            <ul class="list-unstyled mb-0">
                                                                <li class="list-inline-item me-2 mb-0">
                                                                    <a href="userProfile?uid=${b.getUserID()}" class="text-dark title">
                                                                        <img style="max-width: 40px; border: 1px solid wheat; border-radius: 100px; margin-right: 5px; margin-left: 5px; margin-bottom: 5px" src="${b.getImage()}" alt="alt"/>
                                                                        <span style=" font-weight: 400;">Tác giả: </span>
                                                                        <span style=" font-weight: 400;">${b.getUserName()}</span>  
                                                                    </a>
                                                                </li>
                                                                <div class="widget mt-4">
                                                                    <div class="tagcloud">
                                                                        <a href="bloglist?topic=${b.getBlogTopicID()}" class="rounded ${b.getBlogTopicID() == topic ? 'active':''}">${b.getBlogTopicName()}</a>
                                                                        <a href="bloglist?tag=${b.getBlogTagID()}" class="rounded ${b.getBlogTagID() == tag ? 'active':''}">${b.getBlogTagName()}</a>                                                                 
                                                                    </div>
                                                                </div>

                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <div class="text-lg-end">
                                                            <ul class="list-unstyled mb-2">           
                                                                <li class="list-inline-item dropdown dropdown-primary">

                                                                    <c:if test="${list_save.contains(b.getBlogID())}">
                                                                        <a href="save-blog-action?id=${b.getBlogID()}&index=${index}&action=unsave&page=saveblog" class="text-muted bookmarked title">
                                                                            <i class="far fa-bookmark" id="bookMarkSave" style="color: #ff6600"></i>
                                                                        </a>&ensp;
                                                                    </c:if>
                                                                    <c:if test="${!list_save.contains(b.getBlogID())}">
                                                                        <a href="save-blog-action?id=${b.getBlogID()}&index=${index}&action=save&page=saveblog" class="text-muted bookmarked title">
                                                                            <i class="far fa-bookmark" id="bookMarkNotSave"></i>
                                                                        </a>&ensp;
                                                                    </c:if>

                                                                    <a href="#" class="text-muted title dropdown-toggle p-0"data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        <i class="fas fa-ellipsis-h"></i>
                                                                    </a>                                                                   
                                                                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                                                        <a class="dropdown-item text-dark" href="save-blog-action?id=${b.getBlogID()}&index=${index}&action=unsave&page=saveblog"> 
                                                                            <span class="mb-0 d-inline-block me-1">
                                                                                <i class="uil uil-trash-alt align-middle h6"></i>
                                                                            </span> Xóa khỏi mục đã lưu
                                                                        </a>
                                                                    </div>                       
                                                                </li>
                                                            </ul>  
                                                            <img style="max-width: 250px; height: 200px; border: 1px solid wheat; border-radius: 25px;" src="assets/images/blog/${b.getBlogImage()}" alt="alt"/>
                                                            <br><br>
                                                            <a href="blogview?id=${b.getBlogID()}" class="link-secondary">Đã lưu <span id="${b.getSave_day()}_publish"></span><i class="mdi mdi-chevron-right align-middle"></i></a>
                                                            <script>
                                                                // Lấy thời gian hiện tại
                                                                var currentTime = new Date();
                                                                var publishTime = new Date("${b.getSave_day()}");// Lấy thời gian được publish
                                                                var timeDiff = currentTime - publishTime;// Tính số milliseconds đã trôi qua

                                                                var minutesDiff = Math.floor(timeDiff / (1000 * 60));
                                                                var hoursDiff = Math.floor(timeDiff / (1000 * 60 * 60));
                                                                var daysDiff = Math.floor(timeDiff / (1000 * 60 * 60 * 24));
                                                                var monthsDiff = Math.floor(timeDiff / (1000 * 60 * 60 * 24 * 30));
                                                                var yearsDiff = Math.floor(timeDiff / (1000 * 60 * 60 * 24 * 365));

                                                                var timeAgo;
                                                                if (minutesDiff == 0) {
                                                                    timeAgo = "vài giây trước";
                                                                } else if (minutesDiff < 60) {
                                                                    timeAgo = minutesDiff + " phút trước";
                                                                } else if (hoursDiff < 24) {
                                                                    timeAgo = hoursDiff + " giờ trước";
                                                                } else if (daysDiff < 30) {
                                                                    timeAgo = daysDiff + " ngày trước";
                                                                } else if (monthsDiff < 12) {
                                                                    timeAgo = monthsDiff + " tháng trước";
                                                                } else {
                                                                    timeAgo = yearsDiff + " năm trước";
                                                                }
                                                                var publishSpan = document.getElementById("${b.getSave_day()}_publish");
                                                                publishSpan.textContent = timeAgo;
                                                            </script>
                                                        </div>
                                                        <div id="copySuccessAlert" class="copy-success-alert">Đã sao chép liên kết</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="row text-center mt-2 mb-3">
                                <div class="col-12">
                                    <ul class="pagination justify-content-center mb-0 list-unstyled">
                                        <c:choose>
                                            <c:when test="${index > 1}">
                                                <li class="page-item"><a class="page-link" href="save-blog-list?index=${index - 1}" aria-label="Previous">< Trang trước</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                <li class="page-item disabled"><a class="page-link" href="#" aria-label="Previous">< Trang trước</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:forEach begin="1" end="${totalPage}" var="i">
                                            <li class="page-item"><a class="page-link" href="save-blog-list?index=${i}">${i}</a></li>
                                            </c:forEach>   
                                            <c:choose>
                                                <c:when test="${index < totalPage}">
                                                <li class="page-item"><a class="page-link" href="save-blog-list?index=${index + 1}" aria-label="Next">Trang sau ></a></li>
                                                </c:when>
                                                <c:otherwise>
                                                <li class="page-item disabled"><a class="page-link" href="#" aria-label="Next">Trang sau ></a></li>
                                                </c:otherwise>
                                            </c:choose>
                                    </ul><!--end pagination-->
                                </div><!--end col-->
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->
                    <div class="col-xl-3 col-lg-4 col-md-6 mt-4 mt-md-0"> 
                        <br>
                        <div class=" border-0 sidebar sticky-bar rounded shadow overflow-hidden" style=" margin-top: 120px; margin-left: 15px">
                            <%@include file="/view/common/sidebar.jsp"%>
                            <div class="col-xl-1 col-lg-8 col-md-6 mt-4 mt-sm-0"></div>
                        </div>
                    </div><!--end col-->
                    <script>
                        $(document).ready(function () {
                            var message = '${toastMessage}'; // Lấy giá trị từ biến message
                            if (message !== '') {
                                // Hiển thị toast
                                toastr.info(message, '', {timeOut: 2000});
                            }
                        });
                    </script>
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
                                                                function deleteBlog(event, blogID) {
                                                                    event.preventDefault(); // Ngăn chặn hành vi mặc định của thẻ <a>

                                                                    // Hiển thị toast thông báo
                                                                    toastr.success('Bài viết đã được xóa thành công!');

                                                                    // Thực hiện chuyển hướng tới đường dẫn
                                                                    setTimeout(function () {
                                                                        window.location.href = `save-blog-action?id=${blogID}&action=unsave`;
                                                                    }, 2000); // Chuyển hướng sau 2 giây (có thể điều chỉnh thời gian)
                                                                }

//                                                                    function sendData(action, id) {
//                                                                        var xhr = new XMLHttpRequest();
//                                                                        var url = "save-blog-action";
//
//
//                                                                        url += "?action=" + encodeURIComponent(action) + "&id=" + encodeURIComponent(id);
//
//                                                                        xhr.open("GET", url, true);
//
//                                                                        xhr.onreadystatechange = function () {
//                                                                            if (xhr.readyState === 4 && xhr.status === 200) {
//                                                                                if (action === 'unsave')
//                                                                                    document.getElementById("bookMarkSave").style.color = "white";
//                                                                                else
//                                                                                    document.getElementById("bookMarkNotSave").style.color = "yellow";
//                                                                            }
//                                                                        };
//
//                                                                        xhr.send();
//                                                                    }
//                                                                    ;

        </script>
    </body>
    <%@include file="/view/common/footer.jsp"%>
</html>
