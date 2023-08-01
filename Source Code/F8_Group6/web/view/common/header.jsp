<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 
    Document   : header
    Created on : May 19, 2023, 9:47:01 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <title>F8 - Học Lập Trình Để Đi Làm | F8 trên Youtube | F8 trên Facebook</title>
    <!-- F8logo -->
    <link rel="shortcut icon" href="assets/images/logoF8.png">
    <!-- Bootstrap -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Icons -->
    <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
    <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
    <!-- Css -->
    <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
    <!-- Bootstrap -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- SLIDER -->
    <link rel="stylesheet" href="assets/css/tiny-slider.css"/>
    <!-- Icons -->
    <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
    <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
    <style>
        .list-inline-item:not(:last-child){
            margin-right:.5rem;
            margin-left: 245px;
        }

        .subcribe-form {
            position: fixed;
            top: 22px;
            left: 50%;
            transform: translate(-50%, -50%);
            margin-top: 30px;
        }

        .list-search{
            margin-left: 10px;
        }

        .all-list-search {
            position: absolute;
            top: 97%;
            left: 50%;
            transform: translateX(-50%);
            width: 480px;
            background-color: #fff;
            border: 0.5px solid #f0f0f0;
            border-radius: 10px;
            padding: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            z-index: 9999;
        }

        .item-search {
            margin:0px 25px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }


        .input-group {
            position: relative;
        }

        .input-group .search-icon {
            position: absolute;
            top: 50%;
            left: 10px;
            transform: translateY(-50%);
            color: #333333;
            cursor: pointer;
            transition: opacity 0.3s ease;
        }

        .input-group input[type="text"] {
            padding-left: 30px;
        }

        .input-group input[type="text"]::placeholder {
            font-size: 14px; /* Kích thước chữ trong placeholder */
            color: gray; /* Màu chữ trong placeholder */
            font-weight: 300;
        }

        .input-group input[type="text"] {
            padding-left: 40px;
        }

    </style>
</head>

