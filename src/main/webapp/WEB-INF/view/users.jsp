<%@ page import="com.epam.java.ft.models.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users</title>
    <jsp:include page="../../includeStyles.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../header.jsp"></jsp:include>

<main class="catalog-main main-content">
    <section class="goods container">
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

<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>
