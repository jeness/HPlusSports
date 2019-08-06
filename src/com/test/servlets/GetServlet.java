package com.test.servlets;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/GetServlet")
public class GetServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String value = req.getParameter("name");
		
		ServletConfig config = getServletConfig();
		System.out.println(config.getInitParameter("URL"));
		String htmlResponse = "<html><h3>Welcome to Servlets!</h3></html>";
		PrintWriter writer = resp.getWriter();
		writer.write(htmlResponse+" "+value);
		
	}

}
