function sendMapData() {
  $.post("/api/v1/maps", {
    lat: map.getCenter().lat,
    lng: map.getCenter().lng,
    zoom: map.getZoom()
  }, function (data) {
    if (data["success"]) {
      window.location.replace("<%= new_order_path %>")
    }
  }, 'script');
};
