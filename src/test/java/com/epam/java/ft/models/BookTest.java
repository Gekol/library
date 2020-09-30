package com.epam.java.ft.models;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.util.Date;

public class BookTest {

    Book book = null;
    Edition edition = new Edition(1, "edition1", new Date());
    Author author = new Author(1, "Joanne Rowling");

    @Before
    public void setUp() {
        book = new Book(1, "Harry Potter and the philosopher's stone", edition, author);
    }

    @Test
    public void getIdTest() {
        int expected = 1;
        Assert.assertEquals(expected, book.getId());
    }

    @Test
    public void setIdTest() {
        int expected = 2;
        book.setId(expected);
        Assert.assertEquals(expected, book.getId());
    }

    @Test
    public void getTitleTest() {
        String expected = "Harry Potter and the philosopher's stone";
        Assert.assertEquals(expected, book.getTitle());
    }

    @Test
    public void setTitleTest() {
        String expected = "Harry Potter and the chamber of secrets";
        book.setTitle(expected);
        Assert.assertEquals(expected, book.getTitle());
    }

    @Test
    public void getEditionTest() {
        Assert.assertEquals(edition, book.getEdition());
    }

    @Test
    public void setEditionTest() {
        Edition expected = new Edition(1, "edition1", new Date());
        book.setEdition(expected);
        Assert.assertEquals(expected, book.getEdition());
    }

    @Test
    public void getAuthorTest() {
        Assert.assertEquals(author, book.getAuthor());
    }

    @Test
    public void setAuthorTest() {
        Author expected = new Author(1, "Joanne1 Rowling");
        book.setAuthor(expected);
        Assert.assertEquals(expected, book.getAuthor());
    }

    @Test
    public void equalsSameTest() {
        Assert.assertEquals(book, book);
    }

    @Test
    public void equalsTest() {
        Book expected = new Book(1, "Harry Potter and the philosopher's stone", edition, author);
        Assert.assertEquals(expected, book);
    }
}
