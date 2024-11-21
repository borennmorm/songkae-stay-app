import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'properties_detail_screen.dart';

class PropertyScreen extends StatelessWidget {
  const PropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFF002352).withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: const Text(
                '1',
                style: TextStyle(
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
        actions: [
          IconButton(
            icon: const Icon(
              Iconsax.notification,
              size: 23,
              color: Color(0xFF002352),
            ),
            onPressed: () {
              print("hello, I'm a notification!");
            },
          ),
        ],
      ),

      backgroundColor: const Color(0xFFF5F6F8),

      // Floating Button for Add new property
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.to(() => AddPropertyScreen());
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
          itemCount: 1,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 10),
              // property card
              child: PropertyCard(),
            );
          },
        ),
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  const PropertyCard({
    super.key,
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
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: Image.asset(
                'assets/images/property.png',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      'Property Name',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Iconsax.home,
                        size: 13,
                        color: Colors.black,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Rooms: 25',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Iconsax.location,
                        size: 13,
                        color: Colors.black,
                      ),
                      SizedBox(width: 5),
                      SizedBox(
                        width: 200,
                        child: Text(
                          'Battambang, Cambodia',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
