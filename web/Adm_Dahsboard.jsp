<%-- 
    Document   : Adm_Dahsboard
    Created on : Jun 2, 2024, 7:26:39 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--=== Coding by CodingLab | www.codinglabweb.com === -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="Assets/CSS/Adm_DahsboardCSS.css">
     
    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>Admin Dashboard Panel</title> 
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
                <li><a href="Adm_Dahsboard.jsp">
                    <i class="uil uil-estate"></i>
                    <span class="link-name">Dahsboard</span>
                </a></li>
                <li><a href="Adm_CaNhan.jsp">
                    <i class="uil uil-user"></i>
                    <span class="link-name">Cá Nhân</span>
                </a></li>
                <li><a href="Adm_NhanVienServlet">
                    <i class="uil uil-users-alt"></i>
                    <span class="link-name">Nhân Viên</span>
                </a></li>
                <li><a href="admchamcongservlet">
                    <i class="uil uil-file-check-alt"></i>
                    <span class="link-name">QLy Chấm công</span>
                </a></li>
                <li><a href="load">
                    <i class="uil uil-file-check-alt"></i>
                    <span class="link-name">QLy Nghỉ phép</span>
                </a></li>
                <li><a href="admluongservlet">
                    <i class="uil uil-file-check-alt"></i>
                    <span class="link-name">QLy Lương</span>
                </a></li>
                <li><a href="Adm_ThongKeServlet">
                    <i class="uil uil-comparison"></i>
                    <span class="link-name">Thống Kê</span>
                </a></li>
            </ul>
            
            <ul class="logout-mode">
                <li><a href="Adm_Login.jsp">
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
            
            <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt
                class="d-block ui-w-85">
        </div>
        <br><br><br><br>
        <div class="banner">
            <img src="Assets/img/banner.png" alt="alt" style="width: 100%; height: 100%; object-fit: cover"/>
        </div>
    </section>
    
    

    <script src="Assets/JavaScript/Adm_DahsboardJS.js"></script>
</body>
</html>