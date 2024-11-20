import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapViews extends StatefulWidget {
  @override
  _MapViewsState createState() => _MapViewsState();
}

class _MapViewsState extends State<MapViews> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(13.084130, 103.218931);

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
  }
  

  Future<void> requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print("Location permission granted.");
    } else if (status.isDenied || status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    print("Map created successfully!");
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Google Map Example'),
          backgroundColor: Colors.blue,
        ),
        body: GoogleMap(
          cloudMapId: "cdaff65de0b970d6",
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          compassEnabled: true,
          trafficEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          indoorViewEnabled: false, // Disable indoor view if not needed
          buildingsEnabled: false, // Disable buildings layer if not needed
        ));
  }
}
