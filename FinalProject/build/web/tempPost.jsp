<%-- 
    Document   : tempPost
    Created on : Dec 21, 2016, 2:23:10 AM
    Author     : Ankhaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:forEach var="post" items="${posts}">
            div class="post-content">
            <div class="post-container">
                <img src="https://www.peakprosperity.com/sites/default/files/imagecache/comment_avatar/sites/all/themes/peak_prosperity/images/comments/default-user.png" alt="user" class="profile-photo-md pull-left">
                <div class="post-detail">
                    <div class="user-info">
                        <h5><a href="" class="profile-link">${post.userid.fullname}</a> </h5>
                        <p class="text-muted"><b>Source:</b> <i class="icon ion-ios-location"></i> ${post.source}<br/> <b>Destination:</b> <i class="icon ion-ios-location"></i> ${post.destination}<br/><b>Posted date:</b> <i class="icon ion-ios-location"></i> ${post.datecreated}<br/></p>
                    </div>
                    <div class="reaction re-${post.postid}">
                        <a data-post="${post.postid}" data-user="${user.userid}" class="btn like text-green"><i class="icon ion-thumbsup"></i> ${post.likesList.size()}</a>
                    </div>
                    <div class="line-divider"></div>
                    <div class="post-text">
                        <p>${post.post} </p>
                    </div>
                    <div data-post="${post.postid}" class="user-comments-${post.postid}"></div>
                    <div class="post-comment">
                        <img src="https://www.peakprosperity.com/sites/default/files/imagecache/comment_avatar/sites/all/themes/peak_prosperity/images/comments/default-user.png" alt="" class="profile-photo-sm">
                        <input type="text" data-input="${post.postid}" class="form-control post-comment" placeholder="Post a comment">
                    </div>
                </div>
            </div>
        </c:forEach>

    </body>
</html>
