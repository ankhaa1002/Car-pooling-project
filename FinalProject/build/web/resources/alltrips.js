$(function () {

    $.post('PostServlet', {postType: 0})
            .done(drawMap);

});

function drawMap(data) {

    $('#trips').text(data.length.toString());

    var map;
    var mapOptions = {center: new google.maps.LatLng(42.5584308, -120), zoom: 4,
        mapTypeId: google.maps.MapTypeId.ROADMAP};

    function initialize() {
        var mapOptions = {
            zoom: 5,
            center: new google.maps.LatLng(40, -100)
        };
        map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);

        function renderDirections(result) {
            var directionsRenderer = new google.maps.DirectionsRenderer;
            directionsRenderer.setMap(map);
            directionsRenderer.setDirections(result);
        }

        var directionsService = new google.maps.DirectionsService;
        function requestDirections(start, end) {
            directionsService.route({
                origin: start,
                destination: end,
                travelMode: google.maps.DirectionsTravelMode.DRIVING
            }, function (result) {
                renderDirections(result);
            });
        }

        for (var k = 0; k < data.length; k++) {
            var a = "";
            a = data[k].source;
            var temp = a.split(",");
            city1 = temp[0];
            state1 = temp[1];

            var b = "";
            b = data[k].destination;
            var temp2 = b.split(",");
            city2 = temp2[0];
            state2 = temp2[1];

            requestDirections(city1 + ',' + state1, city2 + ',' + state2);
        }

    }
    google.maps.event.addDomListener(window, 'load', initialize);
}