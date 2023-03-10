package com.learning;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.DbConfig;
import db.OLSHelper;

@WebServlet("/SubmitExam")
public class SubmitExamServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String tid=req.getParameter("tid");
		HttpSession session=req.getSession();
		String rollno=session.getAttribute("id").toString();
		Map<String,String[]> pp=req.getParameterMap();
		int total=0,correct=0;
		try {
		for(String key : pp.keySet()) {
			if(key.startsWith("q")) {
				String qno=key.substring(1);
				String result=OLSHelper.getAnswer(qno);
				if(result.equals(pp.get(key)[0])) {
					//System.out.println(qno+" => "+pp.get(key)[0]+" correct ");
					correct++;
				}else {
					//System.out.println(qno+" => "+pp.get(key)[0]+" wrong ");
				}
				total++;
			}
		}
		System.out.println("Correct "+correct+" out of "+total);
		String result=((float)correct*100/total)>=50 ? "Pass" : "Fail";
		DbConfig.executeDML("insert into results(rollno,tid,correct,total,result,submitdate) "
				+ "values(?,?,?,?,?,date(now()))", rollno,tid,String.valueOf(correct),String.valueOf(total),result);
		session.setAttribute("msg", "Test submitted successfully");
		resp.sendRedirect("student/tests.jsp");
		}catch(Exception ex) {
			System.err.println("Error "+ex.getMessage());
		}
	}
}
