package com.epam.java.ft.dao;

import com.epam.java.ft.models.*;
import org.apache.log4j.Logger;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
    public static Logger logger = Logger.getLogger("OrderDao");

    public static List<Order> getAllOrders(Connection connection, String lang) {
        ArrayList<Order> orders = new ArrayList<>();
        String getOrdersQuery = "SELECT *" +
                "FROM orders o\n" +
                "         JOIN users u on o.user_id = u.id\n" +
                "         JOIN books b ON b.id = o.book_id\n" +
                "         JOIN editions e on b.edition_id = e.id\n" +
                "         JOIN authors a on b.author_id = a.id\n" +
                "         JOIN orderTypes ot ON o.order_type_id = ot.id\n" +
                "ORDER BY o.id;";
        try (Statement getOrdersStatement = connection.createStatement()) {
            getOrders(lang, orders, getOrdersStatement.executeQuery(getOrdersQuery));
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
        return orders;
    }

    public static List<Order> getOrderByUser(Connection connection, int id, String lang) {
        ArrayList<Order> orders = new ArrayList<>();
        String getOrdersQuery = "SELECT *" +
                "FROM orders o\n" +
                "         JOIN users u on o.user_id = u.id\n" +
                "         JOIN books b ON b.id = o.book_id\n" +
                "         JOIN editions e on b.edition_id = e.id\n" +
                "         JOIN authors a on b.author_id = a.id\n" +
                "         JOIN orderTypes ot ON o.order_type_id = ot.id\n" +
                " WHERE u.id=? ORDER BY o.id;";
        try (PreparedStatement getOrdersStatement = connection.prepareStatement(getOrdersQuery)) {
            getOrdersStatement.setInt(1, id);
            getOrders(lang, orders, getOrdersStatement.executeQuery(getOrdersQuery));
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
        return orders;
    }

    private static void getOrders(String lang, ArrayList<Order> orders, ResultSet resultSet) throws SQLException {
        while (resultSet.next()) {
            Order order = new Order(resultSet.getInt("o.id"), new User(resultSet.getInt("u.id"), resultSet.getString("first_name"), resultSet.getString("last_name"),
                    resultSet.getString("email"), resultSet.getString("u.user_password"), null, null, null),
                    new Book(resultSet.getInt("b.id"), resultSet.getString("b.title_" + lang), resultSet.getString("b.book_src"), resultSet.getInt("b.price"), resultSet.getInt("b.fine"),
                            new Edition(resultSet.getInt("e.id"), resultSet.getString("e.title_" + lang), resultSet.getDate("e.date")),
                            new Author(resultSet.getString("a.id"), resultSet.getString("a.full_name_" + lang))),
                    resultSet.getInt("o.fine"), resultSet.getDate("o.deadline"), null, null);
            orders.add(order);
        }
    }
}
