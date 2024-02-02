<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Connection conn = null;
try{
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/arrnet","root","");
}catch(Exception e){
    // out.println(e);   
} 
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking</title>
</head>

<body>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link
        href="https://image.similarpng.com/very-thumbnail/2020/06/Restaurant-logo-with-chef-drawing-template-on-transparent-background-PNG.png"
        rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Amatic+SC:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
        rel="stylesheet">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!-- Template Main CSS File -->
    <link href="../assets/css/main.css" rel="stylesheet">
    <link href="../assets/css/book.css" rel="stylesheet">


    </head>

    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top d-flex align-items-center container-fluid bg-success">
            <div class="container d-flex align-items-center justify-content-between">

                <a href="../index.html" class="logo d-flex align-items-center me-auto me-lg-0">

                    <h1>Your Booking</h1>
                </a>

                <nav id="navbar" class="navbar">
                    <ul class="text text-white">
                        <li><a href="../index.html" class="text text-white">Home</a></li>
                        <li><a href="../index.html" class="text text-white">About</a></li>
                        <li><a href="../Yummy/index.html" class="text text-white">Menu</a></li>
                        <li><a href="../Yummy/index.html" class="text text-white">Events</a></li>
                        <li><a href="../Yummy/index.html" class="text text-white">Chefs</a></li>
                        <li><a href="../Yummy/index.html" class="text text-white">Gallery</a></li>
                        <li class="dropdown"><a href="#" class="text text-white"><span>More</span> <i
                                    class="bi bi-chevron-down dropdown-indicator"></i></a>
                            <ul>
                                <li><a href="../../Yummy/index.html">Location</a></li>
                                <li><a href="advice-menu.html">Advice Menu</a></li>
                                <li><a href="book-table.html">Book a Table</a></li>
                            </ul>
                        </li>
                        <li><a href="../../Yummy/index.html" class="text text-white">Contact</a></li>
                    </ul>
                </nav><!-- .navbar -->

                <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
                <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

            </div>
        </header><!-- End Header -->
        <section id="hero" class="hero d-flex align-items-center bg-white">

            <div class="card d-flex align-items-center container-fluid">
                <div class="card-body mx-4  align-items-center container-fluid">
                    <div class="container">
                        <h1 class="my-5 mx-4 d-flex align-items-center container-fluid">Bill of Booking</h1>
                        <div class="row">
                            <ul class="list-unstyled">
                                <li class="text-black">Mou Hun Restaurant</li>
                                <li class="text-muted mt-1"><span class="text-black">contact us:</span> 20 78066015</li>
                                <li class="text-black mt-1">Email: lambopkd@gmail.com</li>
                            </ul>
                            <hr style="border: 2px solid black;">
                                        <%
            String id = request.getParameter("id"); 
            //แสดงค่า
            PreparedStatement pb = conn.prepareStatement("SELECT * FROM tbl_booking WHERE id=?");
            pb.setString(1, id);
            ResultSet rsb = pb.executeQuery();
            %>
 <%if (rsb.next()) {%>
                            <div class="col-xl-10">
                                <p>First name</p>
                            </div>
                            <div class="col-xl-2">
                                <p class="float-end"><%= rsb.getString("booking_email") %></p>

                            </div>

                        </div>
                        <div class="row">
                            <div class="col-xl-10">
                                <p>Last Name</p>
                            </div>
                            <div class="col-xl-2">
                                <p class="float-end"><%= rsb.getString("lastName") %>
                                </p>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-xl-10">
                                <p>Date</p>
                            </div>
                            <div class="col-xl-2">
                                <p class="float-end"><%= rsb.getString("selectDate") %>
                                </p>
                            </div>
                            
                            
                            <hr style="border: 2px solid black;">
                        </div>
                        <%} %>
                        <div class="row text-black">

                            <div class="col-xl-12">
                                <p class="float-end fw-bold">Total: $10,000.00
                                </p>
                            </div>
                            <hr style="border: 2px solid black;">
                        </div>
                        <div class="text-center" style="margin-top: 90px;">
                            <a><u class="text-info">View in browser</u></a>
                            <p>Thank You so much for your booking. </p>
                        </div>

                    </div>
                </div>
            </div>

        </section>

    </body>
</html>