package com.epam.java.ft.servlets;

import com.epam.java.ft.dao.*;
import com.epam.java.ft.models.Author;
import com.epam.java.ft.models.Book;
import com.epam.java.ft.models.User;
import org.apache.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MainPageServlet extends HttpServlet {
    public static Logger logger = Logger.getLogger("MainPageServlet");
    private Connection connection = ConnectionPool.getConnection();
    private HashMap<String, String> statuses = new HashMap<String, String>() {{
        put("active_en", "Active");
        put("active_ru", "Активный");
        put("blocked_en", "Blocked");
        put("blocked_ru", "Заблокированный");
    }};
    private HashMap<String, String> types = new HashMap<String, String>() {{
        put("user_en", "User");
        put("user_ru", "Пользователь");
        put("librarian_en", "Librarian");
        put("librarian_ru", "Библиотекарь");
        put("admin_en", "Admin");
        put("admin_ru", "Админимтратор");
    }};


    private List<Book> getBooksByAuthor(HttpServletRequest request, String lang) {
        List<Book> books = BookDao.getBooks(connection, lang);
        int i = 0;
        while (i != books.size()) {
            if (request.getParameter(books.get(i).getAuthor().getId()) == null) {
                books.remove(i);
            } else {
                i++;
            }
        }
        return books;
    }

    private void orderBooks(String orderBy, String ascending, final String constLanguage, List<Book> books) {

        if (orderBy.equals("title")) {
            if (ascending.equals("true")) {
                books.sort(Comparator.comparing(book -> book.getTitle(constLanguage)));
            } else {
                books.sort((book, t1) -> t1.getTitle(constLanguage).compareTo(book.getTitle(constLanguage)));
            }
        }
        if (orderBy.equals("author")) {
            if (ascending.equals("true")) {
                books.sort(Comparator.comparing(book -> book.getAuthor().getFullName()));
            } else {
                books.sort((book, t1) -> t1.getAuthor().getFullName().compareTo(book.getAuthor().getFullName()));
            }
        }
        if (orderBy.equals("edition")) {
            if (ascending.equals("true")) {
                books.sort(Comparator.comparing(book -> book.getEdition().getTitle()));
            } else {
                books.sort((book, t1) -> t1.getEdition().getTitle().compareTo(book.getEdition().getTitle()));
            }
        }
        if (orderBy.equals("editionDate")) {
            if (ascending.equals("true")) {
                books.sort(Comparator.comparing(book -> book.getEdition().getDate()));
            } else {
                books.sort((book, t1) -> t1.getEdition().getDate().compareTo(book.getEdition().getDate()));
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String language = request.getParameter("language");
        List<Author> authors;
        if (language == null) {
            language = "ru";
        }
        request.setAttribute("language", language);
        authors = AuthorDao.getAuthors(connection, language);

        request.setAttribute("authors", authors);

        String getBook = request.getParameter("book");
        List<Book> books = getBooksByAuthor(request, language);

        String orderBy = request.getParameter("orderBy");
        String ascending = request.getParameter("ascending");
        if (orderBy == null) {
            orderBy = "title";
        }
        if (ascending == null) {
            ascending = "true";
        }

        request.setAttribute("ascending", ascending);
        request.setAttribute("orderBy", orderBy);

        String currentPage = "1";
        if (request.getParameter("page") != null) {
            currentPage = request.getParameter("page");
        }
        request.setAttribute("page", currentPage);

        if (getBook == null) {
            if (books.size() == 0) {
                books = BookDao.getBooks(connection, language);
            }
            orderBooks(orderBy, ascending, language, books);
            request.setAttribute("books", books);
        } else {
            request.setAttribute("books", BookDao.getBook(connection, getBook, language));
        }

        RequestDispatcher view = request.getRequestDispatcher("WEB-INF/view/index.jsp");
        view.forward(request, response);
    }

    private void logIn(User user, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("loggedIn", "true");
        session.setAttribute("email", user.getEmail());
        String name = user.getFirstName();
        String surname = user.getLastName();
        String username;
        if (!name.equals("") && !surname.equals("")) {
            username = name + " " + surname;
        } else if (!name.equals("")) {
            username = name;
        } else {
            username = surname;
        }
        session.setAttribute("userName", username);
    }

    private User addNewUser(Map<String, String[]> parameters, String language) {
        User newUser = new User(1, parameters.get("first_name")[0], parameters.get("last_name")[0],
                parameters.get("email")[0], parameters.get("password")[0], UserTypeDao.getType(connection, types.get("user_" + language), language),
                UserStatusDao.getStatus(connection, statuses.get("active_" + language), language), null);
        UserDao.insertUser(connection, newUser);
        return newUser;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String language = request.getParameter("language");
        if (language == null) {
            language = "ru";
        }
        User user;
        if (request.getParameterMap().containsKey("first_name")) {
            user = addNewUser(request.getParameterMap(), language);
            logIn(user, request);
            response.sendRedirect(request.getContextPath() + "/profile");
        } else {
            user = UserDao.loginUser(connection, email, password, language);
            if (user != null) {
                logIn(user, request);
                response.sendRedirect(request.getContextPath() + "/profile");
            } else {
                response.sendRedirect(request.getContextPath());
            }
        }
    }
}
