package com.learning;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.DbConfig;

@WebServlet("/CreateTest")
public class AddTestServlet extends HttpServlet{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            Connection con=DbConfig.connect();
            PreparedStatement ps = con
                    .prepareStatement("INSERT INTO tests(tname,lecid,subid,createdate,submitdate) "
                    		+ "VALUES(?,?,?,date(now()),?)");
            ps.setString(1, request.getParameter("tname"));
            ps.setString(2,session.getAttribute("id").toString());
            ps.setString(3, request.getParameter("subid"));
            ps.setString(4, request.getParameter("submitdate"));
            ps.executeUpdate();
            con.close();
            session.setAttribute("msg", "Test created successfully..");
            response.sendRedirect("lecturer/tests.jsp");
        } catch (Exception ex) {
            System.err.println("Error " + ex.getMessage());
        }
    }
}
