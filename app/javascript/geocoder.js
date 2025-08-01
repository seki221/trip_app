var geocoder;
var map;
function initialize() {
 geocoder = new google.maps.Geocoder();
var latlng = new google.maps.LatLng(35.697456,139.702148);
 var opts = {
 zoom: 10,
 center: latlng,
 mapTypeId: google.maps.MapTypeId.ROADMAP
 }
 map = new google.maps.Map
  (document.getElementById("map"), opts);
}

document.addEventListener("turbo:load", function () {
  if (document.getElementById("map")) {
    initMap();
  }
});