$(document).ready(function(){

  L.mapbox.accessToken = 'pk.eyJ1IjoiYWJjZGF2ZTg4IiwiYSI6IjU2MDE1YzUwYjI5NTg3YTExYTJiOWMwNmI2NWEzOWY4In0._qV9cnHz0Q0Uk28oJtUslQ';
  var map = L.mapbox.map('map', 'abcdave88.mmjnge0o',{
    continuousWorld: false,
    noWrap: true,
    maxZoom: 5,
    minZoom: 2
  }).setView([53.9560855309879, -2.8125], 2);


  function showSingleShip(){
    $.ajax({
      type: 'GET',
      dataType: 'JSON',
      url: '/'
    }).done(function(data){
      data.ships.filter(function(ship){
        var shipName = ($('select').val())
        // console.log(shipName)
        // console.log(ship.name)
        if (ship.name == shipName){
          console.log(ship)
        }
        else{
          console.log('fuck')
        }
      })
    })//end of .done
  }//end of showSingleShip



  function showAllShips(){
    console.log('show all')
    $.ajax({
      type: 'GET',
      dataType: 'JSON',
      url: '/'
    }).done(function(data){
      console.log(data);
      // debugger;
        $(data.destinations).each(function(index, destination){
          var destinationName = destination.name
          var eta = destination.eta_time
          var shipIdArray = []
          $(data.ships).each(function(index, ship){shipIdArray.push(ship.id)});
          var biggestIDs = [];
          $(shipIdArray).each(function(index, shipID){
            var temp = data.locations.filter(function(location){
              if (location.ship_id == shipID){
                return true;
              } else return false;
            })
            biggestIDs.push(temp[temp.length-1].id)
          })
          console.log(biggestIDs);

          $(data.locations).each(function(index, location){
            var ship_id = location.ship_id;
            var ship_lat = location.latitude;
            var ship_long = location.longitude;
            var bigIcon = "assets/red-marker.png";
            var smallIcon = "assets/yellow-marker.png";
            var shipName = data.ships.filter(function(ship){
              if (ship.id === ship_id){
                return true
              } else {return false};
            })[0].name;
            if (biggestIDs.indexOf(location.id) !== -1) {
              console.log(location.id);
              addLocationMarker(shipName, ship_lat, ship_long, bigIcon);//big icon holding name - requires path
            } else {
              addLocationMarker(shipName, ship_lat, ship_long, smallIcon);//small icon holding name - requires path
            }//end of if else statment
        })//end of locations loop
      })//end of destinations loop
    });//end of data.done
  }//end of show all ships

// 1 wrap mapbox marker function in a fucntion 
// 2 call that function for every marker we want
// 3 for the marker wee neeed /coordinates/ship-name/marker-image & any key ship data
// 4 

  // function getDestinationCoord(destination){
  //   $.get("http://api.tiles.mapbox.com/v4/geocode/mapbox.places/"+destination+".json?access_token=pk.eyJ1IjoiYWJjZGF2ZTg4IiwiYSI6IjU2MDE1YzUwYjI5NTg3YTExYTJiOWMwNmI2NWEzOWY4In0._qV9cnHz0Q0Uk28oJtUslQ", function(data){
  //     console.log(data);
  //     // debugger
  //   })
  // };

  function addLocationMarker(shipName, lat, long, img){ 
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
            "icon": {
              "iconUrl": img,
              // "iconSize": [100, 100],
              // "iconAnchor": [50, 50],
              // "popupAnchor": [0, -55],
              // "className": "dot"
            }
        }
    }).addTo(map);
  };

$('#show_all').on('click', showAllShips);
// $('#hide_all').on('click', hideAll);
$('#select_tag').on('change', showSingleShip);
})//end of document.ready