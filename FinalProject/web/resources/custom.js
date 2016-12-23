/* global i */

var preloader = $('#spinner-wrapper');
$(window).on('load', function () {
    callPosts(0);

//    var postType = $('li.active').find('a').text() == "Offer" ? 0 : 1;
    setInterval(function () {
        checkLatest();
    }, 1000);
//
//    var ias = $.ias({
//        container: "#1a",
//        item: ".post-content",
//        pagination: "#pagination",
//        next: ".next a"
//    });
//
//    ias.extension(new IASSpinnerExtension());            // shows a spinner (a.k.a. loader)
//    ias.extension(new IASTriggerExtension({offset: 3})); // shows a trigger after page 3
//    ias.extension(new IASNoneLeftExtension({
//        text: 'There are no more pages left to load.'      // override text when no pages left
//    }));
});

function checkLatest() {
    $.post('CheckServlet')
            .done(function (data) {
                if (data != false) {
                    prependPost(data);
                    notify("New trip!",data.userid.fullname+' has posted new trip!')
                }
            });
}

function prependPost(data) {
    var postType = $('li.active').find('a').text() == "Offer" ? 0 : 1;
    var id = postType == 0 ? '#1a' : '#2a';

    $(id).prepend('<div class="post-content">\n\
                            <div class="post-container">\n\
                                <img src="https://www.peakprosperity.com/sites/default/files/imagecache/comment_avatar/sites/all/themes/peak_prosperity/images/comments/default-user.png" alt="user" class="profile-photo-md pull-left">\n\
                                <div class="post-detail">\n\
                                    <div class="user-info">\n\
                                        <h5><a href="" class="profile-link">' + data.userid.fullname + '</a> </h5>\n\
                                        <p class="text-muted"><b>Source:</b> <i class="icon ion-ios-location"></i> ' + data.source + '<br/> <b>Destination:</b> <i class="icon ion-ios-location"></i> ' + data.destination + '<br/><b>Posted date:</b> <i class="icon ion-ios-location"></i> ' + data.datecreated + '<br/></p>\n\
                                    </div>\n\
                                <div class="reaction re-' + data.postid + '">\n\
                                    <a data-post="' + data.postid + '" data-user="' + $('#userId').val() + '" class="btn like text-green"><i class="icon ion-thumbsup"></i> ' + data.likesList.length + '</a>\n\
                                </div>\n\
                                <div class="line-divider"></div>\n\
                                <div class="post-text">\n\
                                    <p>' + data.post + ' </p>\n\
                                </div>\n\
                                <div data-post="' + data.postid + '" class="user-comments-' + data.postid + '"></div>\n\
                                <div class="post-comment">\n\
                                    <img src="https://www.peakprosperity.com/sites/default/files/imagecache/comment_avatar/sites/all/themes/peak_prosperity/images/comments/default-user.png" alt="" class="profile-photo-sm">\n\
                                    <input type="text" data-input="' + data.postid + '" class="form-control post-comment" placeholder="Post a comment">\n\
                                </div>\n\
                            </div>\n\
                        </div>').hide().fadeIn('slow');

    for (var k = 0; k < data.length; k++) {
        $('.user-comments-' + data[k].postid + '').empty();
        var comments = data[k].commentsList;
        if (comments.length > 0) {
            console.log(comments);
            for (var i = 0; i < comments.length; i++) {
                $('.user-comments-' + data[k].postid + '').append('<div class="post-comment">\n\
                                            <img src="https://www.peakprosperity.com/sites/default/files/imagecache/comment_avatar/sites/all/themes/peak_prosperity/images/comments/default-user.png" alt="" class="profile-photo-sm">\n\
                                            <p><a href="" class="profile-link">' + comments[i].userid.fullname + '</a> ' + comments[i].comment + '</p>\n\
                                        </div>');
            }
        }
    }

}

$('#offer').on('click', function () {
    callPosts(0);
});

