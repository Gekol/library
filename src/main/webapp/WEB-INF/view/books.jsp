<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.epam.java.ft.models.Book" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<fmt:setLocale value="${param.language}"/>
<fmt:setBundle basename="content"/>
<html>
<head>
    <title>Books</title>
    <jsp:include page="../../includeStyles.jsp"/>
</head>
<body>
<jsp:include page="../../header.jsp"/>
<main class="catalog-main main-content">
    <section class="goods container">
        <ul class="way">
            <li><a href="<%out.print(request.getContextPath());%>"><img
                    src="<%=request.getContextPath()%>/resources/img/icon-home.svg" width="14"
                    height="12" alt="Main page"/></a></li>
            <li><a href="<%out.print(request.getContextPath());%>">Заказы</a></li>
        </ul>
        <h3 class="books-block-title">Книги
            <span>
                <a href="?language=en" class="switch-language">EN</a>
                <a href="?language=ru" class="switch-language">RU</a>
            </span>
        </h3>
        <h1>Книги</h1>
        <ul class="books-list users-list">
            <%
                List<Book> books = (List<Book>) request.getAttribute("books");
                for (Book book : books) {
                    out.println("<li class=\"good\">");
                    out.println("<div class=\"book\"><img src=\"" + request.getContextPath() + "/resources/img/books/" + book.getBookSrc() + "\" width=\"144\" height=\"225\" alt=\"" + book.getTitle() + "\" /></div>");
                    out.println("<div class=\"buy\">");
                    out.println("<a href=\"books?delete=" + book.getId() + "\">Удалить книгу</a>");
                    out.println("<a href=\"edit?id=" + book.getId() + "\">Редактировать</a>");
                    out.println("</div>");
                    out.println("<b>" + book.getTitle() + "</b>");
                    out.println("<p class=\"author\">" + book.getAuthor().getFullName() + "</p>");
                    out.println("<p class=\"current-price\">" + book.getPrice() + " грн/час</p>");
                    out.println("</li>");
                }
            %>
        </ul>
    </section>
</main>
<jsp:include page="../../footer.jsp"/>
</body>
</html>
