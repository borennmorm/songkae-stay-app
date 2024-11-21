import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:get/get.dart';

GoogleMap MarkOnMap(double latitude, double longitude) {
  return GoogleMap(
    onMapCreated: (GoogleMapController controller) {
      print("Map created successfully!");
    },
    initialCameraPosition: CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 15.0,
    ),
    markers: {
      Marker(
        markerId: const MarkerId('marker_1'),
        position: LatLng(latitude, longitude),
        infoWindow: const InfoWindow(title: "Selected Location"),
      ),
    },
    compassEnabled: true,
    trafficEnabled: true,
    myLocationEnabled: true,
    myLocationButtonEnabled: true,
    indoorViewEnabled: false, // Disable indoor view if not needed
    buildingsEnabled: false, // Disable buildings layer if not needed
  );
}
