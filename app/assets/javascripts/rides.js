function codeAddress(addressId, point) {
  var geocoder = new google.maps.Geocoder();
  var address = document.getElementById(addressId).value;
  geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      console.log('results[0].geometry.location.A')
      console.log(results[0].geometry.location.A)
      console.log('results[0].geometry.location.k')
      console.log(results[0].geometry.location.k)

      $(point).val("POINT ("+ results[0].geometry.location.A + " " + results[0].geometry.location.k+")")
      console.log("point")
      console.log($(point))

    } else {
      alert('Please enter a valid address');
    }
  });
}

function calcRoute(startAddress, endAddress) {
  var directionsDisplay = new google.maps.DirectionsRenderer();
  var directionsService = new google.maps.DirectionsService();
  var start = document.getElementById(startAddress).value;
  var end = document.getElementById(endAddress).value;
  var request = {
      origin:start,
      destination:end,
      travelMode: google.maps.TravelMode.DRIVING
  };

  directionsService.route(request, function(response, status) {
    console.log(status)
    if (status == google.maps.DirectionsStatus.OK) {
      $('#distance-calc').text("Total Distance: "+response.routes[0].legs[0].distance.text)
      console.log("$"+parseFloat(response.routes[0].legs[0].distance.text) * 0.1333)
      $('#ride_total_cost').val(Math.round(parseFloat(response.routes[0].legs[0].distance.text) * 0.21*100)/100)
    }
  });
}

function riderApprove() {
  $('body').on('ajax:success', '.rider-approve', function(e, data, status, xhr) {
    console.log(status)
    $(this).replaceWith('<p>Accepted</p>');
  });
}

function driverApprove() {
  $('body').on('ajax:success', '.driver-approve', function(e, data, status, xhr) {
    $(this).replaceWith('<p>Accepted</p>');
  });
}

$(document).ready(function() {
  $('#start_location').on('focusout', function(e) {
    e.preventDefault();
    codeAddress('start_location', '#location_start');
  });

  $('#end_location').on('focusout', function(e) {
    e.preventDefault();
    codeAddress('end_location', '#location_end');
    calcRoute('start_location', 'end_location');
  });

  $('#invite-riders').on('click', function(e) {
    e.preventDefault();

  });

  riderApprove();
  driverApprove();
});


$(document).on('page:load', function() {
  $('#start_location').on('focusout', function(e) {
    e.preventDefault();
    codeAddress('start_location', '#location_start');
  });

  $('#end_location').on('focusout', function(e) {
    e.preventDefault();
    codeAddress('end_location', '#location_end');
    calcRoute('start_location', 'end_location');
  });

  $('#invite-riders').on('click', function(e) {
    e.preventDefault();

  });

  riderApprove();
});
