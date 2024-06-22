<%-- 
    Document   : Emp_ChamCong
    Created on : Jun 7, 2024, 5:43:59 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="Model.Emp_Account" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="Assets/CSS/Emp_ChamCongCSS.css">
     
    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>Admin Dashboard Panel</title> 
    <script>
            function showCC(){
                alert("Chấm Công Thành Công!");
            }
            var suaChamCong = <%= session.getAttribute("chamcong") %>;
            if (suaChamCong === true) {
                showCC();
                <% session.removeAttribute("chamcong"); %>
            }
    </script>
</head>
<body>
    <nav>
        <div class="logo-name">
            <div class="logo-image">
                <img src="Assets/img/logo.png" alt="">
            </div>

            <span class="logo_name">TopsMarket</span>
        </div>

        <div class="menu-items">
            <ul class="nav-links">
                <li><a href="Emp_Dahsboard.jsp">
                    <i class="uil uil-estate"></i>
                    <span class="link-name">Dahsboard</span>
                </a></li>
                <li><a href="Emp_CaNhan.jsp">
                    <i class="uil uil-user"></i>
                    <span class="link-name">Cá Nhân</span>
                </a></li>
                <li><a href="Emp_ChamCong.jsp">
                    <i class="uil uil-notes"></i>
                    <span class="link-name">Chấm Công</span>
                </a></li>
                <li><a href="loads">
                    <i class="uil uil-file-check-alt"></i>
                    <span class="link-name">Nghỉ Phép</span>
                </a></li>
                <li><a href="Emp_Luong.jsp">
                    <i class="uil uil-usd-circle"></i>
                    <span class="link-name">Lương</span>
                </a></li>
            </ul>
            
            <ul class="logout-mode">
                <li><a href="Emp_Login.jsp">
                    <i class="uil uil-signout"></i>
                    <span class="link-name">Đăng xuất</span>
                </a></li>

                <li class="mode">
                    <a href="#">
                        <i class="uil uil-moon"></i>
                    <span class="link-name">Dark Mode</span>
                </a>

                <div class="mode-toggle">
                  <span class="switch"></span>
                </div>
            </li>
            </ul>
        </div>
    </nav>

    <section class="dashboard">
        <div class="top">
        <i class="uil uil-bars sidebar-toggle"></i>

        <div class="search-box">
            <i class="uil uil-search"></i>
            <input type="text" placeholder="Search here...">
        </div>
      
        <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt
            class="d-block ui-w-85">
        </div>

        <div
            <div class="chamcong">
                <p style="font-size: 40px;">Chấm công</p>
                <a href="">Trang chủ</a><span> / </span>
                <a href="">Chấm công</a>
                <a>${test}</a>
                <hr>
                <%
                Emp_Account account = (Emp_Account) session.getAttribute("account");
                    if (account == null) {
                        response.sendRedirect("Emp_Login.jsp");
                    }
                %>
                <div class="chamcong_container">
                    <div class="chamcong_container_head">
                        <p style="font-size: 20px; font-family: Arial, Helvetica, sans-serif;">Chấm công nhân viên</p>
                        <p style="color: rgb(133, 130, 130);">Điền đầy đủ thông tin</p>
                    </div>
                    <hr>
                    <div class="chamcong_container_body">
                        <form class="form_chamcong" action="empchamcongservlet" method="post">
                            <div class="form_head">
                                <p>Ngày</p>
                                <p>Giờ Vào</p>
                                <p>Giờ Ra</p>
                    
                            </div>
                            <div class="form_body">
                                <div>
                                    <input type="hidden" name="manv" value="<%= account.getManv()%>">
                                </div>                              
                                <div>
                                    <input type="date" id="ngay" readonly name="ngay" required>
                                </div>
                                <div>
                                    <input type="time"  name="giovao" placeholder="hh:mm AM or PM" required>
                                </div>
                                <div>
                                    <input type="time" name="giora" placeholder="hh:mm AM or PM" required>
                                </div>

                                <button class="btn_add" type="submit">Thêm</button>
                            </div>
                        </form>
                    </div>
                </div>
                <hr>
                <p style="text-align: center;">Ứng dụng quản lý nhân viên siêu thị</p>
            </div>
        </div>
    </section>

    <script src="Assets/JavaScript/Emp_DahsboardJS.js"></script>
    <script>
    var currentDate = new Date();
    var year = currentDate.getFullYear();
    var month = (currentDate.getMonth() + 1).toString().padStart(2, '0'); // Lấy tháng và thêm số 0 phía trước nếu cần
    var day = currentDate.getDate().toString().padStart(2, '0'); // Lấy ngày và thêm số 0 phía trước nếu cần
    var formattedDate = year + '-' + month + '-' + day;
    document.getElementById('ngay').value = formattedDate;
    </script>
</body>
</html>