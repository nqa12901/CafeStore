<%@ page import="model.User" %>
<%@ page import="model.ProductInCart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Product" %>
<%@ page import="utils.CurrencyService" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<!doctype html>
<html lang="en">
    <head>
        <script src="https://kit.fontawesome.com/628d1a6561.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="shortcut icon" href="resources/Banner/d.png" type="image/x-icon"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">
        <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/checkout/">

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous">
        <!-- Custom styles for this template -->
        <link href="form-validation.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Linh Coffee - For The Good Teacher</title>
    </head>

    <style>
        .delete-button:hover {
            color: #e07c51;
        }

        .delete-button {
            color: #86939E;
        }

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

        .navbar {
            border-bottom: 0.5px solid #bdbdbd;
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

        .product-list {
            flex: 7;
            float: left;
            border-left: 1px solid #bdbdbd; /* Màu và độ dày của thanh viền bên phải */
            padding-left: 35px; /* Khoảng cách từ nội dung đến thanh viền bên phải */
        }

        .home-container {
            display: flex;

        }

        .filter-container {
            flex: 2;
        }

        .category {
            text-decoration: none;
            color: #646464;
            font-size: 16px;
            line-height: 22px;
            font-weight: 600;
        }


        @media (max-width: 768px) {
            /* Khi cửa sổ có chiều rộng nhỏ hơn hoặc bằng 768px */
            .home-container .filter-container {
                margin-left: 0; /* Thiết lập lề trái về 0 */
            }

            .category {
                margin-right: 10px; /* Giảm lề phải của category khi cửa sổ thu nhỏ */
            }
        }

        .home-container .filter-container .category:hover {
            text-decoration: none;
            color: #e07c51;
            font-size: 16px;
            line-height: 22px;
            font-weight: 600;
            transition: 0.3s ease;
        }

        .sidebar a {
            display: block;
            color: #8e1414;
            text-align: left;
            padding: 0px 30px;
            text-decoration: none;
            transition: color 0.3s ease; /* Thêm hiệu ứng chuyển màu cho thẻ a */
        }

        .sidebar a:hover {
            text-decoration: none;
            color: #e07c51;
            font-size: 16px;
            line-height: 22px;
            font-weight: 600;
            transition: 0.3s;
        }

        /* Màu chữ mặc định */
        .card-title a {
            color: black;
            text-decoration: none; /* Loại bỏ gạch chân mặc định */
            display: block;
            word-wrap: break-word;
            max-width: 250px;
        }

        /* Màu chữ khi hover */
        .card-title a:hover {
            transition: 0.3s ease;
            color: #e07c51;
            display: block;
            word-wrap: break-word;
            max-width: 250px;
        }

        /* Phần viền chỉ bao quanh ảnh */
        .card {
            border: none;
            border-radius: 12px; /* Độ cong của góc */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-img-top {
            border-radius: 12px;
        }

        /* Loại bỏ phần viền của .card-body */
        .card-body {
            border: none;
        }

        button {
            border: none;
            background-color: transparent;
            padding: 10px; /* Optional: Set padding to adjust the button size */
            cursor: pointer;
            outline: none; /* Remove outline on focus (for better aesthetics) */
        }

        button:focus {
            outline: none;
        }

        .product-card {
            opacity: 0;
            transition: opacity 0.5s ease-in-out;
        }

        .product-card.show {
            opacity: 1;
        }

        .sticky {
            position: sticky;
            top: 70px;
            font-size: 20px;
        }

        .selected {
            color: #e07c51;
        }
    </style>
    <% User user = (User) session.getAttribute("user");%>
    <%
        ArrayList<ProductInCart> cart = (ArrayList<ProductInCart>) session.getAttribute("cart");
        if (cart == null) {
            response.sendRedirect("./home");
        }
    %>
    <% if (cart != null) { %>
    <body class="bg-light">
        <div class="top-bar">
            <span class="phone-icon">&#128222;</span>
            <span class="phone-number">Order: 0936 849 516</span>
            <div class="user-cart-container">
                <% if (user == null) { %>
                <a href="login" class="text-highlight">Đăng nhập</a>
                <% } else { %>
                <div class="d-flex align-items-center">
                    <a href="./cart" class="text-highlight" style="font-size: 24px; position: relative;">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <div class="cart-count" id="cartCount">0</div>
                    </a>
                    <div class="dropdown text-highlight">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <%= user.getLast_name() + " " + user.getFirst_name()%> &nbsp;&nbsp;
                            <img src="display-avatar?fileName=<%=user.getAvatar_url()%>" alt=""
                                 style="width: 35px; height: 35px; border-radius: 50%; object-fit: cover; border: #e07c51 1px solid">
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="./info"><i class="fa-solid fa-user"></i>&#160 Thông tin tài khoản</a>
                            <a class="dropdown-item" href="./user-order"><i class="fa-solid fa-cart-shopping"></i>&#160 Đơn
                                mua</a>
                            <a class="dropdown-item" href="./logout"><i class="fa-solid fa-right-from-bracket"></i>&#160
                                Đăng xuất</a>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>


        <nav class="navbar navbar-expand-lg navbar-light navbar-custom sticky-top"
             style="height: 60px; background-color: white">
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
                            <a class="nav-link " href="#" style="font-size: 14px; line-height: 22px">Cà phê</a>
                        </li>
                        <li class="navbar-item">
                            <a class="nav-link " href="#" style="font-size: 14px; line-height: 22px">Trà</a>
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

        <br>
        <br>

        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h4 class="mb-3">Thông tin giao hàng</h4>
                    <form class="needs-validation" method="POST" action="./cart" novalidate>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="firstName">Họ</label>
                                <input type="text" class="form-control" id="firstName" name="firstName" placeholder=""
                                       value="<%if (user != null) { %> <%=user.getFirst_name()%> <% } %>" required>
                                <div class="invalid-feedback">
                                    Yêu cầu họ hợp lệ.
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="lastName">Tên</label>
                                <input type="text" class="form-control" id="lastName" name="lastName" placeholder=""
                                       value="<% if (user != null) { %> <%=user.getLast_name()%> <% } %>" required>
                                <div class="invalid-feedback">
                                    Yêu cầu tên hợp lệ.
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="Address">Địa chỉ</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="address" name="address"
                                       placeholder="Address"
                                       value="<% if (user != null) { if (user.getAddress() != null) {  %> <%=user.getAddress()%> <% }} %>"
                                       required>
                                <div class="invalid-feedback" style="width: 100%;">
                                    Thêm địa chỉ giao hàng.
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="Note">Thêm hướng dẫn giao hàng</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="note" name="note" placeholder="Note">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="Number">Điện thoại</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="number" name="number" placeholder="Number"
                                       value="<%if (user != null) { if (user.getNumber() != null) { %> <%=user.getNumber()%> <% }} %>"
                                       required>
                                <div class="invalid-feedback" style="width: 100%;">
                                    Thêm SĐT hợp lệ.
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="email">Email <span class="text-muted">(Không bắt buộc)</span></label>
                            <input type="email" class="form-control" id="email" name="email"
                                   placeholder="you@example.com">
                            <div class="invalid-feedback">
                                Please enter a valid email address for shipping updates.
                            </div>
                        </div>
                        <hr class="mb-4">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="save-info" id="save-info">
                            <label class="custom-control-label" for="save-info">Lưu thông tin cho đơn đặt hàng
                                sau</label>
                        </div>
                        <hr class="mb-4">

                        <h4 class="mb-3">Thanh toán</h4>

                        <div class="d-block my-3">
                            <div class="custom-control custom-radio">
                                <input id="credit" name="paymentMethod" type="radio" class="custom-control-input"
                                       checked required>
                                <label class="custom-control-label" for="credit">Ship COD</label>
                            </div>
                            <%--                            <div class="custom-control custom-radio">--%>
                            <%--                                <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>--%>
                            <%--                                <label class="custom-control-label" for="debit">Debit card</label>--%>
                            <%--                            </div>--%>
                            <%--                            <div class="custom-control custom-radio">--%>
                            <%--                                <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>--%>
                            <%--                                <label class="custom-control-label" for="paypal">Paypal</label>--%>
                            <%--                            </div>--%>
                        </div>
                        <hr class="mb-4">
                        <h4 class="mb-3">Hình thức giao hàng</h4>

                        <div class="d-block my-3">
                            <div class="custom-control custom-radio">
                                <input id="slow" name="shippingMethod" type="radio" class="custom-control-input"
                                       value="slow"
                                       checked required>
                                <label class="custom-control-label" for="slow">Thường</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input id="fast" name="shippingMethod" type="radio" class="custom-control-input"
                                       value="fast"
                                       checked required>
                                <label class="custom-control-label" for="fast">Nhanh</label>
                            </div>
                            <%--                            <div class="custom-control custom-radio">--%>
                            <%--                                <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>--%>
                            <%--                                <label class="custom-control-label" for="debit">Debit card</label>--%>
                            <%--                            </div>--%>
                            <%--                            <div class="custom-control custom-radio">--%>
                            <%--                                <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>--%>
                            <%--                                <label class="custom-control-label" for="paypal">Paypal</label>--%>
                            <%--                            </div>--%>
                        </div>
                        <button class="btn btn-primary btn-lg btn-block" type="submit"
                                style="background-color: #e07c51; border: none">Đặt hàng
                        </button>
                    </form>
                </div>
                <div class="col-md-6" id="your-cart">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-muted">Giỏ hàng</span>
                        <span class="badge badge-secondary badge-pill"><%= cart.size()%></span>
                    </h4>
                    <ul class="list-group mb-3">
                        <% int totalPrice = 0;
                            int index = 0;%>
                        <% for (ProductInCart prod : cart) {%>
                        <li class="list-group-item d-flex justify-content-between lh-condensed">
                            <div>

                                <h6 class="my-0"><img src="<%=prod.getImageURL()%>"
                                                      style="max-width: 10%; height: auto"> <%=prod.getQuantity()%>
                                    x <%=prod.getTitle()%>
                                </h6>
                                <small class="text-muted"><%=prod.getOption()%>
                                </small><br>
                                <small class="delete-button" style="cursor: pointer"
                                       onclick="handleDeleteProduct(<%=index%>)">Xóa</small>
                            </div>
                            <span class="text-muted"><%=CurrencyService.formatPrice(prod.getPrice() * prod.getQuantity())%></span>
                        </li>
                        <% totalPrice += prod.getPrice() * prod.getQuantity();
                            index++;
                        } %>
                        <%--                        <li class="list-group-item d-flex justify-content-between bg-light">--%>
                        <%--                            <div class="text-success">--%>
                        <%--                                <h6 class="my-0">Promo code</h6>--%>
                        <%--                                <small>EXAMPLECODE</small>--%>
                        <%--                            </div>--%>
                        <%--                            <span class="text-success">-$5</span>--%>
                        <%--                        </li>--%>
                        <li class="list-group-item d-flex justify-content-between">
                            <span>Tổng (VNĐ)</span>
                            <strong><%=CurrencyService.formatPrice(totalPrice)%> VNĐ</strong>
                        </li>
                    </ul>

                    <%--                    <form class="card p-2">--%>
                    <%--                        <div class="input-group">--%>
                    <%--                            <input type="text" class="form-control" placeholder="Promo code">--%>
                    <%--                            <div class="input-group-append">--%>
                    <%--                                <button type="submit" class="btn btn-secondary">Redeem</button>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </form>--%>
                </div>

            </div>

            <footer class="my-5 pt-5 text-muted text-center text-small">
                <p class="mb-1">&copy; 2017-2018 Company Name</p>
                <ul class="list-inline">
                    <li class="list-inline-item"><a href="#">Privacy</a></li>
                    <li class="list-inline-item"><a href="#">Terms</a></li>
                    <li class="list-inline-item"><a href="#">Support</a></li>
                </ul>
            </footer>
        </div>

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
                crossorigin="anonymous"></script>
        <script>
            // Example starter JavaScript for disabling form submissions if there are invalid fields
            (function () {
                'use strict';

                window.addEventListener('load', function () {
                    // Fetch all the forms we want to apply custom Bootstrap validation styles to
                    var forms = document.getElementsByClassName('needs-validation');

                    // Loop over them and prevent submission
                    var validation = Array.prototype.filter.call(forms, function (form) {
                        form.addEventListener('submit', function (event) {
                            if (form.checkValidity() === false) {
                                event.preventDefault();
                                event.stopPropagation();
                            }
                            form.classList.add('was-validated');
                        }, false);
                    });
                }, false);
            })();
        </script>
        <%@ include file="footer.jsp" %>
    </body>
    <script>
        function handleDeleteProduct(id) {
            $.ajax({
                url: "./ProcessDeleteProduct",
                type: "get", // send through get method
                data: {
                    id: id,
                },
                success: function (data) {
                    var content = $(data).find('#your-cart').html();
                    console.log(content);
                    $("#your-cart").html(content);
                },
                error: function (xhr) {
                    // ok
                }
            });
        }
    </script>
    <% } %>
</html>