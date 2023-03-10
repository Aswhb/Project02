package com.learning;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/UploadMat")
@MultipartConfig
public class UploadMatServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            HttpSession session=req.getSession();
            String lid=session.getAttribute("id").toString();
            String subid=req.getParameter("subid");
            String catid=req.getParameter("catid");
            Part mat=req.getPart("material");
            
            Connection con=db.DbConfig.connect();
            PreparedStatement ps=con
                .prepareStatement("INSERT INTO material(lid,subid,catid) VALUES(?,?,?)",Statement.RETURN_GENERATED_KEYS);
            ps.setString(1,lid);
            ps.setString(2,subid);
            ps.setString(3,catid);
            ps.executeUpdate();
            ResultSet rs=ps.getGeneratedKeys();
            rs.next();
            int id=rs.getInt(1);
            
            ps=con.prepareStatement("UPDATE material SET filename=? WHERE matid=?");
            String ext=mat.getSubmittedFileName().substring(mat.getSubmittedFileName().lastIndexOf("."));
            String filename=String.format("%d%s", id,ext);
            ps.setString(1, filename);
            ps.setInt(2, id);
            ps.executeUpdate();
            con.close();
            String path=getServletContext().getRealPath("/content/");
            Files.copy(mat.getInputStream(), Paths.get(path, filename), StandardCopyOption.REPLACE_EXISTING);
            
            session.setAttribute("msg", "Material uploaded successfully..!!");
            resp.sendRedirect("lecturer/material.jsp");
        }
        catch(Exception ex)
        {
            System.err.println("Error "+ex.getMessage());
        }
    }
    
    
}
