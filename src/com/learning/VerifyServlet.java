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
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Verify")
public class VerifyServlet  extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("id");        
        String role=req.getParameter("role");
        HttpSession session=req.getSession();
        try{
            Connection con=DbConfig.connect();
            PreparedStatement ps=null;
            if(role.equals("student")){
                ps=con.prepareStatement("SELECT name from student where rollno=?");
            }
            else if(role.equals("lecturer")){
                ps=con.prepareStatement("SELECT lname as name from lecturer where lid=?");
            }
            ps.setString(1,id);                        
            ResultSet rs=ps.executeQuery();
            if(rs.next()){                
                resp.getWriter().println(rs.getString("name"));
            }else{                
                resp.getWriter().println("Invalid");
            }
            con.close();
        }
        catch(Exception ex){
            System.err.println("Error "+ex.getMessage());
        }
    }
    
    
    
}
