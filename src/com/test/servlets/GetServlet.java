package com.test.servlets;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns="/GetServlet",
initParams = {@WebInitParam(name="URL", value="http://www.weatherservice.com")})

//@WebServlet(urlPatterns="/GetServlet")
public class GetServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String value = req.getParameter("name");
		
		ServletConfig config = getServletConfig();
		System.out.println("My init parameter is : "+config.getInitParameter("URL"));

		String htmlResponse = "<html><h3>Welcome to Servlets!</h3>" + config.getInitParameter("URL") + "</html>";
		PrintWriter writer = resp.getWriter();

		writer.write(config.getInitParameter("URL")+ htmlResponse+"");
		
	}

}
