<%@ page import="com.epam.java.ft.models.Author" %>
<%@ page import="com.epam.java.ft.models.Book" %>
<%@ page import="com.epam.java.ft.models.Subscription" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title>Библиотека "Книжный червь"</title>
    <jsp:include page="../../includeStyles.jsp"/>
</head>

<body>
<%
    Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
%>
<jsp:include page="../../header.jsp"/>

<main class="catalog-main main-content">
    <section class="goods container">
        <ul class="way">
            <li><a href="<%out.print(request.getContextPath());%>"><img
                    src="<%=request.getContextPath()%>/resources/img/icon-home.svg" width="14"
                    height="12" alt="Main page"/></a></li>
            <li><a href="<%out.print(request.getContextPath());%>">Каталог</a></li>
        </ul>
        <h3 class="books-block-title">Книги
            <span>
                <a href="?language=en" class="switch-language">EN</a>
                <a href="?language=ru" class="switch-language">RU</a>
            </span>
        </h3>
        <section class="order-block">
            <article class="filter-block">
                <p class="filter-title">Фильтр:</p>
                <form action="<%out.print(request.getContextPath());%>" class="filters">
                    <div>
                        <fieldset>
                            <legend class="filter-subtitle">Авторы:</legend>
                            <input type="hidden" name="language"
                                   value="<%out.print(request.getAttribute("language"));%>">
                            <ul class="manufacturer-filter">
                                <%
                                    List<Author> authors = (List<Author>) request.getAttribute("authors");
                                    for (Object obj : authors) {
                                        Author author = (Author) obj;
                                        String authorId = author.getId();
                                        out.print("<li><input type=\"checkbox\" class=\"visually-hidden\" name=\"" + authorId + "\" id=\"" + authorId + "\"><label\n" +
                                                "                                        for=\"" + authorId + "\" tabindex=\"0\">" + author.getFullName() + "</label></li>");
                                    }
                                %>
                            </ul>
                        </fieldset>
                    </div>
                    <input type="submit" value="Показать">
                </form>
            </article>
            <article class="books-block">
                <div class="sort-block">
                    <p>Сортировка</p>
                    <ul class="sort-filters">
                        <li class="sort-filter"><a
                                href="<%out.print(request.getContextPath());%>?language=<% out.print((String) request.getAttribute("language")); %>&orderBy=title">По
                            названию</a></li>
                        <li class="sort-filter"><a
                                href="<%out.print(request.getContextPath());%>?language=<% out.print((String) request.getAttribute("language")); %>&orderBy=author">По
                            автору</a></li>
                        <li class="sort-filter"><a
                                href="<%out.print(request.getContextPath());%>?language=<% out.print((String) request.getAttribute("language")); %>&orderBy=edition">По
                            изданию</a></li>
                        <li class="sort-filter"><a
                                href="<%out.print(request.getContextPath());%>?language=<% out.print((String) request.getAttribute("language")); %>&orderBy=editionDate">По
                            дате издания</a></li>
                    </ul>
                    <%String language = (String) request.getAttribute("language");%>
                    <%String orderBy = (String) request.getAttribute("orderBy");%>
                    <a href="<%out.print(request.getContextPath());%>?language=<% out.print(language); %>&orderBy=<% out.print(orderBy); %>&ascending=true">
                        <div class="arrow ascending <%if (request.getAttribute("ascending").equals("true")) {
                            out.print("selected");
                        }%>"></div>
                    </a>
                    <a href="<%out.print(request.getContextPath());%>?language=<% out.print(language); %>&orderBy=<% out.print(orderBy); %>&ascending=false">
                        <div class="arrow descending <%if (request.getAttribute("ascending").equals("false")) {
                            out.print("selected");
                        }%>"></div>
                    </a>
                </div>
                <ul class="books-list">
                    <%
                        List<Book> books = (List<Book>) request.getAttribute("books");
                        int currentPage = Integer.parseInt((String) request.getAttribute("page"));
                        int start = (currentPage - 1) * 9;
                        int size = books.size();
                        int booksOnPageCount = Math.min(start + 9, size);
                        Subscription subscription = (Subscription) session.getAttribute("subscription");
                        for (Object obj : books.subList(start, booksOnPageCount)) {
                            Book book = (Book) obj;
                            String text = "";
                            if (loggedIn != null && loggedIn) {
                                int status = (Integer) session.getAttribute("status");
                                if (status != 1) {
                                    text = "<span>Вы заблокированы за неуплату штрафа!</span>";
                                } else {
                                    text = (subscription != null ? "<a href=\"order?orderType=Subscription&book_id=" + book.getId() + "\" class=\"buy-button\">Абонемент</a>\n" : "") +
                                            "<a href=\"order?orderType=Reading hall&book_id=" + book.getId() + "\" class=\"buy-button reading-hall-choose\">Читальный зал</a>\n";
                                }
                            } else {
                                text = "<span>Войдите в аккаунт, чтобы заказать книгу</span>";
                            }
                            out.print("<li class=\"good\" tabindex=\"0\">\n" +
                                    "                        <div class=\"book\">\n" +
                                    "                            <img src=\"" + request.getContextPath() + "/resources/img/books/" + book.getBookSrc() + "\" width=\"144\" height=\"225\" alt=\"" + book.getTitle() + "\"/>\n" +
                                    "                        </div>\n" +
                                    "                        <div class=\"buy\">\n" + text +
                                    "                        </div>\n" +
                                    "                        <b>" + book.getTitle() + "</b>\n" +
                                    "                        <p class=\"author\">" + book.getAuthor().getFullName() + "</p>\n" +
                                    "                        <p class=\"current-price\">" + book.getPrice() + " грн/час</p>\n" +
                                    "                    </li>");
                        }
                    %>
                </ul>
                <ul class="list-pages">
                    <%
                        int pagesCount = size / 9;
                        if ((size % 9) != 0) {
                            pagesCount++;
                        }
                        if (pagesCount > 1) {
                            for (int i = 0; i < pagesCount; i++) {
                                out.print("<li><a href=\"" + request.getContextPath() + "?language=" + language + "&orderBy=" + orderBy + "&ascending=" + request.getAttribute("ascending") + "&page=" + (i + 1));
                                if ((i + 1) == currentPage) {
                                    out.print("\" class=\"chosen");
                                }
                                out.print("\">" + (i + 1 + "</a></li>"));
                            }
                        }
                    %>
                    <%
                        if (currentPage != pagesCount) {
                            out.print("<li><a href = \"" + request.getContextPath() + "?language=" + language + "&orderBy="
                                    + orderBy + "&ascending=" + request.getAttribute("ascending") + "&page=" + (currentPage + 1) +
                                    "\" class=next>Следующая</a></li> ");
                        }
                    %>
                </ul>
            </article>
        </section>
    </section>
