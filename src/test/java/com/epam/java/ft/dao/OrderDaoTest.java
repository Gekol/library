package com.epam.java.ft.dao;

import com.epam.java.ft.models.*;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class OrderDaoTest {
    Connection connection = ConnectionPool.getInstance("jdbc:mysql://localhost:3306/?serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8",
            "root", "1111").getConnection();
    Logger logger = Logger.getLogger("OrderDaoTest");

    @Before
    public void CreateEmptyDatabase() {
        try {
            PrepareTests.beforeTests(connection);
        } catch (FileNotFoundException | SQLException e) {
            logger.info(e.getMessage());
        }
    }

    @Test
    public void getOrdersTest() {
        List<Order> orders = OrderDao.getOrders(connection);
        List<Order> expected = new ArrayList<Order>() {
            {
                add(new Order(1, new User(1, "Darth", "Vader", "vader@example.com", "1111", null, null, null), new Book(1, "Harry Potter and the philosopher's stone", new Edition(2, "Edition 2", new Date(2020, 2, 1)), new Author(1, "Joanne Rowling")), 2, 0, null, null, null));
                add(new Order(2, new User(3, "Mace", "Vindu", "vindu@example.com", "1111", null, null, null), new Book(4, "33 strategies of War", new Edition(1, "Edition 1", new Date(2020, 1, 1)), new Author(3, "Robert Greene")), 3, 0, null, null, null));
            }
        };
        Assert.assertEquals(expected, orders);
    }

    @After
    public void DropDatabase() {
        try {
            PrepareTests.afterTests(connection);
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
    }
}
