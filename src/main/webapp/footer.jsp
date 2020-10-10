<%@ page contentType="text/html; charset=UTF-8" %>

<footer class="downside">
    <div class="downside-navigation-content">
        <div class="downside-navigation container">
            <div class="address">
                <a href="index.jsp" class="title big">Книжный червь</a>
                <p class="address-info">г. Днепр, ул. В. Жуковского, д. 21A</p>
                <p class="phone-number"><a href="tel:78125550555">+380 (67) 617-17-10</a></p>
            </div>
            <div class="links">
                <ul class="white-links">
                    <li><a href="<%out.print(request.getContextPath());%>">Компания</a></li>
                    <li><a href="<%out.print(request.getContextPath());%>">Новости</a></li>
                    <li><a href="<%out.print(request.getContextPath());%>">Каталог</a></li>
                    <li><a href="<%out.print(request.getContextPath());%>">Доставка</a></li>
                    <li><a href="<%out.print(request.getContextPath());%>">Контакты</a></li>
                </ul>
                <ul class="yellow-links">
                    <li><a href="<%out.print(request.getContextPath());%>">Материалы</a></li>
                    <li><a href="<%out.print(request.getContextPath());%>">Техника</a></li>
                    <li><a href="<%out.print(request.getContextPath());%>">Инструмент</a></li>
                    <li><a href="">Спецпредложения</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="downside-contacts-content">
        <div class="downside-contacts container">
            <div class="rights-reserved">
                <p>© 2010–2020 Библиотека «Книжный червь»</p>
                <p>Все права защищены</p>
            </div>
            <div class="networks">
                <div class="network" tabindex="0">
                    <a href="vk.com" class="icon vk"></a>
                </div>
                <div class="network" tabindex="0">
                    <a href="facebook.com" class="icon fb"></a>
                </div>
                <div class="network" tabindex="0">
                    <a href="instagram.com" class="icon insta"></a>
                </div>
            </div>
            <div class="feedback">
                <p>Обратная связь:<a href="https://mail@htmlacademy.ru" class="yellow-link"
                                     tabindex="0">mail@worm.ru</a></p>
                <p>Разработано — <a href="https://htmlacademy.ru/intensive/htmlcss"
                                    class="yellow-link">hsokolovskyi.com</a></p>
            </div>
        </div>
    </div>
</footer>