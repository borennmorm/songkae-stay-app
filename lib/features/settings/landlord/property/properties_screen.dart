import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'add_property.dart';
import 'properties_detail_screen.dart';

class PropertyScreen extends StatelessWidget {
  const PropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data to simulate properties
    final List<Map<String, dynamic>> properties = List.generate(
      2, // Number of properties
      (index) => {
        "name": "Property ${index + 1}",
        "rooms": 25 + index,
        "location": "Battambang, Cambodia",
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F6F8),
        title: Row(
          children: [
            const Text(
              'Properties',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 8),
            // Property counter dynamically showing the number of properties
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFF002352).withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: Text(
                properties.length.toString(), // Dynamic counter
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        centerTitle: false,
        automaticallyImplyLeading: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF002352).withOpacity(0.3),
              shape: BoxShape.rectangle,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xFF002352),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF5F6F8),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to AddPropertyScreen()
          Get.to(() => const AddProperty());
        },
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        elevation: 3,
        child: const Icon(
          Iconsax.add,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView.builder(
          itemCount: properties.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: PropertyCard(
                property: properties[index],
                number: index + 1,
              ),
            );
          },
        ),
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final Map<String, dynamic> property;
  final int number;

  const PropertyCard({
    super.key,
    required this.property,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => PropertyDetailScreen());
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.06),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Fixed color for the property icon
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFF002352).withOpacity(0.3),
              ),
              child: Center(
                child: Text(
                  number.toString().padLeft(2, '0'), // Display property number
                  style: const TextStyle(
                    color: Color(0xFF002352),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    property['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Iconsax.home,
                        size: 13,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Rooms: ${property['rooms']}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Iconsax.location,
                        size: 13,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          property['location'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
