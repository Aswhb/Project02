
<%@page contentType="text/html" session="true" %>
<%

    /*response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma", "no-cache");

    if (!session.isNew()) {
        session = request.getSession(false);
        if (session != null) {
            if (session.getAttribute("uname") != null) {
                String name = (String) session.getAttribute("uname");*/
%>
<jsp:include flush="true" page="header.jsp" />
<h3>Dashboard</h3>
<div class="container">
    <div class="row">
        <div class="col-sm-3 bg-primary p-4 text-white">
            <h5>Materials</h5>
            <h6><%= db.DbConfig.findCount("material")%></h6>
        </div>
        <div class="col-sm-3 bg-danger p-4 text-white">
            <h5>Teachers</h5>
            <h6><%= db.DbConfig.findCount("lecturer")%></h6>
        </div>
        <div class="col-sm-3 bg-warning p-4 text-white">
            <h5>Students</h5>
            <h6><%= db.DbConfig.findCount("student")%></h6>
        </div>
        <div class="col-sm-3 bg-info p-4 text-white">
            <h5>Users</h5>
            <h6><%= db.DbConfig.findCount("users")%></h6>
        </div>
    </div>
</div>
<jsp:include flush="true" page="footer.jsp" />

<%
         /*   } else {
                session.setAttribute("msg", "Please login first..!!");
                response.sendRedirect("../index.jsp");
            }
        }
    } else {
        session.setAttribute("msg", "Please login first..!!");
        response.sendRedirect("../index.jsp");
    }*/
%>