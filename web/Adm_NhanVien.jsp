<%-- 
    Document   : Adm_Dahsboard
    Created on : Jun 2, 2024, 7:26:39 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!--=== Coding by CodingLab | www.codinglabweb.com === -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="Assets/CSS/Adm_NhanVien.css">
     
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
                <form action="Adm_searchNhanVienServlet" method="get">
                <i class="uil uil-search"></i>
                <input name="searchName" id="searchName" type="text" placeholder="Search here...">
                </form>
            </div>
            <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt
                class="d-block ui-w-85">
        </div>
        
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Quản lý <b>Nhân viên</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Employee</span></a>
                            <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>MNV</th>
                            <th>Họ Tên</th>
                            <th>Ngày sinh</th>
                            <th>Giới tính</th>
                            <th>SDT</th>
                            <th>Email</th>
                            <th>Chức vụ</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    
                        <c:forEach items="${nvs}" var="x">
                        <tr>
                            <td>${x.manv}</td>
                            <td>${x.hoten}</td>
                            <td>${x.ngaysinh}</td>
                            <td>${x.gioitinh}</td>
                            <td>${x.sdt}</td>
                            <td>${x.email}</td>
                            <td>${x.chucvu}</td>
                            <td>
                            <a href="javascript:void(0);" onclick="editEmployee('${x.manv}', '${x.hoten}', '${x.ngaysinh}', '${x.gioitinh}', '${x.sdt}', '${x.email}', '${x.chucvu}')" class="edit"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                            <a href="javascript:void(0);" onclick="deleteEmployee('${x.manv}')" class="delete"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                        </td>
                        </tr>
                        </c:forEach>
                    
                </table>
                
                <div class="clearfix">
                    <div class="hint-text">Showing <b>20</b> out of <b>100</b> entries</div>
                    <ul class="pagination">
                        <li class="page-item"><a href="#">Previous</a></li>
                        <li class="page-item active"><a href="#" class="page-link">1</a></li>
                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                        <li class="page-item"><a href="#" class="page-link">3</a></li>
                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Add Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="Adm_insertNhanVienServlet" method="post">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Employee</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Họ tên</label>
                                <input name="hoten" type="text" class="form-control" required />
                            </div>
                            <div class="form-group">
                                <label>Ngày sinh</label>
                                <input name="ngaysinh" type="date" class="form-control" required />
                            </div>
                            <div class="form-group">
                                <label>Giới tính</label>
                                <input name="sex" type="text" class="form-control" required />
                            </div>
                            <div class="form-group">
                                <label>Địa chỉ</label>
                                <input name="dc" type="text" class="form-control" required />
                            </div>
                            <div class="form-group">
                                <label>Số điện thoại</label>
                                <input name="sdt" type="number" class="form-control" required />
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input name="email" type="email" class="form-control" required />
                            </div>
                            <div class="form-group">
                                <label>Chức vụ</label>
                                <input name="chucvu" type="text" class="form-control" required />
                            </div>
                            <div class="form-group">
                                <label>Ngày vào làm</label>
                                <input name="nvl" type="date" class="form-control" required />
                            </div>
                            <div class="form-group">
                                <label>Tài khoản</label>
                                <input name="tk" type="text" class="form-control" required />
                            </div>
                            <div class="form-group">
                                <label>Mật khẩu</label>
                                <input name="matkhau" type="text" class="form-control" required />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel" />
                            <input type="submit" class="btn btn-success" value="Add" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
         <div id="editEmployeeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="Adm_updateNhanVienServlet" method="post">
                    <input type="hidden" name="manv" />
                    <div class="modal-header">
                        <h4 class="modal-title">Chỉnh sửa nhân viên</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Họ tên</label>
                            <input name="hoten" type="text" class="form-control" required />
                        </div>
                        <div class="form-group">
                            <label>Ngày sinh</label>
                            <input name="ngaysinh" type="date" class="form-control" required />
                        </div>
                        <div class="form-group">
                            <label>Giới tính</label>
                            <input name="gioitinh" type="text" class="form-control" required />
                        </div>
                        <div class="form-group">
                            <label>Số điện thoại</label>
                            <input name="sdt" type="number" class="form-control" required />
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input name="email" type="email" class="form-control" required />
                        </div>
                        <div class="form-group">
                            <label>Chức vụ</label>
                            <input name="chucvu" type="text" class="form-control" required />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy" />
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
                <form action="Adm_deleteNhanVienServlet" method="post">
                    <input type="hidden" name="manv" />
                    <div class="modal-header">
                        <h4 class="modal-title">Xóa nhân viên</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p>Bạn có chắc muốn xóa nhân viên này?</p>
                        <p class="text-warning"><small>Hành động này không thể hoàn tác.</small></p>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy" />
                        <input type="submit" class="btn btn-danger" value="Xóa" />
                    </div>
                </form>
            </div>
        </div>
    </div>
    </section>

    <script src="Assets/JavaScript/Adm_NhanVien.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        // JavaScript để mở modal chỉnh sửa
        function editEmployee(manv, hoten, ngaysinh, gioitinh, sdt, email, chucvu) {
            $('#editEmployeeModal input[name="manv"]').val(manv);
            $('#editEmployeeModal input[name="hoten"]').val(hoten);
            $('#editEmployeeModal input[name="ngaysinh"]').val(ngaysinh);
            $('#editEmployeeModal input[name="gioitinh"]').val(gioitinh);
            $('#editEmployeeModal input[name="sdt"]').val(sdt);
            $('#editEmployeeModal input[name="email"]').val(email);
            $('#editEmployeeModal input[name="chucvu"]').val(chucvu);
            $('#editEmployeeModal').modal('show');
        }

        // JavaScript để mở modal xóa
        function deleteEmployee(manv) {
            $('#deleteEmployeeModal input[name="manv"]').val(manv);
            $('#deleteEmployeeModal').modal('show');
        }
    </script>
</body>
</html>