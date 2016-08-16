<%@ include file="include.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Users list</title>
</head>
<body>
<h2>Users List</h2>
<u1>
    <table class="tg">
        <tr>
            <th width="50">ID</th>
            <th width="120">Name</th>
            <th width="50">Age</th>
            <th width="80">Is admin</th>
            <th width="300">Created date</th>
            <th width="100">Action</th>
        </tr>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.age}</td>
                <td>${user.admin}</td>
                <td>${user.createdDate}</td>
                <td width="50"><a href="<c:url value='/edit/${user.id}' />">Edit</a></td>
                <td width="50"><a href="<c:url value='/remove/${user.id}' />">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</u1>

<h1></h1>
<div>
    <!--Previous page-->
    <c:url value="/index" var="prev">
        <c:param name="page" value="${page-1}"/>
    </c:url>
    <c:if test="${page > 1}">
        <a href="<c:out value="${prev}" />">Prev</a>
    </c:if>

    <!--1 2 3 ...-->
    <c:if test="${maxPages != 1}">
        <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
            <c:choose>
                <c:when test="${page == i.index}">
                    <span>${i.index}</span>
                </c:when>
                <c:otherwise>
                    <c:url value="/index" var="url">
                        <c:param name="page" value="${i.index}"/>
                    </c:url>
                    <a href='<c:out value="${url}" />'>${i.index}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </c:if>

    <!--Next page-->
    <c:url value="/index" var="next">
        <c:param name="page" value="${page+1}"/>
    </c:url>
    <c:if test="${page < maxPages}">
        <a href="<c:out value="${next}" />">Next</a>
    </c:if>
</div>

<h1></h1>
<a href="/add">Add user</a><br/>
<a href="/search">Search users</a><br/>
</body>
</html>