<!DOCTYPE html>
<html>
    <%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<head>
  <title>Leaflet Routing Example</title>
  <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
  <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
  <script src="https://unpkg.com/leaflet-routing-machine/dist/leaflet-routing-machine.js"></script>
  <style>
    .leaflet-routing-container {
      display: none !important;
    }
  </style>
</head>
<body>
  <div id="map" style="height: 100vh;"></div>
  <script>
    
    var map = L.map('map').setView([9.935218, 76.256085], 13);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors'
    }).addTo(map);

    // Assuming you have an array of coordinates in the format [latitude, longitude]
    const coordinates = [
       <%

                                    String selqry = "select u.user_longitude as longitude,u.user_latitude as latitude from tbl_wasterequest wr inner join tbl_user u on u.user_id=wr.user_id where wr.employee_id='"+request.getParameter("id")+"'";
                                    ResultSet rs = con.selectCommand(selqry);
                                    while (rs.next()) {
                                        out.println("[" + rs.getString("latitude") + ", " + rs.getString("longitude") + "],");
                                    }

            %>
    ];

    // Add markers for the original coordinates
    coordinates.forEach((coordinate) => {
      L.marker(coordinate).addTo(map);
    });
  function updateLocation(latitude, longitude) {
      const currentLocation = L.latLng(latitude, longitude);

        // Set the map view to the current location
        map.setView(currentLocation, 13);

        // Update the starting coordinate
        coordinates[0] = [latitude, longitude];

        // Define a custom icon for the current location marker
        const currentLocationIcon = L.icon({
          iconUrl: 'https://cdn.rawgit.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-red.png',
          iconSize: [25, 41],
          iconAnchor: [12, 41]
        });

        // Add a marker for the current location with the custom icon and red color
        L.circleMarker(currentLocation, { color: 'red' }).addTo(map);

        // Add a marker for the current location with the custom icon
        L.marker(currentLocation, { icon: currentLocationIcon }).addTo(map);

        // Create a Leaflet Routing Machine control
        var control = L.Routing.control({
          waypoints: coordinates.map(coordinate => L.latLng(coordinate[0], coordinate[1])),
          router: new L.Routing.OSRMv1({
            serviceUrl: 'https://router.project-osrm.org/route/v1'
          }),
          lineOptions: {
            styles: [{ color: '#3388ff', opacity: 0.7, weight: 5 }]
          }
        }).addTo(map);
    

        // Event handler for route calculation
        control.on('routesfound', function(e) {
          var routes = e.routes;
          var summary = routes[0].summary;
        });
    }


  







//    // Get the current location coordinates
//    navigator.geolocation.getCurrentPosition(
//      (position) => {
//        const latitude = position.coords.latitude;
//        const longitude = position.coords.longitude;
//        const currentLocation = L.latLng(latitude, longitude);
//
//        // Set the map view to the current location
//        map.setView(currentLocation, 13);
//
//        // Update the starting coordinate
//        coordinates[0] = [latitude, longitude];
//
//        // Define a custom icon for the current location marker
//        const currentLocationIcon = L.icon({
//          iconUrl: 'https://cdn.rawgit.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-red.png',
//          iconSize: [25, 41],
//          iconAnchor: [12, 41]
//        });
//
//        // Add a marker for the current location with the custom icon and red color
//        L.circleMarker(currentLocation, { color: 'red' }).addTo(map);
//
//        // Add a marker for the current location with the custom icon
//        L.marker(currentLocation, { icon: currentLocationIcon }).addTo(map);
//
//        // Create a Leaflet Routing Machine control
//        var control = L.Routing.control({
//          waypoints: coordinates.map(coordinate => L.latLng(coordinate[0], coordinate[1])),
//          router: new L.Routing.OSRMv1({
//            serviceUrl: 'https://router.project-osrm.org/route/v1'
//          }),
//          lineOptions: {
//            styles: [{ color: '#3388ff', opacity: 0.7, weight: 5 }]
//          }
//        }).addTo(map);
//        control.hideDetails();
//
//        // Event handler for route calculation
//        control.on('routesfound', function(e) {
//          var routes = e.routes;
//          var summary = routes[0].summary;
//        });
//      },(error) => {
//      console.log("Error getting current location: " + error.message);
//      // Display an error message to the user
//      
//    }
//    );
  </script>
</body>
</html>
