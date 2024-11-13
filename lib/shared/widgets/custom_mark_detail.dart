import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class MarkerInfo extends StatelessWidget {
  final String name;
  final List<String> images;

  const MarkerInfo({
    super.key,
    required this.name,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final PageController pageController = PageController();

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
                'ឈ្មោះ: $name', // "Name" in Khmer
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
                  'បង្ហាញព័ត៌មាន', // "Show Details" in Khmer
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
            'ព័ត៌មានបន្ថែមអំពីសញ្ញាអាចមាននៅទីនេះ...', // "More info about the marker can go here..." in Khmer
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
