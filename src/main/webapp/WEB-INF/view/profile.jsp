<%@ page import="com.epam.java.ft.models.Book" %>
<%@ page import="com.epam.java.ft.models.Order" %>
<%@ page import="com.epam.java.ft.models.Subscription" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ru">

<head>
    <title>Профиль</title>
    <jsp:include page="../../includeStyles.jsp"></jsp:include>
</head>

<body>
<%
    String email = (String) session.getAttribute("email");
    String userName = (String) session.getAttribute("userName");
    Integer type = (Integer) session.getAttribute("type");
    Subscription subscription = (Subscription) request.getAttribute("subscription");
    List<Order> orders = (List<Order>) request.getAttribute("orders");
    int fine = (Integer) request.getAttribute("fine");
%>

<jsp:include page="../../header.jsp"></jsp:include>

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
                        out.println("<a href=\"books\"></a>");
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