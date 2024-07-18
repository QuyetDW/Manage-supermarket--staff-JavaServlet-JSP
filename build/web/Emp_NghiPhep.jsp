<%-- 
    Document   : Emp_Dahsboard
    Created on : Jun 2, 2024, 4:30:43 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import ="java.util.List"%>
<%@page import="Model.Emp_NghiPhep" %>
<!DOCTYPE html>
<!--=== Coding by CodingLab | www.codinglabweb.com === -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="Assets/CSS/Emp_ChamCongCSS.css">
     
    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

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
                    <span class="link-name">Logout</span>
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
        <h2 style="margin-top: 70px">Đơn xin nghỉ phép</h2>
       
            
            <form class="row g-3" action="add" method="post" style="margin-top: 60px; width: 100%">

          <div class="col-md-4">
            <label for="validationDefault02" class="form-label">Mã Nhân Viên</label>
            <input type="text" class="form-control" id="validationDefault02" name="manv" placeholder="Mời bạn nhập mã nhân viên..." required>
          </div>
          <div class="col-md-6">
            <label for="validationDefault03" class="form-label">Lý Do</label>
            <input type="text" class="form-control" id="validationDefault03" name="lydo" placeholder="Mời bạn nhập lý do..." required>
          </div>
          <div class="col-md-3">
            <label for="validationDefault05" class="form-label">Ngày Nghỉ</label>
            <input type="date" class="form-control" id="validationDefault05" name="ngaynghi" placeholder="Mời bạn nhập ngày nghỉ..." required>
          </div>
                <input value="Chưa được duyệt" name="trangthai" type="hidden">
          <div class="col-12">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="invalidCheck2" required>
              <label class="form-check-label" for="invalidCheck2">
                Tôi đồng ý với điểu khoản và điều kiện
              </label>
            </div>
          </div>
          <div class="col-12">
              <button class="btn btn-primary" type="submit"
                      onclick="return confirm('Xác nhận đơn xin nghỉ?');">Nộp đơn xin nghỉ</button>
          </div>
        </form>
            <table border="1" style="margin-top: 100px; padding: 5px; width: 100%" class="table">
            
        <thead class="table-dark">
            <tr>
                <th>Id</th>
                <th>Mã Nhân Viên</th>
                <th>Ngày Nghỉ</th>
                <th>Lý Do</th>
                <th>Tình Trạng Đơn</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${listS}" var="x" >
                <tr>
                    <td>${x.id}</td>
                    <td>${x.manv}</td>
                    <td>${x.ngaynghi}</td>
                    <td>${x.lydo}</td>
                    <td>${x.trangthai}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>      
    </section>

    <script src="Assets/JavaScript/Emp_DahsboardJS.js"></script>
</body>
</html>