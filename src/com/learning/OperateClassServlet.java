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

@WebServlet("/COperate")
public class OperateClassServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            if (request.getParameter("add") != null) {
                Connection con = DbConfig.connect();
                PreparedStatement ps = con
                        .prepareStatement("INSERT INTO class(cname) VALUES(?)");
                ps.setString(1, request.getParameter("cname"));
                ps.executeUpdate();
                con.close();
                session.setAttribute("msg", "Class added successfully..");
                response.sendRedirect("admin/classes.jsp");
            } else if (request.getParameter("update") != null) {
                Connection con = DbConfig.connect();
                PreparedStatement ps = con
                        .prepareStatement("UPDATE class SET cname=? WHERE cid=?");
                ps.setString(1, request.getParameter("cname"));
                ps.setString(2, request.getParameter("cid"));
                ps.executeUpdate();
                con.close();
                session.setAttribute("msg", "Class updated successfully..");
                response.sendRedirect("admin/classes.jsp");
            }
        } catch (Exception ex) {
            System.err.println("Error " + ex.getMessage());
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection con = DbConfig.connect();
            PreparedStatement ps = con
                    .prepareStatement("DELETE FROM class WHERE cid=?");
            ps.setString(1, request.getParameter("cid"));
            ps.executeUpdate();
            con.close();
            HttpSession session = request.getSession();
            session.setAttribute("msg", "Class removed successfully..");
            response.sendRedirect("admin/classes.jsp");
        } catch (Exception ex) {
            System.err.println("Error " + ex.getMessage());
        }
    }

}
