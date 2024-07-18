<%-- 
    Document   : Adm_qlChamCong
    Created on : Jun 7, 2024, 5:42:20 PM
    Author     : ADMIN
--%>
<%@page import ="Model.Emp_Luong"%>
<%@page import ="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="Assets/CSS/Adm_ChamCongCSS.css">
     
    <!----===== Iconscout CSS ===== -->
    
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
         <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <link rel="stylesheet" href="style.css">
      
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Admin Dashboard Panel</title> 
        <script type="text/javascript">
            function doDelete(id) {
                document.getElementById("idnv").value = id;
            }
            function fillEditForm(id, manv,ngay, luongcoban, luongtheogio, sogiolam, songaynghi, luongthuong) {
                document.getElementById('maluong').value = id;
                document.getElementById('manv').value = manv;
                 document.getElementById('ngayluong').value = ngay;
                document.getElementById('luongcoban').value = luongcoban;
                document.getElementById('luongtheogio').value = luongtheogio;
                document.getElementById('sogiolam').value = sogiolam;
                document.getElementById('songaynghi').value = songaynghi;
                document.getElementById('luongthuong').value = luongthuong;
            }
            function showAlert() {
                alert("Dữ liệu đã được xóa thành công!");
            }
            function showThongBao() {
                alert("Không Tìm Thấy Nhân Viên Này!");
            }
            function showThem() {
                alert("Cập nhật lương thành công!");
            }
            var deleteSuccess = <%= session.getAttribute("deleteSuccess") %>;
            if (deleteSuccess === true) {
                showAlert();
                <% session.removeAttribute("deleteSuccess"); %>
            }      
            var thongbao = <%= session.getAttribute("thongbao") %>;
            if (thongbao === true) {
                showThongBao();
                <% session.removeAttribute("thongbao"); %>
            }
            var tinhluong = <%= session.getAttribute("tinhluong") %>;
            if (tinhluong === true) {
                showThem();
                <% session.removeAttribute("tinhluong"); %>
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
                <form style="display: flex; align-items: center;" action="admluongservlet" method="post">
                    <i class="uil uil-search"></i>
                    <input type="search" name="searchName" placeholder="Search here...">
                    <button class="btn_timkiem" type="submit">Search</button>
                </form>
            </div>
            
            <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt
                class="d-block ui-w-85">
        </div>

        <div class="body" style="margin-top: 40px;">
            <div class="container" style="width: 100%;">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Chấm Công</h2>
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
                                <th>Thao Tác</th>
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
                                <td>
                                    <a href="#editEmployeeModal" class="edit" data-toggle="modal"
                                        onclick="fillEditForm('<%= id %>', '<%= i.getManv() %>','<%= i.getNgayluong()%>', '<%= i.getLuongcoban() %>', '<%= i.getLuongtheogio() %>', '<%= i.getSogiolam() %>', '<%= i.getSongaynghi() %>', '<%= i.getLuongthuong() %>')">
                                        <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                    </a>
                                     <a href="#deleteEmployeeModal" onclick="doDelete('<%= id%>')"  class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                 
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
            <a href="#addEmployeeModal" style="background-color: rgb(27, 173, 173);    font-size: 14px;color: rgb(255, 255, 255);padding: 4px 18px;outline: none;border: none;" class="btn btn-success" data-toggle="modal"> <span>Tính Lương</span></a>
                <%!
                    public String formatCurrency(int number) {
                        java.text.DecimalFormat df = new java.text.DecimalFormat("#,### VND");
                        return df.format(number);
                    }
                %>
            <h4 style="color: red; font-family: monospace">Tổng Lương:<%= formatCurrency((int) request.getAttribute("tongLuong")) %></h4>
            <div id="addEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="empluongservlet" method="get">
                            <div class="modal-header">
                                <h4 class="modal-title">Tính lương</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Mã Nhân Viên</label>
                                    <input type="number" name="manv" class="form-control" required />
                                </div>
                                <div class="form-group">
                                
                                    <input type="hidden" id="ngayCoDinh" class="form-control"  name="ngay" required>
                                </div>
                                <div class="form-group">
                                    <input type="hidden" value="60000" id="luongcb" name="luongcoban" class="form-control" required />
                                </div>
                                <div class="form-group">
                                    <input type="hidden" value="28000" name="luongtheogio" class="form-control" required />
                                </div>
                                <div class="form-group">
                                    <label>Số ngày nghỉ</label>
                                    <input type="number" class="form-control" name="songaynghi" required />
                                </div>
                                <div class="form-group">
                                    <label>Lương thưởng</label>
                                    <input type="number" class="form-control" name="luongthuong" required />
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel" />
                                <input type="submit" class="btn btn-success" value="Tính" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Edit Modal HTML -->
            <div id="editEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="updateForm" action="admupdateLluongServlet" method="post">
                            <div class="modal-header">
                                <h4 class="modal-title">Update Lương</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <input type="hidden"  id="maluong" name="maluong" class="form-control" required />
                                </div>
                                <div class="form-group">
                                    <input type="hidden" id="manv" name="manv" class="form-control" required />
                               </div>
                                <div class="form-group">
                                    <input type="hidden" id="ngayluong" name="ngay" class="form-control" required />
                                </div>
                                <div class="form-group">
                                    <label>Lương Cơ Bản</label>
                                    <input type="number" id="luongcoban" name="luongcoban" class="form-control" required />
                                </div>
                                <div class="form-group">
                                    <label>Lương Theo Giờ</label>
                                    <input type="number" id="luongtheogio" name="luongtheogio" class="form-control" required />
                                </div>
                                <div class="form-group">
                                    <input type="hidden" id="sogiolam" name="sogiolam" class="form-control" required />
                                </div>
                                <div class="form-group">
                                    <label>Số ngày nghỉ</label>
                                    <input type="number" id="songaynghi" name="songaynghi" class="form-control" required />
                                </div>
                                <div class="form-group">
                                    <label>Lương Thưởng</label>
                                    <input type="number" id="luongthuong" name="luongthuong" class="form-control" required />
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel" />
                                <input type="submit" class="btn btn-info" value="Lưu" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Delete Modal HTML -->
            <div id="deleteEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="admdeleteluongServlet" method="post">
                            <div class="modal-header">
                                <h4 class="modal-title">Delete Lương</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <p>Bạn Có Chắc Muốn Xóa Không?</p>
                                <p class="text-warning"><small>Nếu Xóa Sẽ Không Thể Khôi Phực Lại.</small></p>
                                <input type="hidden" id="idnv" name="idNV">
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel" />
                                <input type="submit" class="btn btn-danger" value="Delete" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
        <script>
            var currentDate = new Date();
            var year = currentDate.getFullYear();
            var month = (currentDate.getMonth() + 1).toString().padStart(2, '0'); // Lấy tháng và thêm số 0 phía trước nếu cần
            var day = currentDate.getDate().toString().padStart(2, '0'); // Lấy ngày và thêm số 0 phía trước nếu cần
            var formattedDate = year + '-' + month + '-' + day;
            document.getElementById('ngayCoDinh').value = formattedDate;
           
        </script>
        <script src="Assets/JavaScript/Adm_DahsboardJS.js"></script>
  </body>
</html>

