$(document).ready(function(){

  L.mapbox.accessToken = 'pk.eyJ1IjoiYWJjZGF2ZTg4IiwiYSI6IjU2MDE1YzUwYjI5NTg3YTExYTJiOWMwNmI2NWEzOWY4In0._qV9cnHz0Q0Uk28oJtUslQ';
  var map = L.mapbox.map('map', 'abcdave88.mmjnge0o',{
    continuousWorld: false,
    noWrap: true,
    maxZoom: 12,
    minZoom: 2
  }).setView([53.9560855309879, -2.8125], 3);

  $.ajax({
    type: 'GET',
    dataType: 'JSON',
    url: '/'
  }).done(function(data){
    console.log(data);
  });

  map.on('style.load', function() {
  map.addSource("markers", {
    "type": "geojson",
    "data": {
      "type": "FeatureCollection",
      "features": [{
        "type": "Feature",
        "geometry": {
          "type": "Point",
          "coordinates": [-77.03238901390978, 38.913188059745586]
        },
        "properties": {
          "title": "Mapbox DC",
          "marker-symbol": "monument"
        }
      }, {
        "type": "Feature",
        "geometry": {
          "type": "Point",
          "coordinates": [-122.414, 37.776]
        },
        "properties": {
          "title": "Mapbox SF",
          "marker-symbol": "harbor"
        }
      }]
    }
  });

    map.addLayer({
      "id": "markers",
      "type": "symbol",
      "source": "markers",
      "layout": {
        "icon-image": "{marker-symbol}-12",
        "text-field": "{title}",
        "text-font": "Open Sans Semibold, Arial Unicode MS Bold",
        "text-offset": [0, 0.6],
        "text-anchor": "top"
      },
      "paint": {
        "text-size": 12
      }
    });
  });
})//end of document.ready