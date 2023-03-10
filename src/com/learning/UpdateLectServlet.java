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

@WebServlet("/LUpdate")
public class UpdateLectServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String lid=req.getParameter("lid");
        String lname=req.getParameter("lname");
        String city=req.getParameter("city");
        String email=req.getParameter("email");
        String qual=req.getParameter("qual");
        String gender=req.getParameter("gender");
        HttpSession session=req.getSession();
        try{
            Connection con=DbConfig.connect();
            PreparedStatement ps=con.prepareStatement("UPDATE lecturer set lname=?,city=?,gender=?,email=?,qual=? where lid=?");
            ps.setString(1,lname);
            ps.setString(2,city);
            ps.setString(3,gender);
            ps.setString(4,email);
            ps.setString(5,qual);
            ps.setString(6,lid);
            ps.executeUpdate();
con.close();            
            session.setAttribute("msg", "Lecturer Information Updated Successfully..!");
            resp.sendRedirect("admin/lecturers.jsp");            
        }
        catch(Exception ex){
            System.err.println("Error "+ex.getMessage());
        }
    }
    
}

