package com.epam.java.ft.servlets;

import com.epam.java.ft.dao.ConnectionPool;
import com.epam.java.ft.dao.SubscriptionDao;
import com.epam.java.ft.dao.UserDao;
import com.epam.java.ft.models.Subscription;
import com.epam.java.ft.models.User;
import org.apache.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.util.Calendar;


public class ProfilePageServlet extends HttpServlet {
    public static Logger logger = Logger.getLogger("ProfilePageServlet");
    Connection connection = ConnectionPool.getInstance("jdbc:mysql://localhost:3306/library?serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8",
            "root", "1111").getConnectionWithDriverManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher view = request.getRequestDispatcher("WEB-INF/view/profile.jsp");
        HttpSession session = request.getSession(true);
        if (session.getAttribute("loggedIn").equals("true")) {
            String createSubscription = request.getParameter("createSubscription");
            if (createSubscription != null && createSubscription.equals("true")) {
                Date todayDate = new java.sql.Date(new java.util.Date().getTime());
                Date futureDate = addDays(todayDate);
                SubscriptionDao.createSubscription(new Subscription(1, todayDate, futureDate));
                int userId = (Integer) request.getSession().getAttribute("id");
                int subscriptionId = SubscriptionDao.getRowsCount(connection);
                UserDao.updateUserSubscription(connection, userId, subscriptionId);
            }
            String language = request.getParameter("language");
            if (language == null) {
                language = "ru";
            }
            User user = UserDao.getUser(connection, (String) session.getAttribute("email"), language);
            session.setAttribute("subscription", user.getSubscription());
            view.forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath());
        }
    }

    private Date addDays(Date day) {
        Calendar c = Calendar.getInstance();
        c.setTime(day);
        c.add(Calendar.DATE, 30);
        return new Date(c.getTimeInMillis());
    }
}
