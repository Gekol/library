package com.epam.java.ft.dao;

import com.epam.java.ft.models.Author;
import com.epam.java.ft.models.Book;
import com.epam.java.ft.models.Edition;
import org.apache.log4j.Logger;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

;

public class BookDao {
    public static Logger logger = Logger.getLogger("BookDao");

    public static List<Book> getBook(Connection connection, String querySelector) {
        ArrayList<Book> books = new ArrayList<>();
        String getBooksQuery = "SELECT b.id, b.title, b.book_src, b.price, b.fine, a.id, a.full_name, e.id, e.title, e.date\n" +
                "FROM (books b JOIN authors a ON b.author_id = a.id)\n" +
                "         JOIN editions e ON b.edition_id = e.id WHERE b.title LIKE ?;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(getBooksQuery);
            String predicate = "%" + querySelector + "%";
            preparedStatement.setString(1, predicate);
            getBooksList(books, preparedStatement.executeQuery());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    public static List<Book> getBooks(Connection connection) {
        ArrayList<Book> books = new ArrayList<>();
        String getBooksQuery = "SELECT b.id, b.title, b.book_src, b.price, b.fine, a.id, a.full_name, e.id, e.title, e.date\n" +
                "FROM (books b JOIN authors a ON b.author_id = a.id)\n" +
                "         JOIN editions e ON b.edition_id = e.id;";
        try (Statement getBooksStatement = connection.createStatement()) {
            getBooksList(books, getBooksStatement.executeQuery(getBooksQuery));
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
        return books;
    }

    public static List<Book> getOrderedBooks(Connection connection, String columnName) {
        ArrayList<Book> books = new ArrayList<>();
        String getBooksQuery = "SELECT *\n" +
                "FROM (books b JOIN authors a ON b.author_id = a.id)\n" +
                "         JOIN editions e ON b.edition_id = e.id ORDER BY " + columnName + ";";
        try (Statement getBooksStatement = connection.createStatement()) {
            getBooksList(books, getBooksStatement.executeQuery(getBooksQuery));
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
        return books;
    }

    private static void getBooksList(ArrayList<Book> books, ResultSet resultSet) throws SQLException {
        while (resultSet.next()) {
            Book book = new Book(resultSet.getInt("b.id"), resultSet.getString("b.title"), resultSet.getString("b.book_src"),
                    resultSet.getInt("b.price"), resultSet.getInt("b.fine"),
                    new Edition(resultSet.getInt("e.id"), resultSet.getString("e.title"), resultSet.getDate("e.date")),
                    new Author(resultSet.getString("a.id"), resultSet.getString("a.full_name")));
            books.add(book);
        }
    }

    public static int insertBook(Connection connection, Book book) {
        String insertBookQuery = "INSERT INTO books(title, author_id, edition_id) \n" +
                "VALUES (?, ?, ?);";
        try (PreparedStatement insertBookStatement = connection.prepareStatement(insertBookQuery)) {
            insertBookStatement.setString(1, book.getTitle());
            insertBookStatement.setString(2, book.getAuthor().getId());
            insertBookStatement.setInt(3, book.getEdition().getId());
            return insertBookStatement.executeUpdate();
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
        return 0;
    }

    public static int deleteBook(Connection connection, Book book) {
        String deleteBookQuery = "DELETE FROM books WHERE id=?";
        try (PreparedStatement deleteBookStatement = connection.prepareStatement(deleteBookQuery)) {
            deleteBookStatement.setInt(1, book.getId());
            return deleteBookStatement.executeUpdate();
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
        return 0;
    }

    public static int updateBook(Connection connection, Book book) {
        String deleteBookQuery = "UPDATE books SET title=?, author_id=?, edition_id=? WHERE id=?";
        try (PreparedStatement deleteBookStatement = connection.prepareStatement(deleteBookQuery)) {
            deleteBookStatement.setString(1, book.getTitle());
            deleteBookStatement.setString(2, book.getAuthor().getId());
            deleteBookStatement.setInt(3, book.getEdition().getId());
            deleteBookStatement.setInt(4, book.getId());
            return deleteBookStatement.executeUpdate();
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
        return 0;
    }
}
