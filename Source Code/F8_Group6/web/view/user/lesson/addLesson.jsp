<%-- 
    Document   : addLesson
    Created on : Jul 19, 2023, 9:10:59 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello Add Lesson</h1>

        <a href="lessonManager"> Lesson Manager </a> <br><br><br>
        
        <form action="addLesson" method="POST" class="mt-4">
            <div class="row">
                <div class="col-md-12">
                    <div class="mb-3">
                        <label class="form-label">Lesson ID</label>
                        <input id="lessonID" name="LessonID" type="text" class="form-control" placeholder="Lesson ID">
                    </div>
                </div><!--end col-->

                <div class="col-md-12">
                    <div class="mb-3">
                        <label class="form-label">Lesson Name</label>
                        <input name="LessonName" type="text" class="form-control" placeholder="Lesson Name" required="">
                    </div>
                </div><!--end col-->

                <div class="col-md-12">
                    <div class="mb-3">
                        <label class="form-label">Course ID</label>
                        <input name="CourseID" type="text" class="form-control" placeholder="Course ID" required="">
                    </div>
                </div><!--end col-->

                <p style="color: green">${messSuccess}</p> 
                <p style="color: red">${mess}</p>
                <button type="submit" class="btn btn-primary" onclick="generateLessonDetailID()">Them chuong moi</button>
            </div>
        </form>

    </body>
</html>
