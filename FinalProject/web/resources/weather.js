$(function () {

    var zip = $('#zip').val();
    var city = $('#city').val();
    var set = "";
    var locationCity = "";

    if (zip != 0) {
        set = 'zip=' + zip;
        forecast(set);
    } else if (city != "") {
        set = 'q=' + city;
        forecast(set);
    } else if (zip == 0 && city == "") {
        getLocation();
        set = 'q=' + locationCity;
    }



    function getLocation() {

        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(geoSuccess, geoError);
        } else {
            alert("Geolocation is not supported by this browser.");
        }
    }

    function geoError() {
        alert("Geocoder failed.");
    }

    function geoSuccess(position) {
        var lat = position.coords.latitude;
        var lng = position.coords.longitude;
        locationCity = codeLatLng(lat, lng);
    }

    var geocoder = new google.maps.Geocoder();

    function codeLatLng(lat, lng) {
        var latlng = new google.maps.LatLng(lat, lng);
        geocoder.geocode({'latLng': latlng}, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {

                if (results[1]) {
                    //formatted address
                    var address = results[0].formatted_address;
                } else {
                    alert("No results found");
                }
                var ci = results[0].address_components[1].long_name;
                var set = 'q=' + ci;
                forecast(set);
                return results[0].address_components[1].long_name;
            } else {
                alert("Geocoder failed due to: " + status);
            }
        });
    }


    $('#searchWeather').on('click', function () {
        var val = $('#searchValue').val();
        if (val == "") {
            alert('Search value cannot be null!');
        } else {
            var criteria = $('#criteria').val();

            if (criteria == 'zip') {
                set = 'zip=' + val;
                forecast(set);
            } else {
                set = 'q=' + val;
                forecast(set);
            }
        }
    });

});

function forecast(set) {
    $.post('http://api.openweathermap.org/data/2.5/forecast?' + set + '&units=metric&appid=1d7d33a770950e00fb331499b4a97a42')
            .done(createForecast)
            .fail(function () {
                alert('There was an error to retrieve data!');
            });
}

function createForecast(data) {
    console.log(data);
    $('.row-no-gutter').empty();
    var d = new Date();
    var weekday = new Array(7);
    weekday[0] = "Sunday";
    weekday[1] = "Monday";
    weekday[2] = "Tuesday";
    weekday[3] = "Wednesday";
    weekday[4] = "Thursday";
    weekday[5] = "Friday";
    weekday[6] = "Saturday";

    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate() + 1;
    var curDate = year + '-' + month + '-' + day;
    console.log(curDate);

    var day1 = year + '-' + month + '-' + (day + 1) + ' 15:00:00';
    var day2 = year + '-' + month + '-' + (day + 2) + ' 15:00:00';
    var day3 = year + '-' + month + '-' + (day + 3) + ' 15:00:00';
    var day4 = year + '-' + month + '-' + (day + 4) + ' 15:00:00';

    todayResult = $.grep(data.list, function (a) {
        return (new RegExp(curDate).test(a.dt_txt));
    });

    result = $.grep(data.list, function (a) {
        return (a.dt_txt == day1 || a.dt_txt == day2 || a.dt_txt == day3 || a.dt_txt == day4);
    });

    var temp = todayResult[0].main.temp;
    var city = data.city.name;

    $('.city').text(city);
    $('.temp').text(Math.round(parseInt(temp)) + '°');
    $('#wind-speed').text(Math.round(parseInt(todayResult[0].wind.speed))+' m/s');

    var k = parseInt(d.getDay()) + 1;
    var count = 0;
    for (var p = k; p < k + 4; p++) {
        var weekDay = "";
        if (p > 6) {
            weekDay = weekday[7 - p];
        } else {
            weekDay = weekday[p];
        }

        $('.row-no-gutter').append('<div class="col-md-3">\n\
                            <div class="day">\n\
                                <h1>' + weekDay + '</h1>\n\
                                <h3>' + Math.round(parseInt(result[count].main.temp)) + '°</h3>\n\
                            </div>\n\
                        </div>');

        count++;
    }
}