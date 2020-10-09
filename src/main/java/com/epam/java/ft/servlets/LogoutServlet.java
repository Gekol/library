package com.epam.java.ft.servlets;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        String loggedIn = (String) session.getAttribute("loggedIn");
        if (loggedIn != null && loggedIn.equals("true")) {
            session.setAttribute("loggedIn", "false");
        }
        response.sendRedirect(request.getContextPath());
    }
}