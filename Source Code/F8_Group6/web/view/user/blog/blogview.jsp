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
        <title>${blog.getBlogTitle()} | by ${blog.getUserName()} | F8</title>
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
        <link href="./assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="./assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="./assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- SLIDER -->
        <link rel="stylesheet" href="../assets/css/tiny-slider.css"/>
        <!-- Css -->
        <link href="./assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
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
            .bookmarked {
                color: orange; /* Màu của icon đã lưu */
            }
            .form-group {
                display: flex;
                margin-bottom: 10px;
            }
            .form-group .comment {
                flex: 1 0 50%; /* Ô input chiếm 50% chiều rộng */
            }
            .button-container {
                text-align: right;
            }
            @media (max-width: 768px) {
                .form-group .comment {
                    flex: 1 0 100%; /* Ô input chiếm 100% chiều rộng trong responsive */
                }
            }
            .comment{
                width: 92%;
                border: none;
                outline: none;
                border-bottom: 1px solid #1890ff;
                padding: 5px 10px;
            }
            .show-comment{
                background: #f2f3f5;
                padding: 5px 10px;
                margin-left: 5px;
                padding-right: 250px;
                border-radius: 5px;
            }
            .reply{
                background: #f2f3f5;
                padding: 5px 10px;
                margin-left: 5px;
                padding-right: 250px;
                border-radius: 5px;
            }
            .toast-top-right {
                top: 90px !important;
                right: 40%;
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

        <!-- Navbar STart -->


        <!-- Start Hero -->

        <div class="position-relative">
            <div class="shape overflow-hidden text-white">
                <svg viewBox="0 0 2880 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M0 48H1437.5H2880V0H2160C1442.5 52 720 0 720 0H0V48Z" fill="currentColor"></path>
                </svg>
            </div>
        </div>
        <!-- End Hero -->
        <%@include file="/view/common/header-back.jsp"%>
        <!-- Start -->
        <section class="bg-dashboard">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-xl-1 col-lg-8 col-md-6 mt-4 mt-sm-0"></div>
                    <div class="col-xl-7 col-lg-8 col-md-6 mt-4 mt-sm-0">
                        <div class="blog blog-primary sidebar rounded">
                            <strong><a style="color: #000 ; font-size: 36px;">${blog.getBlogTitle()}</a></strong>
                            <div class="post-meta d-flex justify-content-between mt-3">
                                <ul class="list-unstyled mb-0">
                                    <li class="list-inline-item text-muted small">
                                        <a href="userProfile?uid=${blog.getUserID()}" class="text-muted ">
                                            <img style="max-width: 55px; border: 1px solid wheat; border-radius: 100px; margin-right: 5px; margin-left: 5px; margin-bottom: 5px" src="${blog.getImage()}" alt="alt"/>
                                            Tác giả: 
                                            ${blog.getUserName()}
                                        </a>
                                    </li>
                                    <li class="list-inline-item text-muted small"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>Ngày đăng: 
                                        <script>
                                            var postDate = new Date("${blog.getPostDate()}");
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
                                <ul class="list-unstyled mb-0" style="margin-top: 20px">
                                    <li class="list-inline-item">
                                        <c:if test="${list_like.contains(blog.getBlogID())}">
                                            <a href="save-like?id=${blog.getBlogID()}&action=unlike" class="text-muted like title">
                                                <i class="mdi mdi-heart-outline me-1" style="color: red; font-size: large"></i>${total}
                                            </a>
                                        </c:if>                          
                                        <c:if test="${!list_like.contains(blog.getBlogID())}">
                                            <a href="save-like?id=${blog.getBlogID()}&action=like" class="text-muted like title">
                                                <i class="mdi mdi-heart-outline me-1" style="font-size: large"></i>${total}
                                            </a>
                                        </c:if>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight" class="text-muted comments title">
                                            <i class="mdi mdi-comment-outline me-1" style="font-size: large"></i>${sessionScope.list_comment.size()}
                                        </a>
                                    </li>
                                    <li class="list-inline-item"></li>
                                    <li class="list-inline-item dropdown dropdown-primary">
                                        <c:if test="${list_save.contains(blog.getBlogID())}">
                                            <a href="save-blog-action?id=${blog.getBlogID()}&action=unsave&page=blogview" class="text-muted bookmarked title">
                                                <i class="far fa-bookmark" id="bookMarkSave" style="color: #ff6600"></i>
                                            </a>&ensp;
                                        </c:if>
                                        <c:if test="${!list_save.contains(blog.getBlogID())}">
                                            <a href="save-blog-action?id=${blog.getBlogID()}&action=save&page=blogview" class="text-muted bookmarked title">
                                                <i class="far fa-bookmark" id="bookMarkNotSave"></i>
                                            </a>&ensp;
                                        </c:if>
                                        <a href="#" class="text-muted title dropdown-toggle p-0"data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-h"></i>
                                        </a>                                                                   
                                        <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                            <c:if test="${expert.getUserID() == blog.getUserID()}">
                                                <a class="dropdown-item text-dark" href="blog?type=1&id=${b.getBlogID()}"            
                                                   <span class="mb-0 d-inline-block me-1">
                                                    <i class="uil uil-pen align-middle h6"></i>
                                                    </span> Sửa bài viết
                                                </a>
                                                <div class="dropdown-divider border-top"></div>
                                            </c:if>
                                            <a class="dropdown-item text-dark" href="#" 
                                               onclick="shareOnFacebook('http://localhost:9999/F8_Group6/blogview?id=${blog.getBlogID()}');">
                                                <span class="mb-0 d-inline-block me-1">
                                                    <i class="uil uil-facebook align-middle h6"></i>
                                                </span> Chia sẻ lên Facebook
                                            </a>
                                            <a class="dropdown-item text-dark" href="#" 
                                               onclick="shareOnTwitter('http://localhost:9999/F8_Group6/blogview?id=${blog.getBlogID()}');">
                                                <span class="mb-0 d-inline-block me-1">
                                                    <i class="uil uil-twitter align-middle h6"></i>
                                                </span> Chia sẻ lên Twitter
                                            </a>
                                            <a class="dropdown-item text-dark" href="#" 
                                               onclick="shareByEmail('http://localhost:9999/F8_Group6/blogview?id=${blog.getBlogID()}');">
                                                <span class="mb-0 d-inline-block me-1">
                                                    <i class="uil uil-envelope align-middle h6"></i>
                                                </span> Chia sẻ tới Email
                                            </a>
                                            <a class="dropdown-item text-dark" href="#" 
                                               onclick="copyToClipboard('http://localhost:9999/F8_Group6/blogview?id=${blog.getBlogID()}')">
                                                <span class="mb-0 d-inline-block me-1">
                                                    <i class="uil uil-link align-middle h6"></i>
                                                </span> Sao chép liên kết
                                            </a>
                                            <c:if test="${expert == null || expert.getUserID() != blog.getUserID()}">
                                                <a class="dropdown-item text-dark" href="blogreport">
                                                    <span class="mb-0 d-inline-block me-1">
                                                        <i class="uil uil-exclamation-octagon align-middle h6"></i>
                                                    </span> Báo cáo bài viết
                                                </a>
                                            </c:if>
                                        </div>
                                    </li>    
                                </ul>
                                <div id="copySuccessAlert" class="copy-success-alert">Đã sao chép liên kết</div>
                            </div>
                            <br>
                            <div class="col-lg-12">
                                <div class="tiny-slide rounded mb-4">
                                    <img src="assets/images/blog/${blog.getBlogImage()}" class="img-fluid rounded shadow" style="height: 450px; width: 100%;">
                                    <p class="text-muted mt-4">${blog.getBlogDetail()}</p>
                                </div>
                            </div><!--end col-->
                            <div class="widget mt-4">
                                <div class="tagcloud">
                                    <a href="bloglist?tag=${blog.getBlogTagID()}" class="rounded ${blog.getBlogTagID() == tag ? 'active':''}">${blog.getBlogTagName()}</a>
                                    <a href="bloglist?topic=${blog.getBlogTopicID()}" class="rounded ${blog.getBlogTopicID() == topic ? 'active':''}" class="rounded">${blog.getBlogTopicName()}</a>
                                </div>
                            </div>  
                        </div>
                    </div><!--end col-->                  
                    <div class="col-xl-3 col-lg-4 col-md-6 mt-4 mt-md-0"> 
                        <br>
                        <div class="card border-0 sidebar sticky-bar rounded shadow" style="margin-top: 51px; margin-left: 10px">
                            <%@include file="/view/common/sidebar.jsp"%>
                            <div class="col-xl-1 col-lg-8 col-md-6 mt-4 mt-sm-0"></div>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
                <script>
                    $(document).ready(function () {
                        var message = '${toastMessage}'; // Lấy giá trị từ biến message
                        if (message !== '') {
                            // Hiển thị toast
                            toastr.info(message, '', {timeOut: 2000});
                        }
                    });
                </script>
                <!--end container-->
        </section>
        <br> <br> <br> <br> <br> <br> <br>
        <!-- Offcanvas End -->
        <%@include file="/view/common/footer.jsp"%>
        <!-- javascript -->
        <script src="https://kit.fontawesome.com/4ec0e85a31.js" crossorigin="anonymous"></script>
        <script src="https://cdn.tiny.cloud/1/960h90rahv9jcykqywlacmvxqve30f5e9a1jn5id5msshl6a/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script src="../../../assets/js/bootstrap.bundle.min.js"></script>
        <!-- SLIDER -->
        <script src="../../../assets/js/tiny-slider.js"></script>
        <script src="../../../assets/js/tiny-slider-init.js"></script>
        <!-- Icons -->
        <script src="../../../assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="../../../assets/js/app.js"></script>
        <script>
                    // Xu ly sao chep lien ket link và hien message
                    function copyToClipboard(text) {
                        var dummy = document.createElement("input");
                        document.body.appendChild(dummy);
                        dummy.setAttribute("value", text);
                        dummy.select();
                        document.execCommand("copy");
                        document.body.removeChild(dummy);

                        var copySuccessAlert = document.getElementById("copySuccessAlert");

                        copySuccessAlert.classList.add("show");
                        setTimeout(function () {
                            copySuccessAlert.classList.remove("show");
                        }, 2000);
                    }
                    ;
//                                                   // Xu ly luu trang thai save blog và hien message
//                                                   var bookmarkIcon = document.getElementById("bookmarkIcon");
//                                                   var isBookmarked = localStorage.getItem("isBookmarked"); // Lấy trạng thái đã lưu từ Local Storage
//
//                                                   if (isBookmarked === "true") {
//                                                       bookmarkIcon.classList.add("bookmarked");
//                                                   }
//
//                                                   function toggleBookmark(event) {
//                                                       event.preventDefault();
//
//                                                       if (bookmarkIcon.classList.contains("bookmarked")) {
//                                                           bookmarkIcon.classList.remove("bookmarked");
//                                                           localStorage.setItem("isBookmarked", "false"); // Lưu trạng thái chưa lưu vào Local Storage
//                                                           var removeSaveSuccessAlert = document.getElementById("removeSaveSuccessAlert");
//                                                           removeSaveSuccessAlert.classList.add("show");
//                                                           setTimeout(function () {
//                                                               removeSaveSuccessAlert.classList.remove("show");
//                                                           }, 2000);
//                                                       } else {
//                                                           bookmarkIcon.classList.add("bookmarked");
//                                                           localStorage.setItem("isBookmarked", "true"); // Lưu trạng thái đã lưu vào Local Storage
//                                                           var saveSuccessAlert = document.getElementById("saveSuccessAlert");
//                                                           saveSuccessAlert.classList.add("show");
//                                                           setTimeout(function () {
//                                                               saveSuccessAlert.classList.remove("show");
//                                                           }, 2000);
//                                                       }
//                                                   }
                    ;// Xu ly chia se toi Facebook
                    function shareOnFacebook(url) {
                        var facebookUrl = 'https://www.facebook.com/sharer/sharer.php?u=' + encodeURIComponent(url);
                        window.open(facebookUrl, '_blank');
                    }
                    ;
                    // Xu ly chia se toi Twitter
                    function shareOnTwitter(url) {
                        var twitterUrl = 'https://twitter.com/intent/tweet?url=' + encodeURIComponent(url);
                        window.open(twitterUrl, '_blank');
                    }
                    ;
                    // Xu ly chia se toi Email
                    function shareByEmail(url) {
                        var subject = '';
                        var body = 'Xin chào,\n\nMình muốn chia sẻ với bạn bài viết này:\n\n' + url;

                        var mailtoUrl = 'mailto:?subject=' + encodeURIComponent(subject) + '&body=' + encodeURIComponent(body);
                        window.location.href = mailtoUrl;
                    }

        </script>

        <div class="offcanvas offcanvas-end bg-white shadow" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel" style="width: 50%;">
            <!-- header bar -->
            <div class="offcanvas-header p-4 border-bottom">
                <h5 id="offcanvasRightLabel" class="mb-0">
                    <strong style="font-size: 18px">${sessionScope.list_comment.size()} bình luận</strong>
                    <p style="color: gray;font-size: 15px; font-style: italic">(Nếu thấy bình luận spam , các bạn bấm report giúp mình nhé)</p>
                </h5>
                <button type="button" class="btn-close d-flex align-items-center text-dark" data-bs-dismiss="offcanvas" aria-label="Close"><i class="uil uil-times fs-4"></i></button>
            </div>

            <!-- New feed -->
            <div class="offcanvas-body p-4 px-md-5">
                <div class="row">
                    <c:if test="${customer != null || admin != null || sales != null || expert != null || marketing != null}">
                        <div class="col-12">
                            <!-- Form Comment -->
                            <form action="insertComment" method="post" id="commentForm">
                                <div class="form-group">
                                    <c:if test="${customer != null || admin != null || sales != null || expert != null || marketing != null}">
                                        <img src="${customer != null ? customer.getImage() : (admin != null ? admin.getImage() : (sales != null ? sales.getImage() : (expert != null ? expert.getImage() : marketing.getImage())))}" 
                                             class="avatar avatar-md-sm rounded-circle border shadow" alt="avatar" style="margin-right: 10px;">
                                    </c:if>
                                    <div id="inputContainer" style="width: 100%">
                                        <input type="text" name="commentInput" class="form-control comment input-field" style="border-top: 0px; border-left: 0px;border-right: 0px;" placeholder="Nhập bình luận của bạn">
                                    </div>
                                    <div id="textareaContainer" style="display: none; width: 100%">
                                        <textarea name="comment" id="editor" class="form-control comment textarea-field" placeholder="Nhập bình luận của bạn"></textarea>
                                    </div>
                                </div>
                                <div class="button-container">
                                    <button type="button" id="cancelButton" class="btn btn-soft-light" style="margin-right: 5px; border-radius: 20px; width: 70px; display: none">Hủy</button>
                                    <button type="submit" id="submitButton" class="btn btn-danger" style="border-radius: 20px; width: 120px; display: none" disabled>Bình luận</button>
                                </div>
                                <input type="hidden" name="id" value="${sessionScope.id_blog}"/>
                            </form>

                            <script>
                                document.addEventListener('DOMContentLoaded', function () {
                                    const inputContainer = document.getElementById('inputContainer');
                                    const textareaContainer = document.getElementById('textareaContainer');
                                    const inputField = inputContainer.querySelector('.input-field');
                                    const textareaField = textareaContainer.querySelector('.textarea-field');
                                    const cancelButton = document.getElementById('cancelButton');
                                    const commentButton = document.getElementById('submitButton');
                                    const commentForm = document.getElementById('commentForm');
                                    let tinymceEditor;

                                    inputField.addEventListener('focus', function () {
                                        inputContainer.style.display = 'none';
                                        textareaContainer.style.display = 'block';
                                        cancelButton.style.display = 'inline-block';
                                        commentButton.style.display = 'inline-block';
                                    });

                                    cancelButton.addEventListener('click', function () {
                                        textareaField.value = '';
                                        inputContainer.style.display = 'block';
                                        textareaContainer.style.display = 'none';
                                        cancelButton.style.display = 'none';
                                        commentButton.style.display = 'none';
                                        commentForm.reset();
                                        commentButton.disabled = true;
                                    });

                                    commentButton.addEventListener('click', function () {
                                        commentForm.submit();
                                    });

                                    //TinyMCE for comment
                                    tinymce.init({
                                        selector: 'textarea#editor, textarea#editor2',
                                        width: '100%',
                                        height: '300px',
                                        menubar: false,
                                        plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount',
                                        toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table | align lineheight | numlist bullist indent outdent | emoticons charmap | removeformat',
                                        images_upload_url: '/F8_Group6/upload',
                                        images_upload_handler: function (blobInfo, success, failure) {
                                            var xhr, formData;
                                            xhr = new XMLHttpRequest();
                                            xhr.withCredentials = false;
                                            xhr.open('POST', '/F8_Group6/upload');
                                            xhr.onload = function () {
                                                var json;
                                                if (xhr.status != 200) {
                                                    failure('HTTP Error: ' + xhr.status);
                                                    return;
                                                }
                                                json = JSON.parse(xhr.responseText);
                                                if (!json || typeof json.location != 'string') {
                                                    failure('Invalid JSON: ' + xhr.responseText);
                                                    return;
                                                }
                                                success(json.location);
                                            };
                                            formData = new FormData();
                                            formData.append('file', blobInfo.blob(), blobInfo.filename());
                                            xhr.send(formData);
                                        },
                                        setup: function (editor) {
                                            editor.on('input', function () {
                                                updateCommentButtonState();
                                            });
                                        }
                                    });

                                    function updateCommentButtonState() {
                                        const inputContent = inputField.value.trim();
                                        const editorContent = tinymce.get('editor').getContent().trim();
                                        if (inputContent !== '' || editorContent !== '') {
                                            commentButton.disabled = false; // Enable the button if input or editor has content
                                        } else {
                                            commentButton.disabled = true; // Disable the button if both input and editor are empty
                                        }
                                    }
                                    updateCommentButtonState();
                                });
                            </script>
                        </div>
                    </c:if>

                    <c:forEach var="c" items="${sessionScope.list_comment}">
                        <c:if test="${c.getLevel() == 1}">
                            <div class="col-12 mt-5" style="display: flex;">
                            </c:if>

                            <c:if test="${c.getLevel() == 1}">
                                <a href="userProfile?uid=${c.getUserID()}">
                                    <img src="${c.getUser_image()}" class="avatar avatar-md-sm rounded-circle border shadow" alt="avatar">
                                </a>       
                            </c:if>

                            <div>
                                <c:if test="${c.getLevel() == 1}">
                                    <div class="show-comment" style="margin-left: 16px; border-radius: 10px; padding-right: 230px;">
                                        <a href="userProfile?uid=${c.getUserID()}" style="color: #333333">
                                            <div style="font-weight: bold">${c.getUser_comment()}</div>
                                        </a>
                                        <div><p >${c.getContent()}</p></div>
                                    </div>
                                    <c:if test="${customer != null || admin != null || sales != null || expert != null || marketing != null}">
                                        <div class="mt-2" style="margin-left: 21px;cursor: pointer; font-size: 13px"> 
                                            <a style="color: #ff6600;text-decoration: none;" onclick="likeComment('${c.getBlogCommmentID()}_like',${c.getNumberLike()}, '${c.getBlogCommmentID()}_like_action', 'display_${c.getBlogCommmentID()}',${sessionScope.user_id})" id="${c.getBlogCommmentID()}_like_action"> Thích </a>.  
                                            <a onclick="toggleElement('${c.getBlogCommmentID()}')" id="${c.getBlogCommmentID()}_comment" style="color: #ff6600;text-decoration: none;"> Trả lời </a> 
                                            . 
                                            <span style="color: gray" id="${c.getBlogCommmentID()}_publish"></span>  
                                            <c:if test="${expert.getUserID() == c.getUserID() || customer.getUserID() == c.getUserID()
                                                          || admin.getUserID() == c.getUserID() || sales.getUserID() == c.getUserID()
                                                          || marketing.getUserID() == c.getUserID()}">
                                                  <a href="#" class="text-muted title p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                      . <i class="fas fa-ellipsis-h"></i>
                                                  </a>                                                                   
                                                  <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">

                                                      <a class="dropdown-item text-dark" href="#"            
                                                         <span class="mb-0 d-inline-block me-1">
                                                          <i class="uil uil-comment-edit align-middle h6"></i>
                                                          </span> Sửa bình luận
                                                      </a>
                                                      <a class="dropdown-item text-dark" href="#"            
                                                         <span class="mb-0 d-inline-block me-1">
                                                          <i class="uil uil-comment-slash align-middle h6"></i>
                                                          </span> Xóa bình luận
                                                      </a>

                                                  </div>
                                            </c:if>
                                            <span  style="float: right;${c.getNumberLike() == 0 ? 'display:none':''}" id="display_${c.getBlogCommmentID()}"><i class="fa fa-thumbs-up"  style="color: blue"></i>&nbsp;<span id="${c.getBlogCommmentID()}_like">${c.getNumberLike()}</span></span>
                                        </div>
                                    </c:if>
                                    <c:if test="${customer == null && admin == null && sales == null && expert == null && marketing == null}">
                                        <div class="mt-2" style="margin-left: 21px;cursor: pointer; font-size: 13px">        
                                            <span style="color: gray" id="${c.getBlogCommmentID()}_publish"></span>  
                                            <a href="#" class="text-muted title p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                . <i class="fas fa-ellipsis-h"></i>
                                            </a>                                                                   
                                            <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">

                                                <a class="dropdown-item text-dark" href="#"            
                                                   <span class="mb-0 d-inline-block me-1">
                                                    <i class="uil uil-exclamation-octagon align-middle h6"></i>
                                                    </span> Báo cáo bình luận
                                                </a>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:if>

                                <c:if test="${c.getLevel() == 2}">
                                    <div style="display: flex;margin-left: 50px;" class="mt-4">
                                        <a href="userProfile?uid=${c.getUserID()}">
                                            <img src="${c.getUser_image()}" class="avatar avatar-md-sm rounded-circle border shadow" alt="avatar">
                                        </a>
                                        <div>
                                            <div class="reply" style="margin-left: 16px; border-radius: 10px; padding-right: 60px; padding-bottom: 20px">
                                                <a href="userProfile?uid=${c.getUserID()}" style="color: #333333">
                                                    <div style="font-weight: bold">${c.getUser_comment()}</div>
                                                </a>
                                                <div><c:if test="${c.getReply_to_user() != c.getUserID()}"><span style="font-weight: bold;color: #009999">${c.getReply_to()}</span>&ensp;</c:if> <span >${c.getContent()}</span></div>
                                                </div>
                                            <c:if test="${customer != null || admin != null || sales != null || expert != null || marketing != null}">
                                                <div class="mt-2" style=";margin-left: 21px;cursor: pointer;font-size: 13px">
                                                    <a style="color: #ff6600;text-decoration: none;" onclick="likeComment('${c.getBlogCommmentID()}_like',${c.getNumberLike()}, '${c.getBlogCommmentID()}_like_action', 'display_${c.getBlogCommmentID()}',${sessionScope.user_id})" id="${c.getBlogCommmentID()}_like_action"> Thích </a>. 
                                                    <a onclick="toggleElement('${c.getBlogCommmentID()}')" id="${c.getBlogCommmentID()}_comment" style="color: #ff6600;text-decoration: none;"> Trả lời </a>
                                                    . 
                                                    <span style="color: gray" id="${c.getBlogCommmentID()}_publish"></span>
                                                    <c:if test="${expert.getUserID() == c.getUserID() || customer.getUserID() == c.getUserID()
                                                                  || admin.getUserID() == c.getUserID() || sales.getUserID() == c.getUserID()
                                                                  || marketing.getUserID() == c.getUserID()}">
                                                          <a href="#" class="text-muted title p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                              . <i class="fas fa-ellipsis-h"></i>
                                                          </a>                                                                   
                                                          <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">

                                                              <a class="dropdown-item text-dark" href="#"            
                                                                 <span class="mb-0 d-inline-block me-1">
                                                                  <i class="uil uil-comment-edit align-middle h6"></i>
                                                                  </span> Sửa bình luận
                                                              </a>
                                                              <a class="dropdown-item text-dark" href="#"            
                                                                 <span class="mb-0 d-inline-block me-1">
                                                                  <i class="uil uil-comment-slash align-middle h6"></i>
                                                                  </span> Xóa bình luận
                                                              </a>

                                                          </div>
                                                    </c:if>
                                                    <span style="float: right;${c.getNumberLike() == 0 ? 'display:none':''}" id="display_${c.getBlogCommmentID()}"><i class="fa fa-thumbs-up"  style="color: blue"></i>&nbsp;<span id="${c.getBlogCommmentID()}_like">${c.getNumberLike()}</span></span>
                                                </div>
                                            </c:if>
                                            <c:if test="${customer == null && admin == null && sales == null && expert == null && marketing == null}">
                                                <div class="mt-2" style="margin-left: 21px;cursor: pointer; font-size: 13px">        
                                                    <span style="color: gray" id="${c.getBlogCommmentID()}_publish"></span>  
                                                    <a href="#" class="text-muted title p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        . <i class="fas fa-ellipsis-h"></i>
                                                    </a>                                                                   
                                                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">

                                                        <a class="dropdown-item text-dark" href="#"            
                                                           <span class="mb-0 d-inline-block me-1">
                                                            <i class="uil uil-exclamation-octagon align-middle h6"></i>
                                                            </span> Báo cáo bình luận
                                                        </a>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>

                                </c:if>
                                <!-- Form Reply Comment -->
                                <div id="${c.getBlogCommmentID()}" class="mt-3" style="display: none;margin-left: 50px;width: 95%;">
                                    <form action="insertComment" method="post">
                                        <div style="display: flex">
                                            <c:if test="${customer != null || admin != null || sales != null || expert != null || marketing != null}">
                                                <img src="${customer != null ? customer.getImage() : (admin != null ? admin.getImage() : (sales != null ? sales.getImage() : (expert != null ? expert.getImage() : marketing.getImage())))}" 
                                                     class="avatar avatar-md-sm rounded-circle border shadow" alt="avatar">
                                            </c:if>
                                            <input type="hidden" name="id" value="${sessionScope.id_blog}"/>
                                            <input type="hidden" name="id_comment" value="${c.origin_comment_id}"/>
                                            <input type="hidden" name="reply_id" value="${c.getUserID()}"/>
                                            <div style="width: 100%; margin-left: 10px">
                                                <textarea name="comment" id="editor2" class="form-control comment textarea-field" placeholder="Nhập bình luận của bạn"></textarea>
                                            </div>
                                        </div>
                                        <div style="margin-top: 10px">
                                            <button type="submit" id="submitButtonReply" class="btn btn-danger" style="border-radius: 20px; width: 90px; float: right">Trả lời</button>
                                            <button type="button" onclick="toggleElement('${c.getBlogCommmentID()}')"  id="cancelButtonReply" class="btn btn-soft-light" style="margin-right: 5px; border-radius: 20px; width: 70px; float: right">Hủy</button>
                                        </div>
                                    </form>
                                </div>
                                <!-- Form Edit Comment -->
                                <div id="${c.getBlogCommmentID()}" class="mt-3" style="display: none;margin-left: 50px;width: 95%;">
                                    <form action="insertComment" method="post">
                                        <div style="display: flex">
                                            <c:if test="${customer != null || admin != null || sales != null || expert != null || marketing != null}">
                                                <img src="${customer != null ? customer.getImage() : (admin != null ? admin.getImage() : (sales != null ? sales.getImage() : (expert != null ? expert.getImage() : marketing.getImage())))}" 
                                                     class="avatar avatar-md-sm rounded-circle border shadow" alt="avatar">
                                            </c:if>
                                            <input type="hidden" name="id" value="${sessionScope.id_blog}"/>
                                            <input type="hidden" name="id_comment" value="${c.origin_comment_id}"/>
                                            <input type="hidden" name="reply_id" value="${c.getUserID()}"/>
                                            <div style="width: 100%; margin-left: 10px">
                                                <textarea name="comment" id="editor2" class="form-control comment textarea-field" placeholder="Nhập bình luận của bạn"></textarea>
                                            </div>
                                        </div>
                                        <div style="margin-top: 10px">
                                            <button type="submit" id="submitButton" class="btn btn-danger" style="border-radius: 20px; width: 90px; float: right">Trả lời</button>
                                            <button type="button" onclick="toggleElement('${c.getBlogCommmentID()}')"  id="cancelButton" class="btn btn-soft-light" style="margin-right: 5px; border-radius: 20px; width: 70px; float: right">Hủy</button>
                                        </div>
                                    </form>
                                </div>
                                <script>
                                    function likeComment(param, total, choosen, display_zero, user_id) {
                                        var likeAction = document.getElementById(param);
                                        var choose = document.getElementById(choosen);
                                        var zr = document.getElementById(display_zero);
                                        var comment_id = param.split('_')[0];
                                        var action = '';
                                        if (likeAction.textContent == total) {
                                            likeAction.textContent = total + 1;
                                            choose.style.color = 'blue';

                                            if (likeAction.textContent >= 1)
                                                zr.style.display = 'block';
                                            action = 'like';

                                        } else {
                                            likeAction.textContent = total;
                                            choose.style.color = '#ff6600';

                                            if (likeAction.textContent == 0)
                                                zr.style.display = 'none';
                                            action = 'unlike';

                                        }

                                        var xhr = new XMLHttpRequest();

                                        var servletUrl = "LikeComment?user_id=" + encodeURIComponent(user_id) + "&comment_id=" + encodeURIComponent(comment_id) + "&action=" + encodeURIComponent(action);

                                        xhr.open("GET", servletUrl, true);
                                        xhr.send();
                                    }
                                    function toggleElement(param) {
                                        const textareaField = textareaContainer.querySelector('.textarea-field');
                                        var content = document.getElementById(param);
                                        if (content.style.display === 'none') {
                                            content.style.display = 'block'; // Khi ẩn, hiển thị nội dung
                                        } else {
                                            textareaField.value = '';
                                            content.style.display = 'none'; // Khi hiển thị, ẩn nội dung
                                        }
                                    }
                                    ;
                                    // Lấy thời gian hiện tại
                                    var currentTime = new Date();
                                    var publishTime = new Date("${c.getPublish()}");// Lấy thời gian được publish
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
                                    var publishSpan = document.getElementById("${c.getBlogCommmentID()}_publish");
                                    publishSpan.textContent = timeAgo;

                                </script>
                            </div>
                            <c:if test="${c.level == 1}">
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div><!-- Header -->
    </body>
</html>
