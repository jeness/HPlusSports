package com.test.servlets;

import com.test.beans.Order;
import com.test.dao.ApplicationDao;
import javafx.application.Application;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/orderHistory")
public class OrderHistory extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get username from session
        String username = (String)request.getSession().getAttribute("username");

        //call dao and get order history
        ApplicationDao dao = new ApplicationDao();
        List<Order> orders = dao.getOrders(username);

        //set order data in reqeust
        request.setAttribute("orders", orders);

        //forward to home jsp
        request.getRequestDispatcher("/html/home.jsp").forward(request,response);
    }
}
