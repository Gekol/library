package com.epam.java.ft.dao;

import org.apache.log4j.Logger;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;

;


public class ConnectionPool {

    public static Logger logger = Logger.getLogger("ConnectionPool");
    private static ConnectionPool instance = null;
    Connection connection;

    private ConnectionPool(String url, String user, String password) {
        try {
            connection = DriverManager.getConnection(url,
                    user, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void testDb(Connection conn) {
        Statement stmt = null;
        ResultSet rs = null;
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM users");
            while (rs.next()) {
                int n = rs.getMetaData().getColumnCount();
                for (int i = 1; i <= n; i++) {
                    System.out.print(":" + rs.getString(i) + ":");
                }
                System.out.println();
            }
        } catch (SQLException ex) {
            // handle any errors
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        } finally {
            // it is a good idea to release
            // resources in a finally{} block
            // in reverse-order of their creation
            // if they are no-longer needed

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {
                } // ignore

                rs = null;
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) {
                } // ignore

                stmt = null;
            }
        }
    }

    public static ConnectionPool getInstance(String url, String user, String password) {
        if (instance == null)
            instance = new ConnectionPool(url, user, password);
        return instance;
    }

    public static void main(String[] args) {
        ConnectionPool db = ConnectionPool.getInstance("jdbc:mysql://localhost:3306/?serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8",
                "root", "1111");
        Connection conn = null;
        conn = db.getConnection();
        testDb(conn);

    }

    public Connection getConnection() {
        Connection con = null;
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");

            // ST4DB - the name of data source
            DataSource ds = (DataSource) envContext.lookup("jdbc/library");
            con = ds.getConnection();
        } catch (NamingException | SQLException ex) {
            System.out.println("Cannot obtain a connection from the pool. " + ex.getMessage());
        }
        return con;
    }

    public Connection getConnectionWithDriverManager() {
        return connection;
    }
}