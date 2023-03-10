<!DOCTYPE html>

<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <title>Learning System</title>
        <link href="../css/style.css" rel='stylesheet' type='text/css' media="all">
        <!-- Custom fonts for this template-->
        <link href="../css/all.css" rel="stylesheet" type="text/css">

        <!-- Custom styles for this template-->
        <link href="../css/sb-admin.css" rel="stylesheet">
        <script src="../js/jquery-3.4.1.js" type="text/javascript"></script>
    </head>

    <body id="page-top">
        <nav class="navbar navbar-expand navbar-dark bg-dark static-top">     
            <%
                String uname = "";
                if (session.getAttribute("uname") != null &&
                        session.getAttribute("role").equals("admin")) {
                    uname = session.getAttribute("uname").toString();
                } else {
                    session.setAttribute("msg", "Please login first");
                    //response.sendRedirect("../Logout");
                %>
            <script>
                location.href = "../index.jsp";
            </script>          
            <% }
            %>

            <a class="navbar-brand mr-1" href="index.jsp">Hi,  <%= uname%></a>

            <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
                <i class="fas fa-bars"></i>
            </button>

        </nav>
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="sidebar navbar-nav" style="min-height:calc(100vh-46px);">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li> 
                <li class="nav-item">
                    <a class="nav-link" href="classes.jsp">
                        <i class="fas fa-fw fa-users"></i>
                        <span>Classes</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="subjects.jsp">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Subjects</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="lecturers.jsp">
                        <i class="fas fa-fw fa-user-cog"></i>
                        <span>Teachers</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="assign.jsp">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Assign Subjects</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="students.jsp">
                        <i class="fas fa-fw fa-user-graduate"></i>
                        <span>Students</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="eval.jsp">
                        <i class="fas fa-fw fa-eye"></i>
                        <span>Evaluations</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="users.jsp">
                        <i class="fas fa-fw fa-users"></i>
                        <span>Users</span></a>
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

            <div id="content-wrapper" style="background:linear-gradient( rgba(255, 255, 255, 0.7) 100%, rgba(255, 255, 255, 0.8)100%),url('../images/aaa.PNG');width:100%;background-size: 100% 100%;">

                <div class="container-fluid" style="min-height:88vh;">
                    <jsp:include page="../msg.jsp" />
                    
