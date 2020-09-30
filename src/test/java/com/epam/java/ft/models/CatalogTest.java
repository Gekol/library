package com.epam.java.ft.models;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CatalogTest {
    Catalog catalog = null;

    @Before
    public void setUp() {
        Edition edition = new Edition(1, "edition1", new Date());
        Author author = new Author(1, "Joanne Rowling");
        List<Book> books = new ArrayList<Book>() {
            {
                add(new Book(1, "Harry Potter and the philosopher's stone", edition, author));
                add(new Book(2, "Harry Potter and the chamber of secrets", edition, author));
                add(new Book(3, "Harry Potter and the prisoner of Azkaban", edition, author));
            }
        };
        List<Integer> bookCounts = new ArrayList<Integer>() {
            {
                add(3);
                add(7);
                add(1);
            }
        };
        catalog = new Catalog(books, bookCounts);
    }

    @Test
    public void getBooksTest() {
        Edition edition = new Edition(1, "edition1", new Date());
        Author author = new Author(1, "Joanne Rowling");
        List<Book> expected = new ArrayList<Book>() {
            {
                add(new Book(1, "Harry Potter and the philosopher's stone", edition, author));
                add(new Book(2, "Harry Potter and the chamber of secrets", edition, author));
                add(new Book(3, "Harry Potter and the prisoner of Azkaban", edition, author));
            }
        };
        Assert.assertEquals(expected, catalog.getBooks());
    }

    @Test
    public void setBooksTest() {
        Edition edition = new Edition(1, "edition1", new Date());
        Author author = new Author(1, "Joanne Rowling");
        List<Book> expected = new ArrayList<Book>() {
            {
                add(new Book(1, "Harry Potter and the philosopher's stone", edition, author));
                add(new Book(2, "Harry Potter and the chamber of secrets", edition, author));
                add(new Book(3, "Harry Potter and the prisoner of Azkaban", edition, author));
            }
        };
        catalog.setBooks(expected);
        Assert.assertEquals(expected, catalog.getBooks());
    }

    @Test
    public void getBooksCountTest() {
        List<Integer> expected = new ArrayList<Integer>() {
            {
                add(3);
                add(7);
                add(1);
            }
        };
        Assert.assertEquals(expected, catalog.getBookCounts());
    }

    @Test
    public void setBooksCountTest() {
        List<Integer> expected = new ArrayList<Integer>() {
            {
                add(3);
                add(7);
                add(1);
            }
        };
        catalog.setBookCounts(expected);
        Assert.assertEquals(expected, catalog.getBookCounts());
    }

    @Test
    public void equalsSameTest() {
        Assert.assertEquals(catalog, catalog);
    }

    @Test
    public void equalsTest() {
        Edition edition = new Edition(1, "edition1", new Date());
        Author author = new Author(1, "Joanne Rowling");
        List<Book> books = new ArrayList<Book>() {
            {
                add(new Book(1, "Harry Potter and the philosopher's stone", edition, author));
                add(new Book(2, "Harry Potter and the chamber of secrets", edition, author));
                add(new Book(3, "Harry Potter and the prisoner of Azkaban", edition, author));
            }
        };
        List<Integer> bookCounts = new ArrayList<Integer>() {
            {
                add(3);
                add(7);
                add(1);
            }
        };
        Catalog expected = new Catalog(books, bookCounts);
        Assert.assertEquals(expected, catalog);
    }
}
