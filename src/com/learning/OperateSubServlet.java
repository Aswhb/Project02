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

@WebServlet("/SOperate")
public class OperateSubServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            if (request.getParameter("add") != null) {
                Connection con=DbConfig.connect();
                PreparedStatement ps = con
                        .prepareStatement("INSERT INTO subjects(subname,cid) VALUES(?,?)");
                ps.setString(1, request.getParameter("sub"));
                ps.setString(2, request.getParameter("cid"));
                ps.executeUpdate();
                con.close();
                session.setAttribute("msg", "Subject added successfully..");
                response.sendRedirect("admin/subjects.jsp");
            } else if (request.getParameter("update") != null) {
                Connection con=DbConfig.connect();
                PreparedStatement ps = con
                        .prepareStatement("UPDATE subjects SET subname=?,cid=? WHERE subid=?");
                ps.setString(1, request.getParameter("sub"));
                ps.setString(2, request.getParameter("cid"));
                ps.setString(3, request.getParameter("subid"));
                ps.executeUpdate();
                con.close();
                session.setAttribute("msg", "Subject updated successfully..");
                response.sendRedirect("admin/subjects.jsp");
            }
        } catch (Exception ex) {
            System.err.println("Error " + ex.getMessage());
        }

    }

}