$('#need').on('click', function () {
    callPosts(1);
});

$('#publish').on('click', function () {
    var postType = $('li.active').find('a').text() == "Offer" ? 0 : 1;

    $.post('CreatePostServlet',
            {post: $('#post').val(),
                postType: $('#postType').find(":selected").text(),
                source: $('#source').val(),
                destination: $('#destination').val()})
            .done(function (data) {
                notify("Successfully posted", "Your post has been successfully posted!");
                callPosts(postType);
            })
            .always(function () {
                hidePreloader();
            })
            .fail(errorCreatePost);

    showPreloader();
});

function hidePreloader() {
    var preloaderFadeOutTime = 500;
    preloader.fadeOut(preloaderFadeOutTime);
}

function showPreloader() {
    var preloaderFadeOutTime = 500;
    preloader.fadeIn(preloaderFadeOutTime);
}

function callPosts(type) {
    $.post('PostServlet', {postType: type})
            .done(function (data) {
                appendPosts(data);
                afterAppend(type);
            })
            .always(function () {
                hidePreloader();
            })
            .fail();

    showPreloader();

}

function callPostsAlternate(type) {
    $.post('PostServlet', {postType: type})
            .done(function (data) {
                appendPosts(data);
                afterAppend(type);
            })
            .fail();
}

function appendPosts(data) {
    var type;

    console.log(data);
    if (data[0] != null) {
        type = data[0].posttype;
    }

    var id = type == 0 ? '#1a' : '#2a';

    $(id).empty();

    for (var i = 0; i < data.length; i++) {
        $(id).append('<div class="post-content">\n\
                            <div class="post-container">\n\
                                <img src="https://www.peakprosperity.com/sites/default/files/imagecache/comment_avatar/sites/all/themes/peak_prosperity/images/comments/default-user.png" alt="user" class="profile-photo-md pull-left">\n\
                                <div class="post-detail">\n\
                                    <div class="user-info">\n\
                                        <h5><a href="" class="profile-link">' + data[i].userid.fullname + '</a> </h5>\n\
                                        <p class="text-muted"><b>Source:</b> <i class="icon ion-ios-location"></i> ' + data[i].source + '<br/> <b>Destination:</b> <i class="icon ion-ios-location"></i> ' + data[i].destination + '<br/><b>Posted date:</b> <i class="icon ion-ios-location"></i> ' + data[i].datecreated + '<br/></p>\n\
                                    </div>\n\
                                <div class="reaction re-' + data[i].postid + '">\n\
                                    <a data-post="' + data[i].postid + '" data-user="' + $('#userId').val() + '" class="btn like text-green"><i class="icon ion-thumbsup"></i> ' + data[i].likesList.length + '</a>\n\
                                </div>\n\
                                <div class="line-divider"></div>\n\
                                <div class="post-text">\n\
                                    <p>' + data[i].post + ' </p>\n\
                                </div>\n\
                                <div data-post="' + data[i].postid + '" class="user-comments-' + data[i].postid + '"></div>\n\
                                <div class="post-comment">\n\
                                    <img src="https://www.peakprosperity.com/sites/default/files/imagecache/comment_avatar/sites/all/themes/peak_prosperity/images/comments/default-user.png" alt="" class="profile-photo-sm">\n\
                                    <input type="text" data-input="' + data[i].postid + '" class="form-control post-comment" placeholder="Post a comment">\n\
                                </div>\n\
                            </div>\n\
                        </div>');
    }

    for (var k = 0; k < data.length; k++) {
        $('.user-comments-' + data[k].postid + '').empty();
        var comments = data[k].commentsList;
        if (comments.length > 0) {
            console.log(comments);
            for (var i = 0; i < comments.length; i++) {
                $('.user-comments-' + data[k].postid + '').append('<div class="post-comment">\n\
                                            <img src="https://www.peakprosperity.com/sites/default/files/imagecache/comment_avatar/sites/all/themes/peak_prosperity/images/comments/default-user.png" alt="" class="profile-photo-sm">\n\
                                            <p><a href="" class="profile-link">' + comments[i].userid.fullname + '</a> ' + comments[i].comment + '</p>\n\
                                        </div>');
            }
        }
    }

    for (var i = 0; i < data.length; i++) {
        if ($('#userId').val() == data[i].userid.userid) {
            $('.re-' + data[i].postid + '').append('<b><a data-post="' + data[i].postid + '" class="btn text-red delete"><i class="fa .fa-close"></i> Delete</a></b>');
        }
    }

}

