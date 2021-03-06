<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="by.teachmeskills.sweater.constant.SweaterWebConstants" %>
<c:set var="allPosts" value="${requestScope.allPosts}"/>
<c:url var="tweetUrl" value="${SweaterWebConstants.PATH_TWEET}"/>
<html lang="en">
<head>
    <title>All Tweets</title>
    <jsp:include page="common/_head.jsp"/>
</head>
<body>
<jsp:include page="common/_header.jsp"/>
<table class="table table-striped table-bordered align-middle" style="table-layout: fixed">
    <caption></caption>
    <thead>
    <tr>
        <th scope="col" class="col-1 text-center">Post ID</th>
        <th scope="col" class="col-2 text-center">Author</th>
        <th scope="col" class="col-6 text-center">Content</th>
        <th scope="col" class="col-1 text-center">Comments</th>
        <th scope="col" class="col-1 text-center">Likes</th>
        <th scope="col" class="col-2 text-center">Last edit</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="post" items="${allPosts}">
        <tr>
            <th scope="row" class="text-center">${post.id}</th>
            <td class="text-center">${post.author}</td>
            <td class="text-truncate">${post.content}</td>
            <td class="d-flex justify-content-center">
                <form action="${tweetUrl}" method="get" class="mx-auto">
                    <input type='hidden' name='post-id' value='${post.id}'/>
                    <button type="submit" class="btn btn-primary">Comments</button>
                </form>
            </td>
            <td class="text-center">
                <div class="dropdown">
                    <a class="btn btn-primary w-100 dropdown-toggle" role="button" id="dropdownMenuLink"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        likes
                        <span class="position-absolute top-0 start-0 translate-middle badge rounded-pill bg-success bg-secondary me-4">
                            ${post.likesCount}
                            <span class="visually-hidden">Hey, here a lot of likes!</span>
                        </span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <c:forEach var="like" items="${post.likes}">
                            <li class="ms-2">${like}</li>
                        </c:forEach>
                    </ul>
                </div>
            </td>
            <td class="text-center">${post.timestampFormatted}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<jsp:include page="common/_footer.jsp"/>
</body>
</html>
