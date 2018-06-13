var map,
  infoWindow,
  geocoder;
function initMap() {
  geocoder = new google.maps.Geocoder();
  map = new google.maps.Map(document.getElementById('map'), {
    center: {
      lat: 39.7392,
      lng: -104.9903
    },
    zoom: 14,
    disableDefaultUI: true,
    minZoom: 3,
    maxZoom: 18,
    styles: [
      {
        "featureType": "administrative",
        "elementType": "all",
        "stylers": [
          {
            "saturation": "-100"
          }
        ]
      }, {
        "featureType": "administrative.province",
        "elementType": "all",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      }, {
        "featureType": "landscape",
        "elementType": "all",
        "stylers": [
          {
            "saturation": -100
          }, {
            "lightness": 65
          }, {
            "visibility": "on"
          }
        ]
      }, {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      }, {
        "featureType": "road",
        "elementType": "all",
        "stylers": [
          {
            "saturation": "-100"
          }
        ]
      }, {
        "featureType": "road.highway",
        "elementType": "all",
        "stylers": [
          {
            "visibility": "simplified"
          }
        ]
      }, {
        "featureType": "road.arterial",
        "elementType": "all",
        "stylers": [
          {
            "lightness": "30"
          }
        ]
      }, {
        "featureType": "road.local",
        "elementType": "all",
        "stylers": [
          {
            "lightness": "40"
          }
        ]
      }, {
        "featureType": "transit",
        "elementType": "all",
        "stylers": [
          {
            "saturation": -100
          }, {
            "visibility": "simplified"
          }
        ]
      }, {
        "featureType": "water",
        "elementType": "geometry",
        "stylers": [
          {
            "hue": "#ffff00"
          }, {
            "lightness": -25
          }, {
            "saturation": -97
          }
        ]
      }, {
        "featureType": "water",
        "elementType": "labels",
        "stylers": [
          {
            "lightness": -25
          }, {
            "saturation": -100
          }
        ]
      }
    ]
  });
  infoWindow = new google.maps.InfoWindow;

  // Try HTML5 geolocation.
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function (position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      infoWindow.setPosition(pos);
      infoWindow.setContent('Location found.');
      infoWindow.open(map);
      map.setCenter(pos);
    }, function () {
      handleLocationError(true, infoWindow, map.getCenter());
    });
  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(
    browserHasGeolocation
      ? 'Error: The Geolocation service failed.'
      : 'Error: Your browser doesn\'t support geolocation.'
  );
  infoWindow.open(map);
}
