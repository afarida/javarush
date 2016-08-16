<%@ include file="include.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User</title>
</head>
<body>
<h2>
    <c:if test="${!empty user.name}">
        Edit the user
    </c:if>
    <c:if test="${empty user.name}">
        Add a user
    </c:if>
</h2>

<c:url var="addAction" value="/save"></c:url>

<form:form action="${addAction}" commandName="user">
    <form:hidden path="id"/>
    <table>
        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="Name"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="age">
                    <spring:message text="Age"/>
                </form:label>
            </td>
            <td>
                <form:input path="age"/>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <form:checkbox path="admin"/>
                <form:label path="admin">
                    <spring:message text="Is admin"/>
                </form:label>
            </td>

        </tr>
        <tr>
            <td colspan="2">
                <input type="submit"
                       value="<spring:message text="Save"/>"/>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
