<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>

<html>

<c:set var="title" value="Error" scope="page"/>
<head>
    <title>Errors</title>
    <jsp:include page="../../includeStyles.jsp"/>
</head>

<body>
<%@ include file="../../header.jsp" %>

<%--<table id="main-container">--%>

<%--    <tr>--%>
<%--        <td class="content">--%>

<%--            <h2 class="error">--%>
<%--                The following error occurred--%>
<%--            </h2>--%>

<%--            <c:set var="code" value="${requestScope['javax.servlet.error.status_code']}"/>--%>
<%--            <c:set var="message" value="${requestScope['javax.servlet.error.message']}"/>--%>
<%--            <c:set var="exception" value="${requestScope['javax.servlet.error.exception']}"/>--%>
<%--            <c:if test="${not empty code}">--%>
<%--                <h3>Error code: ${code}</h3>--%>
<%--            </c:if>--%>

<%--            <c:if test="${not empty message}">--%>
<%--                <h3>Message: ${message}</h3>--%>
<%--            </c:if>--%>

<%--            <c:if test="${not empty errorMessage and empty exception and empty code}">--%>
<%--                <h3>Error message: ${errorMessage}</h3>--%>
<%--            </c:if>--%>

<%--            <c:if test="${not empty exception}">--%>
<%--                <hr/>--%>
<%--                <h3>Stack trace:</h3>--%>
<%--                <c:forEach var="stackTraceElement" items="${exception.stackTrace}">--%>
<%--                    ${stackTraceElement}--%>
<%--                </c:forEach>--%>
<%--            </c:if>--%>
<%--        </td>--%>
<%--    </tr>--%>

<%--</table>--%>
<%@ include file="../../footer.jsp" %>
</body>
</html>
