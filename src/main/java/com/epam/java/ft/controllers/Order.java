package com.epam.java.ft.controllers;

import com.epam.java.ft.dao.CatalogDao;
import com.epam.java.ft.dao.OrderDao;
import com.epam.java.ft.dao.OrderTypeDao;
import com.epam.java.ft.models.OrderType;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

public class Order {
    private static Connection connection;

    public static void setConnection(Connection connection) {
        Order.connection = connection;
    }

    public static String getLoggedIn(HttpSession session) {
        String loggedIn = (String) session.getAttribute("loggedIn");
        if (loggedIn == null) {
            loggedIn = "false";
        }
        return loggedIn;
    }

    public static void addNewOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        if (getLoggedIn(session).equals("true")) {
            OrderType orderType = OrderTypeDao.getOrderType(connection, request.getParameter("orderType"), "en");
            int bookId;
            if (orderType != null) {
                bookId = Integer.parseInt(request.getParameter("book_id"));
                if (CatalogDao.checkBook(connection, bookId)) {
                    OrderDao.insertNewOrder(connection, (Integer) session.getAttribute("id"), bookId, orderType.getId());
                }
            }
            response.sendRedirect(request.getContextPath() + "/profile");
        }
    }
}
