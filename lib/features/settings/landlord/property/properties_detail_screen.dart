import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'property_detail_controller.dart';

class PropertyDetailScreen extends StatelessWidget {
  PropertyDetailScreen({super.key});

  final PropertyDetailController controller =
      Get.put(PropertyDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F6F8),
        title: const Row(
          children: [
            Text(
              '',
              style: TextStyle(
                fontSize: 18,
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
      body: const Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PropertyDetails(),
            ],
          ),
        ),
      ),
    );
  }
}

class AddImages extends StatelessWidget {
  const AddImages({
    super.key,
    required this.controller,
  });

  final PropertyDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GridView.builder(
        physics: const NeverScrollableScrollPhysics(), // Prevent scroll inside
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 images in a row
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: controller.images.length + 1,
        itemBuilder: (context, index) {
          if (index < controller.images.length) {
            // Display added images with delete button
            return Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[200], // Background color for image
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/image_1.jpg', // Replace with real image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: () {
                      controller.removeImage(index);
                    },
                    child: const Icon(
                      Iconsax.trash,
                      size: 20,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ],
            );
          } else {
            // Display the add icon container
            return GestureDetector(
              onTap: controller.addImage,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.06),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Icon(
                  Iconsax.add,
                  color: Colors.grey[500],
                  size: 30,
                ),
              ),
            );
          }
        },
      );
    });
  }
}

class PropertyDetails extends StatelessWidget {
  const PropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Property Title',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        const Row(
          children: [
            Icon(Iconsax.location, size: 16, color: Colors.grey),
            SizedBox(width: 5),
            Text('Battambang', style: TextStyle(fontSize: 14)),
          ],
        ),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Price: \$50 /month', style: TextStyle(fontSize: 14)),
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: Text('Bed: 01', style: TextStyle(fontSize: 14)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Bathroom: 01', style: TextStyle(fontSize: 14)),
            Text('Size: 5 x 6m', style: TextStyle(fontSize: 14)),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          'Description:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'This spacious room is filled with natural light and features a comfortable queen-sized bed, a large wardrobe for storage, and a private en-suite bathroom.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 14),
          ),
        ),
        const Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        const SizedBox(height: 10),
        const Text(
          'Basic Info:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        buildBasicInfoRow('Electricity:', '1500៛ /kwh'),
        buildBasicInfoRow('Water:', '700៛ /m3'),
        buildBasicInfoRow('Garbage:', 'Free'),
        buildBasicInfoRow('Wifi:', '4000៛ /month'),
        const SizedBox(height: 20),
        const Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        const Text(
          'Contact:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        buildContactRow('Phone:', '091284723'),
        buildContactRow('Telegram:', '@borin_more'),
      ],
    );
  }

  Widget buildBasicInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 14)),
          Text(value, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget buildContactRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 14)),
          Text(value, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
