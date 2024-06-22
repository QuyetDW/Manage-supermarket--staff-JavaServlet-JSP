<%-- 
    Document   : Adm_qlChamCong
    Created on : Jun 7, 2024, 5:42:20 PM
    Author     : ADMIN
--%>
<%@page import ="Model.Emp_ChamCong"%>
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
        

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Admin Dashboard Panel</title> 
        <script type="text/javascript">
            function doDelete(id) {
                document.getElementById("idnv").value = id;
            }
            function fillEditForm(id, maNV, ngay, giovao, giora) {
                document.getElementById('id_chamcong').value = id;
                document.getElementById('maNV').value = maNV;
                document.getElementById('ngay').value = ngay;
                document.getElementById('giovao').value = giovao;
                document.getElementById('giora').value = giora;
            }
            function showAlert() {
            alert("Dữ liệu đã được xóa thành công!");
            }

            
            var deleteSuccess = <%= session.getAttribute("deleteSuccess") %>;
            if (deleteSuccess === true) {
                showAlert();
                <% session.removeAttribute("deleteSuccess"); %>
            }
            
            function showSua(){
                alert("Dữ liệu sửa thành công");
            }
            var suaChamCong = <%= session.getAttribute("suathanhcong") %>;
            if (suaChamCong === true) {
                showSua();
                <% session.removeAttribute("suathanhcong"); %>
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
                <form style="display: flex; align-items: center;" action="admchamcongservlet" method="post">
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
                                <th>Mã </th>
                                <th>Mã NV</th>
                                <th>Họ Tên</th>
                                <th>Ngày</th>
                                <th>Giờ Vào</th>
                                <th>Giờ Ra</th>
                                <th>Số giờ làm</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Emp_ChamCong> nv =(List<Emp_ChamCong>)request.getAttribute("dataCC");
                                if(nv != null){
                                    for(Emp_ChamCong i : nv){
                                        int id =i.getId_chamcong(); 
                                        int maNV = i.getNhanVien().getManv();
                                        String hoTen = i.getNhanVien().getHoten();
                            %>
                            <tr>
                                <td><%= id%></td>
                                <td><%= maNV%></td>
                                <td><%= hoTen%></td>
                                <td><%= i.getNgay()%></td>
                                <td><%= i.getGiovao()%></td>
                                <td><%= i.getGiora()%></td>
                                <td><%= i.getSogiolam()%></td>
                                <td>
                                    <a href="#editEmployeeModal" onclick="fillEditForm('<%= id %>', '<%= maNV %>', '<%= i.getNgay() %>', '<%= i.getGiovao() %>', '<%= i.getGiora() %>')" class="edit" data-toggle="modal">
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
                        <!--sua-->
            <div id="editEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="updateForm" action="admupdatechamcongServlet" method="post">
                            <div class="modal-header">
                                <h4 class="modal-title">Update Chấm Công</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <input type="hidden" id="id_chamcong" name="id_chamcong" class="form-control" required />
                                </div>
                                <div class="form-group">
                                    <input type="hidden" id="maNV" name="maNV" class="form-control" required />
                                </div>
                                <div class="form-group"> 
                                    <input type="hidden" id="ngay" name="ngay" class="form-control" required />
                                </div>
                                <div class="form-group">
                                    <label>Giờ vào</label>
                                    <input type="text" id="giovao" name="giovao" class="form-control" required />
                                </div>
                                <div class="form-group">
                                    <label>Giờ ra</label>
                                    <input type="text" id="giora" name="giora" class="form-control" required />
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel" />
                                <input type="submit" class="btn btn-info" value="Save" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Delete Modal HTML -->
            <div id="deleteEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="admdeletechamcongServlet" method="post">
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

    <script src="Assets/JavaScript/Adm_DahsboardJS.js"></script>
</body>
</html>

