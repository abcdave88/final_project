$(document).ready(function(){

  L.mapbox.accessToken = 'pk.eyJ1IjoiYWJjZGF2ZTg4IiwiYSI6IjU2MDE1YzUwYjI5NTg3YTExYTJiOWMwNmI2NWEzOWY4In0._qV9cnHz0Q0Uk28oJtUslQ';
  var map = L.mapbox.map('map', 'abcdave88.mmjnge0o',{
    continuousWorld: false,
    noWrap: true,
    maxZoom: 12,
    minZoom: 2
  }).setView([53.9560855309879, -2.8125], 3);
})//end of document.ready