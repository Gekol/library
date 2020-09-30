package com.epam.java.ft.dao;

import com.epam.java.ft.models.Author;
import com.epam.java.ft.models.Book;
import com.epam.java.ft.models.Edition;
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

public class BookDaoTest {
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
    public void getBooksTest() {
        List<Book> books = BookDao.getBooks(connection);
        List<Book> expected = new ArrayList<Book>() {
            {
                add(new Book(1, "Harry Potter and the philosopher's stone", new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author(1, "Joanne Rowling")));
                add(new Book(2, "Harry Potter and the chamber of secrets", new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author(1, "Joanne Rowling")));
                add(new Book(3, "Atlas Shrugged", new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author(2, "Ayn Rand")));
                add(new Book(4, "33 strategies of War", new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author(3, "Robert Greene")));
            }
        };
        Assert.assertEquals(expected, books);
    }

    @Test
    public void getOrderedByNameTest() {
        List<Book> books = BookDao.getOrderedBooks(connection, "b.title");
        List<Book> expected = new ArrayList<Book>() {
            {
                add(new Book(4, "33 strategies of War", new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author(3, "Robert Greene")));
                add(new Book(3, "Atlas Shrugged", new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author(2, "Ayn Rand")));
                add(new Book(2, "Harry Potter and the chamber of secrets", new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author(1, "Joanne Rowling")));
                add(new Book(1, "Harry Potter and the philosopher's stone", new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author(1, "Joanne Rowling")));
            }
        };
        Assert.assertEquals(expected, books);
    }

    @Test
    public void getOrderedByAuthorTest() {
        List<Book> books = BookDao.getOrderedBooks(connection, "a.full_name");
        List<Book> expected = new ArrayList<Book>() {
            {
                add(new Book(3, "Atlas Shrugged", new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author(2, "Ayn Rand")));
                add(new Book(1, "Harry Potter and the philosopher's stone", new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author(1, "Joanne Rowling")));
                add(new Book(2, "Harry Potter and the chamber of secrets", new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author(1, "Joanne Rowling")));
                add(new Book(4, "33 strategies of War", new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author(3, "Robert Greene")));
            }
        };
        Assert.assertEquals(expected, books);
    }

    @Test
    public void getOrderedByEditionTest() {
        List<Book> books = BookDao.getOrderedBooks(connection, "e.title");
        List<Book> expected = new ArrayList<Book>() {
            {
                add(new Book(1, "Harry Potter and the philosopher's stone", new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author(1, "Joanne Rowling")));
                add(new Book(2, "Harry Potter and the chamber of secrets", new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author(1, "Joanne Rowling")));
                add(new Book(3, "Atlas Shrugged", new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author(2, "Ayn Rand")));
                add(new Book(4, "33 strategies of War", new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author(3, "Robert Greene")));
            }
        };
        Assert.assertEquals(expected, books);
    }

    @Test
    public void getOrderedByEditionDateTest() {
        List<Book> books = BookDao.getOrderedBooks(connection, "e.date");
        List<Book> expected = new ArrayList<Book>() {
            {
                add(new Book(1, "Harry Potter and the philosopher's stone", new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author(1, "Joanne Rowling")));
                add(new Book(2, "Harry Potter and the chamber of secrets", new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author(1, "Joanne Rowling")));
                add(new Book(3, "Atlas Shrugged", new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author(2, "Ayn Rand")));
                add(new Book(4, "33 strategies of War", new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author(3, "Robert Greene")));
            }
        };
        Assert.assertEquals(expected, books);
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
