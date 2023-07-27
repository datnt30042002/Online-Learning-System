<%-- 
    Document   : sidebar
    Created on : Jun 23, 2023, 5:06:15 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="card-body">
    <!-- SEARCH -->
    <div class="widget mb-4 pb-2">
        <h5 class="widget-title">CÁC CHỦ ĐỀ ĐƯỢC ĐỀ XUẤT</h5>
        <div class="tagcloud mt-4">
            <c:forEach var="t" items="${topics}">
                <c:choose>
                    <c:when test="${empty param.tag}">
                        <a href="bloglist?topic=${t.getBlogTopicID()}"
                           class="rounded ${t.getBlogTopicID() == topic ? 'active' : ''}">
                            ${t.getBlogTopicName()}
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="bloglist?topic=${t.getBlogTopicID()}&amp;tag=${param.tag}"
                           class="rounded ${t.getBlogTopicID() == topic ? 'active' : ''}">
                            ${t.getBlogTopicName()}
                        </a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </div>
    <!-- SEARCH -->

    <!-- RECENT POST -->
    <div class="widget mb-4 pb-2">
        <h5 class="widget-title">CÁC BÀI VIẾT MỚI NHẤT</h5>
        <div class="mt-4">
            <c:forEach var="n" items="${news}">
                <div class="clearfix post-recent">
                    <div class="post-recent-thumb float-start"> <a href="blogview?id=${n.getBlogID()}"> <img alt="img" style="height: 55px" src="assets/images/blog/${n.getBlogImage()}" class="img-fluid rounded"></a></div>
                    <div class="post-recent-content float-start"><a href="blogview?id=${n.getBlogID()}">${n.getBlogTitle()}</a><span class="text-muted mt-2">
                            <script>
                                var postDate = new Date("${n.getPostDate()}");
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
                        </span></div>
                </div>
            </c:forEach>
        </div>
    </div>
    <!-- RECENT POST -->

    <!-- TAG CLOUDS -->
    <div class="widget mb-4 pb-2">
        <h5 class="widget-title">CÁC THẺ ĐƯỢC ĐỀ XUẤT</h5>
        <div class="tagcloud mt-4">
            <c:forEach var="t" items="${tags}">
                <c:choose>
                    <c:when test="${empty param.topic}">
                        <a href="bloglist?tag=${t.getBlogTagID()}"
                           class="rounded ${t.getBlogTagID() == tag ? 'active' : ''}">
                            ${t.getBlogTagName()}
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="bloglist?tag=${t.getBlogTagID()}&amp;topic=${param.topic}"
                           class="rounded ${t.getBlogTagID() == tag ? 'active' : ''}">
                            ${t.getBlogTagName()}
                        </a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </div>
</div>
