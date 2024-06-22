<%-- 
    Document   : Emp_Dahsboard
    Created on : Jun 2, 2024, 4:30:43 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="Model.Emp_Account" %>
<%@ page session="true" %>
<!DOCTYPE html>
<!--=== Coding by CodingLab | www.codinglabweb.com === -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="Assets/CSS/Emp_CaNhan.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
     
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
  <%
  Emp_Account account = (Emp_Account) session.getAttribute("account");
  if (account == null) {
      response.sendRedirect("Emp_Login.jsp");
  }
  %>
  <div class="container light-style flex-grow-1 container-p-y">
  <h4 class="font-weight-bold py-3 mb-4">
      Account settings
  </h4>
  <div class="card overflow-hidden">
      <div class="row no-gutters row-bordered row-border-light">
          <div class="col-md-3 pt-0">
              <div class="list-group list-group-flush account-settings-links">
                  <a class="list-group-item list-group-item-action active" data-toggle="list"
                      href="#account-general">Tổng quan</a>
                  <a class="list-group-item list-group-item-action" data-toggle="list"
                      href="#account-info">Thông tin</a>
                  <a class="list-group-item list-group-item-action" data-toggle="list"
                      href="#account-change-password">Đổi mật khẩu</a>
              </div>
          </div>

          <div class="col-md-9">
              <div class="tab-content">
                  <div class="tab-pane fade active show" id="account-general">
                      <div class="card-body media align-items-center">
                          <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt
                              class="d-block ui-w-80">
                          <div class="media-body ml-4">
                              <label class="btn btn-outline-primary">
                                  Upload new photo
                                  <input type="file" class="account-settings-fileinput">
                              </label> &nbsp;
                              <div class="text-light small mt-1">Allowed JPG, GIF or PNG. Max size of 800K</div>
                          </div>
                      </div>
                      <hr class="border-light m-0">
                      <div class="card-body">
                          <div class="form-group">
                              <label class="form-label">Username</label>
                              <input name="taikhoan" type="text" class="form-control mb-1" value="<%= account.getTaikhoan() %>">
                          </div>
                          <div class="form-group">
                              <label class="form-label">Họ tên</label>
                              <input name="tenadmin" type="text" class="form-control" value="<%= account.getHoten() %>">
                          </div>
                          <div class="form-group">
                              <label class="form-label">E-mail</label>
                              <input name="email" type="email" class="form-control mb-1" value="<%= account.getEmail() %>">
                          </div>
                          <div class="form-group">
                              <label class="form-label">Công ty</label>
                              <input type="text" class="form-control" value="Nhom4-TopsMarket." readonly>
                          </div>
                      </div>
                  </div>
                  <div class="tab-pane fade" id="account-change-password">
                      <div class="card-body pb-2">
                          <form action="Emp_CaNhanServlet" method="post" onsubmit="return validatePassword()">
                          <div class="form-group">
                              <label class="form-label">E-mail</label>
                              <input name="email" type="email" class="form-control mb-1" value="<%= account.getEmail() %>" readonly>
                          </div>
                          <div class="form-group">
                              <label class="form-label">Mật khẩu hiện tại</label>
                              <input name="matkhau" type="password" class="form-control" value="<%= account.getMatkhau() %>">
                          </div>
                          <div class="form-group">
                              <label class="form-label">Mật khẩu mới</label>
                              <input id="newmk" name="newmk" type="password" class="form-control" required>
                          </div>
                          <div class="form-group">
                              <label class="form-label">Xác nhận Mật khẩu mới</label>
                              <input id="xnmk" name="xnmk" type="password" class="form-control" required>
                          </div>
                          <div style="color: red; font-size: 12px; text-align: center">
                                      ${errorMessage}
                          </div>
                          <div class="text-right mt-3" style="padding: 0px 10px 20px 5px">
                          <button type="submit" class="btn btn-primary">Lưu thay đổi</button>&nbsp;
                          <button type="button" class="btn btn-default">Hủy</button>
                          </div>
                          </form>
                      </div>
                  </div>
                  <div class="tab-pane fade" id="account-info">
                      <div class="card-body pb-2">
                          <div class="form-group">
                              <label class="form-label">Giới tính</label>
                              <input type="text" class="form-control" value="<%= account.getGioitinh() %>">
                          </div>
                          <div class="form-group">
                              <label class="form-label">Ngày sinh</label>
                              <input type="date" class="form-control" value="<%= account.getNgaysinh() %>">
                          </div>
                          <div class="form-group">
                              <label class="form-label">Chức vụ</label>
                              <input type="text" class="form-control" value="<%= account.getChucvu() %>">
                          </div>
                          <div class="form-group">
                              <label class="form-label">Địa chỉ</label>
                              <input type="text" class="form-control" value="<%= account.getDiachi() %>">
                          </div>
                          <div class="form-group">
                              <label class="form-label">Ngày vào làm</label>
                              <input type="date" class="form-control" value="<%= account.getNgaybatdau() %>">
                          </div>
                      </div>
                      <hr class="border-light m-0">
                      <div class="card-body pb-2">
                          <h6 class="mb-4">Liên Hệ</h6>
                          <div class="form-group">
                              <label class="form-label">Số điện thoại</label>
                              <input type="number" class="form-control" value="<%= account.getSdt() %>">
                          </div>
                          <div class="form-group">
                              <label class="form-label">Website</label>
                              <input type="text" class="form-control" value="WWW.Nhom4.com/TopsMarket" readonly>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
</div>
</section>
    <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">
    </script>
    <script>
    function validatePassword() {
        var password = document.getElementById("newmk").value;
        var confirmPassword = document.getElementById("xnmk").value;

        if (password != confirmPassword) {
            alert("Mật khẩu và mật khẩu xác nhận không giống nhau!");
            return false;
        }
        return true;
    }
    </script>
    <script src="Assets/JavaScript/Emp_DahsboardJS.js"></script>
</body>
</html>