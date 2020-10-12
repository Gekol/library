<%@ page import="com.epam.java.ft.models.Book" %>
<%@ page import="com.epam.java.ft.models.Order" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Заказы</title>
    <jsp:include page="../../includeStyles.jsp"/>
</head>
<body>
<jsp:include page="../../header.jsp"/>
<main class="catalog-main main-content">
    <section class="goods container">
        <h1>Заказы</h1>
        <ul class="books-list users-list">
            <%
                List<Order> orders = (List<Order>) request.getAttribute("orders");
                for (Order order : orders) {
                    Book book = order.getBook();
                    out.println("<li class=\"good\">");
                    out.println("<div class=\"book\"><img src=\"" + request.getContextPath() + "/resources/img/books/" + book.getBookSrc() + "\" width=\"144\" height=\"225\" alt=\"" + order.getBook().getTitle() + "\" /></div>");
                    out.println("<div class=\"buy\">");
                    out.println((order.getFine() > 0) ? "<a href=\"fine?id=" + order.getId() + "\">Заплатить штраф</a>" :
                            ((order.getDeadline() == null) ? "<a href=" + request.getContextPath() + "/giveBook?id=" + order.getId() + "&bookId=" + order.getBook().getId() + "&orderType=" + order.getOrderType().getId() + ">Выдать книгу</a>"
                                    : "<a href=" + request.getContextPath() + "/return?id=" + order.getId() + "&bookId=" + order.getBook().getId() + ">Забрать книгу</a>"));
                    out.println("</div>");
                    out.println("<h3>" + order.getBook().getTitle() + "</h3>");
                    out.println("<b>" + order.getUser().getEmail() + "</b>");
                    out.println("<p class=\"author\">" + ((order.getDeadline() == null) ? "Вы ещё не забрали книгу!!!" : order.getDeadline().toString()) + "</p>");
                    out.println("<p class=\"current-price\">Штраф: " + order.getFine() + "</p>");
                    out.println("</li>");
                }
            %>
        </ul>
    </section>
</main>
<jsp:include page="../../footer.jsp"/>
</body>
</html>
