<%-- 
    Document   : alltrips
    Created on : Dec 21, 2016, 9:55:52 PM
    Author     : Ankhaa
--%>

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
        <style>
            html, body, #map_canvas { margin: 0; padding: 0; height: 100% }
        </style>
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
                    
                    <div class="col-md-12" style="height: 1050px;overflow: hidden;">
                        <h1>All trips</h1>
                        <br/>
                        <h3>There are <span id="trips"></span> trips available</h3>
                        <div id="map_canvas" style=" margin-bottom: 120px;"></div>
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
        <script src="resources/alltrips.js"></script>
    </body>
</html>