<body>
    <!-- Header -->
    <header id="topnav" class="defaultscroll sticky">
        <div class="container-fluid">
            <!-- Logo  -->
            <a class="logo" href="home">
                <img style="border-radius: 25%;" src="assets/images/logoF8.png" height="50" width="50" class="logo-light-mode" alt="F8 logo">
                <strong style="color: #000"><strong style="font-size: 13px">Học lập trình để đi làm</strong></strong>
            </a>  
            <!-- Logo End-->
            <!-- Search -->
            <li class="list-inline-item mb-0">
                <div class="subcribe-form mt-4">

                    <div class="mb-0">
                        <div class="input-group">
                            <i data-feather="search" class="search-icon fea icon-m-sm"> </i>
                            <!-- Ô nhập liệu để nhập từ khóa tìm kiếm, gọi hàm showDropdown() khi người dùng nhập dữ liệu -->
                            <input type="text" id="searchInput" onkeyup="showDropdown()" name="id" class="form-control border rounded-pill" required="" style="font-size: 12px; width: 450px;" placeholder="Tìm kiếm khóa học, bài viết, video, ...">
                        </div>
                    </div>

                </div>
                <div class="all-list-search pb-2" style="display: none;" id="form-search">
                    <!-- Dùng để hiển thị thông báo không có kết quả tìm kiếm -->
                    <div id="noResultsMessage" style="display: none; color: gray; margin-left: 25px; padding-top: 10px; font-weight: 300">
                        <i data-feather="search" class="fea icon-sm" style="font-weight: bold; margin-bottom: 6px; margin-right: 3px"> </i>  
                        Không có kết quả cho '<span id="span-searchno"></span>'
                    </div>
                    <!-- Dùng để hiển thị thông báo kết quả tìm kiếm -->
                    <div id="ResultsMessage" class="mt-1" style="color: gray; margin-left: 25px; padding-top: 10px; font-weight: 300">
                        <i data-feather="search" class="fea icon-sm" style="font-weight: bold; margin-bottom: 6px; margin-right: 3px"> </i>  
                        Kết quả cho '<span id="span-search"></span>' 
                    </div>
                    <!-- Dùng để hiển thị kết quả tìm kiếm của bài viết -->
                    <div id="blogtittle-dropdown" class="mt-3 item-search mb-2" style="border-bottom: 1px solid #cccccc ; padding-bottom: 5px;">
                        <span style="font-size: 16px; font-weight: 500">BÀI VIẾT</span>
                        <span style="float: right; margin-right: 5px; font-weight: 300; font-size: 15px"><a id="searchByBlog" class="link-secondary">Xem thêm</a></span>
                    </div>
                    <div id="blogs" class="mb-2"></div>
                    <!-- Dùng để hiển thị kết quả tìm kiếm của khóa học -->
                    <div id="coursetittle-dropdown" class="mt-3 item-search mb-2" style="border-bottom: 1px solid #cccccc ; padding-bottom: 5px;">
                        <span style="font-size: 16px; font-weight: 500">KHÓA HỌC</span>
                        <span style="float: right; margin-right: 5px; font-weight: 300; font-size: 15px"><a id="searchByCourse" class="link-secondary" style="">Xem thêm</a></span>
                    </div>
                    <div id="courses" class=""></div>
                </div>
            </li>
            <script>
                // Hàm thực hiện khi người dùng nhập từ khóa tìm kiếm vào ô nhập liệu
                function showDropdown() {
                    var input = document.getElementById("searchInput").value;
                    // Cập nhật link "Xem thêm" của bài viết và khóa học dựa trên từ khóa tìm kiếm
                    document.getElementById('searchByBlog').href = 'searchPage?name=' + input + '&page=blog';
                    document.getElementById('searchByCourse').href = 'searchPage?name=' + input + '&page=course';
                    if (input.length > 0) {
                        // Hiển thị form kết quả tìm kiếm nếu có từ khóa tìm kiếm được nhập vào
                        document.getElementById("form-search").style.display = "block";
                        document.getElementById("span-search").textContent = input;
                        document.getElementById("span-searchno").textContent = input;

                        var url = 'http://localhost:9999/F8_Group6/search?search=' + encodeURIComponent(input);
                        console.log(2);
                        // Sử dụng Fetch API để gửi yêu cầu tìm kiếm từ khóa đến backend
                        fetch(url)
                                .then(response => response.json()) 
                                .then(data => {
                                    // Dữ liệu JSON trả về được lưu trong biến 'data'
                                    // Khoi tao các phần tử cần hiển thị kết quả tìm kiếm
                                    var listBlog = document.getElementById("blogs");
                                    listBlog.innerHTML = "";
                                    var listCourse = document.getElementById("courses");
                                    listCourse.innerHTML = "";
                                    var blogTittleDropdown = document.getElementById("blogtittle-dropdown");
                                    var courseTitleDropdown = document.getElementById("coursetittle-dropdown");
                                    var noResultsMessage = document.getElementById("noResultsMessage");
                                    var ResultsMessage = document.getElementById("ResultsMessage");

                                    // Check data Blog&Course => Hien thi logic
                                    if (data.blogs.length === 0 && data.courses.length === 0) {
                                        blogTittleDropdown.style.display = "none";
                                        courseTitleDropdown.style.display = "none";
                                        noResultsMessage.style.display = "block";
                                        ResultsMessage.style.display = "none";
                                    } else {
                                        noResultsMessage.style.display = "none";
                                        ResultsMessage.style.display = "block";
                                        if (data.blogs.length > 0) {
                                            blogTittleDropdown.style.display = "block";
                                            listBlog.style.display = "block";
                                            listBlog.innerHTML = "";
                                            // Hiển thị kết quả tìm kiếm của bài viết (blogs)
                                            for (var i = 0; i < data.blogs.length; i++) {
                                                if (i < 4) {
                                                    var item = document.createElement("div");
                                                    var link = document.createElement("a"); // Tạo phần tử <a> bao bọc cả ảnh và title
                                                    link.href = 'http://localhost:9999/F8_Group6/blogview?id=' + data.blogs[i].id; // Link => blogView
                                                    link.style.setProperty("display", "flex"); // Đảm bảo các phần tử bên trong nằm trên cùng một dòng
                                                    link.style.setProperty("align-items", "center"); // Căn giữa các phần tử bên trong

                                                    var image = document.createElement("img");
                                                    var imageURL = 'http://localhost:9999/F8_Group6/assets/images/blog/' + data.blogs[i].image + '?timestamp=' + Date.now();
                                                    image.src = imageURL;
                                                    image.style.setProperty("margin-left", "25px");
                                                    image.style.setProperty("height", "35px");
                                                    image.style.setProperty("width", "35px");
                                                    image.style.setProperty("border-radius", "50%");
                                                    image.style.setProperty("margin-bottom", "7px");
                                                    image.style.setProperty("margin-top", "7px");
                                                    link.appendChild(image);
                                                    console.log(data.blogs[i].image);

                                                    var text = document.createElement("a");
                                                    text.textContent = data.blogs[i].title;
                                                    text.style.setProperty("margin-left", "10px");
                                                    text.style.setProperty("color", "black");
                                                    text.style.setProperty("font-weight", "400");
                                                    text.style.setProperty("font-size", "14px");
                                                    link.appendChild(text);
                                                    console.log(data.blogs[i].title);
                                                    item.appendChild(link);
                                                    listBlog.appendChild(item);
                                                }
                                            }
                                        } else {
                                            // Nếu không có kết quả tìm kiếm của (blogs), ẩn phần kết quả tìm kiếm của bài viết
                                            listBlog.style.display = "none";
                                            blogTittleDropdown.style.display = "none";
                                        }

                                        if (data.courses.length > 0) {
                                            listCourse.style.display = "block";
                                            listCourse.innerHTML = "";
                                            courseTitleDropdown.style.display = "block";
                                            // Hiển thị kết quả tìm kiếm của (courses)
                                            for (var i = 0; i < data.courses.length; i++) {
                                                if (i < 4) {
                                                    var item = document.createElement("div");
                                                    var link = document.createElement("a"); // Tạo phần tử <a> bao bọc cả ảnh và title
                                                    link.href = 'http://localhost:9999/F8_Group6/courseDetail?CourseID=' + data.courses[i].id; // Link => courseView
                                                    link.style.setProperty("display", "flex"); // Đảm bảo các phần tử bên trong nằm trên cùng một dòng
                                                    link.style.setProperty("align-items", "center"); // Căn giữa các phần tử bên trong

                                                    var image = document.createElement("img");
                                                    var imageURL = 'http://localhost:9999/F8_Group6/' + data.courses[i].image + '?timestamp=' + Date.now();
                                                    image.src = imageURL;
                                                    image.style.setProperty("margin-left", "25px");
                                                    image.style.setProperty("height", "35px");
                                                    image.style.setProperty("width", "35px");
                                                    image.style.setProperty("border-radius", "50%");
                                                    image.style.setProperty("margin-bottom", "7px");
                                                    image.style.setProperty("margin-top", "7px");
                                                    link.appendChild(image);
                                                    console.log(data.courses[i].image);

                                                    var text = document.createElement("a");
                                                    text.textContent = data.courses[i].name;
                                                    text.style.setProperty("margin-left", "10px");
                                                    text.style.setProperty("color", "black");
                                                    text.style.setProperty("font-weight", "400");
                                                    text.style.setProperty("font-size", "14px");
                                                    link.appendChild(text);
                                                    console.log(data.courses[i].title);
                                                    item.appendChild(link);
                                                    listCourse.appendChild(item);
                                                }
                                            }
                                        } else {
                                            // Nếu không có kết quả tìm kiếm của (courses), ẩn phần kết quả tìm kiếm của khóa học
                                            listCourse.style.display = "none";
                                            courseTitleDropdown.style.display = "none";
                                        }
                                    }
                                })
                                .catch(error => console.log(error));
                    } else {
                        // Nếu không có từ khóa tìm kiếm, ẩn form kết quả tìm kiếm
                        document.getElementById("form-search").style.display = "none";
                    }
                }
            </script>

            <!-- End Search -->

            <!-- Login Home Page Function -->
            <!-- My Course -->

            <ul class="dropdowns list-inline mb-0">
                <c:if test="${customer != null || admin != null || sales != null || expert != null || marketing != null}">
                    <!-- F8 Newfeed -->
                    <li class="list-inline-item mb-0">
                        <a href="javascript:void(0)" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                            <div><img src="assets/images/header/loa.jpg" class="avatar avatar-ex-small rounded-circle" alt="F8 Newfeed"></div>
                        </a>
                    </li>
                    <!-- End My Course -->

                    <!-- Notification -->
                    <li class="list-inline-item mb-0 ms-1">
                        <div class="dropdown dropdown-primary">
                            <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="assets/images/header/chuong.png" class="avatar avatar-ex-small rounded-circle" height="500px" alt="Notification"></button>
                            <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                <a class="dropdown-item d-flex align-items-center text-dark">

                                    <div class="flex-1 ms-2">
                                        <span class="d-block mb-1" style="color: #000">Thông báo</span>
                                        <small style="color: orangered">đến từ F8</small>
                                        <div class="dropdown-divider border-top"></div>
                                    </div>
                                </a>

                                <!-- dong 87 -->
                                <a class="dropdown-item text-dark" href="#"><span class="mb-0 d-inline-block me-1"></span>Kiến Thức Nhập Môn IT</a>
                                <a class="dropdown-item text-dark" href="#"><span class="mb-0 d-inline-block me-1"></span>Xây Dựng Website với ReactJS</a>
                                <a class="dropdown-item text-dark" href="#"><span class="mb-0 d-inline-block me-1"></span>Node & ExpressJS</a>
                            </div>
                        </div>
                    </li>
                </c:if>
                <!-- End Notification -->


                <!-- Profile -->
                <c:choose>
                    <c:when test="${customer != null}">
                        <li class="list-inline-item mb-0 ms-1">
                            <div class="dropdown dropdown-primary">
                                <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="${customer.getImage()}" class="avatar avatar-ex-small rounded-circle" alt="button"></button>
                                <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                    <a class="dropdown-item d-flex align-items-center text-dark" href="userProfile?uid=${sessionScope.customer.getUserID()}">
                                        <img src="${customer.getImage()}" class="avatar avatar-md-sm rounded-circle border shadow" alt="avatar">
                                        <div class="flex-1 ms-2">
                                            <span class="d-block mb-1">${customer.getFullName()}</span>
                                            <small style="color: orangered">${customer.getUserRole().getName()}</small>
                                        </div>
                                    </a>
                                    <a class="dropdown-item text-dark" href="userProfile?uid=${sessionScope.customer.getUserID()}"><span class="mb-0 d-inline-block me-1"></span>Trang cá nhân</a>
                                    <div class="dropdown-divider border-top"></div>
                                    <a class="dropdown-item text-dark" href="myCourse"><span class="mb-0 d-inline-block me-1"></span>Khóa học của tôi</a>
                                    <div class="dropdown-divider border-top"></div>    
                                    <a class="dropdown-item text-dark" href="save-blog-list"><span class="mb-0 d-inline-block me-1"></span>Bài viết đã lưu</a>
                                    <div class="dropdown-divider border-top"></div>
                                    <a class="dropdown-item text-dark" href="updateProfile?UserID=${sessionScope.customer.getUserID()}"><span class="mb-0 d-inline-block me-1"></span>Cài đặt</a>
                                    <a class="dropdown-item text-dark" href="login"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span>Đăng xuất</a>                     
                                </div>
                            </div>
                        </li>
                    </c:when>

                    <c:when test="${admin != null}">
                        <li class="list-inline-item mb-0 ms-1">
                            <div class="dropdown dropdown-primary">
                                <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="${admin.getImage()}" class="avatar avatar-ex-small rounded-circle" alt="button"></button>
                                <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                    <a class="dropdown-item d-flex align-items-center text-dark" href="#">
                                        <img src="${admin.getImage()}" class="avatar avatar-md-sm rounded-circle border shadow" alt="avatar">
                                        <div class="flex-1 ms-2">
                                            <span class="d-block mb-1">${admin.getFullName()}</span>
                                            <small style="color: orangered">${admin.getUserRole().getName()}</small>
                                        </div>
                                    </a>
                                    <a class="dropdown-item text-dark" href="userProfile?uid=${sessionScope.admin.getUserID()}"><span class="mb-0 d-inline-block me-1"></span>Trang cá nhân</a>
                                    <div class="dropdown-divider border-top"></div>
                                    <a class="dropdown-item text-dark" href="blogmanager"><span class="mb-0 d-inline-block me-1"></i></span>Quản lý bài viết</a>
                                    <a class="dropdown-item text-dark" href="userManager"><span class="mb-0 d-inline-block me-1"></span>Quản lý tài khoản</a>
                                    <a class="dropdown-item text-dark" href="course"><span class="mb-0 d-inline-block me-1"></span>Quản lý khóa học</a>
                                    <a class="dropdown-item text-dark" href="ptmanager"><span class="mb-0 d-inline-block me-1"></span>Quản lý lộ trình</a>
                                    <div class="dropdown-divider border-top"></div>
                                    <a class="dropdown-item text-dark" href="updateProfile?UserID=${sessionScope.admin.getUserID()}"><span class="mb-0 d-inline-block me-1"></span>Cài đặt</a>
                                    <a class="dropdown-item text-dark" href="login"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span>Đăng xuất</a>                     
                                </div>
                            </div>
                        </li>
                    </c:when>

                    <c:when test="${sales != null}">                                                
                        <li class="list-inline-item mb-0 ms-1">
                            <div class="dropdown dropdown-primary">
                                <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="${sales.getImage()}" class="avatar avatar-ex-small rounded-circle" alt="button"></button>
                                <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                    <a class="dropdown-item d-flex align-items-center text-dark" href="#">
                                        <img src="${sales.getImage()}" class="avatar avatar-md-sm rounded-circle border shadow" alt="avatar">
                                        <div class="flex-1 ms-2">
                                            <span class="d-block mb-1">${sales.getFullName()}</span>
                                            <small style="color: orangered">${sales.getUserRole().getName()}</small>
                                        </div>
                                    </a>
                                    <a class="dropdown-item text-dark" href="userProfile?uid=${sessionScope.sales.getUserID()}"><span class="mb-0 d-inline-block me-1"></span>Trang cá nhân</a>
                                    <div class="dropdown-divider border-top"></div>
                                    <a class="dropdown-item text-dark" href="save-blog-list"><span class="mb-0 d-inline-block me-1"></span>Bài viết đã lưu</a>
                                    <div class="dropdown-divider border-top"></div>
                                    <a class="dropdown-item text-dark" href="updateProfile?UserID=${sessionScope.sales.getUserID()}"><span class="mb-0 d-inline-block me-1"></span>Cài đặt</a>
                                    <a class="dropdown-item text-dark" href="login"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span>Đăng xuất</a>                     
                                </div>
                            </div>
                        </li>
                    </c:when>

                    <c:when test="${expert != null}">                                                
                        <li class="list-inline-item mb-0 ms-1">
                            <div class="dropdown dropdown-primary">
                                <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="${expert.getImage()}" class="avatar avatar-ex-small rounded-circle" alt="button"></button>
                                <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                    <a class="dropdown-item d-flex align-items-center text-dark" href="#">
                                        <img src="${expert.getImage()}" class="avatar avatar-md-sm rounded-circle border shadow" alt="avatar">
                                        <div class="flex-1 ms-2">
                                            <span class="d-block mb-1">${expert.getFullName()}</span>
                                            <small style="color: orangered">${expert.getUserRole().getName()}</small>
                                        </div>
                                    </a>
                                    <a class="dropdown-item text-dark" href="userProfile?uid=${sessionScope.expert.getUserID()}"><span class="mb-0 d-inline-block me-1"></span>Trang cá nhân</a>
                                    <div class="dropdown-divider border-top"></div>
                                    <a class="dropdown-item text-dark" href="blog"><span class="mb-0 d-inline-block me-1"></span>Viết blog</a>
                                    <a class="dropdown-item text-dark" href="myblog"><span class="mb-0 d-inline-block me-1"></i></span>Bài viết của tôi</a>
                                    <a class="dropdown-item text-dark" href="save-blog-list"><span class="mb-0 d-inline-block me-1"></span>Bài viết đã lưu</a>
                                    <div class="dropdown-divider border-top"></div>
                                    <a class="dropdown-item text-dark" href="lessonManager"><span class="mb-0 d-inline-block me-1"></span>Quản lý bài học </a>
                                    <div class="dropdown-divider border-top"></div>
                                    <a class="dropdown-item text-dark" href="updateProfile?UserID=${sessionScope.expert.getUserID()}"><span class="mb-0 d-inline-block me-1"></span>Cài đặt</a>
                                    <a class="dropdown-item text-dark" href="login"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span>Đăng xuất</a>                     
                                </div>
                            </div>
                        </li>
                    </c:when>

                    <c:when test="${marketing != null}">                                                
                        <li class="list-inline-item mb-0 ms-1">
                            <div class="dropdown dropdown-primary">
                                <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="${marketing.getImage()}" class="avatar avatar-ex-small rounded-circle" alt="button"></button>
                                <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                    <a class="dropdown-item d-flex align-items-center text-dark" href="#">
                                        <img src="${marketing.getImage()}" class="avatar avatar-md-sm rounded-circle border shadow" alt="avatar">
                                        <div class="flex-1 ms-2">
                                            <span class="d-block mb-1">${marketing.getFullName()}</span>
                                            <small style="color: orangered">${marketing.getUserRole().getName()}</small>
                                        </div>
                                    </a>
                                    <a class="dropdown-item text-dark" href="userProfile?uid=${sessionScope.marketing.getUserID()}"><span class="mb-0 d-inline-block me-1"></span>Trang cá nhân</a>
                                    <div class="dropdown-divider border-top"></div>
                                    <a class="dropdown-item text-dark" href="save-blog-list"><span class="mb-0 d-inline-block me-1"></span>Bài viết đã lưu</a>
                                    <div class="dropdown-divider border-top"></div>
                                    <a class="dropdown-item text-dark" href="updateProfile?UserID=${sessionScope.marketing.getUserID()}"><span class="mb-0 d-inline-block me-1"></span>Cài đặt</a>
                                    <a class="dropdown-item text-dark" href="login"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span>Đăng xuất</a>                     
                                </div>
                            </div>
                        </li>
                    </c:when>

                    <c:otherwise>
                        <!-- Logout Home Page Function -->
                        <ul class="dropdowns list-inline mb-0">

                            <span class="btn btn-pills btn-danger"> 
                                <strong style="color: #000">
                                    <strong style="font-size: 14px">
                                        <strong style="font-family: monospace">
                                            <a href="login" style="color: white">Đăng nhập</a>
                                        </strong>
                                    </strong>
                                </strong>
                            </span>

                        </ul>
                        <ul class="dropdowns list-inline mb-0">
                            <span class=""> 
                                <strong style="color: #000">
                                    <strong style="font-size: 14px">
                                        <strong style="font-family: monospace">
                                            <a href="register" style="color: black">Đăng ký</a>
                                        </strong>
                                    </strong>
                                </strong>
                            </span>

                        </ul>
                        <!-- End Logout Home Page Function -->  
                    </c:otherwise>

                </c:choose>    
            </ul>
            <!-- End Login Home Page Function -->
        </div>
    </header>
    <!--End Header-->

    <!-- F8 New feed -->
    <div class="offcanvas offcanvas-end bg-white shadow" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
        <!-- header bar -->
        <div class="offcanvas-header p-4 border-bottom">
            <h5 id="offcanvasRightLabel" class="mb-0">
                <strong style="font-size: 18px">Bảng tin F8</strong></strong>
            </h5>
            <button type="button" class="btn-close d-flex align-items-center text-dark" data-bs-dismiss="offcanvas" aria-label="Close"><i class="uil uil-times fs-4"></i></button>
        </div>

        <!-- New feed -->
        <div class="offcanvas-body p-4 px-md-5">
            <div class="row">
                <div class="col-12">
                    <!-- New feed -->
                    <div id="style-switcher">
                        <div>
                            <ul class="text-center list-unstyled mb-0">
                                <li class="d-grid"><a href="javascript:void(0)" class="rtl-version t-rtl-light" onclick="setTheme('style-rtl')"><img src="assets/images/header/loa1.jpg" class="img-fluid rounded-md shadow-md d-block" alt="" width="320px" height="500px"><span class="text-muted mt-2 d-block"></span></a></li>
                                <li class="d-grid"><a href="javascript:void(0)" class="rtl-version t-rtl-light" onclick="setTheme('style-rtl')"><img src="assets/images/header/loa2.jpg" class="img-fluid rounded-md shadow-md d-block" alt="" width="320px" height="500px"><span class="text-muted mt-2 d-block"></span></a></li>
                                <li class="d-grid"><a href="javascript:void(0)" class="rtl-version t-rtl-light" onclick="setTheme('style-rtl')"><img src="assets/images/header/loa3.jpg" class="img-fluid rounded-md shadow-md d-block" alt="" width="320px" height="500px"><span class="text-muted mt-2 d-block"></span></a></li>
                                <li class="d-grid"><a href="javascript:void(0)" class="rtl-version t-rtl-light" onclick="setTheme('style-rtl')"><img src="assets/images/header/loa4.jpg" class="img-fluid rounded-md shadow-md d-block" alt="" width="320px" height="500px"><span class="text-muted mt-2 d-block"></span></a></li>
                                <li class="d-grid"><a href="javascript:void(0)" class="rtl-version t-rtl-light" onclick="setTheme('style-rtl')"><img src="assets/images/header/loa5.jpg" class="img-fluid rounded-md shadow-md d-block" alt="" width="320px" height="500px"><span class="text-muted mt-2 d-block"></span></a></li>
                                <li class="d-grid"><a href="javascript:void(0)" class="rtl-version t-rtl-light" onclick="setTheme('style-rtl')"><img src="assets/images/header/loa6.jpg" class="img-fluid rounded-md shadow-md d-block" alt="" width="320px" height="500px"><span class="text-muted mt-2 d-block"></span></a></li>
                                <li class="d-grid"><a href="javascript:void(0)" class="rtl-version t-rtl-light" onclick="setTheme('style-rtl')"><img src="assets/images/header/loa7.jpg" class="img-fluid rounded-md shadow-md d-block" alt="" width="320px" height="500px"><span class="text-muted mt-2 d-block"></span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- End New feed -->
    </div><!-- Header -->    
    <!-- java script -->
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <!-- Icons -->
    <script src="assets/js/feather.min.js"></script>
    <!-- Main Js -->
    <script src="assets/js/app.js"></script>
</body>
