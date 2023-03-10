package com.learning;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.DbConfig;

@WebServlet("/AddQuestion")
public class AddQuestionServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		try {
			String descr=req.getParameter("descr");
			String ch1=req.getParameter("ch1");
			String ch2=req.getParameter("ch2");
			String ch3=req.getParameter("ch3");
			String ch4=req.getParameter("ch4");
			String ans=req.getParameter("ans");
			String tid=req.getParameter("tid");
			DbConfig.executeDML("insert into questions(descr,ch1,ch2,ch3,ch4,ans,tid) values(?,?,?,?,?,?,?)",
					descr,ch1,ch2,ch3,ch4,ans,tid);
			session.setAttribute("msg", "Question Added successfully");
			resp.sendRedirect("lecturer/questions.jsp?id="+tid);
		}
		catch(Exception ex) {
			System.err.println("Error "+ex.getMessage());
		}
	}

}
