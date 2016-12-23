<%-- 
    Document   : index
    Created on : Dec 19, 2016, 10:36:19 PM
    Author     : Ankhaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="This is social network html5 template available in themeforest......" />
        <meta name="keywords" content="Social Network, Social Media, Make Friends, Newsfeed, Profile Page" />
        <meta name="robots" content="index, follow" />
        <title>Let's carpool! | Ankhbayar Tsogtbaatar</title>

        <!-- Stylesheets
        ================================================= -->
        <link rel="stylesheet" href="resources/bootstrap.css" />
        <link rel="stylesheet" href="resources/style.css" />
        <link rel="stylesheet" href="resources/css/ionicons.min.css" />
        <link rel="stylesheet" href="resources/css/font-awesome.css" />
        <link href="resources/emoji.css" rel="stylesheet">
        <!--Google Webfont-->
        <link href='https://fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,300italic,400italic,500,500italic,600,600italic,700' rel='stylesheet' type='text/css'>
        <!--Favicon-->
        <link rel="shortcut icon" type="image/png" href="images/fav.png"/>
        <link href="resources/styles/metro/notify-metro.css" rel="stylesheet" />
    </head>
    <body>

        <!-- Header
        ================================================= -->
        <header id="header">
            <nav class="navbar navbar-default navbar-fixed-top menu">
                <div class="container">
                    <input type="hidden" id="userId" value="${user.userid}" />
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="/FinalProject/Home"><img src="resources/main_logo.png" alt="logo" /></a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right main-menu">
                            <li class="dropdown"><a href="index.jsp">Ride</a></li>
                            <li class="dropdown"><a href="weather.jsp">Weather</a></li>
                        </ul>
                        <form class="navbar-form navbar-right hidden-sm">
                            <div class="form-group">
                                <i class="icon ion-android-search"></i>
                                <input type="text" class="form-control" placeholder="Search rides">
                            </div>
                        </form>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container -->
            </nav>
        </header>
        <!--Header End-->

        <div id="page-contents">
            <div class="container">
                <div class="row">

                    <!-- Newsfeed Common Side Bar Left
                    ================================================= -->
                    <div class="col-md-3 static">
                        <div class="profile-card" style="
                             position: relative;
                             ">
                            <img src="https://www.peakprosperity.com/sites/default/files/imagecache/comment_avatar/sites/all/themes/peak_prosperity/images/comments/default-user.png" alt="user" class="profile-photo" />
                            <h5><a href="timeline.html" class="text-white">${user.fullname}</a></h5>
                            <a href="#" class="text-white"><i class="icon ion-ios-paper"></i> 10 posts</a>
                            <button style="
                                    position: absolute;
                                    left: 0;
                                    margin-left: 10px;
                                    background: #999;   
                                    "  data-toggle="modal" data-target="#exampleModal">Edit profile</button>
                        </div><!--profile card ends-->
                        <ul class="nav-news-feed">
                            <li><i class="icon ion-ios-paper"></i><div><a href="index.jsp">Ride newsfeed</a></div></li>
                            <li><i class="icon ion-ios-information"></i><div><a href="weather.jsp">Weather service</a></div></li>
                            <li><i class="icon ion-ios-analytics"></i><div><a href="alltrips.jsp">All trips</a></div></li>
                            <li><i class="icon ion-ios-person"></i><div><form method='post' action='LogoutServlet'><button type="submit" id='logout'>Log out</button></form></div></li>
                        </ul><!--news-feed links ends-->
                    </div>
                    <div class="col-md-9">

                        <!-- Post Create Box
                        ================================================= -->
                        <div class="create-post">
                            <div class="row">
                                <div class="col-md-7 col-sm-7">
                                    <div class="form-group">
                                        <img src="https://www.peakprosperity.com/sites/default/files/imagecache/comment_avatar/sites/all/themes/peak_prosperity/images/comments/default-user.png" alt="" class="profile-photo-md" />
                                        <textarea name="texts" id="post" cols="60" rows="5" class="form-control" placeholder="Write what you wish"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-5 col-sm-5">
                                    <div class="tools">
                                        <select class="form-control" id="postType" name="postType">
                                            <option value="offer">Offer</option>
                                            <option value="need">Need</option>
                                        </select>
                                        <br/>
                                        <input type="text" class="form-control" id="source" value="${user.city}, ${user.state}, United States" placeholder="Source" />
                                        <br/>
                                        <input type="text" class="form-control" id="destination" placeholder="Destination">
                                        <br/>
                                        <button id="publish" class="btn btn-primary pull-right">Publish</button>
                                    </div>
                                </div>
                            </div>
                        </div><!-- Post Create Box End-->

                        <ul  class="nav nav-pills">
                            <li class="active">
                                <a  href="#1a" id="offer" data-toggle="tab">Offer</a>
                            </li>
                            <li><a href="#2a" id="need" data-toggle="tab">Need</a>
                            </li>
                        </ul>
                        <div class="tab-content clearfix">
                            <div class="tab-pane active" id="1a">
                                <!-- Post Content
                                ================================================= -->

                            </div>

                            <div class="tab-pane" id="2a">
                                <!-- Post Content
                                ================================================= -->

                            </div>
                        </div>

                    </div>


                </div>
            </div>
        </div>

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-hidden= true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" datadismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="exampleModalLabel">Edit profile</h4>
                    </div>
                    <form method="post" action="UpdateProfileServlet">
                        <div class="modal-body">
                            <div class="form-group">
                                <input type="hidden" name="userId" value="${user.userid}" />
                                <div class="form-group">
                                    <input type="text" name="fullName" id="username" tabindex="1" class="form-control" placeholder="Full name" value="${user.fullname}">
                                </div>
                                <div class="form-group">
                                    <select name="gender" class="form-control">
                                        <option value="null">-- Select your gender --</option>
                                        <option <c:if test="${user.gender == 0}">selected</c:if> value="male">Male</option>
                                        <option <c:if test="${user.gender == 1}">selected</c:if> value="female">Female</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="state" value="${user.state}" />
                                </div>
                                <div class="form-group">
                                    <input type="text" name="city" value="${user.city}" tabindex="2" class="form-control" placeholder="City">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="street" value="${user.street}" tabindex="2" class="form-control" placeholder="Street">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="zip" tabindex="2" value="${user.zipcode}" class="form-control" placeholder="Zip code">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="birthYear" tabindex="2" value="${user.birthyear}" class="form-control" placeholder="Birth Year">
                                </div>
                                <div class="form-group">
                                    <input type="email" name="email" tabindex="2" value="${user.email}" class="form-control" placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" value="${user.password}" pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$" tabindex="2" class="form-control" placeholder="Password">
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Update profile</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!-- Footer
        ================================================= -->
        <footer id="footer">
            <div class="copyright">
                <p>Ankhbayar Tsogtbaatar © 2016. All rights reserved</p>
            </div>
        </footer>

        <!--preloader-->
        <div id="spinner-wrapper" style="display: none;">
            <div class="spinner"></div>
        </div>

        <!-- Scripts
        ================================================= -->
        <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
        <script src="resources/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCTMXfmDn0VlqWIyoOxK8997L-amWbUPiQ&libraries=places"></script>
        <script src="resources/notify.js"></script>
        <script src="resources/styles/metro/notify-metro.js"></script>
        <script src="resources/jquery-ias.min.js"></script>
        <script src="resources/custom.js"></script>
    </body>
</html>
