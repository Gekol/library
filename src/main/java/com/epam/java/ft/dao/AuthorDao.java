package com.epam.java.ft.dao;

import com.epam.java.ft.models.Author;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

;

public class AuthorDao {
    public static Logger logger = Logger.getLogger("AuthorDao");

    public static List<Author> getAuthors(Connection connection) {
        ArrayList<Author> authors = new ArrayList<>();
        String getAuthorsQuery = "SELECT *\n" +
                "FROM authors ORDER BY id";
        try (Statement getBooksStatement = connection.createStatement()) {
            getAuthorsList(authors, getBooksStatement.executeQuery(getAuthorsQuery));
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
        return authors;
    }

    private static void getAuthorsList(ArrayList<Author> authors, ResultSet resultSet) throws SQLException {
        while (resultSet.next()) {
            Author author = new Author(resultSet.getString("id"), resultSet.getString("full_name"));
            authors.add(author);
        }
    }
}
