<%-- 
    Document   : courseManagement
    Created on : Jun 10, 2023, 8:49:26 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Quản lý danh sách khóa học </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="index.html" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="assets/images/logoF8.png">
        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="assets/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

        <script>
            function confirmDelete() {
                return confirm("Chắc chắn muốn BAN khóa học này?");
            }
        </script>
        <!-- bien no thanh 1 cai pock up -->

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
                                    <li class="breadcrumb-item"><a href="course" style="font-size: 20px ;color: orangered ; font-family: inherit">Quản lý danh sách khóa học</a></li>
                                </ul>
                            </nav>

                            <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                                <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                    <a href="addCourse" class="btn btn-outline-danger">Thêm khóa học mới</a>
                                </ul>
                            </nav>
                        </div>

                        <!-- Search --> 
                        <div class="row">
                            <div class="col-2 mt-4">
                                <div id="search" class="menu-search mb-0">
                                    <form method="get" action="searchCourse" class="searchform">
                                        <input type="text" name="txtSearchCourse" class="form-control border rounded-pill" placeholder="Tìm kiếm tiêu đề bài học...">

                                        <div class="col-1 mt-4">
                                            <input type="submit" id="searchsubmit" class="btn btn-danger rounded-pill" value="Search">
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- End Search --> 

                            <!-- filter -->
                            <!-- Category -->
                            <div class="col-2 mt-4">
                                <div class="form-group">
                                    <label for="userRoleSelect">Lọc theo Category</label>
                                    <select class="form-select" id="userRoleSelect" onchange="location = this.value;">
                                        <option value="#" <c:if test="${selectedUserRoleID == -1}">selected</c:if>>Lựa chọn</option>
                                        <c:forEach var="listCategories" items="${listCategories}">
                                            <option value="filterCategory?CategoryID=${listCategories.getCategoryID()}">
                                                ${listCategories.getName()}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <!-- Category -->
                            <!-- end filter -->

                            <div class="col-2 mt-4">
                                <div class="form-group">
                                    <label for="userRoleSelect">Lọc theo Publish Status</label>
                                    <select class="form-select" id="userRoleSelect" onchange="location = this.value;">
                                        <option value="#" <c:if test="${selectedUserRoleID == -1}">selected</c:if>>Lựa chọn</option>
                                            <option value="filterPublishStatus?PublishStatus=1">
                                                PUBLISH
                                            </option>
                                            <option value="filterPublishStatus?PublishStatus=0">
                                                UN PUBLISH
                                            </option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-2 mt-4">
                                    <div class="form-group">
                                        <label for="userRoleSelect">Lọc theo Cost</label>
                                        <select class="form-select" id="userRoleSelect" onchange="location = this.value;">
                                            <option value="#" <c:if test="${selectedUserRoleID == -1}">selected</c:if>>Lựa chọn</option>
                                            <option value="filterCost?Cost=0">
                                                FREE
                                            </option>
                                            <option value="filterCost?Cost!=0">
                                                COST
                                            </option>
                                        </select>
                                    </div>
                                </div>

                                <!-- Sort -->
                                <div class="col-4 mt-4">
                                    <form action="sortCourse" method="post" class="d-flex">
                                        <div class="me-2">
                                            <label for="sortBy">Sắp xếp bởi</label>
                                            <select name="sortBy" id="sortBy" class="form-select">
                                                <option value="sortCourse">Lựa chọn</option>
                                                <option value="ID">STT</option> 
                                                <option value="Name">Tên khóa học</option> 
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
                                <!--  end sort -->
                            </div>


                            <div class="row">
                                <div class="col-12 mt-4">
                                    <div class="table-responsive rounded">                             
                                        <table class="table table-center bg-white mb-0">
                                            <thead>
                                                <tr>
                                                    <th class="border-bottom p-3" style="width: 100px;">STT</th>
                                                    <th class="border-bottom p-3" style="width: 500px;">Course Name</th>   
                                                    <th class="border-bottom p-3" style="width: 500px;">Course Image</th>
                                                    <th class="border-bottom p-3" style="width: 500px;">Category</th>
                                                    <th class="border-bottom p-3" style="width: 500px;">Publish Status</th>
                                                    <th class="border-bottom p-3" style="width: 400px;">Cost</th>
                                                    <th class="border-bottom p-3" style="width: 300px;">Function</th>
                                                </tr>
                                            </thead>                                     
                                            <tbody>
                                            <c:choose>
                                                <c:when test="${empty CourselistByPage}">
                                                    <tr>
                                                        <td colspan="7" style="color: red;">Không có thông tin về khóa học này.</td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>

                                                    <c:forEach items="${CourselistByPage}" var="c">
                                                        <tr>                                                    
                                                            <th class="p-3" id="stt_${loop.index + 1}"></th> <!-- user id -->
                                                            <th class="p-3">${c.getName()}</th>
                                                            <td class="p-3"><img src="${c.getImage()}" alt="Card image cap" style="width: 180px; height: 100px; border-radius: 5%"></td>
                                                            <td class="p-3">
                                                                <c:forEach items="${listCategories}" var="category">
                                                                    <c:if test="${category.getCategoryID() == c.getCategory_CategoryID()}">
                                                                        <c:choose>
                                                                            <c:when test="${category.getCategoryID() == 1}">
                                                                                <p><span style="color: orangered">${category.getName()}</span></p>
                                                                                </c:when>
                                                                                <c:when test="${category.getCategoryID() == 2}">
                                                                                <p><span style="color: darkblue">${category.getName()}</span></p>
                                                                                </c:when>
                                                                                <c:when test="${category.getCategoryID() == 3}">
                                                                                <p><span style="color: green">${category.getName()}</span></p>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                <p>${category.getName()}</p>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </td>
                                                            <td class="p-3">
                                                                <c:if test="${c.getStatus() == 1}">
                                                                    <p style="color: green">PUBLISH</p>
                                                                </c:if>
                                                                <c:if test="${c.getStatus() == 0}">
                                                                    <p style="color: red">UN PUBLISH</p>
                                                                </c:if>
                                                            </td>
                                                            <td class="p-3">
                                                                <c:if test="${c.getFeeStatus() != 0}">
                                                                    <p style="color: orangered">
                                                                        <script>
                                                                    var fee = ${c.getFeeStatus()};
                                                                    var formattedFee = (fee / 1).toLocaleString('en-US');
                                                                    document.write(formattedFee + 'đ');
                                                                        </script>
                                                                    </p>
                                                                </c:if>
                                                                <c:if test="${c.getFeeStatus() == 0}">
                                                                    <p style="color: green">Miễn phí</p>
                                                                </c:if>
                                                            </td>
                                                            <td class="text-end p-3">
                                                                <a href="updateCourse?CourseID=${c.getCourseID()}" class="btn btn-icon btn-pills btn-soft-success"><i class="uil uil-pen"></i></a>
                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i class="uil uil-edit"></i></a>
                                                                <a href="deleteCourse?CourseID=${c.getCourseID()}" onclick="return confirmDelete()" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-ban"></i></a>
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
                                            <a href="course?page=${currentPage - 1}" class="btn btn-soft-dark page-link">< Trang trước</a>
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
                                                <a href="course?page=${loop.index}" class="btn btn-soft-dark page-link active">${loop.index}</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="course?page=${loop.index}" class="btn btn-soft-dark page-link">${loop.index}</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>

                                    <c:choose>
                                        <%-- Kiểm tra nếu currentPage < totalPages thì hiển thị nút Next --%>
                                        <c:when test="${currentPage < totalPages}">
                                            <a href="course?page=${currentPage + 1}" class="btn btn-soft-dark page-link">Trang sau ></a>
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
                </div><!--end container-->
                <br><br>
                <!-- Footer Start -->
                <%@include file="/view/common/footer.jsp"%>
                <!-- End -->
            </main>
            <!--End page-content" -->
        </div>
        <!-- page-wrapper -->

        <!-- java script -->
        <script src="../../../assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="../../../assets/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="../../../assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="../../../assets/js/app.js"></script>

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

        <script>
            // Lấy tất cả các thẻ th có id bắt đầu bằng "stt_"
            var sttElements = document.querySelectorAll("[id^='stt_']");

            // Gán số thứ tự tăng dần cho từng thẻ th
            for (var i = 0; i < sttElements.length; i++) {
                sttElements[i].textContent = i + 1;
            }
        </script>

    </body>
</html>