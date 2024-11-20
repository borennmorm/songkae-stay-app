import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CustomSearch extends StatefulWidget {
  const CustomSearch({super.key});

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  final String _googleApiKey = "AIzaSyDuEbc_TfhcaHFzEKLeRz5rWVnIzppqPk0";
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _predictions = [];

  Future<void> _fetchSuggestions(String input) async {
    if (input.isEmpty) {
      setState(() {
        _predictions = [];
      });
      return;
    }

    final url = Uri.parse(
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$_googleApiKey&components=country:kh");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _predictions = data["predictions"];
      });
    }
  }

  Future<void> _onPlaceSelected(String placeId) async {
    final url = Uri.parse(
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$_googleApiKey");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final location = data["result"]["geometry"]["location"];
      Navigator.pop(context, location);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Search")),
      body: Column(
        children: [
          TextField(
            controller: _searchController,
            onChanged: _fetchSuggestions,
            decoration: const InputDecoration(
              hintText: "Search places...",
              prefixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _predictions.length,
              itemBuilder: (context, index) {
                final prediction = _predictions[index];
                return ListTile(
                  title: Text(prediction["description"]),
                  onTap: () => _onPlaceSelected(prediction["place_id"]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
