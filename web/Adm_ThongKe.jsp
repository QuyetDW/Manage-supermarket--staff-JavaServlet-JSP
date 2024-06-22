<%-- 
    Document   : Adm_Dahsboard
    Created on : Jun 2, 2024, 7:26:39 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="Assets/CSS/Adm_ThongKeCSS.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
     
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
    <h1 style="text-align: center">BIỂU ĐỒ THỐNG KÊ NHÂN VIÊN</h1>
    <h4>Tổng Số Nhân Viên: <%= request.getAttribute("totalNhanVien") %></h4>

    <canvas id="myChart" width="400px" height="200px"></canvas>
    <script>
        // Lấy dữ liệu từ request attribute
        var chucVuData = {};
        <%
            Map<String, Integer> chucVuCount = (Map<String, Integer>) request.getAttribute("chucVuCount");
            for (Map.Entry<String, Integer> entry : chucVuCount.entrySet()) {
                out.println("chucVuData['" + entry.getKey() + "'] = " + entry.getValue() + ";");
            }
        %>

        // Chuyển đổi dữ liệu sang dạng mảng
        var labels = Object.keys(chucVuData);
        var data = Object.values(chucVuData);

        // Cấu hình biểu đồ
        var ctx = document.getElementById('myChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Số lượng nhân viên',
                    data: data,
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
    
    <br><br><br><br>
    <h2 style="text-align: center">BIỂU ĐỒ THỐNG KÊ ĐƠN NGHỈ PHÉP</h2>
    <br><br>
    <canvas id="pieChart" width="200px" height="200px" ></canvas>
    <script>
        fetch('Adm_ReportServlet')
            .then(response => response.json())
            .then(data => {
                const labels = [];
                const counts = [];

                data.data.forEach((item, index) => {
                    labels.push(item.trangthai);
                    counts.push(item.count);
                });

                const ctx = document.getElementById('pieChart').getContext('2d');
                new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: labels,
                        datasets: [{
                            data: counts,
                            backgroundColor:  [
                                'rgba(255, 99, 132, 0.8)',
                                'rgba(54, 162, 235, 0.8)',
                                'rgba(255, 205, 86, 0.8)',
                                'rgba(75, 192, 192, 0.8)'
                                ],
                            borderColor: '#fff',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                position: 'top'
                            },
                            tooltip: {
                                callbacks: {
                                    label: function (context) {
                                        let label = context.label || '';
                                        if (label) {
                                            label += ': ';
                                        }
                                        label += context.raw;
                                        return label;
                                    }
                                }
                            }
                        }
                    }
                });
            })
            .catch(error => console.error('Error:', error));
    </script>
   
    </section>

    <script src="Assets/JavaScript/Adm_DahsboardJS.js"></script>
</body>
</html>