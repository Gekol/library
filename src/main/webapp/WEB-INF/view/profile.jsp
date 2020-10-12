<%@ page import="com.epam.java.ft.models.*" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ru">

<head>
    <title>Профиль</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <jsp:include page="../../includeStyles.jsp"/>
</head>

<body>
<%
    String email = (String) session.getAttribute("email");
    String userName = (String) session.getAttribute("userName");
    Integer type = (Integer) session.getAttribute("type");
    Subscription subscription = (Subscription) request.getAttribute("subscription");
    List<Order> orders = (List<Order>) request.getAttribute("orders");
    List<Author> authors = (List<Author>) request.getAttribute("authors");
    List<Edition> editions = (List<Edition>) request.getAttribute("editions");
    int fine = (Integer) request.getAttribute("fine");
%>

<jsp:include page="../../header.jsp"/>

<main class="catalog-main main-content">
    <section class="goods container">
        <ul class="way">
            <li><a href="<%out.print(request.getContextPath());%>"><img
                    src="<%=request.getContextPath()%>/resources/img/icon-home.svg" width="14"
                    height="12" alt="Main page"/></a></li>
            <li><a href="<%out.print(request.getContextPath());%>">Личный кабинет</a></li>
        </ul>
        <h3 class="books-block-title">Личный кабинет
            <span>
                <a href="?language=en" class="switch-language">EN</a>
                <a href="?language=ru" class="switch-language">RU</a>
            </span>
        </h3>
        <h1 class="userName">
            <span><% out.print(userName); %></span>
            <span><%
                if (subscription == null) {
                    out.print("<a href=\"?createSubscription=true\" class='create-subscription'>У вас нет абонемента! Вы можете получить его прямо сейчас!</a>");
                } else {
                    out.print("<span class='create-subscription'>Абонемент действует с " + subscription.getGiven() + " по " + subscription.getExpires() + "</span>");
                }
            %></span>
        </h1>
        <div>
            <div>Электронная почта: <% out.print(email); %></div>
            <% if (orders.size() == 0) {
                out.println("<div>Необработанных заказов нет!</div>");
            } else {
                out.println("<div>Общая сумма штрафа: " + fine + "</div>");
            }%>
            <div>
                <%
                    if (type > 1) {
                        out.println("<a href=\"orders\">Все заказы</a>");
                        out.println("<a href=\"users\">Все пользователи</a>");
                    }
                    if (type == 3) {
                        out.println("<a href=\"add-book\" class=\"addBook\">Добавить новую книгу</a>");
                        out.println("<a href=\"books\" class=\"addBook\">Все книги</a>");
                    }
                %>
            </div>
        </div>
        <ul class="books-list orders-list">
            <%
                for (Order order : orders) {
                    Book book = order.getBook();
                    out.println("<li class=\"good\">");
                    out.println("<div class=\"book\"><img src=\"" + request.getContextPath() + "/resources/img/books/" + book.getBookSrc() + "\" width=\"144\" height=\"225\" alt=\"" + order.getBook().getTitle() + "\" /></div>");
                    out.println("<div class=\"buy\">");
                    out.println((order.getFine() > 0) ? "<span>Срок сдачи пропущен!!!</span>" : "<span>Срок не прошёл!!!</span>");
                    out.println("</div>");
                    out.println("<b>" + book.getTitle() + "</b>");
                    out.println("<p class=\"author\">" + ((order.getDeadline() == null) ? "Вы ещё не забрали книгу!!!" : order.getDeadline().toString()) + "</p>");
                    out.println("<p class=\"current-price\">Штраф: " + order.getFine() + "</p>");
                    out.println("</li>");
                }
            %>
        </ul>
    </section>
</main>
<jsp:include page="../../footer.jsp"/>
<section class="item-added-block book-form visually-hidden">
    <div class="item-added">
        <form action="<%out.print(request.getContextPath());%>/profile" method="post">
            <h1 class="form__title">Добавить книгу</h1>
            <div class="form__block">
                <label for="title_en" class="form__label">Название на английском</label>
                <input type="text" id="title_en" name="title_en" class="form__input" required>
            </div>
            <div class="form__block">
                <label for="title_ru" class="form__label">Название на русском</label>
                <input type="text" id="title_ru" name="title_ru" class="form__input" required>
            </div>
            <div class="form__block">
                <label for="price" class="form__label">Цена за час времени</label>
                <input type="number" name="price" id="price" placeholder="10" required>
            </div>
            <div class="form__block">
                <label for="fine" class="form__label">Размер штрафа</label>
                <input type="number" name="fine" id="fine" placeholder="10" required>
            </div>
            <div class="form__block">
                <label for="author" class="form__label">Автор</label>
                <select name="author" id="author" required>
                    <% for (Author author : authors) {
                        out.println("<option value=\"" + author.getId() + "\">" + author.getFullName() + "</option>");
                    }
                    %>
                </select>
            </div>
            <div class="form__block">
                <label for="edition" class="form__label">Издание</label>
                <select name="edition" id="edition" required>
                    <% for (Edition edition : editions) {
                        out.println("<option value=\"" + edition.getId() + "\">" + edition.getTitle() + "</option>");
                    }
                    %>
                </select>
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