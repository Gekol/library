<%@ page import="com.epam.java.ft.models.Author" %>
<%@ page import="com.epam.java.ft.models.Edition" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Books</title>
    <jsp:include page="../../includeStyles.jsp"/>
</head>
<body>
<jsp:include page="../../header.jsp"/>
<%
    List<Author> authors = (List<Author>) request.getAttribute("authors");
    List<Edition> editions = (List<Edition>) request.getAttribute("editions");
%>
<main class="catalog-main main-content">
    <section class="item-added-block edit-form">
        <div class="item-added">
            <form action="<%out.print(request.getContextPath());%>/edit" method="post">
                <h1 class="form__title">Редактировать книгу</h1>
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
                    <input type="number" name="price" id="price" placeholder="10" class="form__input" required>
                </div>
                <div class="form__block">
                    <label for="fine" class="form__label">Размер штрафа</label>
                    <input type="number" name="fine" id="fine" placeholder="10" class="form__input" required>
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
                <input type="hidden" name="id" id="id" value="<% out.print((Integer) request.getAttribute("book")); %>">
                <div class="form__block">
                    <input type="submit" value="Отправить" class="form__input form__input__submit">
                </div>
            </form>
        </div>
    </section>
</main>
<jsp:include page="../../footer.jsp"/>
</body>
</html>