<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ include file="include.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Search</title>
</head>
<body>
<h2>Search users</h2>

<div class="row">
    <form method="get" action="/search">
        <div class="small-3 columns">
            <label for="txt">By name</label>
            <input type="text" id="txt" name="name" value="${name}">
        </div>

        <div class="small-5 columns end">
            <button id="button-id" type="submit">Search Users</button>
        </div>
    </form>
</div>
<c:if test="${!empty users}">
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
</c:if>

<h1></h1>
<div>
    <!--Previous page-->
    <c:url value="/search?name=${name}" var="prev">
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
                    <c:url value="/search?name=${name}" var="url">
                        <c:param name="page" value="${i.index}"/>
                    </c:url>
                    <a href='<c:out value="${url}" />'>${i.index}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </c:if>

    <!--Next page-->
    <c:url value="/search?name=${name}" var="next">
        <c:param name="page" value="${page+1}"/>
    </c:url>
    <c:if test="${page < maxPages}">
        <a href="<c:out value="${next}" />">Next</a>
    </c:if>
</div>

<h1></h1>
<a href="/index">Home page</a><br/>
</body>
</html>
