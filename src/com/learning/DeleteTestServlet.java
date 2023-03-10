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

@WebServlet("/DelTest")
public class DeleteTestServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            Connection con=DbConfig.connect();
            PreparedStatement ps = con
                    .prepareStatement("DELETE FROM tests WHERE id=?");
            ps.setString(1, request.getParameter("id"));            
            ps.executeUpdate();
            con.close();
            session.setAttribute("msg", "Test removed successfully..");
            response.sendRedirect("lecturer/tests.jsp");
        } catch (Exception ex) {
            System.err.println("Error " + ex.getMessage());
        }
    }

}
