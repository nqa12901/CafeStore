<%@ page import="java.util.ArrayList" %>
<%@ page import="model.ProductInOrder" %>
<%@ page import="model.Order" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<style>
    .card {
        box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
    }

    .card {
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 0 solid rgba(0, 0, 0, .125);
        border-radius: 1rem;
    }

    .text-reset {
        --bs-text-opacity: 1;
        color: inherit !important;
    }

    a {
        color: #5465ff;
        text-decoration: none;
    }
</style>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <script src="https://kit.fontawesome.com/628d1a6561.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8"/>
        <title>Linh Coffee - For the good teacher</title>
        <!-- CSS -->
        <link rel="stylesheet" href="style.css"/>
        <!-- Fontawesome CDN Link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
    </head>


    <body>
        <div class="container-fluid">

            <div class="container">
                <!-- Title -->
                <div class="d-flex justify-content-between align-items-center py-3">
                    <h2 class="h5 mb-0"><a href="#" class="text-muted"></a> Order #16123222</h2>
                </div>

                <!-- Main content -->
                <div class="row">
                    <div class="col-lg-8">
                        <!-- Details -->
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="mb-3 d-flex justify-content-between">
                                    <div>
                                        <span class="me-3">22-11-2021</span>
                                        <span class="me-3">#16123222</span>
                                        <span class="me-3">Visa -1234</span>
                                        <span class="badge rounded-pill bg-info">SHIPPING</span>
                                    </div>
                                </div>

                                <table class="table table-borderless">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="d-flex mb-2">
                                                    <div class="flex-shrink-0">
                                                        <img src="https://www.bootdey.com/image/280x280/87CEFA/000000"
                                                             alt="" width="35" class="img-fluid">
                                                    </div>
                                                    <div class="flex-lg-grow-1 ms-3">
                                                        <h6 class="small mb-0"><a href="#" class="text-reset">Wireless
                                                            Headphones with Noise Cancellation Tru Bass Bluetooth
                                                            HiFi</a></h6>
                                                        <span class="small">Color: Black</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>1</td>
                                            <td class="text-end">$79.99</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex mb-2">
                                                    <div class="flex-shrink-0">
                                                        <img src="https://www.bootdey.com/image/280x280/FF69B4/000000"
                                                             alt="" width="35" class="img-fluid">
                                                    </div>
                                                    <div class="flex-lg-grow-1 ms-3">
                                                        <h6 class="small mb-0"><a href="#" class="text-reset">Smartwatch
                                                            IP68 Waterproof GPS and Bluetooth Support</a></h6>
                                                        <span class="small">Color: White</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>1</td>
                                            <td class="text-end">$79.99</td>
                                        </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="2">Subtotal</td>
                                            <td class="text-end">$159,98</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">Shipping</td>
                                            <td class="text-end">$20.00</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">Discount (Code: NEWYEAR)</td>
                                            <td class="text-danger text-end">-$10.00</td>
                                        </tr>
                                        <tr class="fw-bold">
                                            <td colspan="2">TOTAL</td>
                                            <td class="text-end">$169,98</td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                        <!-- Payment -->
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <h3 class="h6">Payment Method</h3>
                                        <p>Visa -1234 <br>
                                            Total: $169,98 <span class="badge bg-success rounded-pill">PAID</span></p>
                                    </div>
                                    <div class="col-lg-6">
                                        <h3 class="h6">Billing address</h3>
                                        <address>
                                            <strong>John Doe</strong><br>
                                            1355 Market St, Suite 900<br>
                                            San Francisco, CA 94103<br>
                                            <abbr title="Phone">P:</abbr> (123) 456-7890
                                        </address>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <!-- Customer Notes -->
                        <div class="card mb-4">
                            <div class="card-body">
                                <h3 class="h6">Customer Notes</h3>
                                <p>Sed enim, faucibus litora velit vestibulum habitasse. Cras lobortis cum sem aliquet
                                    mauris rutrum. Sollicitudin. Morbi, sem tellus vestibulum porttitor.</p>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <!-- Shipping information -->
                            <div class="card-body">
                                <h3 class="h6">Shipping Information</h3>
                                <strong>FedEx</strong>
                                <span><a href="#" class="text-decoration-underline" target="_blank">FF1234567890</a> <i
                                        class="bi bi-box-arrow-up-right"></i> </span>
                                <hr>
                                <h3 class="h6">Address</h3>
                                <address>
                                    <strong>John Doe</strong><br>
                                    1355 Market St, Suite 900<br>
                                    San Francisco, CA 94103<br>
                                    <abbr title="Phone">P:</abbr> (123) 456-7890
                                </address>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</html>