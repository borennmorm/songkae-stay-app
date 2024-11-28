import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:flutter_google_places_hoc081098/google_maps_webservice_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class MapOnSearchHome extends StatefulWidget {
  const MapOnSearchHome({super.key});

  @override
  State<MapOnSearchHome> createState() => _MapOnSearchHomeState();
}

class _MapOnSearchHomeState extends State<MapOnSearchHome> {
  late GoogleMapController mapController;

  final Set<Marker> _markers = {};
  final LatLng _center = const LatLng(13.084130, 103.218931);
  final String _googleApiKey = "AIzaSyDuEbc_TfhcaHFzEKLeRz5rWVnIzppqPk0";

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
    _initializeMarkers();
  }

  void _initializeMarkers() {
    _markers.add(const Marker(
      markerId: MarkerId("1"),
      position: LatLng(13.084130, 103.218931),
      infoWindow: InfoWindow(title: "Marker 1"),
    ));
    _markers.add(const Marker(
      markerId: MarkerId("2"),
      position: LatLng(13.084546, 103.218736),
      infoWindow: InfoWindow(title: "Marker 2"),
    ));
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
    mapController = controller;
  }

  Future<void> _searchPlace() async {
    print("Searching");
    final Prediction? prediction = await PlacesAutocomplete.show(
      context: context,
      apiKey: _googleApiKey,
      mode: Mode.overlay, // Options: fullscreen, overlay
      language: "en",
      components: [Component(Component.country, "kh")], // Limit to Cambodia
    );

    if (prediction != null) {
      final url = Uri.parse(
          "https://maps.googleapis.com/maps/api/place/details/json?place_id=${prediction.placeId}&key=$_googleApiKey");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final location = data['result']['geometry']['location'];
        final latLng = LatLng(location['lat'], location['lng']);

        // Update map and markers
        mapController.animateCamera(CameraUpdate.newLatLngZoom(latLng, 14.0));
        setState(() {
          _markers.add(Marker(
            markerId: MarkerId(prediction.placeId!),
            position: latLng,
            infoWindow: InfoWindow(title: prediction.description),
          ));
        });
      } else {
        print("Failed to fetch place details.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for places",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onTap: _searchPlace,
              ),
            ),
            Expanded(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
                markers: _markers,
                compassEnabled: true,
                trafficEnabled: true,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                indoorViewEnabled: true,
                buildingsEnabled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
