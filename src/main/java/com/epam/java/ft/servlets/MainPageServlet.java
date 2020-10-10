package com.epam.java.ft.servlets;

import com.epam.java.ft.controllers.Logout;
import com.epam.java.ft.controllers.Main;
import com.epam.java.ft.controllers.Order;
import com.epam.java.ft.controllers.Profile;
import com.epam.java.ft.dao.ConnectionPool;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

public class MainPageServlet extends HttpServlet {
    public static Logger logger = Logger.getLogger("MainPageServlet");
    private Connection connection = ConnectionPool.getConnection();

    private static String getLanguage(HttpServletRequest request) {
        String language = request.getParameter("language");
        if (language == null) {
            language = "ru";
        }
        return language;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        switch (path) {
            case "/":
                Main.setConnection(connection);
                Main.get(request, response, getLanguage(request));
                break;
            case "/order":
                Order.setConnection(connection);
                Order.addNewOrder(request, response);
                break;
            case "/profile":
                Profile.setConnection(connection);
                Profile.get(request, response, getLanguage(request));
                break;
            case "logout":
                Logout.logout(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String path = request.getServletPath();
        switch (path) {
            case "/":
                Main.post(request, response);
        }
    }
}
