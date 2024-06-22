<%-- 
    Document   : Adm_Login
    Created on : Jun 5, 2024, 3:29:13 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- ===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <!-- ===== CSS ===== -->
    <link rel="stylesheet" href="Assets/CSS/LoginAll.css">
         
    <title>Login & Registration Form</title> 
</head>
<body>

    <div class="container">
        <div class="forms">
            <div class="form login">
                <div style="color: red; font-size: 12px; text-align: center">
                            ${errorMessage}
                </div>
                <span class="title">Login Admin</span>
                <form action="Adm_LoginServlet" method="post">
                    <div class="input-field">
                        <input name="email" type="email" placeholder="Nhập email..." required>
                        <i class="uil uil-envelope icon"></i>
                    </div>
                    <div class="input-field">
                        <input name="matkhau" type="password" class="password" placeholder="Nhập mật khẩu..." required>
                        <i class="uil uil-lock icon"></i>
                        <i class="uil uil-eye-slash showHidePw"></i>
                    </div>

                    <div class="checkbox-text">
                        <div class="checkbox-content">
                            <input type="checkbox" id="logCheck">
                            <label for="logCheck" class="text">Lưu tài khoản</label>
                        </div>
                        
                        <a href="#" class="text">Quên mật khẩu?</a>
                    </div>

                    <div class="input-field button">
                        <input type="submit" value="Đăng nhập">
                    </div>
                    
                    <div class="login-signup">
                        <a href="index.html"><span class="text">Nhóm4_IT6_LoginAdmin</span></a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="Assets/JavaScript/Login.js"></script> 
</body>
</html>