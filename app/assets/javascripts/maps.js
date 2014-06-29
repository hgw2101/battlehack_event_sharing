var directionsShow;
var directionsTool = new google.maps.DirectionsService();
var map;

function initializeMap() {
  directionsShow = new google.maps.DirectionsRenderer();
  var chicago = new google.maps.LatLng(41.850033, -87.6500523);
  var mapOptions = {
    zoom:7,
    center: chicago
  }
  if (document.getElementById('map-canvas')) {
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    directionsShow.setMap(map);
  }

}

function calcPath() {
  // var start = document.getElementById('start').value;
  // var end = document.getElementById('end').value;
  var start = '41.8822784,-87.6294101'
  var end = '42.1168454,-85.6345205'
  var request = {
      origin:start,
      destination:end,
      travelMode: google.maps.TravelMode.DRIVING
  };
  directionsTool.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsShow.setDirections(response);
    }
  });
}

// google.maps.event.addDomListener(window, 'load', initializeMap);

$(document).ready(function() {
  console.log("FUUUCK")
  initializeMap();
  calcPath();
});


$(document).on('page:load', function() {
  console.log("FUUUCK")
  initializeMap();
  calcPath();
});
