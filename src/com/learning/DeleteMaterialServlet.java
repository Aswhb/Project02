/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learning;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DelMat")
public class DeleteMaterialServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         try{
            HttpSession session=req.getSession();            
            String matid=req.getParameter("matid");            
            
            Connection con=db.DbConfig.connect();
            
            PreparedStatement ps=con
                .prepareStatement("SELECT filename FROM material WHERE matid=?");
            ps.setString(1,matid);            
            ResultSet rs=ps.executeQuery();
            rs.next();
            String filename=rs.getString(1);
            
            ps=con
                .prepareStatement("DELETE FROM material WHERE matid=?");
            ps.setString(1,matid);            
            ps.executeUpdate();
            con.close();
            String path=getServletContext().getRealPath("/content/");
            //Files.copy(mat.getInputStream(), Paths.get(path, filename), StandardCopyOption.REPLACE_EXISTING);
            Files.deleteIfExists(Paths.get(path,filename));
            
            session.setAttribute("msg", "Material deleted successfully..!!");
            resp.sendRedirect("lecturer/material.jsp");
        }
        catch(Exception ex)
        {
            System.err.println("Error "+ex.getMessage());
        }
    }
    
}
