// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require lodash
//= require gmaps/google
//= require moment
//= require foundation
//= require turbolinks
//= require_tree .

$(function(){ $(document).foundation(); });

(function(){


  $(document).ready(init);

  function init(){
    initMap(36, -86, 2);
    $('#add').click(add);
    $('#show').click(show);
    $('#nsa').click(nsa);
  }

  var map;

  function nsa(){
    var options = {enableHighAccuracy: true, timeout: 5000, maximumAge: 0};
    navigator.geolocation.getCurrentPosition(success, e => console.log(e), options);
  }

  function success(pos){
    var lat = pos.coords.latitude;
    var lng = pos.coords.longitude;
    var latLng = new google.maps.LatLng(lat, lng);
    addMarker(lat, lng, name, './media/icon.png');
    map.setCenter(latLng);
    map.setZoom(10);
  }

  function initMap(lat, lng, zoom){
    var styles = [{"elementType":"labels.text.stroke","stylers":[{"color":"#ffffff"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#000000"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#0000ff"}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#ff0000"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#000100"}]},{"featureType":"road.highway.controlled_access","elementType":"geometry.fill","stylers":[{"color":"#ffff00"}]},{"featureType":"road.highway.controlled_access","elementType":"geometry.stroke","stylers":[{"color":"#ff0000"}]},{"featureType":"road.arterial","elementType":"geometry.fill","stylers":[{"color":"#ffa91a"}]},{"featureType":"road.arterial","elementType":"geometry.stroke","stylers":[{"color":"#000000"}]},{"featureType":"landscape.natural","stylers":[{"saturation":36},{"gamma":0.55}]},{"featureType":"road.local","elementType":"geometry.stroke","stylers":[{"color":"#000000"}]},{"featureType":"road.local","elementType":"geometry.fill","stylers":[{"color":"#ffffff"}]},{"featureType":"landscape.man_made","elementType":"geometry.stroke","stylers":[{"lightness":-100},{"weight":2.1}]},{"featureType":"landscape.man_made","elementType":"geometry.fill","stylers":[{"invert_lightness":true},{"hue":"#ff0000"},{"gamma":3.02},{"lightness":20},{"saturation":40}]},{"featureType":"poi.attraction","stylers":[{"saturation":100},{"hue":"#ff00ee"},{"lightness":-13}]},{"featureType":"poi.government","stylers":[{"saturation":100},{"hue":"#eeff00"},{"gamma":0.67},{"lightness":-26}]},{"featureType":"poi.medical","elementType":"geometry.fill","stylers":[{"hue":"#ff0000"},{"saturation":100},{"lightness":-37}]},{"featureType":"poi.medical","elementType":"labels.text.fill","stylers":[{"color":"#ff0000"}]},{"featureType":"poi.school","stylers":[{"hue":"#ff7700"},{"saturation":97},{"lightness":-41}]},{"featureType":"poi.sports_complex","stylers":[{"saturation":100},{"hue":"#00ffb3"},{"lightness":-71}]},{"featureType":"poi.park","stylers":[{"saturation":84},{"lightness":-57},{"hue":"#a1ff00"}]},{"featureType":"transit.station.airport","elementType":"geometry.fill","stylers":[{"gamma":0.11}]},{"featureType":"transit.station","elementType":"labels.text.stroke","stylers":[{"color":"#ffc35e"}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"lightness":-100}]},{"featureType":"administrative","stylers":[{"saturation":100},{"gamma":0.35},{"lightness":20}]},{"featureType":"poi.business","elementType":"geometry.fill","stylers":[{"saturation":-100},{"gamma":0.35}]},{"featureType":"poi.business","elementType":"labels.text.stroke","stylers":[{"color":"#69ffff"}]},{"featureType":"poi.place_of_worship","elementType":"labels.text.stroke","stylers":[{"color":"#c3ffc3"}]}]
    var mapOptions = {center: new google.maps.LatLng(lat, lng), zoom: zoom, mapTypeId: google.maps.MapTypeId.ROADMAP, styles: styles};
    map = new google.maps.Map(document.getElementById('map'), mapOptions);
  }

  function add(){
    var place = $('#place').val().trim();
    var vacation = "<option> + ${place} + </option>";
    $('#vacations').append(vacation);
    $('#place').val('');
    $('#place').focus();
  }

  function addMarker(lat, lng, name, icon){
    var latLng = new google.maps.LatLng(lat, lng);
    new google.maps.Marker({map: map, position: latLng, title: name, icon: icon});
  }

  function show(){
    var vacation = $('#vacations').val();
    var geocoder = new google.maps.Geocoder();

    geocoder.geocode({address: vacation}, (results, status)=>{
      var name = results[0].formatted_address;
      var lat = results[0].geometry.location.lat();
      var lng = results[0].geometry.location.lng();
      addMarker(lat, lng, name, './media/flag.png');
      var latLng = new google.maps.LatLng(lat, lng);
      map.setCenter(latLng);
      map.setZoom(10);
    });
  }
})();