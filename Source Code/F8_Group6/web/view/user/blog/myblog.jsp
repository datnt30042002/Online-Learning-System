
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <!-- favicon -->
        <link rel="shortcut icon" href="../../../assets/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="../../../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="../../../assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="../../../assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="../../../assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
    </head>

    <body>


        <%@include file="/view/common/header.jsp"%>

        <!-- Start Hero -->
        <section class="bg-half-170 d-table w-100" style="background: url('assets/images/bg/blogbg.jpg') center center;">
            <div class="bg-overlay bg-overlay-dark"></div>
            <div class="container">
                <div class="row mt-5 justify-content-center">
                    <div class="col-12">
                        <div class="section-title text-center">
                            <h1 class="sub-title mb-4 text-white title-dark">BLOG CỦA TÔI</h1>


                            <nav aria-label="breadcrumb" class="d-inline-block mt-3">
                                <ul class="breadcrumb bg-light rounded mb-0 py-1 px-2">
                                    <li class="breadcrumb-item">
                                        <a class=" ${statusValue==0 ? 'active' : ''}" href="myblog?status=0" value="save">Bản nháp</a>
                                    </li>
                                    <li class="breadcrumb-item " >
                                        <a class=" ${statusValue==1 ? 'active' : ''}" href="myblog?status=1" value="publish">Đã xuất bản</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->
        <!-- End Hero -->

        <!-- Start -->
        <section class="section">
            <div class="container">
                <div class="row">
                    <c:forEach items="${bList}" var="o">
                        <div class="col-lg-4 col-md-6 col-12 mb-4 pb-2">
                            <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">


                                <div class="card-body p-4">
                                    <ul class="list-unstyled mb-2">
                                        <li class="list-inline-item text-muted small me-3">
                                            <i class="uil uil-calendar-alt text-dark h6 me-1"></i>
                                            <script>
                                                                    var postDate = new Date("${o.getPostDate()}");
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
                                    </ul>
                                    <a href="blogview?id=${o.getBlogID()}" class="text-dark title h5">${o.getBlogTitle()}</a>
                                    <div class="post-meta d-flex justify-content-between mt-3">
                                        <ul class="list-unstyled mb-0">                                        
                                            <li class="list-inline-item"><a href="myblog?type=0&id=${o.getBlogID()}" class="text-muted comments"><i class="mdi mdi-comment-outline me-1"></i>DELETE</a></li>
                                        </ul>
                                        <a href="blogview?id=${o.getBlogID()}" class="link">Read More <i class="mdi mdi-chevron-right align-middle"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div><!--end col-->
                    </c:forEach>

                </div><!--end row-->

                <div class="row text-center">
                    <div class="col-12">
                        <ul class="pagination justify-content-center mb-0 list-unstyled">
                            <li class="page-item"><a class="page-link" href="javascript:void(0)" aria-label="Previous">Prev</a></li>
                            <li class="page-item active"><a class="page-link" href="javascript:void(0)">1</a></li>
                            <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                            <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                            <li class="page-item"><a class="page-link" href="javascript:void(0)" aria-label="Next">Next</a></li>
                        </ul><!--end pagination-->
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->
        <!-- End -->

        <%@include file="/view/common/footer.jsp"%>

        <!-- javascript -->
        <script src="../../../assets/js/bootstrap.bundle.min.js"></script>
        <!-- Icons -->
        <script src="../../../assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="../../../assets/js/app.js"></script>

    </body>

</html>