function afterAppend(postType) {
    var id = postType == 0 ? '#1a' : '#2a';
    var like = $(id).find('.like');
    var postComment = $(id).find('.post-comment');
    var remove = $(id).find('.delete');

    like.on('click', function () {
        var postId = $(this).data('post');
        var userId = $(this).data('user');

        $(this).removeClass('text-green');
        $(this).addClass('clicked');

        var postType = $('li.active').find('a').text() == "Offer" ? 0 : 1;
        $.post('LikeServlet', {'userId': userId, 'postId': postId})
                .done(function () {
                    callPosts(postType);
                });
    });

    remove.on('click', function () {
        var postId = $(this).data('post');
        var postType = $('li.active').find('a').text() == "Offer" ? 0 : 1;

        var isDelete = confirm("Do you want to delete this post?");

        if (isDelete) {
            $.post('DeletePostServlet', {postId: postId})
                    .done(function () {
                        callPosts(postType);
                        notify("Successfully deleted", "Your post has been successfully deleted!")
                    });
        }
    });

    postComment.keyup(function (e) {
        if (e.keyCode == 13) {
            var postId = parseInt($(this).data('input'));
            if (postId >= 0) {
                var userId = $('#userId').val();
                var comment = $(this).val();
                if (comment != "") {
                    var postType = $('li.active').find('a').text() == "Offer" ? 0 : 1;
                    $.post('CommentServlet', {'postId': postId, 'userId': userId, 'comment': comment})
                            .done(function () {
                                callPosts(postType);
                            });
                } else {
                    alert('Say something!');
                }

            }
        }
    });
}

function notify(title, text) {
    $.notify({
        title: title,
        text: text,
        image: "<img src='http://diversity.com/images/icons/53.png'/>"
    }, {
        style: 'metro',
        className: 'info',
        autoHide: true,
        clickToHide: true
    });

    $('#post').val("");
    $('#destination').val("");
}

function errorCreatePost(data) {
    $.notify({
        title: 'Error!',
        text: 'There was some error!',
        image: "<img src='http://diversity.com/images/icons/53.png'/>"
    }, {
        style: 'metro',
        className: 'error',
        autoHide: true,
        clickToHide: true
    });

    $('#post').val("");
    $('#source').val("");
    $('#destination').val("")
}

google.maps.event.addDomListener(window, 'load', function () {
    var places = new google.maps.places.Autocomplete(document.getElementById('source'));
    google.maps.event.addListener(places, 'place_changed', function () {
        var place = places.getPlace();
        var address = place.formatted_address;
        var latitude = place.geometry.location.A;
        var longitude = place.geometry.location.F;
        var mesg = "Address: " + address;
        mesg += "\nLatitude: " + latitude;
        mesg += "\nLongitude: " + longitude;
    });
});

google.maps.event.addDomListener(window, 'load', function () {
    var places = new google.maps.places.Autocomplete(document.getElementById('destination'));
    google.maps.event.addListener(places, 'place_changed', function () {
        var place = places.getPlace();
        var address = place.formatted_address;
        var latitude = place.geometry.location.A;
        var longitude = place.geometry.location.F;
        var mesg = "Address: " + address;
        mesg += "\nLatitude: " + latitude;
        mesg += "\nLongitude: " + longitude;
    });
});
