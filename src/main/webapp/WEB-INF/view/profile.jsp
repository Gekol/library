<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="utf-8">
    <title>Библиотека "Книжный червь"</title>
    <link rel="stylesheet" href="resources/css/normalize.css">
    <link rel="stylesheet" href="resources/css/general.css">
</head>

<body>
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
            <div class="menu">
                <div class="cart">
                    <a href="carts">Корзина: 0</a>
                </div>
                <a href="form-order" class="order">Оформить заказ</a>
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
                            Равшан Джамшутович
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
                <li><a href="main">Главная</a></li>
                <li><a href="">Компания</a></li>
                <li><a href="main">Каталог</a></li>
                <li><a href="">Новости</a></li>
                <li><a href="">Спецпредложения</a></li>
                <li><a href="">Доставка</a></li>
                <li><a href="">Контакты</a></li>
            </ul>
        </nav>
    </div>

</header>

<main class="catalog-main main-content">
    <section class="goods container">
        <h1>Равшан Джамшутович</h1>
        <div>
            <div>Электронная почта:</div>
        </div>
        <div>
            <div>Телефон:</div>
        </div>
    </section>
</main>
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
                    <li><a href="">Компания</a></li>
                    <li><a href="">Новости</a></li>
                    <li><a href="main">Каталог</a></li>
                    <li><a href="main">Доставка</a></li>
                    <li><a href="">Контакты</a></li>
                </ul>
                <ul class="yellow-links">
                    <li><a href="main">Материалы</a></li>
                    <li><a href="main">Техника</a></li>
                    <li><a href="main">Инструмент</a></li>
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