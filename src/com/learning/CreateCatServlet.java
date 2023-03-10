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

@WebServlet("/CreateCat")
public class CreateCatServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            if (request.getParameter("add") != null) {
                Connection con=DbConfig.connect();
                PreparedStatement ps = con
                        .prepareStatement("INSERT INTO matcat(catname,lid) VALUES(?,?)");
                ps.setString(1, request.getParameter("catname"));
                ps.setString(2,session.getAttribute("id").toString());
                ps.executeUpdate();
                con.close();
                session.setAttribute("msg", "Category created successfully..");
                response.sendRedirect("lecturer/category.jsp");
            } else if (request.getParameter("update") != null) {
                Connection con=DbConfig.connect();
                PreparedStatement ps = con
                        .prepareStatement("UPDATE matcat SET catname=? WHERE catid=?");
                ps.setString(1, request.getParameter("catname"));
                ps.setString(2, request.getParameter("catid"));                
                ps.executeUpdate();
                con.close();
                session.setAttribute("msg", "Category updated successfully..");                
                response.sendRedirect("lecturer/category.jsp");
            }
        } catch (Exception ex) {
            System.err.println("Error " + ex.getMessage());
        }
    }
    
}
