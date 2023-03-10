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

@WebServlet("/eval")
public class EvaluationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        String lid = req.getParameter("lid");
        String eval = req.getParameter("eval");
        String rollno = session.getAttribute("id").toString();
        try {
            Connection con = DbConfig.connect();
            PreparedStatement ps = con.prepareStatement("INSERT INTO evaluation values(?,?,?)");
            ps.setString(1, rollno);
            ps.setString(2, lid);
            ps.setString(3, eval);
            ps.executeUpdate();
            con.close();
            session.setAttribute("msg", "Evaluation submitted successfully..!!");

            resp.sendRedirect("student/evaluation.jsp");
        } catch (Exception ex) {
            System.err.println("Error " + ex.getMessage());
        }

    }

}
