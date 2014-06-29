function codeAddress(addressId, result) {
  var geocoder = new google.maps.Geocoder();
  var address = document.getElementById(addressId).value;
  geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      // console.log('results[0].geometry.location.A')
      // console.log(results[0].geometry.location.A)
      // console.log('results[0].geometry.location.k')
      // console.log(results[0].geometry.location.k)

      $(result).val("POINT ("+ results[0].geometry.location.A + " " + results[0].geometry.location.k+")")

    } else {
      alert('Please enter a valid address');
    }
  });
}


$(document).ready(function() {
  $('#start_location').on('focusout', function(e) {
    e.preventDefault();
    codeAddress('start_location', '#location_start');
    console.log("FUUUUUCK")
  });

  $('#end_location').on('focusout', function(e) {
    e.preventDefault();
    codeAddress('end_location', '#location_end');
    console.log("Wanker!!")
  });
});

$(document).on('page:load', function() {
  $('#start_location').on('focusout', function(e) {
    e.preventDefault();
    codeAddress('start_location', '#location_start');
    console.log("FUUUUUCK")
  });

  $('#end_location').on('focusout', function(e) {
    e.preventDefault();
    codeAddress('end_location', '#location_end');
    console.log("Wanker!!")
  });
})
