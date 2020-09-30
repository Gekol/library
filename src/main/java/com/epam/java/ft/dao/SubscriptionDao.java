package com.epam.java.ft.dao;

import com.epam.java.ft.models.Subscription;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Logger;

public class SubscriptionDao {
    public static Connection connection = ConnectionPool.getInstance("jdbc:mysql://localhost:3306/p8db?serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8",
            "root", "1111").getConnection();
    public static Logger logger = Logger.getLogger("UserDao");

    public static int createSubscription(Subscription subscription) {
        String insertSubscriptionQuery = "INSERT INTO books(given, expires) VALUES (?, ?);";
        try (PreparedStatement insertBookStatement = connection.prepareStatement(insertSubscriptionQuery)) {
            insertBookStatement.setDate(1, subscription.getGiven());
            insertBookStatement.setDate(2, subscription.getExpires());
            return insertBookStatement.executeUpdate();
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
        return 0;
    }
}
