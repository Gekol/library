package com.epam.java.ft.dao;

import com.epam.java.ft.models.Author;
import com.epam.java.ft.models.Book;
import com.epam.java.ft.models.Edition;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class BookDao {
    public static Logger logger = Logger.getLogger("BookDao");

    public static List<Book> getBook(Connection connection, String querySelector, String language) {
        ArrayList<Book> books = new ArrayList<>();
        String getBooksQuery = "SELECT b.id as b_id, b.title_" + language + " as b_title, book_src, price, fine, a.id as a_id, a.full_name_" + language + " as full_name, e.id as e_id, e.title_" + language + " as e_title, e.date\n" +
                "FROM (books b JOIN authors a ON b.author_id = a.id) JOIN editions e ON b.edition_id = e.id WHERE b.title_" + language + " LIKE \"%" + querySelector + "%\";";
        try (Statement preparedStatement = connection.createStatement()) {
            getBooksList(books, preparedStatement.executeQuery(getBooksQuery));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    public static List<Book> getBooks(Connection connection, String language) {
        ArrayList<Book> books = new ArrayList<>();
        String getBooksQuery = "SELECT b.id as b_id, b.title_" + language + " as b_title, book_src, price, fine, a.id as a_id, a.full_name_" + language + " as full_name, e.id as e_id, e.title_" + language + " as e_title" +
                ", e.date\n FROM (books b JOIN authors a ON b.author_id = a.id)\n " +
                "         JOIN editions e ON b.edition_id = e.id";
        try (Statement getBooksStatement = connection.createStatement()) {
            getBooksList(books, getBooksStatement.executeQuery(getBooksQuery));
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
        return books;
    }

    private static void getBooksList(ArrayList<Book> books, ResultSet resultSet) throws SQLException {
        while (resultSet.next()) {
            Book book = new Book(resultSet.getInt("b_id"), resultSet.getString("b_title"), resultSet.getString("book_src"),
                    resultSet.getInt("price"), resultSet.getInt("fine"),
                    new Edition(resultSet.getInt("e_id"), resultSet.getString("e_title"), resultSet.getDate("date")),
                    new Author(resultSet.getString("a_id"), resultSet.getString("full_name")));
            books.add(book);
        }
    }

    public static int insertBook(Connection connection, Book book) {
        String insertBookQuery = "INSERT INTO books(title_en, title_ru, author_id, edition_id) \n" +
                "VALUES (?, ?, ?, ?);";
        try (PreparedStatement insertBookStatement = connection.prepareStatement(insertBookQuery)) {
            insertBookStatement.setString(1, book.getTitle());
            insertBookStatement.setString(2, book.getTitle());
            insertBookStatement.setString(3, book.getAuthor().getId());
            insertBookStatement.setInt(4, book.getEdition().getId());
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

    public static int updateBook(Connection connection, Book book, String language) {
        String deleteBookQuery = "UPDATE books SET title" + language + "=?, author_id=?, edition_id=? WHERE id=?";
        try (PreparedStatement deleteBookStatement = connection.prepareStatement(deleteBookQuery)) {
            deleteBookStatement.setString(1, book.getTitle());
            deleteBookStatement.setString(1, book.getTitle());
            deleteBookStatement.setString(3, book.getAuthor().getId());
            deleteBookStatement.setInt(4, book.getEdition().getId());
            deleteBookStatement.setInt(5, book.getId());
            return deleteBookStatement.executeUpdate();
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
        return 0;
    }
}
