<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : navbarSetting
    Created on : Jun 10, 2023, 7:53:24 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div>
    <nav id="sidebar" class="sidebar-wrapper">
        <div class="sidebar-content" data-simplebar style="height: calc(100% - 80px);">
            <div class="sidebar-brand"></div>
            <div class="sidebar-brand">
                <h5 style="color: #000 ;  font-family: inherit">CÀI ĐẶT</h5>
            </div>
            <c:choose>
                <c:when test="${customer != null}">
                    <ul class="sidebar-menu pt-3">
                        <li><a href="updateProfile?UserID=${customer.getUserID()}"><i class="uil uil-user me-2 d-inline-block"></i>Cài đặt tài khoản</a></li>
                        <li><a href="deleteUser?UserID=${sessionScope.customer.getUserID()}"><i class="uil uil-dashboard me-2 d-inline-block"></i>Bảo mật và đăng nhập</a></li>
                        <li><a href="notification"><i class="uil uil-window me-2 d-inline-block"></i>Thông báo</a></li>
                    </ul>
                </c:when>
                <c:when test="${admin != null}">
                    <ul class="sidebar-menu pt-3">
                        <li><a href="updateProfile?UserID=${admin.getUserID()}"><i class="uil uil-user me-2 d-inline-block"></i>Cài đặt tài khoản</a></li>
                        <li><a href="deleteUser?UserID=${sessionScope.admin.getUserID()}"><i class="uil uil-dashboard me-2 d-inline-block"></i>Bảo mật và đăng nhập</a></li>
                    </ul>
                </c:when>
                <c:when test="${expert != null}">
                    <ul class="sidebar-menu pt-3">
                        <li><a href="updateProfile?UserID=${expert.getUserID()}"><i class="uil uil-user me-2 d-inline-block"></i>Cài đặt tài khoản</a></li>
                        <li><a href="deleteUser?UserID=${sessionScope.expert.getUserID()}"><i class="uil uil-dashboard me-2 d-inline-block"></i>Bảo mật và đăng nhập</a></li>
                    </ul>
                </c:when>
                <c:when test="${sales != null}">
                    <ul class="sidebar-menu pt-3">
                        <li><a href="updateProfile?UserID=${sales.getUserID()}"><i class="uil uil-user me-2 d-inline-block"></i>Cài đặt tài khoản</a></li>
                        <li><a href="deleteUser?UserID=${sessionScope.sales.getUserID()}"><i class="uil uil-dashboard me-2 d-inline-block"></i>Bảo mật và đăng nhập</a></li>
                    </ul>
                </c:when>
                <c:when test="${marketing != null}">
                    <ul class="sidebar-menu pt-3">
                        <li><a href="updateProfile?UserID=${marketing.getUserID()}"><i class="uil uil-user me-2 d-inline-block"></i>Cài đặt tài khoản</a></li>
                        <li><a href="deleteUser?UserID=${sessionScope.marketing.getUserID()}"><i class="uil uil-dashboard me-2 d-inline-block"></i>Bảo mật và đăng nhập</a></li>
                    </ul>
                </c:when>
            </c:choose>
        </div>
    </nav>
</div>