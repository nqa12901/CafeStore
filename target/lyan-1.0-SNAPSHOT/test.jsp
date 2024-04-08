<%--
  Created by IntelliJ IDEA.
  User: LynG
  Date: 4/6/2024
  Time: 4:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .gradient-custom-2 {
        /* fallback for old browsers */
        background: rgba(0, 0, 0, .5);;
    }


    #progressbar-1 {
        color: #455A64;
    }

    #progressbar-1 li {
        list-style-type: none;
        font-size: 13px;
        width: 33.33%;
        float: left;
        position: relative;
    }

    #progressbar-1 #step1:before {
        content: "1";
        color: #fff;
        width: 29px;
        margin-left: 22px;
        padding-left: 11px;
    }

    #progressbar-1 #step2:before {
        content: "2";
        color: #fff;
        width: 29px;
    }

    #progressbar-1 #step3:before {
        content: "3";
        color: #fff;
        width: 29px;
        margin-right: 22px;
        text-align: center;
    }

    #progressbar-1 li:before {
        line-height: 29px;
        display: block;
        font-size: 12px;
        background: #455A64;
        border-radius: 50%;
        margin: auto;
    }

    #progressbar-1 li:after {
        content: '';
        width: 121%;
        height: 2px;
        background: #455A64;
        position: absolute;
        left: 0%;
        right: 0%;
        top: 15px;
        z-index: -1;
    }

    #progressbar-1 li:nth-child(2):after {
        left: 50%
    }

    #progressbar-1 li:nth-child(1):after {
        left: 25%;
        width: 121%
    }

    #progressbar-1 li:nth-child(3):after {
        left: 25%;
        width: 50%;
    }

    #progressbar-1 li.active:before,
    #progressbar-1 li.active:after {
        background: #1266f1;
    }

    .card-stepper {
        z-index: 0
    }

</style>
<html>
    <head>
        <script src="https://kit.fontawesome.com/628d1a6561.js" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <section class="vh-100 gradient-custom-2">
            <div class="container py-5 h-100 ">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-10 col-lg-8 col-xl-6">
                        <div class="card card-stepper" style="border-radius: 16px;">
                            <div class="card-header p-4">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <p class="text-muted mb-2"> Order ID <span
                                                class="fw-bold text-body">1222528743</span></p>
                                        <p class="text-muted mb-0"> Place On <span class="fw-bold text-body">12,March 2019</span>
                                        </p>
                                    </div>
                                    <div>
                                        <h6 class="mb-0"><a href="#">View Details</a></h6>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body p-4">
                                <div class="d-flex flex-row mb-4 pb-2">
                                    <div class="flex-fill">
                                        <h5 class="bold">Headphones Bose 35 II</h5>
                                        <p class="text-muted"> Qt: 1 item</p>
                                        <h4 class="mb-3"> $ 299 <span class="small text-muted"> via (COD) </span></h4>
                                        <p class="text-muted">Tracking Status on: <span
                                                class="text-body">11:30pm, Today</span></p>
                                    </div>
                                    <div>
                                        <img class="align-self-center img-fluid"
                                             src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/E-commerce/Products/6.webp"
                                             width="250">
                                    </div>
                                </div>
                                <ul id="progressbar-1" class="mx-0 mt-0 mb-5 px-0 pt-0 pb-4">
                                    <li class="step0 active" id="step1"><span
                                            style="margin-left: 22px; margin-top: 12px;">PLACED</span></li>
                                    <li class="step0 active text-center" id="step2"><span>SHIPPED</span></li>
                                    <li class="step0 text-muted text-end" id="step3"><span
                                            style="margin-right: 22px;">DELIVERED</span></li>
                                </ul>
                            </div>
                            <div class="card-footer p-4">
                                <div class="d-flex justify-content-between">
                                    <h5 class="fw-normal mb-0"><a href="#!">Track</a></h5>
                                    <div class="border-start h-100"></div>
                                    <h5 class="fw-normal mb-0"><a href="#!">Cancel</a></h5>
                                    <div class="border-start h-100"></div>
                                    <h5 class="fw-normal mb-0"><a href="#!">Pre-pay</a></h5>
                                    <div class="border-start h-100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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
