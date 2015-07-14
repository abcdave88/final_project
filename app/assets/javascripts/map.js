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
    debugger;
      $(data.destinations).each(function(index, destination){
        debugger;
        
        $(data.locations).each(function(index, location){
          debugger;
          var ship_id = location.ship_id;
          var ship_lat = location.latitude;
          var ship_long = location.longitude;
          var shipName = data.ships.filter(function(ship){
            if (ship.id === ship_id){
              return true
            } else {return false};
          })[0].name;
          addMarker(shipName, ship_lat, ship_long);
      })//end of locations loop
    })//end of destinations loop
  });

// 1 wrap mapbox marker function in a fucntion 
// 2 call that function for every marker we want
// 3 for the marker wee neeed /coordinates/ship-name/marker-image & any key ship data
// 4 

  function addMarker(shipName, lat, long){ 
    L.mapbox.featureLayer({
        // this feature is in the GeoJSON format: see geojson.org
        // for the full specification
        type: 'Feature',
        geometry: {
            type: 'Point',
            // coordinates here are in longitude, latitude order because
            // x, y is the standard for GeoJSON and many formats
            coordinates: [
              long,
              lat 
            ]
        },
        properties: {
            title: shipName,
            description: 'Daveys Ship',
            // one can customize markers by adding simplestyle properties
            // https://www.mapbox.com/guides/an-open-platform/#simplestyle
            'marker-size': 'large',
            'marker-color': '#BE9A6B',
            'marker-symbol': 'cafe'
        }
    }).addTo(map);
  };
})//end of document.ready