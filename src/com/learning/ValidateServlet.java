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

@WebServlet("/Validate")
public class ValidateServlet  extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userid=req.getParameter("userid");
        String pwd=req.getParameter("pwd");
        String role=req.getParameter("role");
        HttpSession session=req.getSession();
        try{
            Connection con=DbConfig.connect();
            PreparedStatement ps=con.prepareStatement("SELECT * FROM users WHERE userid=? and pwd=? and role=?");
            ps.setString(1,userid);
            ps.setString(2,pwd);
            ps.setString(3,role);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                session.setAttribute("userid", userid);
                session.setAttribute("uname", rs.getString("uname"));
                session.setAttribute("role", role);
                session.setAttribute("id", rs.getString("id"));
                con.close();
                if(role.equals("admin")){
                    resp.sendRedirect("admin/index.jsp");
                } else if(role.equals("lecturer")){
                    resp.sendRedirect("lecturer/index.jsp");
                } else if(role.equals("student")){
                    resp.sendRedirect("student/index.jsp");
                }
            }else{
                con.close();
                session.setAttribute("msg", "Invalid username or password");
                resp.sendRedirect("index.jsp");
            }
        }
        catch(Exception ex){
            resp.getWriter().println("Error "+ex.getMessage());
        }
    }
    
    
    
}
