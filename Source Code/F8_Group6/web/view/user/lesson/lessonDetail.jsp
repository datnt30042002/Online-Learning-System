<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : lesson
    Created on : May 19, 2023, 10:06:03 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello Lesson Detail List</h1>

<!--        <video width="320" height="240" controls>
            <source src="assets/video/video2.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>

        <form action="upload.jsp" method="post" enctype="multipart/form-data">
            <input type="file" name="videoFile">
            <input type="submit" value="Tải lên">
        </form>-->

        <p>Lesson detail nay la cua Lesson ID nao, cai nay thi don gian</p>
        <c:forEach items="${LessonDetailList}" var="c">
<!--            <p>${c.getLessonDetailID()}</p>
            <p>${c.getTitle()}</p>
            <p>name of link video : ${c.getVideo()}</p>
            <video width="320" height="240" controls>
                <source src="${c.getVideo()}" type="video/mp4">
            </video>
            <p>${c.getNote()}</p>
            <p>${c.getTime()}</p>
            <p>${c.getLesson_LessonID()}</p>
            <p>${c.getDicuss_DicussID()}</p>  -->

            <!-- Xem chi tiết Video Lesson Detail by ID -->
            <p>
                <a href="videoLesson?LessonDetailID=${c.getLessonDetailID()}" class="btn btn-warning">${c.getTitle()}</a>
            </p>

        </c:forEach>
 
            <br>
            <p>Menu Lesson Detail</p>
            <a href="lessonDetailManager"> Lesson Detial Manager</a>
    </body>
</html>
