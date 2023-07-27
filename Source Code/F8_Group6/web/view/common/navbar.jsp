<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : navbar
    Created on : May 19, 2023, 9:47:55 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Nav Bar -->
<head>
    <style>
        .col-xl-2 {
            flex: 0 0 auto;
            width: 130px;
        }

        .sidebar-nav .navbar-item .navbar-link {
            width: 80px;
        }
    </style>
</head>
<ul class="list-unstyled sidebar-nav mb-0">
    <br>
    <li class="navbar-item"><a href="home" class="btn btn navbar-link" style="font-size: 11px;"><i class="ri-home-8-line align-middle navbar-icon"></i><br>Home</a></li>
    <li class="navbar-item"><a href="programTraining" class="btn btn navbar-link" style="font-size: 11px;"><i class="ri-calendar-check-line align-middle navbar-icon"></i><br>Lộ trình</a></li>
    <li class="navbar-item"><a href="coursePublic" class="btn btn navbar-link" style="font-size: 11px;"><i class="ri-projector-line align-middle navbar-icon"></i><br>Học</a></li>
    <li class="navbar-item"><a href="bloglist" class="btn btn  navbar-link" style="font-size: 11px;"><i class="ri-pages-line align-middle navbar-icon"></i><br>Blog</a></li>
</ul>
<!-- Nav Bar -->