<%@ page contentType="text/html; charset=UTF-8" %>

<%
    boolean loggedIn;
    HttpSession httpSession = request.getSession(false);
    if (httpSession == null || httpSession.getAttribute("loggedIn") == null) {
        loggedIn = false;
    } else {
        loggedIn = (boolean) httpSession.getAttribute("loggedIn");
    }
    String language = (String) request.getAttribute("language");
%>
<header class="header-block">
    <div class="menu-content">
        <div class="menu-block container">
            <div class="title-block">
                <p class="title">Книжный червь</p>
                <div class="search-block">
                    <form class="search" method="GET" action="<%out.print(request.getContextPath());%>">
                        <label for="search">
                            <input type="hidden" name="language"
                                   value="<% out.print(language); %>">
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
                <p class="phone"><img src="<%=request.getContextPath()%>/resources/img/icon-phone.svg" width="19"
                                      height="19" alt="Phone"/> <a
                        href="tel:78125550555">+380 (67) 617-17-10</a></p>
                <p class="city">г. Днепр, ул. В. Жуковского, д. 21A</p>
            </div>
            <%
                if (loggedIn) {
                    String userName = (String) session.getAttribute("userName");
                    out.print("<div class=\"profile-block\">\n" +
                            "                <div class=\"profile\">\n" +
                            "                    <div class=\"name\">\n" +
                            "                        <a href=\"profile\" class=\"profile-link\">\n" +
                            "                            <svg class=\"profile-image\" width=\"20\" height=\"18\" viewBox=\"0 0 20 18\" fill=\"none\"\n" +
                            "                                 xmlns=\"http://www.w3.org/2000/svg\">\n" +
                            "                                <path d=\"M17.881 14.166C15.737 13.431 13.625 12.5 12.674 11.776C12.017 11.275 11.904 10.158 12.157 9.361C13.275 8.458 14.021 6.884 14.021 5.083C14.021 2.276 12.221 0 10 0C7.77902 0 5.97901 2.276 5.97901 5.083C5.97901 6.884 6.72501 8.457 7.84201 9.36C8.09501 10.158 7.98302 11.275 7.32502 11.776C6.37502 12.5 4.26201 13.43 2.11801 14.166C-0.0259852 14.902 1.48343e-05 18 1.48343e-05 18H20C20 18 20.025 14.901 17.881 14.166Z\"\n" +
                            "                                      fill=\"#C5C5C5\"/>\n" +
                            "                            </svg>\n" +
                            "                            " + userName + "\n" +
                            "                        </a>\n" +
                            "                        <a href=\"logout\" class=\"logout\">\n" +
                            "                            <svg width=\"20\" height=\"18\" viewBox=\"0 0 20 18\" fill=\"none\"\n" +
                            "                                 xmlns=\"http://www.w3.org/2000/svg\">\n" +
                            "                                <path d=\"M20 9L11.125 0.5V6.5H5.125V11.5H11.125V17.5L20 9Z\" fill=\"#C5C5C5\"/>\n" +
                            "                                <path d=\"M2.10601 14.452V3.548C2.12401 3.172 2.27701 2.491 3.11601 2.491H8.14301V0.5H3.11601C0.938006 0.5 0.112006 2.31 0.0870056 3.527V14.473C0.112006 15.689 0.938006 17.5 3.11601 17.5H8.14301V15.51H3.11601C2.27701 15.51 2.12401 14.827 2.10601 14.452Z\"\n" +
                            "                                      fill=\"#C5C5C5\"/>\n" +
                            "                            </svg>\n" +
                            "                        </a>\n" +
                            "                    </div>\n" +
                            "                </div>\n" +
                            "                <ul>\n" +
                            "                    <li tabindex=\"0\"><a href=\"profile\">Мои заказы</a></li>\n" +
                            "                    <li tabindex=\"0\"><a href=\"profile\">Личный кабинет</a></li>\n" +
                            "                </ul>");
                } else {
                    out.print("<div class=\"buttons\">\n" +
                            "          <a href=\"login\" class=\"login\">\n" +
                            "            <svg width=\"20\" height=\"17\" viewBox=\"0 0 20 17\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n" +
                            "              <path d=\"M14.1667 8.5L5.71429 0V6H0V11H5.71429V17L14.1667 8.5Z\" fill=\"#C5C5C5\"/>\n" +
                            "              <path d=\"M16.1771 15.01H11.3895V17H16.1771C18.2514 17 19.0381 15.19 19.0619 13.974V3.028C19.0381 1.811 18.2514 0 16.1771 0H11.3895V1.99H16.1771C16.9762 1.99 17.1219 2.671 17.1391 3.047V13.951C17.1229 14.327 16.9762 15.01 16.1771 15.01Z\" fill=\"#C5C5C5\"/>\n" +
                            "            </svg>\n" +
                            "            Войти\n" +
                            "          </a>\n" +
                            "          <a href=\"register\" class=\"register\">Регистрация</a>\n" +
                            "        </div>");
                }
            %>
        </div>
    </div>

    <div class="navigation-content container">
        <nav class="navigation">
            <ul>
                <li><a href="<%out.print(request.getContextPath());%>">Главная</a></li>
                <li><a href="company">Компания</a></li>
                <li><a href="<%out.print(request.getContextPath());%>">Каталог</a></li>
                <li><a href="news">Новости</a></li>
                <li><a href="specialOffers">Спецпредложения</a></li>
                <li><a href="delivery">Доставка</a></li>
                <li><a href="contacts">Контакты</a></li>
            </ul>
        </nav>
    </div>

</header>