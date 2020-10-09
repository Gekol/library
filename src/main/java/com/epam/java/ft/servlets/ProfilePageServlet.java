package com.epam.java.ft.servlets;

import com.epam.java.ft.dao.ConnectionPool;
import org.apache.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;


public class ProfilePageServlet extends HttpServlet {
    public static Logger logger = Logger.getLogger("ProfilePageServlet");
    Connection connection = ConnectionPool.getInstance("jdbc:mysql://localhost:3306/library?serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8",
            "root", "1111").getConnectionWithDriverManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher view = request.getRequestDispatcher("WEB-INF/view/profile.jsp");
        if (request.getSession(true).getAttribute("loggedIn").equals("true")) {
            view.forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath());
        }
    }
}
