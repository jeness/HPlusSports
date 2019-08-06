package com.test.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.test.dao.DBConnection;

@WebServlet("/home")
public class HomeServlet extends HttpServlet{
	public Connection connection=null;
	//life cycle methods - init, service, destroy
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//forward the control to the index.html
		System.out.println("in doGet method");
		req.getRequestDispatcher("/html/index.html").forward(req, resp);
	}


	@Override
	public void init() throws ServletException{
		//initialization activity - set up connection object
		System.out.println("in init method");
		connection = DBConnection.getConnectionToDatabase();
	}

	@Override
	public void destroy(){
		//clean up activity - close DB connection object
		try {
			connection.close();
			System.out.println("in destroy method");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
