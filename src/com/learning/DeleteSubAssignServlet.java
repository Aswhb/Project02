
package com.learning;

import db.DbConfig;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/delassign")
public class DeleteSubAssignServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            Connection con=DbConfig.connect();
            PreparedStatement ps = con
                    .prepareStatement("delete from lecsub where subid=? and lid=?");
            ps.setString(1, request.getParameter("subid"));
            ps.setString(2, request.getParameter("lid"));
            ps.executeUpdate();
            con.close();
            session.setAttribute("msg", "Assignment deleted successfully..");
            response.sendRedirect("admin/assign.jsp");
        } catch (Exception ex) {
            System.err.println("Error " + ex.getMessage());
        }

    }

}
