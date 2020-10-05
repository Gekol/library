package com.epam.java.ft.servlets;

import com.epam.java.ft.dao.*;
import com.epam.java.ft.models.Author;
import com.epam.java.ft.models.Book;
import com.epam.java.ft.models.User;
import org.apache.commons.validator.routines.EmailValidator;
import org.apache.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MainPageServlet extends HttpServlet {
    public static final String LOGGED_IN_ATTRIBUTE = "loggedIn";
    public static Logger logger = Logger.getLogger("MainPageServlet");
    private Connection connection = ConnectionPool.getInstance("jdbc:mysql://localhost:3306/library?serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8",
            "root", "1111").getConnectionWithDriverManager();

    public static void logIn(HttpServletRequest request, String value) {
        request.getSession(true).setAttribute(LOGGED_IN_ATTRIBUTE, value);
    }

    private List<Book> getBooksByAuthor(HttpServletRequest request) {
        List<Book> books = BookDao.getBooks(connection);
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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Author> authors = AuthorDao.getAuthors(connection);
        request.setAttribute("authors", authors);

        String getBook = request.getParameter("book");
        List<Book> books = getBooksByAuthor(request);

        Pattern pattern = Pattern.compile("\\*/\\d+");
        String currentPath = request.getRequestURL().toString();
        Matcher matcher = pattern.matcher(currentPath);

        int currentPage = 1;

        if (matcher.find()) {
            currentPage = Integer.parseInt(currentPath.substring(matcher.start(), matcher.end()));
        }
        request.setAttribute("page", currentPage);

        if (getBook == null) {
            if (books.size() != 0) {
                request.setAttribute("books", books);
            } else {
                request.setAttribute("books", BookDao.getBooks(connection));
            }
        } else {
            request.setAttribute("books", BookDao.getBook(connection, getBook));
        }

        if (request.getSession().getAttribute(LOGGED_IN_ATTRIBUTE) != null) {
            logIn(request, "false");
        }

        RequestDispatcher view = request.getRequestDispatcher("WEB-INF/view/index.jsp");
        view.forward(request, response);
    }

    private boolean isValidString(String name, String regex) {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(name);
        return matcher.matches();
    }

    private boolean registrationValidation(Map<String, String[]> parameters) {
        if (parameters.get("first_name") != null && !isValidString(parameters.get("first_name")[0], "^[a-zA-Z]+$")) {
            return false;
        }
        if (parameters.get("last_name") != null && !isValidString(parameters.get("last_name")[0], "^[a-zA-Z]+$")) {
            return false;
        }
        if (!EmailValidator.getInstance().isValid(parameters.get("email")[0])) {
            return false;
        }
        return isValidString(parameters.get("password")[0], "^(?=.*\\\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,20}$");
    }

    private void addNewUser(Map<String, String[]> parameters) {
        if (registrationValidation(parameters)) {
            User newUser = new User(1, parameters.get("first_name") != null ? parameters.get("first_name")[0] : null, parameters.get("last_name") != null ? parameters.get("last_name")[0] : null,
                    parameters.get("email")[0], parameters.get("password")[0], UserTypeDao.getType(connection, "user"), UserStatusDao.getStatus(connection, "active"), null);
            UserDao.insertUser(connection, newUser);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> parameters = request.getParameterMap();
        RequestDispatcher profilePage = request.getRequestDispatcher("WEB-INF/view/profile.jsp");
        if (parameters.containsKey("first_name")) {
            addNewUser(parameters);
            MainPageServlet.logIn(request, "true");
            System.out.println(request.getSession().getAttribute("loggedIn"));
            response.sendRedirect("library/profile");
        } else if (UserDao.loginUser(connection, parameters.get("email")[0], parameters.get("password")[0])) {
            MainPageServlet.logIn(request, "true");
            System.out.println(request.getSession().getAttribute("loggedIn"));
            response.sendRedirect("library/profile");
        } else {
            response.sendRedirect("/main");
            RequestDispatcher mainPage = request.getRequestDispatcher("WEB-INF/view/index.jsp");
            mainPage.forward(request, response);
        }
    }
}
