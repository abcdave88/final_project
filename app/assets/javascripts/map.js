$(document).ready(function(){

  L.mapbox.accessToken = 'pk.eyJ1IjoiYWJjZGF2ZTg4IiwiYSI6IjU2MDE1YzUwYjI5NTg3YTExYTJiOWMwNmI2NWEzOWY4In0._qV9cnHz0Q0Uk28oJtUslQ';
  var map = L.mapbox.map('map', 'abcdave88.mmjnge0o',{
    continuousWorld: false,
    noWrap: true,
    maxZoom: 8,
    minZoom: 2
  }).setView([53.9560855309879, -2.8125], 2);

var markerLayer;

  function hideAll(){
    $('.leaflet-marker-icon').hide();
  }


  function showSingleShip(){
    $.ajax({
      type: 'GET',
      dataType: 'JSON',
      url: '/'
    }).done(function(data){
      // if(markerLayer) {
      //   debugger;
      //   // map.removeLayer(markerLayer);
      //   markerLayer.removeLayer();
      // };
      $('.leaflet-marker-icon').hide();
      var shipId;
      var shipName;
      var destination;
      var speed;
      var eta;
      var bigIcon = "#ff0000"
      var smallIcon = "#FFFF00"
      data.ships.filter(function(ship){
        shipName = ($('select').val())
        // console.log(shipName)
        // console.log(ship.name)
        if (ship.name === shipName){
           shipId = ship.id 
           destination = ship.destination
           speed = ship.speed
           eta = ship.eta
           debugger;
          console.log(shipId)
           console.log('this is the ship id')
        }
        else{
          console.log('wrong ship')
        }
      })//end of ship filter
      var shipLocations = data.locations.filter(function(location){
        if (shipId === location.ship_id){
          return location
        }
      })//end of location filter
     var currentLocation = shipLocations[shipLocations.length-1]
     shipLocations = shipLocations.slice(0, shipLocations.length-1);
     addLocationMarker(shipName, currentLocation.latitude, currentLocation.longitude, bigIcon, destination, speed, eta);
     $(shipLocations).each(function(index, location){
      addLocationMarker(shipName, location.latitude, location.longitude, smallIcon, destination, speed, eta);
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
        // $(data.destinations).each(function(index, destination){
        //   var destinationName = destination.name
        //   var eta = destination.eta_time
          var shipIdArray = []
          var destination;
          var speed;
          var eta;
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
            var bigIcon = "#ff0000"
            var smallIcon = "#FFFF00"
            var shipName = data.ships.filter(function(ship){
              if (ship.id === ship_id){
                destination = ship.destination
                speed = ship.speed
                eta = ship.eta
                return true
              } else {return false};
            })[0].name;
            if (biggestIDs.indexOf(location.id) !== -1) {
              console.log(location.id);
              addLocationMarker(shipName, ship_lat, ship_long, bigIcon, destination, speed, eta);//big icon holding name - requires path
            } else {
              addLocationMarker(shipName, ship_lat, ship_long, smallIcon, destination, speed, eta);//small icon holding name - requires path
            }//end of if else statment
        })//end of locations loop
      // })//end of destinations loop
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

  function addLocationMarker(shipName, lat, long, img, destination, speed, eta){ 
   markerLayer = L.mapbox.featureLayer({
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
          description: 'Destination: ' +destination+ ', Speed: ' +speed+' eta: '+eta+ '',
          // one can customize markers by adding simplestyle properties
          // https://www.mapbox.com/guides/an-open-platform/#simplestyle
          'marker-size': 'small',
          'marker-color': img,
          'marker-symbol': 'ferry'
        }
    });

    markerLayer.addTo(map);
  };

$('#show_all').on('click', showAllShips);
$('#hide_all').on('click', hideAll);
$('#select_tag').on('change', showSingleShip);
})//end of document.ready