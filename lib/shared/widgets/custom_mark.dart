import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';

MarkerWidget(BuildContext context, double latitude, double longitude, String name) {
  return MarkerLayer(
    markers: [
      Marker(
        point: LatLng(latitude, longitude),
        width: 80,
        height: 80,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                _showMarkerInfo(context, name);
              },
              icon: const Icon(
                Icons.location_on,
                size: 30,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

void _showMarkerInfo(BuildContext context, String name) {
  final screenHeight = MediaQuery.of(context).size.height;
  final List<String> images = [
    'assets/images/image_1.jpg',
    'assets/images/image_1.jpg',
    'assets/images/image_1.jpg',
  ];
  final PageController pageController = PageController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        height: screenHeight * 0.5,
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Name: $name',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 3, 31, 72),
                  ),
                  onPressed: () {
                    // Get.to(() => const RoomDetail());
                  },
                  child: const Text(
                    'Show Details',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: screenHeight * 0.3,
              child: PageView.builder(
                controller: pageController,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(images[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'More info about the marker can go here...',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      );
    },
  );
}
