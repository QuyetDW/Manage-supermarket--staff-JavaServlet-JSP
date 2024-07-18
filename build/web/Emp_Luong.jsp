<%-- 
    Document   : Emp_ChamCong
    Created on : Jun 7, 2024, 5:43:59 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="Model.Emp_Account" %>
<%@ page session="true" %>
<%@page import ="Model.Emp_Luong"%>
<%@page import ="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!----======== CSS ======== -->
   
    <link rel="stylesheet" href="Assets/CSS/Adm_ChamCongCSS.css">
     
    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
             <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <link rel="stylesheet" href="style.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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

            <%
                Emp_Account account = (Emp_Account) session.getAttribute("account");
                    if (account == null) {
                        response.sendRedirect("Emp_Login.jsp");
                    }
            %>
            <div class="search-box">
                <form style="display: flex; align-items: center; " action="empluongservlet" method="post">
                    <button class="btn_timkiem" type="submit">Xem</button>
                    <input type="hidden" name="searchName" value="<%= account.getManv()%>">
                    
                </form>
            </div>
            
            <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt
            class="d-block ui-w-85">
        </div>
                <div class="body" style="margin-top: 40px;">
            <div class="container" style="width: 100%;">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Lương</h2>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Mã</th>
                                <th>Mã NV</th>
                                <th>Ngày</th>
                                <th>Lương Cơ Bản</th>
                                <th>Lương Theo Giờ</th>
                                <th>Số Giờ Làm</th>
                                <th>Số Ngày Nghỉ</th>
                                <th>Lương Thưởng</th>
                                <th>Tổng Lương</th>
                            </tr>
                        </thead>
                        <tbody>
                                                        <%
                            List<Emp_Luong> nv =(List<Emp_Luong>)request.getAttribute("dateL");
                                if(nv != null){
                                    for(Emp_Luong i : nv){
                                        int id =i.getId_luong();
                            %>
                            <tr>
                                <td><%= id%></td>
                                <td><%= i.getManv()%></td>
                                <td><%= i.getNgayluong()%></td>
                                <td><%= i.getLuongcoban()%></td>
                                <td><%= i.getLuongtheogio()%></td>
                                <td><%= i.getSogiolam()%></td>
                                <td><%= i.getSongaynghi()%></td>
                                <td><%= i.getLuongthuong()%></td>
                                <td><%= i.getLuongtong()%></td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>

    <script src="Assets/JavaScript/Emp_DahsboardJS.js"></script>
</body>
</html>