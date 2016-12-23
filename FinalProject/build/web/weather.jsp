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
        <link rel="stylesheet" href="resources/weather.css" />
        <link href="resources/emoji.css" rel="stylesheet">
        <!--Google Webfont-->
        <link href='https://fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,300italic,400italic,500,500italic,600,600italic,700' rel='stylesheet' type='text/css'>
        <!--Favicon-->
        <link rel="shortcut icon" type="image/png" href="images/fav.png"/>
        <link href="resources/styles/metro/notify-metro.css" rel="stylesheet" />
        <style>
            html, body{
                width: 100%;
                height: 100%;
                margin: 0;
                padding: 0;
            }
            #map-canvas {
                width: 100%;
                height: 100%;
            }
            .gm-style-iw {
                text-align: center;
            }
        </style>
    </head>
    <body>

        <!-- Header
        ================================================= -->
        <header id="header">
            <nav class="navbar navbar-default navbar-fixed-top menu">
                <div class="container">
                    <input type="hidden" id="userId" value="${user.userid}" />
                    <input type="hidden" id="city" value="${user.city}" />
                    <input type="hidden" id="zip" value="${user.zipcode}" />
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
                            <li class="dropdown"><a href="alltrips.jsp">All trips</a></li>
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
                    <div class="col-md-3 static" style="height: 1000px;">
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
                            <li>
                                <input type="text" class="form-control" id="searchValue" placeholder = "Enter city or zip to search"/>
                                <br/>
                                <select id="criteria" class="form-control">
                                    <option value="zip">Zip code</option>
                                    <option value="city">City</option>
                                </select>
                                <br/>
                                <br/>
                                <button id="searchWeather" class="btn-primary" value="Search">Search</button>
                            </li>
                        </ul>
                    </div>

                    <div class="col-md-9">
                        <h3>Forecast information</h3>
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-8">
                                    <div id="card" class="weater">
                                        <div class="city-selected">
                                            <article>
                                                <div class="info">
                                                    <span>City:</span><div class="city"></div>

                                                    <div class="temp"></div>

                                                    <div class="wind">
                                                        <svg version="1.1" id="wind" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                             viewBox="0 0 300.492 300.492" style="enable-background:new 0 0 300.492 300.492;" xml:space="preserve">
                                                        <g>
                                                        <g>
                                                        <g>
                                                        <path style="fill:#FFFFFF;" d="M287.166,100.421c-9.502-13.217-24.046-23.034-39.868-26.945
                                                              c-5.309-1.365-10.845-2.061-16.453-2.061c-11.531,0-22.257,3.035-30.981,8.746c-14.076,8.86-23.709,23.91-25.759,40.157
                                                              c-2.698,16.644,4.357,34.315,17.519,43.959c7.555,5.716,17.47,8.991,27.201,8.991c7.332,0,14.109-1.811,19.575-5.216
                                                              c14.936-8.991,21.495-28.577,14.626-43.665c-3.525-7.669-10.427-13.647-18.455-15.975c-2.361-0.696-4.754-1.082-7.131-1.164
                                                              l-0.288,5.434c1.974,0.141,3.916,0.544,5.782,1.202c6.288,2.143,11.536,7.093,14.044,13.288c1.256,2.975,1.893,6.211,1.822,9.355
                                                              c-0.071,3.421-0.658,6.565-1.855,9.861c-2.366,6.222-6.967,11.667-12.678,14.968c-10.269,6.233-26.624,4.329-37.171-4.172
                                                              c-10.405-8.278-15.529-21.87-13.364-35.528c1.8-13.413,9.85-25.71,21.56-32.912c5.553-3.514,12.069-5.803,18.868-6.636
                                                              c2.823-0.359,6.619-0.413,10.285-0.131c3.497,0.31,7.033,0.903,10.231,1.713c13.358,3.437,25.623,11.863,33.668,23.154
                                                              c8.365,11.324,12.325,24.96,11.438,39.477c-0.587,14.098-5.423,28.305-13.619,40.021c-8.159,11.759-19.907,21.354-33.108,27.027
                                                              c-6.059,2.654-13.07,4.574-20.832,5.695c-4.803,0.68-9.959,0.8-16.203,0.892l-176.09,2.339l-29.817,1.164l0.109,5.439
                                                              l199.015,0.131c2.295,0,4.596,0,6.88,0.022l4.253,0.027c3.835,0,8.376-0.071,12.988-0.593c8.36-1.033,16.263-3.111,23.464-6.168
                                                              c14.925-6.206,28.283-16.905,37.606-30.127c9.426-13.206,15.072-29.36,15.893-45.438
                                                              C301.476,130.293,296.679,113.399,287.166,100.421z"/>
                                                        </g>
                                                        <g>
                                                        <path style="fill:#FFFFFF;" d="M106.617,209.839c0.664-0.027,1.463-0.038,2.23-0.038l5.445,0.065
                                                              c1.528,0.027,2.959,0.049,4.395,0.049c2.801,0,6.511-0.076,10.438-0.647c7.626-1.246,14.849-4.471,20.864-9.312
                                                              c12.374-9.752,18.874-25.999,16.562-41.391c-2.371-15.648-15.953-28.697-31.547-30.35c-8.539-1.05-16.421,0.979-22.404,5.619
                                                              c-6.451,4.824-10.688,12.091-11.612,19.842c-1.229,8.077,1.806,16.589,7.664,21.637c5.803,5.287,15.431,7.43,22.387,5.037
                                                              c5.102-1.702,9.42-5.798,11.563-10.971l-4.928-2.284c-1.817,3.519-5.096,6.124-8.762,6.957c-1.218,0.277-2.317,0.408-3.367,0.408
                                                              c-4.329,0-8.762-1.866-11.591-4.89c-3.835-4.003-5.249-9.11-4.096-14.762c1.044-5.08,4.308-10.106,8.496-13.124
                                                              c4.449-3.176,9.284-4.286,15.349-3.405c11.123,1.441,20.603,10.943,22.077,22.229c1.996,11.335-2.877,24.013-12.173,31.585
                                                              c-4.585,3.867-10.193,6.494-16.236,7.604c-2.469,0.479-4.922,0.571-7.647,0.642l-104.506,2.752
                                                              C10.264,203.524,5.134,203.9,0,204.275l0.19,5.434L106.617,209.839z"/>
                                                        </g>
                                                        </g>
                                                        </g>

                                                        <span id="wind-speed"></span>
                                                    </div>
                                                </div>
                                            </article>

                                            <figure></figure>
                                        </div>

                                        <div class="days">
                                            <div class="row row-no-gutter">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br/>
                    <div class="col-md-9" style="height: 550px;">
                        <h3>Current weather map</h3>
                        <div id="map-canvas"></div>
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
        <script src="resources/notify.js"></script>
        <script src="resources/styles/metro/notify-metro.js"></script>
        <script src="resources/jquery-ias.min.js"></script>
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTMXfmDn0VlqWIyoOxK8997L-amWbUPiQ"></script>
        <script src="resources/weathermap.js"></script>
        <script src="resources/weather.js"></script>
    </body>
</html>
