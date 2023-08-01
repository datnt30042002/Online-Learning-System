

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8" />
        <!-- favicon -->
        <link rel="shortcut icon" href="assets/images/logoF8.png">
        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Select2 -->
        <link href="assets/css/select2.min.css" rel="stylesheet" />
        <!-- Date picker -->
        <link rel="stylesheet" href="assets/css/flatpickr.min.css">
        <link href="assets/css/jquery.timepicker.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <script src="https://cdn.tiny.cloud/1/960h90rahv9jcykqywlacmvxqve30f5e9a1jn5id5msshl6a/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <style>
            .form-row {
                display: flex;
                flex-direction: column;
            }

            .form-row input[type="text"],
            .form-row textarea {
                width: 100%;
                border: none;
                outline: none;
            }

            .form-row input[type="text"] {
                height: 60px;
                font-size: 40px;
            }


            .preview-box {
                width: 100%; /* Set the width of the preview box */
                height: auto; /* Let the height adjust based on the image */
                text-align: center; /* Center the image horizontally */
                overflow: hidden; /* Hide any overflowing parts of the image */
            }

            .preview-content {
                max-width: 100%; /* Set a maximum width to prevent the image from exceeding the box width */
                max-height: 100%; /* Set a maximum height to prevent the image from exceeding the box height */
            }

        </style>



    </head>

    <body>       
        <%@include file="/view/common/header-back.jsp"%>
        <section class="bg-half-170 d-table w-100">
            <div class="container-fluid">
                <form action="blog" enctype="multipart/form-data" method="post" >
                    <div class="col-lg-12 text-end">
                        <input type="hidden" name="blogid" value="${Blog.getBlogID()}">
                        <button type="submit" class="btn btn-primary" name="action" value="save">Lưu Blog</button>
                        <button type="submit" class="btn btn-primary" name="action" value="publish">Xuất bản Blog</button>
                    </div><!--end col-->                                       
                    <div class="form-row">
                        <input name="title" type="text" value="" placeholder="Tiêu đề" required "><br>
                    </div>
                    <input type="hidden" name="date" id="currentTimeInput" value="">
                    <div class="d-grid">
                        <p class="text-muted">Tải ảnh blog của bạn ở đây, hãy nhấn vào nút "Tải ảnh lên"</p>
                        <div class="preview-box d-block justify-content-center rounded shadow overflow-hidden bg-light p-1"></div>
                        <input type="file" id="input-file" name="image" accept="image/*" onchange="handleChange()" hidden />
                        <label class="btn-upload btn btn-primary mt-4" for="input-file">Tải ảnh lên</label>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Thẻ</label>
                        <select class="form-control" name="tag" id="tagSelect" title="Chọn thẻ cho blog">
                            <c:forEach items="${tList}" var="i">
                                <option value="${i.getBlogTagID()}">${i.getBlogTagName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Chủ Đề</label>
                        <select class="form-control" name="topic" id="topicSelect" title="Chọn chủ đề cho blog">
                            <c:forEach items="${tpList}" var="i">
                                <option value="${i.getBlogTopicID()}">${i.getBlogTopicName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-row">
                        <textarea name="texttitle" id="editor"></textarea>
                    </div>  
                  
                </form>
            </div> 
        </section>
        <%@include file="/view/common/footer.jsp"%>

        <!-- javascript -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/select2.init.js"></script>

        <script src="assets/js/flatpickr.min.js"></script>
        <script src="assets/js/flatpickr.init.js"></script>

        <script src="assets/js/jquery.timepicker.min.js"></script> 
        <script src="assets/js/timepicker.init.js"></script>

        <script src="assets/js/feather.min.js"></script>

        <script src="assets/js/app.js"></script>

        <script>
                            tinymce.init({
                                selector: 'textarea#editor',
                                width: '100%',
                                height: '2000px',
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
                                }
                            });

        </script>

        <script>
            const handleChange = () => {
                const fileUploader = document.querySelector('#input-file');
                const getFile = fileUploader.files;
                if (getFile.length !== 0) {
                    const uploadedFile = getFile[0];
                    readFile(uploadedFile);
                }
            };

            const readFile = (uploadedFile) => {
                if (uploadedFile) {
                    const reader = new FileReader();
                    reader.onload = () => {
                        const parent = document.querySelector('.preview-box');
                        const img = document.createElement('img');
                        img.src = reader.result;
                        img.classList.add('preview-content');
                        img.onload = () => {
                            const parentWidth = parent.offsetWidth;
                            const imgWidth = img.width;
                            const imgHeight = img.height;

                            const scaleFactor = parentWidth / imgWidth;
                            const newWidth = imgWidth * scaleFactor;
                            const newHeight = imgHeight * scaleFactor;

                            img.style.width = `${newWidth}px`;
                            img.style.height = `${newHeight}px`;
                        };
                        parent.innerHTML = "";
                        parent.appendChild(img);
                    };
                    reader.readAsDataURL(uploadedFile);
                }
            };
        </script>
        <script>
            // Hàm này sẽ được gọi khi trang được load hoàn tất
           document.addEventListener("DOMContentLoaded", function () {
        // Lấy thẻ input có id "currentTimeInput"
        const currentTimeInput = document.getElementById("currentTimeInput");

        // Lấy thời gian hiện tại của hệ thống
        const now = new Date();

        // Định dạng thời gian theo yêu cầu (yyyy-MM-dd)
        const formattedTime = now.toISOString().slice(0, 10);

        // Gán giá trị thời gian vào thẻ input
        currentTimeInput.value = formattedTime;
    });
        </script>

    </body>
</html>
