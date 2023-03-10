package com.learning;

import db.DbConfig;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Register")
public class RegisterServlet   extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userid=req.getParameter("userid");
        String pwd=req.getParameter("pwd");
        String role=req.getParameter("role");
        String uname=req.getParameter("uname");
        String id=req.getParameter("id");
        HttpSession session=req.getSession();
        try{
            Connection con=DbConfig.connect();
            PreparedStatement ps=con.prepareStatement("INSERT INTO users(userid,uname,pwd,role,id) VALUES(?,?,?,?,?)");
            ps.setString(1,userid);
            ps.setString(2,uname);
            ps.setString(3,pwd);
            ps.setString(4,role);
            ps.setString(5,id);
            ps.executeUpdate();  
            con.close();
            session.setAttribute("msg", "User Registered Successfully..!");
            resp.sendRedirect("index.jsp");            
        }
        catch(Exception ex){
            System.err.println("Error "+ex.getMessage());
        }
    }
    
}
