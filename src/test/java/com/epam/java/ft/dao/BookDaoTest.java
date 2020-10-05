package com.epam.java.ft.dao;

import com.epam.java.ft.models.Author;
import com.epam.java.ft.models.Book;
import com.epam.java.ft.models.Edition;
import org.apache.log4j.Logger;
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

;

public class BookDaoTest {
    Connection connection = ConnectionPool.getInstance("jdbc:mysql://localhost:3306/?serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8",
            "root", "1111").getConnectionWithDriverManager();
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
                add(new Book(1, "Harry Potter and the philosopher's stone", "harry_potter_and_the_philosopher's_stone.webp", 10, 5, new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author("rowling", "joanne rowling")));
                add(new Book(2, "Harry Potter and the chamber of secrets", "harry_potter_and_the_chamber_of_secrets.jpg", 10, 5, new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author("rowling", "joanne rowling")));
            }
        };
        Assert.assertEquals(expected.toString(), books.toString());
    }

    @Test
    public void getOrderedByTitleTest() {
        List<Book> books = BookDao.getOrderedBooks(connection, "b.title");
        List<Book> expected = new ArrayList<Book>() {
            {
                add(new Book(2, "Harry Potter and the chamber of secrets", "harry_potter_and_the_chamber_of_secrets.jpg", 10, 5, new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author("rowling", "joanne rowling")));
                add(new Book(1, "Harry Potter and the philosopher's stone", "harry_potter_and_the_philosopher's_stone.webp", 10, 5, new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author("rowling", "joanne rowling")));
            }
        };
        Assert.assertEquals(expected.toString(), books.toString());
    }

    @Test
    public void getOrderedByAuthorTest() {
        List<Book> books = BookDao.getOrderedBooks(connection, "a.id");
        List<Book> expected = new ArrayList<Book>() {
            {
                add(new Book(1, "Harry Potter and the philosopher's stone", "harry_potter_and_the_philosopher's_stone.webp", 10, 5, new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author("rowling", "joanne rowling")));
                add(new Book(2, "Harry Potter and the chamber of secrets", "harry_potter_and_the_chamber_of_secrets.jpg", 10, 5, new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author("rowling", "joanne rowling")));
            }
        };
        Assert.assertEquals(expected.toString(), books.toString());
    }

    @Test
    public void getOrderedByEditionTest() {
        List<Book> books = BookDao.getOrderedBooks(connection, "e.title");
        List<Book> expected = new ArrayList<Book>() {
            {
                add(new Book(1, "Harry Potter and the philosopher's stone", "harry_potter_and_the_philosopher's_stone.webp", 10, 5, new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author("rowling", "joanne rowling")));
                add(new Book(2, "Harry Potter and the chamber of secrets", "harry_potter_and_the_chamber_of_secrets.jpg", 10, 5, new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author("rowling", "joanne rowling")));
            }
        };
        Assert.assertEquals(expected.toString(), books.toString());
    }

    @Test
    public void getOrderedByEditionDateTest() {
        List<Book> books = BookDao.getOrderedBooks(connection, "e.date");
        List<Book> expected = new ArrayList<Book>() {
            {
                add(new Book(1, "Harry Potter and the philosopher's stone", "harry_potter_and_the_philosopher's_stone.webp", 10, 5, new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author("rowling", "joanne rowling")));
                add(new Book(2, "Harry Potter and the chamber of secrets", "harry_potter_and_the_chamber_of_secrets.jpg", 10, 5, new Edition(1, "Edition 1", new Date(120, 0, 1)), new Author("rowling", "joanne rowling")));
            }
        };
        Assert.assertEquals(expected.toString(), books.toString());
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
