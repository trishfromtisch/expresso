// function getLocation(){
//   var autocomplete;
//   function googlePostNew() {
//     $.get("/posts/location", function(data){
//       var defaultBounds = new google.maps.LatLngBounds(
//           new google.maps.LatLng(data["swlat"], data["swlng"]),
//           new google.maps.LatLng(data["nelat"], data["nelng"]));

//       var input = $('input#pac-input');
//       var options = {
//         bounds: defaultBounds,
//         types: ['establishment']
//         };

//       autocomplete = new google.maps.places.Autocomplete(input, options);
//       google.maps.event.addListener(autocomplete, 'place_changed', function () {
//       place = autocomplete.getPlace();
//       console.log(place);
//       });
//       });
//   }

// google.maps.event.addDomListener(window, 'load', googlePostNew);
// }