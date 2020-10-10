<%@ page import="com.epam.java.ft.models.Book" %>
<%@ page import="com.epam.java.ft.models.Order" %>
<%@ page import="com.epam.java.ft.models.Subscription" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ru">

<jsp:include page="../../head.jsp"></jsp:include>

<body>
<%
    String email = (String) session.getAttribute("email");
    String userName = (String) session.getAttribute("userName");
    Subscription subscription = (Subscription) request.getAttribute("subscription");
    List<Order> orders = (List<Order>) request.getAttribute("orders");
    int fine = (Integer) request.getAttribute("fine");
%>
<header class="header-block">
    <div class="menu-content">
        <div class="menu-block container">
            <div class="title-block">
                <p class="title">Книжный червь</p>
                <div class="search-block">
                    <form class="search" method="GET" action="main">
                        <label for="search">
                            <input type="text" placeholder="Поиск:" name="book" autocomplete="false" id="search"
                                   class="searchField">
                        </label>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="about">
            <div class="description">
                <p>Библиотека мировой</p>
                <p>художественной литературы</p>
                <p>всех времен и народов</p>
            </div>
            <div class="contact-info">
                <p class="phone"><img src="resources/img/icon-phone.svg" width="19" height="19" alt="Phone"/> <a
                        href="tel:78125550555">+380 (67) 617-17-10</a></p>
                <p class="city">г. Днепр, ул. В. Жуковского, д. 21A</p>
            </div>
            <div class="profile-block">
                <div class="profile">
                    <div class="name">
                        <a href="profile" class="profile-link">
                            <svg class="profile-image" width="20" height="18" viewBox="0 0 20 18" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path d="M17.881 14.166C15.737 13.431 13.625 12.5 12.674 11.776C12.017 11.275 11.904 10.158 12.157 9.361C13.275 8.458 14.021 6.884 14.021 5.083C14.021 2.276 12.221 0 10 0C7.77902 0 5.97901 2.276 5.97901 5.083C5.97901 6.884 6.72501 8.457 7.84201 9.36C8.09501 10.158 7.98302 11.275 7.32502 11.776C6.37502 12.5 4.26201 13.43 2.11801 14.166C-0.0259852 14.902 1.48343e-05 18 1.48343e-05 18H20C20 18 20.025 14.901 17.881 14.166Z"
                                      fill="#C5C5C5"/>
                            </svg>
                            <% out.print(userName); %>
                        </a>
                        <a href="logout" class="logout">
                            <svg width="20" height="18" viewBox="0 0 20 18" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path d="M20 9L11.125 0.5V6.5H5.125V11.5H11.125V17.5L20 9Z" fill="#C5C5C5"/>
                                <path d="M2.10601 14.452V3.548C2.12401 3.172 2.27701 2.491 3.11601 2.491H8.14301V0.5H3.11601C0.938006 0.5 0.112006 2.31 0.0870056 3.527V14.473C0.112006 15.689 0.938006 17.5 3.11601 17.5H8.14301V15.51H3.11601C2.27701 15.51 2.12401 14.827 2.10601 14.452Z"
                                      fill="#C5C5C5"/>
                            </svg>
                        </a>
                    </div>
                </div>
                <ul>
                    <li tabindex="0">Мои заказы</li>
                    <li tabindex="0">Личный кабинет</li>
                </ul>
            </div>
        </div>
    </div>

    <div class="navigation-content container">
        <nav class="navigation">
            <ul>
                <li><a href="<%out.print(request.getContextPath());%>">Главная</a></li>
                <li><a href="/company">Компания</a></li>
                <li><a href="<%out.print(request.getContextPath());%>">Каталог</a></li>
                <li><a href="/news">Новости</a></li>
                <li><a href="/specialOffers">Спецпредложения</a></li>
                <li><a href="/delivery">Доставка</a></li>
                <li><a href="/contacts">Контакты</a></li>
            </ul>
        </nav>
    </div>

</header>

<main class="catalog-main main-content">
    <section class="goods container">
        <h1 class="userName">
            <div><% out.print(userName); %></div>
            <div><%
                if (subscription == null) {
                    out.print("<a href=\"?createSubscription=true\" class='create-subscription'>У вас нет абонемента! Вы можете получить его прямо сейчас!</a>");
                } else {
                    out.print("<span class='create-subscription'>Абонемент действует с " + subscription.getGiven() + " по " + subscription.getExpires() + "</span>");
                }
            %></div>
        </h1>
        <div>
            <div>Электронная почта: <% out.print(email); %></div>
            <div>Общая сумма штрафа: <% out.print(fine); %></div>
        </div>
        <ul class="books-list orders-list">
            <%
                for (Order order : orders) {
                    Book book = order.getBook();
                    out.println("<li class=\"good\">");
                    out.println("<div class=\"book\"><img src=\"" + request.getContextPath() + "/resources/img/books/" + book.getBookSrc() + "\" width=\"144\" height=\"225\" alt=\"" + order.getBook().getTitle() + "\" /></div>");
                    out.println("<div class=\"buy\">");
                    out.println((order.getFine() > 0) ? "<a href=\"fine/?id=" + order.getId() + "\">Выплатить штраф</a>" : "<span>Срок не прошёл!!!</span>");
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
<jsp:include page="../../footer.jsp"></jsp:include>
<section class="item-added-block visually-hidden">
    <div class="item-added">
        <div class="message-block">
            <img src="resources/img/icon-mark.png" alt="Purchase successful" width="66" height="66">
            <p class="added">Товар добавлен в корзину!</p>
        </div>
        <div class="order-buttons">
            <a href="form-order" class="make-order">Оформить заказ</a>
            <a href="" class="keep-buying">Продолжить покупки</a>
        </div>
        <button class="modal-close" type="button" aria-label="Закрыть"></button>
    </div>
</section>
<script src="resources/js/popups.js"></script>
</body>

</html>