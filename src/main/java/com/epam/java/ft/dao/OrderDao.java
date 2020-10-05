package com.epam.java.ft.dao;

import com.epam.java.ft.models.*;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

;

public class OrderDao {
    public static Logger logger = Logger.getLogger("OrderDao");

    public static List<Order> getOrders(Connection connection) {
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
            ResultSet res = getOrdersStatement.executeQuery(getOrdersQuery);
            while (res.next()) {
                Order order = new Order(res.getInt("o.id"), new User(res.getInt("u.id"), res.getString("first_name"), res.getString("last_name"),
                        res.getString("email"), res.getString("u.user_password"), null, null, null),
                        new Book(res.getInt("b.id"), res.getString("b.title"), res.getString("b.book_src"), res.getInt("b.price"), res.getInt("b.fine"), new Edition(res.getInt("e.id"), res.getString("e.title"), res.getDate("e.date")),
                                new Author(res.getString("a.id"), res.getString("a.full_name"))),
                        res.getInt("o.book_amount"), res.getInt("o.fine"), res.getDate("o.deadline"), null, null);
                orders.add(order);
            }
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
        return orders;
    }
}
