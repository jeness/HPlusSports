package com.test.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//dispatch the request to login.jsp resource
		
		String html = "<html><h3>Please login</h3></html>";
		resp.getWriter().write(html+" ");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
		dispatcher.include(req, resp);
		//why we need to forward both request and response when do forwarding?
		//the current resource wants to utilize request and response, the other resource where
		//you are forwarding to.
		//They may also need to use both of these object for extracting the request data, writing some more response.
		//If the login servlet was not doing anything with these objects, the next resource in line would definitely need these.
	}

}
