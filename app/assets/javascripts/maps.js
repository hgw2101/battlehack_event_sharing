function initializeMap() {
  // var coords = $('#stop_coords').data('info')
  // var myLatlng = new google.maps.LatLng(coords[0],coords[1]);
  var myLatlng = new google.maps.LatLng(41.8848025,-87.6355899)

  var mapOptions = {
    zoom: 16,
    center: myLatlng
  }
  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  var marker = new google.maps.Marker({
      position: myLatlng,
      map: map,
      title: 'Hello World!'
  });

}


$(document).ready(function() {
  initializeMap();
})

$(document).on('page:load', function() {
  initializeMap();
})
