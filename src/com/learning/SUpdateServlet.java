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

@WebServlet("/SUpdate")
public class SUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=req.getParameter("name");
        String city=req.getParameter("city");
        String email=req.getParameter("email");
        String cls=req.getParameter("cid");
        String gender=req.getParameter("gender");
        String rollno=req.getParameter("rollno");
        HttpSession session=req.getSession();
        try{
            Connection con=DbConfig.connect();
            PreparedStatement ps=con.prepareStatement("UPDATE student set name=?,city=?,gender=?,email=?,class=? where rollno=?");
            ps.setString(1,name);
            ps.setString(2,city);
            ps.setString(3,gender);
            ps.setString(4,email);
            ps.setString(5,cls);
            ps.setString(6,rollno);
            ps.executeUpdate();   
            con.close();
            session.setAttribute("msg", "Student Information Updated Successfully..!");
            resp.sendRedirect("admin/students.jsp");            
        }
        catch(Exception ex){
            System.err.println("Error "+ex.getMessage());
        }
    }
    
}

