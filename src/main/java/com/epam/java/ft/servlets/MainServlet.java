package com.epam.java.ft.servlets;

import com.epam.java.ft.controllers.*;
import com.epam.java.ft.dao.ConnectionPool;
import com.epam.java.ft.dao.OrderDao;
import org.apache.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

public class MainServlet extends HttpServlet {
    public static Logger logger = Logger.getLogger("MainServlet");
    private Connection connection = ConnectionPool.getConnection();

    private static String getLanguage(HttpServletRequest request) {
        String language = request.getParameter("language");
        if (language == null) {
            language = "ru";
        }
        return language;
    }

    public static String getLoggedIn(HttpSession session) {
        String loggedIn = (String) session.getAttribute("loggedIn");
        if (loggedIn == null) {
            loggedIn = "false";
        }
        return loggedIn;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        String language = getLanguage(request);
        String loggedIn = getLoggedIn(request.getSession());
        OrderDao.checkForFine(connection, 1);
        switch (path) {
            case "/":
                Main.setConnection(connection);
                Main.get(request, response, language);
                break;
            case "/order":
                Order.setConnection(connection);
                Order.addNewOrder(request, response, loggedIn);
                break;
            case "/fine":
                Fine.setConnection(connection);
                Fine.pay(request, response, loggedIn);
                break;
            case "/profile":
                Profile.setConnection(connection);
                Profile.get(request, response, loggedIn, language);
                break;
            case "/logout":
                Logout.logout(request, response);
                break;
            case "/orders":
                Orders.setConnection(connection);
                Orders.get(request, response, loggedIn, language);
                break;
            case "/users":
                Users.setConnection(connection);
                Users.get(request, response, loggedIn, language);
                break;
            case "/giveBook":
                GiveBook.setConnection(connection);
                GiveBook.get(request, response, loggedIn);
                break;
            case "/return":
                ReturnBook.setConnection(connection);
                ReturnBook.get(request, response, loggedIn);
                break;
            default:
                RequestDispatcher view = request.getRequestDispatcher("WEB-INF/view/error.html");
                view.forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String path = request.getServletPath();
        String language = getLanguage(request);
        switch (path) {
            case "/":
                Main.post(request, response, language);
        }
    }
}
