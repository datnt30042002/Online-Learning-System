<%-- 
    Document   : userManager
    Created on : Jun 19, 2023, 11:36:03 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!Doctype html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="utf-8" />
        <title>Quản lý tài khoản</title>
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
            /* CSS cho trang web bị đè lên */
            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.3); /* Màu xám nhẹ */
                z-index: 9999; /* Đảm bảo lớp này hiển thị trên top */
                display: none; /* Mặc định ẩn overlay */
            }

            /* CSS cho bảng tin F8 */
            .notification-box-overlay {
                position: fixed;
                top: 50%;
                left: 50%;
                height: 600px;
                width: 850px;
                transform: translate(-50%, -50%);
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                z-index: 10000; /* Đảm bảo bảng tin hiển thị trên top */
                display: none; /* Mặc định ẩn bảng tin F8 */
                max-width: 80%; /* Giới hạn chiều rộng của bảng tin */
                max-height: 80%; /* Giới hạn chiều cao của bảng tin */
                overflow: auto; /* Cho phép cuộn nội dung bên trong */
            }

            .close-button {
                position: absolute;
                top: 10px;
                right: 10px;
                cursor: pointer;
            }

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
                                                            <li class="breadcrumb-item" style="width: 300px;"><a href="userManager" style="color: #000;"><h5 class="mb-0" style="font-size: 25px;">Quản lý tài khoản</h5></a></li>
                                                        </ul>
                                                    </nav>
                                                </div>
                                                <!-- title -->
                                            </div>
                                        </div>



                                        <!-- Search -->
                                        <div class="header-bar d-flex justify-content-between border-bottom">
                                            <div class="d-flex align-items-center">
                                                <div class="tab-pane fade bg-white show active" id="inbox" role="tabpanel" aria-labelledby="inbox-tab">
                                                    <div class="search-bar p-0 d-none d-lg-block ms-2">
                                                        <div id="search" class="menu-search mb-0" class="searchform">
                                                            <form method="get" action="searchUser" class="searchform">
                                                                <input type="text" name="txtSearchUser" class="form-control border rounded-pill" placeholder="Tìm kiếm theo tên...">
                                                                <input type="submit" id="searchsubmit" value="Search">
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- User Role function -->
                                            <div class="col-xl-2 col-lg-3 col-md-4 col-12">
                                                <div class="card rounded-0 border-0 p-4">
                                                    <div class="tab-pane fade bg-white show active" id="inbox" role="tabpanel" aria-labelledby="inbox-tab">
                                                        <div class="bg-white rounded">
                                                            <div class="form-group">
                                                                <label for="userRoleSelect">Lọc theo Quyền</label>
                                                                <select class="form-select" id="userRoleSelect" onchange="location = this.value;">
                                                                    <option value="#" <c:if test="${selectedUserRoleID == -1}">selected</c:if>>Lựa chọn</option>
                                                                    <c:forEach var="listUserRole" items="${listUserRole}">
                                                                        <option value="userRole?userRoleID=${listUserRole.getRoleID()}"
                                                                                <c:if test="${listUserRole.getRoleID() == selectedUserRoleID}">
                                                                                    selected
                                                                                </c:if>
                                                                                <c:if test="${listUserRole.getRoleID() == selectedUserRoleID && selectedUserRoleID != -1}">
                                                                                    disabled
                                                                                </c:if>
                                                                                >
                                                                            ${listUserRole.getName()}
                                                                        </option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- User Role function -->

                                            <!-- Sort -->
                                            <div class="col-4 mt-4">
                                                <form action="sortUser" method="post" class="d-flex">
                                                    <div class="me-2">
                                                        <label for="sortUser">Sắp xếp bởi</label>
                                                        <select name="sortBy" id="sortBy" class="form-select">
                                                            <option value="sortCourse">Lựa chọn</option>
                                                            <option value="UserID">STT</option>
                                                            <option value="FullName">Full Name</option>
                                                            <option value="UserRole">User Role</option>
                                                            <option value="UserStatus">Status</option> 
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

                                        <div class="d-flex justify-content-end" sty>
                                            <div class="col-xl-2">
                                                <a href="addUser" class="btn btn-outline-danger">Thêm tài khoản mới</a><br>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-end">
                                            <div class="col-xl-2">
                                                <a class="btn btn-outline-danger" onclick="toggleNotification()">Quyền hạn Bảo mật</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card rounded border-0 mt-4 overflow-hidden">
                                    <div class="row g-1">

                                        <!-- Nav bar -->
                                            <div class="card rounded-0 border-0 p-4">
                                                <ul class="nav nav-pills nav-link-soft nav-justified flex-column mt-4 mb-0" id="pills-tab" role="tablist" style="background: white;">
                                                    <div class="notification-icon">
                                                        <i class="fas fa-bell"></i>
                                                        <div class="overlay" id="overlay" onclick="toggleNotification()"></div>
                                                        <div class="notification-box-overlay" id="notificationBoxOverlay">
                                                            <span class="close-button" onclick="toggleNotification()">&times;</span>

                                                            <h3>Quyền hạn và Chính sách bảo mật của Admin</h3>

                                                            <h6 style="color: orangered;">Quyền hạn:</h6>
                                                            <p>Admin là người có quyền hạn cao nhất đối với trang web và có các chức năng sau:</p>
                                                            <ul>
                                                                <li>Quản lý nội dung: Admin có quyền kiểm duyệt, chỉnh sửa hoặc xóa nội dung trên trang web để đảm bảo tính chất xây dựng và chất lượng của nội dung.</li>
                                                                <li>Quản lý thành viên: Admin có thể quản lý danh sách thành viên, bao gồm thêm, xóa hoặc khóa tài khoản thành viên khi cần thiết.</li>
                                                                <li>Xử lý sự cố: Admin có trách nhiệm giúp đỡ người dùng và xử lý các sự cố kỹ thuật hoặc vấn đề phát sinh liên quan đến trang web.</li>
                                                                <li>Đảm bảo an toàn: Admin phải đảm bảo tính bảo mật và an toàn của trang web, đồng thời áp dụng các biện pháp bảo vệ để ngăn chặn các hành vi không đúng mục đích và tấn công từ bên ngoài.</li>
                                                            </ul>

                                                            <br>
                                                            <h6 style="color: orangered;">Chính sách bảo mật:</h6>
                                                            <p>Admin cam kết bảo vệ thông tin cá nhân của người dùng và tuân thủ các nguyên tắc bảo mật sau:</p>
                                                            <ul>
                                                                <li>Bảo vệ thông tin cá nhân: Admin không tiết lộ hoặc chia sẻ thông tin cá nhân của người dùng cho bất kỳ bên thứ ba nào mà không có sự đồng ý của họ.</li>
                                                                <li>Quyền riêng tư: Admin tôn trọng quyền riêng tư của người dùng và không can thiệp vào thông tin cá nhân của họ một cách trái phép.</li>
                                                                <li>Bảo mật dữ liệu: Admin áp dụng các biện pháp bảo mật kỹ thuật để đảm bảo an toàn dữ liệu của người dùng, bao gồm các biện pháp phòng ngừa, giám sát và xử lý sự cố bảo mật.</li>
                                                                <li>Chính sách cookie: Admin thông báo rõ ràng về việc sử dụng cookie và thu thập thông tin từ người dùng trên trang web, đồng thời cung cấp các tùy chọn và điều chỉnh cho người dùng trong việc quản lý cookie.</li>
                                                            </ul>

                                                            <p>Admin có quyền quản lý và kiểm soát các bình luận và tương tác của người dùng trên trang web. Điều này bao gồm:</p>
                                                            <ul>
                                                                <li>Phê duyệt, chỉnh sửa hoặc xóa các bình luận không phù hợp hoặc vi phạm quy định của trang web.</li>
                                                                <li>Quản lý các tương tác, bao gồm phản hồi, thảo luận, đánh giá và chia sẻ thông tin.</li>
                                                                <li>Đảm bảo sự tôn trọng và sự an toàn trong tương tác giữa người dùng.</li>
                                                            </ul>

                                                            <br>
                                                            <h6 style="color: orangered;">Chính sách bảo mật thông tin cá nhân:</h6>
                                                            <p>Admin cam kết bảo vệ thông tin cá nhân của người dùng và tuân thủ các nguyên tắc bảo mật sau:</p>
                                                            <ul>
                                                                <li>Thu thập thông tin: Admin chỉ thu thập thông tin cá nhân cần thiết để cung cấp dịch vụ và tương tác trên trang web.</li>
                                                                <li>Lưu trữ thông tin: Admin lưu trữ thông tin cá nhân của người dùng một cách an toàn và bảo mật, chỉ trong thời gian cần thiết và theo quy định pháp luật.</li>
                                                                <li>Chia sẻ thông tin: Admin không chia sẻ thông tin cá nhân của người dùng với bất kỳ bên thứ ba nào mà không có sự đồng ý của họ, trừ khi có yêu cầu pháp lý hoặc theo quy định của chính sách bảo mật.</li>
                                                                <li>Bảo mật thông tin: Admin áp dụng các biện pháp bảo mật kỹ thuật và công nghệ để đảm bảo an toàn thông tin cá nhân của người dùng.</li>
                                                                <li>Quyền và điều chỉnh: Admin cung cấp quyền cho người dùng để xem, chỉnh sửa hoặc xóa thông tin cá nhân của họ khi cần thiết.</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </ul>
                                            </div>
                                        <!-- Nav bar -->

                                        <!-- Table -->
                                        <div class="col-xl-12 col-lg-3 col-md-4 col-12">
                                            <div class="card rounded-0 border-0 p-4">
                                                <div class="tab-pane fade bg-white show active" id="inbox" role="tabpanel" aria-labelledby="inbox-tab">
                                                    <div class="table-responsive bg-white rounded">
                                                        <table class="table table-center bg-white mb-0">
                                                            <thead>
                                                                <tr>
                                                                    <th class="border-bottom p-3" style="width: 10px;">STT</th>
                                                                    <th class="border-bottom p-3" style="width: 100px;">Ảnh</th>
                                                                    <th class="border-bottom p-3" style="width: 300px;">Họ tên</th>
                                                                    <th class="border-bottom p-3" style="width: 100px;">Vai trò</th>
                                                                    <th class="border-bottom p-3" style="width: 100px;">Trạng thái</th>
                                                                    <th class="border-bottom p-3" style="width: 110px;"></th>
                                                                </tr>
                                                            </thead>

                                                            <c:choose>
                                                                <c:when test="${empty listUserByPage}">
                                                                    <tr>
                                                                        <td colspan="7" style="color: red;">Không có thông tin về tài khoản này.</td>
                                                                    </tr>
                                                                </c:when>
                                                                <c:otherwise>

                                                                    <tbody>
                                                                        <c:forEach var="user" items="${listUserByPage}" varStatus="loop">
                                                                            <tr>
                                                                                <th class="p-3" id="stt_${loop.index + 1}"></th>
                                                                                <!--<th class="p-3">${user.getUserID()}</th> <!-- user id -->
                                                                                <td class="p-3"><img src="${user.getImage()}" class="avatar avatar-ex-sm rounded-circle" style="width: 80px; height: 80px;"></td>
                                                                                <td class="p-3">${user.getFullName()}</td>
                                                                                <th class="p-3" id="userRole">
                                                                                    <c:forEach items="${listUserRole}" var="userRole">
                                                                                        <c:if test="${userRole.getRoleID() == user.getUserRole_RoleID()}">
                                                                                            <p class="uppercase">${userRole.getName()}</p>
                                                                                        </c:if>
                                                                                    </c:forEach>
                                                                                </th>
                                                                                <td class="p-3">
                                                                                    <c:if test="${user.getStatus() == 1}">
                                                                                        <p style="color: green">ACTIVE</p>
                                                                                    </c:if>
                                                                                    <c:if test="${user.getStatus() == 0}">
                                                                                        <p style="color: red">UNACTIVE</p>
                                                                                    </c:if>
                                                                                </td>
                                                                                <td class="p-3">
                                                                                    <a href="userDetail?UserID=${user.getUserID()}" class="btn btn-warning">Xem chi tiết</a>
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
                                                                <a href="userManager?page=${currentPage - 1}" class="btn btn-soft-dark page-link">< Trang trước</a>
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
                                                                    <a href="userManager?page=${loop.index}" class="btn btn-soft-dark page-link active">${loop.index}</a>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <a href="userManager?page=${loop.index}" class="btn btn-soft-dark page-link">${loop.index}</a>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>

                                                        <c:choose>
                                                            <%-- Kiểm tra nếu currentPage < totalPages thì hiển thị nút Next --%>
                                                            <c:when test="${currentPage < totalPages}">
                                                                <a href="userManager?page=${currentPage + 1}" class="btn btn-soft-dark page-link">Trang sau ></a>
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
                                                                ClassicEditor
                                                                        .create(document.querySelector('#editor'))
                                                                        .catch(error => {
                                                                            console.error(error);
                                                                        });
        </script>

        <script>
            // Lấy tất cả các thẻ th có id bắt đầu bằng "stt_"
            var sttElements = document.querySelectorAll("[id^='stt_']");

            // Gán số thứ tự tăng dần cho từng thẻ th
            for (var i = 0; i < sttElements.length; i++) {
                sttElements[i].textContent = i + 1;
            }
        </script>


        <script>
            function toggleNotification() {
                var overlay = document.getElementById('overlay');
                var notificationBoxOverlay = document.getElementById('notificationBoxOverlay');

                overlay.style.display = (overlay.style.display === 'block') ? 'none' : 'block';
                notificationBoxOverlay.style.display = (notificationBoxOverlay.style.display === 'block') ? 'none' : 'block';
            }
        </script>

        <script>
            // JavaScript để kích hoạt mục được chọn
            var pillsTab = document.getElementById('pills-tab');
            var pills = pillsTab.getElementsByTagName('a');

            for (var i = 0; i < pills.length; i++) {
                pills[i].addEventListener('click', function () {
                    var current = pillsTab.getElementsByClassName('active');
                    current[0].className = current[0].className.replace(' active', '');
                    this.className += ' active';
                });
            }

            function toggleNotification() {
                var overlay = document.getElementById('overlay');
                var notificationBoxOverlay = document.getElementById('notificationBoxOverlay');

                overlay.style.display = (overlay.style.display === 'block') ? 'none' : 'block';
                notificationBoxOverlay.style.display = (notificationBoxOverlay.style.display === 'block') ? 'none' : 'block';
            }
        </script>
    </body>
</html>