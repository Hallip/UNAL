user = "VFH-844"

 function iniciarMap(){
    var coord = {lat: 4.733284 ,lng: -74.0527968};

    window.map = new google.maps.Map(document.getElementById('map'),{
      zoom: 10,
      center: coord
    });
    draw()
}

function error(err) {
  console.warn('ERROR(' + err.code + '): ' + err.message);
};

async function success(pos) {
  var crd = pos.coords;
  var coord = {lat: crd.latitude, lng: crd.longitude};
  console.log(coord);
  var route = await $.ajax({
      url: "http://192.168.0.6:25565/API/route",
      type: 'POST',
      data: {
      	user: user,
        lat: coord.lat,
      	lon: coord.lng
      },
      success: function(res) {
          return res
      }
  });

  console.log(route);
  var coord2 = {lat: route.lat ,lng: route.lon};
  var directionsRenderer = new google.maps.DirectionsRenderer();
  var directionsService = new google.maps.DirectionsService();
  console.log(route)
  document.getElementById("pacID").innerHTML = "ID del proximo paquete:  " + route.id;
  var request = {
    origin: coord,
    destination: coord2,
    travelMode: 'DRIVING'
  };

  directionsRenderer.setMap(window.map)


  directionsService.route(request, function(result,status){
      if (status == "OK") {
          directionsRenderer.setDirections(result)
      }
  });
};

function draw(){
  var options = {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0
  };
  pos = (navigator.geolocation.getCurrentPosition(success, error, options))

}

function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
  } else {
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

async function removePackage(){
    var paquete = document.getElementById("fname").value;
    var status = await $.ajax({
        url: "http://192.168.0.6:25565/API/delivery",
        type: 'POST',
        data: {
        	user: user,
          code: paquete
        },
        success: function(res) {
            return res
        }
    });
    console.log(status)
}
