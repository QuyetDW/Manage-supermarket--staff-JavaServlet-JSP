<%-- 
    Document   : Update_NghiPhep
    Created on : Jun 6, 2024, 6:50:34 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Sửa nghỉ phép</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" />

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet" />
</head>
<style>
.container-fluiid {
    line-height: 50px;
    border: 1px solid black;
    width: 700px;
    box-shadow: 3px 3px 7px black;
    height: 500px;
    overflow: scroll;
    border-radius: 5px;
}
</style>

<body class="bg-gradient-primary">
    <div class="container">
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Duyệt Nghỉ Phép</h1>
                            </div>
                            <form action="update" method="post">
                                <div class="form-group">
                                    <label for="">ID</label>
                                    <input type="text" name="id" class="form-control"
                                           value="${st.id}" readonly="">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="">Mã nhân viên</label>
                                        <input type="text" name="manv" class="form-control"
                                            value="${st.manv}" readonly="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="">Ngày nghỉ</label>
                                        <input type="text" name="ngaynghi" class="form-control"
                                            value="${st.ngaynghi}" readonly="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="">Lý do</label>
                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"
                                            name="lydo"
                                            value="${st.lydo}" readonly=""/>
                                    </div>
                                </div><br>
                                            <div class="col-md-3">
                                            <label for="validationDefault04" class="form-label">Tình Trạng Đơn</label>
                                            <select class="form-select" id="validationDefault04" name="trangthai" required>
                                              <option selected disabled value="${st.trangthai}">Trạng thái...</option>
                                              <option>Từ Chối Duyệt</option>
                                              <option>Đang Duyệt Đơn</option>
                                              <option>Đã Duyệt Đơn</option>
                                            </select>
                                          </div><br>
                                <button name="btn_update" class="btn btn-success" type="submit" onclick="showMess(${st.id})">Sửa nghỉ phép</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script>
    function  showMess(id){
        var option = confirm("Bạn có chắc chắn duyệt đơn xin nghỉ?");
        if(option === true){
            window.location.href = "update?sid="+id;
        }
    }
</script>
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
</body>
