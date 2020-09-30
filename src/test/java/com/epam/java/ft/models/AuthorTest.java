package com.epam.java.ft.models;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class AuthorTest {
    Author author = null;

    @Before
    public void setUp() {
        author = new Author(1, "Joanne Rowling");
    }

    @Test
    public void getIdTest() {
        Assert.assertEquals(1, author.getId());
    }

    @Test
    public void setIdTest() {
        author.setId(2);
        Assert.assertEquals(2, author.getId());
    }

    @Test
    public void getFullNameTest() {
        Assert.assertEquals("Joanne Rowling", author.getFullName());
    }

    @Test
    public void setFullNameTest() {
        author.setFullName("1");
        Assert.assertEquals("1", author.getFullName());
    }

    @Test
    public void equalsSameTest() {
        Assert.assertEquals(author, author);
    }

    @Test
    public void equalsTest() {
        Author expected = new Author(1, "Joanne Rowling");
        Assert.assertEquals(expected, author);
    }
}
