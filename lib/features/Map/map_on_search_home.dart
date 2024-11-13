import 'package:flutter/material.dart';

import '../../shared/widgets/custom_google_map.dart';

class MapOnSearchHome extends StatefulWidget {
  const MapOnSearchHome({super.key});

  @override
  State<MapOnSearchHome> createState() => _MapOnSearchHomeState();
}

class _MapOnSearchHomeState extends State<MapOnSearchHome> {
  @override
  Widget build(BuildContext context) {
    return MapViews();
  }
}
