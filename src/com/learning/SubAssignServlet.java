/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

@WebServlet("/Assign")
public class SubAssignServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            Connection con=DbConfig.connect();
            PreparedStatement ps = con
                    .prepareStatement("INSERT INTO lecsub VALUES(?,?)");
            ps.setString(2, request.getParameter("subid"));
            ps.setString(1, request.getParameter("lid"));
            ps.executeUpdate();
            con.close();
            session.setAttribute("msg", "Subject assigned successfully..");
            response.sendRedirect("admin/assign.jsp");
        } catch (Exception ex) {
            System.err.println("Error " + ex.getMessage());
        }

    }

}
