import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

import '../../shared/widgets/custom_mark.dart';
import '../../shared/widgets/custom_search_bar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController mapController = MapController();
  final TextEditingController searchController = TextEditingController();
  List<dynamic> suggestions = [];
  final String apiUrl = 'https://nominatim.openstreetmap.org/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: const LatLng(13.090204, 103.208514),
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              ),
              MarkerWidget(context, 13.084130, 103.218931, "Marker 1"),
              MarkerWidget(context, 13.084546, 103.218736, "Marker 2"),
              MarkerWidget(context, 13.0855686, 103.2158628, "Marker 3"),
              MarkerWidget(context, 13.099420, 103.210100, "Marker 4"),
            ],
          ),
          Positioned(
            top: 40,
            left: 10,
            right: 10,
            child: SearchBars(
              controller: searchController,
              onSearch: _searchLocation,
              onTextChanged: (value) {
                if (value.isNotEmpty) {
                  _fetchSuggestions(value);
                } else {
                  setState(() {
                    suggestions.clear();
                  });
                }
              },
            ),
          ),
          if (suggestions.isNotEmpty)
            Positioned(
              top: 90,
              left: 10,
              right: 10,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: suggestions.length,
                itemBuilder: (context, index) {
                  final place = suggestions[index];
                  return ListTile(
                    title: Text(
                      place['display_name'],
                      style: const TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      _searchLocation(place['display_name']);
                      setState(() {
                        suggestions.clear();
                      });
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _fetchSuggestions(String query) async {
    final url =
        '$apiUrl?q=$query&format=json&addressdetails=1&limit=5&accept-language=km';
    try {
      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body);

      setState(() {
        suggestions = data;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('ការស្វែងរកទីតាំងមានបញ្ហា!')), // Error in Khmer
      );
    }
  }

  void _searchLocation(String query) async {
    final url = '$apiUrl?q=$query&format=json&limit=1&accept-language=km';
    try {
      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body);
      if (data.isNotEmpty) {
        final location = data.first;
        mapController.move(
          LatLng(double.parse(location['lat']), double.parse(location['lon'])),
          13.0,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('មិនមានលទ្ធផល!')), // No results in Khmer
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text('កំហុសក្នុងការស្វែងរកទីតាំង!')), // Search error in Khmer
      );
    }
  }
}