</main>
<jsp:include page="../../footer.jsp"/>
<section class="item-added-block visually-hidden">
    <form class="item-added">
        <div class="message-block">
            <img src="<%=request.getContextPath()%>/resources/img/icon-mark.png" alt="Purchase successful"
                 width="66" height="66">
            <p class="added">Заказ создан! Зайдите в библиотеку, библиотекарь Вам все отдаст!!!</p>
        </div>
        <div>

        </div>
        <div class="order-buttons">
            <a href="form-order" class="make-order">Оформить заказ</a>
            <a href="" class="keep-buying">Продолжить покупки</a>
        </div>
        <button class="modal-close" type="button" aria-label="Закрыть"></button>
    </form>
</section>
<section class="item-added-block register-form visually-hidden">
    <div class="item-added">
        <form action="<%out.print(request.getContextPath());%>/" method="post">
            <h1 class="form__title">Регистрация</h1>
            <div class="form__block">
                <label for="first_name" class="form__label">Имя: </label>
                <input type="text" id="first_name" name="first_name" class="form__input">
            </div>
            <div class="form__block">
                <label for="last_name" class="form__label">Фамилия: </label>
                <input type="text" id="last_name" name="last_name" class="form__input">
            </div>
            <div class="form__block">
                <label for="email" class="form__label">Электронная почта: </label>
                <input type="email" id="email" name="email" class="form__input" required>
            </div>
            <div class="form__block">
                <label for="password" class="form__label">Пароль: </label>
                <input type="password" id="password" name="password" class="form__input" required>
            </div>
            <div class="form__block">
                <input type="submit" value="Отправить" class="form__input form__input__submit">
            </div>
        </form>
        <button class="modal-close" type="button" aria-label="Закрыть"></button>
    </div>
</section>
<section class="item-added-block login-form visually-hidden">
    <div class="item-added">
        <form action="<%out.print(request.getContextPath());%>/" method="post">
            <h1 class="form__title">Войти</h1>
            <div class="form__block">
                <label for="emailField" class="form__label">Электронная почта: </label>
                <input type="email" id="emailField" name="email" class="form__input" required>
            </div>
            <div class="form__block">
                <label for="passwordField" class="form__label">Пароль: </label>
                <input type="password" id="passwordField" name="password" class="form__input" required>
            </div>
            <div class="form__block">
                <input type="submit" value="Отправить" class="form__input form__input__submit">
            </div>
        </form>
        <button class="modal-close" type="button" aria-label="Закрыть"></button>
    </div>
</section>
<script src="<%=request.getContextPath()%>/resources/js/popups.js"></script>
</body>

</html>