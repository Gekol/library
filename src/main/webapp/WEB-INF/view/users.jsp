<%@ page import="com.epam.java.ft.models.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Users</title>
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
            <li><a href="<%out.print(request.getContextPath());%>">Пользователи</a></li>
        </ul>
        <h3 class="books-block-title">Пользователи
            <span>
                <a href="?language=en" class="switch-language">EN</a>
                <a href="?language=ru" class="switch-language">RU</a>
            </span>
        </h3>
        <ul class="books-list users-list">
            <%
                List<User> users = (List<User>) request.getAttribute("users");
                for (User user : users) {
                    out.println("<li class=\"good\"><p>" + user.getUserName() + "</p><p>" + user.getEmail() + "</p><p>" +
                            ((user.getSubscription() == null) ? "Подписка не оформлена!" : ("Подписка с " + user.getSubscription().getGiven().toString() + " до " + user.getSubscription().getExpires().toString())) +
                            "<p></li>");
                }
            %>
        </ul>
    </section>
</main>

<jsp:include page="../../footer.jsp"/>
</body>
</html>
