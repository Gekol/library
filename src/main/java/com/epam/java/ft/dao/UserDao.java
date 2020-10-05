package com.epam.java.ft.dao;

import com.epam.java.ft.models.Subscription;
import com.epam.java.ft.models.User;
import com.epam.java.ft.models.UserStatus;
import com.epam.java.ft.models.UserType;
import org.apache.log4j.Logger;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

;

public class UserDao {

    private static Logger logger = Logger.getLogger("UserDao");

    public static User getUser(Connection connection, int id) {
        String getUserQuery = "SELECT * " +
                "FROM users u\n" +
                "         JOIN subscriptions s on u.subscription_id = s.id\n" +
                "         JOIN userStatuses us ON u.user_status_id = us.id\n" +
                "         JOIN userTypes ut ON u.user_type_id = ut.id " +
                "WHERE u.id=?;";
        try (PreparedStatement getUserStatement = connection.prepareStatement(getUserQuery)) {
            getUserStatement.setInt(1, id);
            ResultSet res = getUserStatement.executeQuery();
            if (res.next()) {
                return new User(res.getInt("u.id"), res.getString("first_name"), res.getString("last_name"),
                        res.getString("email"), res.getString("u.user_password"),
                        new UserType(res.getInt("ut.id"), res.getString("ut.type")),
                        new UserStatus(res.getInt("s.id"), res.getString("status")),
                        new Subscription(res.getInt("s.id"), res.getDate("s.given"), res.getDate("s.expires")));
            }
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
        return null;
    }

    public static List<User> getAllUsers(Connection connection) {
        String getUsersQuery = "SELECT * " +
                "FROM users u\n" +
                "         JOIN subscriptions s on u.subscription_id = s.id\n" +
                "         JOIN userStatuses us ON u.user_status_id = us.id\n" +
                "         JOIN userTypes ut ON u.user_type_id = ut.id; ";
        ArrayList<User> users = new ArrayList<>();
        try (Statement getUsersStatement = connection.createStatement()) {
            ResultSet res = getUsersStatement.executeQuery(getUsersQuery);
            while (res.next()) {
                User user = new User(res.getInt("u.id"), res.getString("first_name"), res.getString("last_name"),
                        res.getString("email"), res.getString("u.user_password"),
                        new UserType(res.getInt("ut.id"), res.getString("ut.type")),
                        new UserStatus(res.getInt("s.id"), res.getString("status")),
                        new Subscription(res.getInt("s.id"), res.getDate("s.given"), res.getDate("s.expires")));
                users.add(user);
            }
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
        return users;
    }

    public static int insertUser(Connection connection, User user) {
        String insertQuery = "INSERT INTO users(first_name, last_name, email, user_password, user_type_id, user_status_id, subscription_id)\n" +
                "VALUES (?, ?, ?, ?, ?, ?, ?);";
        try (PreparedStatement insertUserStatement = connection.prepareStatement(insertQuery)) {
            insertUserStatement.setString(1, user.getFirstName());
            insertUserStatement.setString(2, user.getLastName());
            insertUserStatement.setString(3, user.getEmail());
            insertUserStatement.setString(4, user.getPassword());
            insertUserStatement.setInt(5, user.getUserType().getId());
            insertUserStatement.setInt(6, user.getUserStatus().getId());
            insertUserStatement.setInt(7, user.getSubscription().getId());
            return insertUserStatement.executeUpdate();
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
        return 0;
    }

    public static boolean loginUser(Connection connection, String email, String password) {
        String query = "SELECT * FROM users WHERE email=" + email + " AND user_password=" + password;
        try (Statement statement = connection.createStatement()) {
            return statement.executeQuery(query).next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static int updateUserStatus(Connection connection, int id, String status) {
        String getStatusIdQuery = "SELECT id FROM userStatuses WHERE status=?";
        String updateStatusQuery = "UPDATE users SET user_status_id=? WHERE id=?";
        return changeUserMetaData(connection, id, status, getStatusIdQuery, updateStatusQuery);
    }

    public static int updateUserType(Connection connection, int id, String type) {
        String getTypeIdQuery = "SELECT id FROM userTypes WHERE type=?";
        String updateTypeQuery = "UPDATE users SET user_type_id=? WHERE id=?";
        return changeUserMetaData(connection, id, type, getTypeIdQuery, updateTypeQuery);
    }

    private static int changeUserMetaData(Connection connection, int id, String type, String getTypeIdQuery, String updateTypeQuery) {
        try (PreparedStatement getTypeIdStatement = connection.prepareStatement(getTypeIdQuery)) {
            getTypeIdStatement.setString(1, type);
            ResultSet res = getTypeIdStatement.executeQuery();
            if (res.next()) {
                try (PreparedStatement updateStatusStatement = connection.prepareStatement(updateTypeQuery)) {
                    updateStatusStatement.setInt(1, res.getInt("id"));
                    updateStatusStatement.setInt(2, id);
                    return updateStatusStatement.executeUpdate();
                }
            }
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
        return 0;
    }
}
