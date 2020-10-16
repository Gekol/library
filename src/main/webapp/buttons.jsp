<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${param.language}"/>
<fmt:setBundle basename="content"/>
<div class="buttons">
    <a href="login" class="login">
        <svg width="20" height="17" viewBox="0 0 20 17" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M14.1667 8.5L5.71429 0V6H0V11H5.71429V17L14.1667 8.5Z" fill="#C5C5C5"></path>
            <path d="M16.1771 15.01H11.3895V17H16.1771C18.2514 17 19.0381 15.19 19.0619 13.974V3.028C19.0381 1.811 18.2514 0 16.1771 0H11.3895V1.99H16.1771C16.9762 1.99 17.1219 2.671 17.1391 3.047V13.951C17.1229 14.327 16.9762 15.01 16.1771 15.01Z"
                  fill="#C5C5C5"></path>
        </svg>
        <fmt:message key="header.logIn"/>
    </a>
    <a href="register" class="register"><fmt:message key="header.registration"/></a>
</div>