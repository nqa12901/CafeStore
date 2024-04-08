<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Order" %>
<%@ page import="utils.CurrencyService" %>
<%@ page import="model.ProductInCart" %>
<%@ page import="model.User" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <script src="https://kit.fontawesome.com/628d1a6561.js" crossorigin="anonymous"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Linh Coffee - For The Good Teacher</title>
        <link rel="shortcut icon" href="resources/Banner/d.png" type="image/x-icon"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </head>

    <% User user = (User) session.getAttribute("user");%>

    <style>

        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Màu đen với độ mờ 0.5 */
            z-index: 6; /* Đặt z-index thấp hơn popup nhưng cao hơn nền */
            pointer-events: none; /* Vô hiệu hóa các sự kiện chuột trên overlay */
        }

        /* Style for the button */
        .popup-btn {
            background-color: #e07c51;
            border: none;
            color: white;
            padding: 10px 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 8px;
            white-space: nowrap;
        }

        /* Style for the popup */
        .popup {
            display: none;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            z-index: 10;
        }

        /* Style for the popup content */
        .popup-content {
            background-color: #fefefe;
            margin: 10% auto;
            padding: 20px;
            border: none; /* Remove border */
            width: 80%;
            border-radius: 8px;
        }

        /* Style for closing the popup */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
    <style>
        body {
            color: #566787;
            background: white;
            font-size: 13px;
        }

        .table-responsive {
            margin: 30px 0;
        }

        .table-wrapper {
            min-width: 1000px;
            background: #fff;
            padding: 20px 25px;
            border-radius: 3px;
            box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
        }

        .table-wrapper .btn {
            float: right;
            color: #333;
            background-color: #fff;
            border-radius: 3px;
            border: none;
            outline: none !important;
            margin-left: 10px;
        }

        .table-wrapper .btn:hover {
            color: #333;
            background: #f2f2f2;
        }

        .table-wrapper .btn.btn-primary {
            color: #fff;
            background: #333;
        }

        .table-wrapper .btn.btn-primary:hover {
            background: #333;
        }

        .table-title .btn {
            font-size: 13px;
            border: none;
        }

        .table-title .btn i {
            float: left;
            font-size: 21px;
            margin-right: 5px;
        }

        .table-title .btn span {
            float: left;
            margin-top: 2px;
        }

        .table-title {
            color: #646464;
            padding: 16px 25px;
            margin: -20px -25px 10px;
            border-radius: 3px 3px 0 0;
        }

        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }

        .show-entries select.form-control {
            width: 60px;
            margin: 0 5px;
        }

        .table-filter .filter-group {
            float: right;
            margin-left: 15px;
        }

        .table-filter input, .table-filter select {
            height: 34px;
            border-radius: 3px;
            border-color: #ddd;
            box-shadow: none;
        }

        .table-filter {
            padding: 5px 0 15px;
            border-bottom: 1px solid #e9e9e9;
            margin-bottom: 5px;
        }

        .table-filter .btn {
            height: 34px;
        }

        .table-filter label {
            font-weight: normal;
            margin-left: 10px;
        }

        .table-filter select, .table-filter input {
            display: inline-block;
            margin-left: 5px;
        }

        .table-filter input {
            width: 200px;
            display: inline-block;
        }

        .filter-group select.form-control {
            width: 110px;
        }

        .filter-icon {
            float: right;
            margin-top: 7px;
        }

        .filter-icon i {
            font-size: 18px;
            opacity: 0.7;
        }

        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
            padding: 12px 15px;
            vertical-align: middle;
        }

        table.table tr th:first-child {
            width: 60px;
        }

        table.table tr th:last-child {
            width: 80px;
        }

        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }

        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }

        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }

        table.table td a {
            font-weight: bold;
            color: #566787;
            display: inline-block;
            text-decoration: none;
        }

        table.table td a:hover {
            color: #646464;
        }

        table.table td a.view {
            width: 30px;
            height: 30px;
            color: #646464;
            border: 2px solid;
            border-radius: 30px;
            text-align: center;
        }

        table.table td a.view i {
            font-size: 22px;
            margin: 2px 0 0 1px;
        }

        table.table .avatar {
            border-radius: 50%;
            vertical-align: middle;
            margin-right: 10px;
        }

        .status {
            font-size: 30px;
            margin: 2px 2px 0 0;
            display: inline-block;
            vertical-align: middle;
            line-height: 10px;
        }

        .deliverd {
            color: #10c469;
        }

        .shipped {
            color: #62c9e8;
        }

        .pending {
            color: #FFC107;
        }

        .cancelled {
            color: #ff5b5b;
        }

        .processing {
            color: #941989;
        }

        .pagination {
            float: right;
            margin: 0 0 5px;
        }

        .pagination li a {
            border: none;
            font-size: 13px;
            min-width: 30px;
            min-height: 30px;
            color: #999;
            margin: 0 2px;
            line-height: 30px;
            border-radius: 2px !important;
            text-align: center;
            padding: 0 6px;
        }

        .pagination li a:hover {
            color: #666;
        }

        .pagination li.active a {
            background: #03A9F4;
        }

        .pagination li.active a:hover {
            background: #0397d6;
        }

        .pagination li.disabled i {
            color: #ccc;
        }

        .pagination li i {
            font-size: 16px;
            padding-top: 6px
        }

        .hint-text {
            float: left;
            margin-top: 10px;
            font-size: 13px;
        }
    </style>
    <!-- Top-bar -->
    <%  ArrayList<ProductInCart> cart = new ArrayList<>();
        if (session.getAttribute("cart") != null) {
            cart = (ArrayList<ProductInCart>) session.getAttribute("cart");
        }
    %>
    <style>

        .top-bar {
            display: flex;
            justify-content: space-between;
            background-color: #ffffff;
            color: #020202;
            padding: 5px;
            align-items: center;
            position: relative;
            z-index: 2;
        }

        .phone-icon {
            font-size: 15px;
            margin-right: 5px;
        }

        .phone-number {
            margin-right: auto;
            color: #e07c51;
            font-size: 14px;
            line-height: 22px;
            font-weight: 600;
        }

        .text-highlight {
            text-decoration: none;
            color: black;
            font-size: 14px;
            line-height: 22px;
            font-weight: 600;
            position: relative;
            z-index: 3;
        }

        .top-bar .text-highlight:hover {
            text-decoration: none;
            color: #e07c51;
            font-size: 14px;
            line-height: 22px;
            font-weight: 600;

            z-index: 3;
        }

        .btn.dropdown-toggle {
            color: black;
            text-decoration: none;
            font-size: 14px;
            line-height: 22px;
            font-weight: 600;
            background-color: transparent !important;
            border: none !important;

        }

        .btn.dropdown-toggle:focus {

            color: #e07c51;
            text-decoration: none;
            font-size: 14px;
            line-height: 22px;
            font-weight: 600;
            background-color: transparent !important;
            border: none !important;
            outline: none;
        !important;
            box-shadow: none !important;
        }

        .btn.dropdown-toggle:hover {

            color: #e07c51;
            text-decoration: none;
            font-size: 14px;
            line-height: 22px;
            font-weight: 600;
            background-color: transparent !important;
            border: none !important;
            outline: none;
        }

        .dropdown-toggle::after {
            display: none !important;
        }

        .cart-count {
            position: absolute;
            top: -8px; /* Điều chỉnh vị trí theo y để số lượng được hiển thị bên trong biểu tượng */
            right: -8px; /* Điều chỉnh vị trí theo x để số lượng được hiển thị bên trong biểu tượng */
            background-color: #e07c51; /* Màu nền */
            color: white; /* Màu chữ */
            border-radius: 50%; /* Bo tròn viền */
            width: 20px; /* Độ rộng */
            height: 20px; /* Chiều cao */
            text-align: center; /* Căn giữa nội dung */
            line-height: 20px; /* Chỉnh chiều cao dòng */
            font-size: 12px; /* Kích thước chữ */
        }

        .user-cart-container {
            display: flex;
            align-items: center;
            margin-right: 80px;
        }

        .user-cart-container .text-highlight {
            margin-right: 2px;
        }

    </style>



    <div class="top-bar">
        <span class="phone-icon">&#128222;</span>
        <span class="phone-number">Order: 0936 849 516</span>
        <div class="user-cart-container">
            <% if (user == null) { %>
            <a href="login" class="text-highlight">Login</a>
            <% } else { %>
            <div class="d-flex align-items-center">
                <div class="dropdown text-highlight">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <%= user.getLast_name() + " " + user.getFirst_name()%>
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="./info"><i class="fa-solid fa-user"></i>&#160  Thông tin tài khoản</a>
                        <a class="dropdown-item" href="./user-order"><i class="fa-solid fa-cart-shopping"></i>&#160  Đơn mua</a>
                        <a class="dropdown-item" href="./logout"><i class="fa-solid fa-right-from-bracket"></i>&#160  Đăng xuất</a>
                    </div>
                </div>
                <a href="./cart" class="text-highlight" style="font-size: 24px; position: relative;">
                    <i class="fa-solid fa-cart-shopping"></i>
                    <div class="cart-count" id="cartCount">0</div>
                </a>
            </div>
            <% } %>
        </div>
    </div>



    <script src="script.js"></script>
    <script>

        // Số lượng sản phẩm trong giỏ hàng được lưu trong biến cartItemCount
        var cartItemCount = <%= cart.size() %>; // Đổi số lượng sản phẩm ở đây

        // Cập nhật số lượng sản phẩm trong biểu tượng giỏ hàng
        function updateCartCount() {
            var cartCountElement = document.getElementById('cartCount');
            cartCountElement.textContent = cartItemCount;

            // Ẩn phần tử cart-count nếu số lượng sản phẩm là 0
            if (cartItemCount === 0) {
                cartCountElement.style.display = 'none';
            } else {
                cartCountElement.style.display = 'block'; // Hiển thị phần tử nếu số lượng sản phẩm không phải là 0
            }
        }

        // Cập nhật số lượng sản phẩm khi trang được tải
        document.addEventListener('DOMContentLoaded', function () {
            updateCartCount();
        });

    </script>


    <%-- Navbar --%>
    <style>
        .navbar {
            z-index: 1;
        }
        .navbar-nav .nav-link {
            margin-right: 10px;
            margin-left: 10px;
        }

        .navbar .navbar-nav .nav-link:hover {
            transition: 0.3s ease;
            color: #e07c51;
            font-size: 14px;
            line-height: 22px;
            font-weight: 600;
        }

        .navbar .navbar-nav .nav-link {
            transition: 0.3s ease;
            color: black;
            font-size: 14px;
            line-height: 22px;
            font-weight: 600;
        }

        .dropdown:hover > .dropdown-menu {
            display: block;
            transition: 0.3s ease;
        }


    </style>

    <nav class="navbar navbar-expand-lg navbar-light navbar-custom sticky-top"
         style="height: 60px; background-color: rgba(255, 255, 255, 0.8)">
        <!-- Container wrapper -->
        <div class="container-fluid">
            <!-- Toggle button -->
            <button
                    class="navbar-toggler"
                    type="button"
                    data-mdb-toggle="collapse"
                    data-mdb-target="#navbarCenteredExample"
                    aria-controls="navbarCenteredExample"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
            >
                <i class="fas fa-bars"></i>
            </button>

            <!-- Collapsible wrapper -->
            <div
                    class="collapse navbar-collapse justify-content-center"
                    id="navbarCenteredExample"
            >
                <!-- Left links -->
                <a href="home"><img src="resources/Banner/Logo.png" width="200" height="40" alt=""></a>
                <ul class="navbar-nav">
                    <li class="navbar-item">
                        <a class="nav-link " href="./product?type=1" style="font-size: 14px; line-height: 22px">Cà phê</a>
                    </li>
                    <li class="navbar-item">
                        <a class="nav-link " href="./product?type=2" style="font-size: 14px; line-height: 22px">Trà</a>
                    </li>
                    <!-- Navbar dropdown -->
                    <li class="nav-item dropdown" href="login">
                        <a class="nav-link dropdown-toggle " id="navbarDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                           style="font-size: 14px; line-height: 22px">
                            Menu
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <!-- Dropdown items -->
                            <a class="dropdown-item" href="product" style="font-size: 14px; line-height: 22px">Tất
                                cả</a>
                        </div>
                    </li>
                    <li class="navbar-item">
                        <a class="nav-link " href="#" style="font-size: 14px;">Câu chuyện</a>
                    </li>
                    <li class="navbar-item">
                        <a class="nav-link " href="#" style="font-size: 14px; line-height: 22px">Cửa hàng</a>
                    </li>
                    <li class="navbar-item">
                        <a class="nav-link " href="#" style="font-size: 14px; line-height: 22px">Tuyển dụng</a>
                    </li>
                </ul>
                <!-- Left links -->
            </div>
            <!-- Collapsible wrapper -->
        </div>
        <!-- Container wrapper -->

    </nav>


    <%
        ArrayList<Order> orderList = (ArrayList<Order>) session.getAttribute("orderList");
        if (orderList != null) {
    %>
    <body>
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-4">
                                <h2>Lịch sử Đơn Hàng</h2>
                            </div>
                            <div class="col-sm-8">
                                <%--                                add ajax here--%>
                               
                            </div>
                        </div>
                    </div>
                    <div class="table-filter">
                        <div class="row">
                            <%--                            <div class="col-sm-3">--%>
                            <%--                                <div class="show-entries">--%>
                            <%--                                    <span>Show</span>--%>
                            <%--                                    <select class="form-control">--%>
                            <%--                                        <option>5</option>--%>
                            <%--                                        <option>10</option>--%>
                            <%--                                        <option>15</option>--%>
                            <%--                                        <option>20</option>--%>
                            <%--                                    </select>--%>
                            <%--                                    <span>entries</span>--%>
                            <%--                                </div>--%>
                            <%--                            </div>--%>
                            <div class="col-sm-12">
                                <button type="button" class="btn btn-primary"><i class="fa fa-search"></i></button>
                                <div class="filter-group">
                                    <label>Status</label>
                                    <select class="form-control">
                                        <option>Any</option>
                                        <option>Delivered</option>
                                        <option>Shipped</option>
                                        <option>Pending</option>
                                        <option>Cancelled</option>
                                    </select>
                                </div>
                                <span class="filter-icon"><i class="fa fa-filter"></i></span>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Order Date</th>
                                <th>Status</th>
                                <th>Net Amount</th>
                                <th>Shipping Method</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% int i = 0;
                                for (Order order : orderList) {
                            %>
                            <tr>
                                <td>#<%= i + 1%>
                                </td>
                                <td><%=order.getOrderDate()%>
                                </td>
                                <td><span class="status <%=order.getStatus()%>">&bull;</span> <%=order.getStatus()%>
                                </td>
                                <td><%=CurrencyService.formatPrice(order.getTotalMoney())%> VNĐ</td>
                                <td><%=order.getShippingMethod()%>
                                </td>

<%--                                <form action="./user-order" method="post">--%>
<%--                                        <input type="hidden" name="id" value="<%=order.getId()%>">--%>
<%--                                        <input type="hidden" name="ordinal-number" value="<%=i%>">--%>
<%--&lt;%&ndash;                                    <a class="view" title="View Details" data-toggle="tooltip"><i&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        class="material-icons">&#xE5C8;</i>&ndash;%&gt;--%>
<%--                                        <input type="submit" name="upvote" value="View detail" />--%>
<%--                                </form>--%>
                                <%--the overlay--%>
                                <div class="overlay" id="overlay" style="display: none;"></div>

                                <td><button class="popup-btn" onclick="openPopup('popup<%=i%>')">Chi tiết</button></td>

                                <!-- The popup -->
                                <div id="popup<%=i%>" class="popup" onclick="closePopup(event, 'popup<%=i%>')">

                                    <!-- Popup content -->
                                    <div class="popup-content">
                                        <span class="close" onclick="closePopup(event, 'popup<%=i%>')">&times;</span>
                                        <iframe src="./user-order?id=<%=order.getId()%>&ordinal-number=<%=i%>" style="width:100%; height:500px; border: none; border-radius: 8px;"></iframe>
                                    </div>

                                </div>
                                    <%i++;} %>
                        </tbody>
                    </table>
                    <div class="clearfix">
                        <ul class="pagination">
                            <li class="page-item disabled"><a href="#">Previous</a></li>
                            <li class="page-item active" style="z-index: 0"><a href="#" class="page-link">1</a></li>
                            <li class="page-item"><a href="#" class="page-link">Next</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        // Function to open the popup
        function openPopup(popupId) {
            document.getElementById('overlay').style.display = "block"; // Hiển thị overlay
            document.getElementById(popupId).style.display = "block";
        }

        // Function to close the popup
        function closePopup(event, popupId) {
            if (event.target.id === popupId) {
                document.getElementById('overlay').style.display = "none"; // Ẩn overlay
                document.getElementById(popupId).style.display = "none";
            }
        }
    </script>
    <% } %>
</html>