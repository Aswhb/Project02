package com.learning;

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

@WebServlet("/Change")
public class ChangePwdServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String old = req.getParameter("oldpwd");
        String newpwd = req.getParameter("password");
                
        HttpSession session = req.getSession();
        String userid = session.getAttribute("userid").toString();
        try {
            Connection con = db.DbConfig.connect();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE userid=? and pwd=?");
            ps.setString(1, userid);
            ps.setString(2, old);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ps = con.prepareStatement("UPDATE users SET pwd=? WHERE userid=?");
                ps.setString(1, newpwd);
                ps.setString(2, userid);
                ps.executeUpdate();
                con.close();
                session.setAttribute("msg", "Password changed successfully..!!");
                if(session.getAttribute("role").equals("admin")){
                    resp.sendRedirect("admin/index.jsp");
                }else if(session.getAttribute("role").equals("lecturer")){
                    resp.sendRedirect("lecturer/index.jsp");
                }else if(session.getAttribute("role").equals("student")) {
                    resp.sendRedirect("student/index.jsp");
                }
            } else {
                session.setAttribute("error", "Incorrect Password..!!");
                resp.sendRedirect("index.jsp");
            }
        } catch (Exception ex) {
            System.err.println("Error "+ex.getMessage());
        }
    }

}
