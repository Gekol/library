package com.epam.java.ft.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Logger;


public class ConnectionPool {

    Connection connection;
    Logger logger = Logger.getLogger("ConnectionPool");

//    private ConnectionPool() {}

    private ConnectionPool(String url, String user, String password) {
        try {
            connection = DriverManager.getConnection(url,
                    user, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static ConnectionPool instance = null;

    public static ConnectionPool getInstance(String url, String user, String password) {
        if (instance == null)
            instance = new ConnectionPool(url, user, password);
        return instance;
    }

    public Connection getConnection() {
//        Context ctx;
//        Connection c = null;
//        try {
//            ctx = new InitialContext();
//            DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mydatabase");
//            c = ds.getConnection();
//        } catch (NamingException | SQLException e) {
//            logger.info(e.getMessage());
//        }
        return connection;
    }
}