package com.test.servlets;

import com.test.beans.User;
import com.test.dao.ApplicationDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/getProfileDetails")
public class ViewProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get the username from the session
        System.out.println("User name is profile servlet: " + request.getSession().getAttribute("username"));

        String username = (String)request.getSession().getAttribute("username");

        //call dao and get profile details
        ApplicationDao dao = new ApplicationDao();
        User user = dao.getProfileDetails(username);

        //store all info in request object
        request.setAttribute("user", user);


        //forward control to profile jsp
        request.getRequestDispatcher("/html/profile.jsp").forward(request, response);
    }
}
