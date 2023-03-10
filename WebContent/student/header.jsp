<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="Jyoti and Sonam">

        <title>Learning System</title>
        <link href="../css/style.css" rel='stylesheet' type='text/css' media="all">
        <!-- Custom fonts for this template-->
        <link href="../css/all.css" rel="stylesheet" type="text/css">

        <!-- Custom styles for this template-->
        <link href="../css/sb-admin.css" rel="stylesheet">
        <script src="../js/jquery-3.4.1.js" type="text/javascript"></script>
    </head>

    <body id="page-top">

        <nav class="navbar navbar-expand navbar-dark bg-success static-top">
            <%
                String uname = "";
                if (session.getAttribute("uname") != null &&
                         session.getAttribute("role").equals("student")) {
                    uname = session.getAttribute("uname").toString();
                } else {
                    session.setAttribute("msg", "Please login first");
                    //response.sendRedirect("../index.jsp");
            %>
            <script>
                location.href = "../index.jsp";
            </script>          
            <% }
            %>
            <a class="navbar-brand mr-1" href="index.jsp">Welcome ! <%= uname%></a>

            <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
                <i class="fas fa-bars"></i>
            </button>

        </nav>
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="sidebar navbar-nav" style="background-color: #000000;">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li>       
                <li class="nav-item">
                    <a class="nav-link" href="material.jsp">
                        <i class="fas fa-fw fa-book"></i>
                        <span>Material</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="evaluation.jsp">
                        <i class="fas fa-fw fa-comments"></i>
                        <span>Evaluation</span></a>
                </li>     
                <li class="nav-item">
                    <a class="nav-link" href="tests.jsp">
                        <i class="fas fa-fw fa-book"></i>
                        <span>Tests</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#content2">
                        <i class="fas fa-fw fa-key"></i>
                        <span>Change Password</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../Logout">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Logout</span></a>
                </li>
            </ul>

            <div id="content-wrapper" class="p-0">

                <div class="container-fluid p-2" style="background-image: url('../images/1.jpg');background-size: 100% 100%;height:100%;">
                    <jsp:include page="../msg.jsp" />

