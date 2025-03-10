package com.yong.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Gugu extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userProcess(req, resp);
	}

	protected void userProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = resp.getWriter();

		pw.println("<html>");
		pw.println("<head><title>");
		pw.println("구구단");
		pw.println("</title></head>");
		pw.println("<body>");
		pw.println("<h1>구구단</h1>");
		pw.println("<table border='1' width='650' cellspacing='0'>");
		for (int i = 1; i <= 9; i++) {
			pw.println("<tr>");
			for (int j = 2; j <= 9; j++) {
				pw.println("<td>");
				pw.println(j+" * "+i+" = "+(i*j));
				pw.println("</td>");
			}
			pw.println("</tr>");
		}
		pw.println("</table>");
		pw.println("</body></html>");
	}

}
