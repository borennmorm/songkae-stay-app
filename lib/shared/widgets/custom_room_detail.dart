import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:room_rental_app/shared/widgets/custom_map_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'custom_button.dart';

class RoomDetail extends StatelessWidget {
  final List<String> images;
  final String title;
  final String location;
  final double price;
  final String landlordName;
  final String landlordImageUrl;
  final String description;
  final String type;
  final String waterCost;
  final String floor;
  final String electricityCost;
  final String garbageCost;
  final String wifiCost;
  final int bedCount;
  final int bathroomCount;
  final String roomSize;

  const RoomDetail({
    Key? key,
    required this.images,
    required this.title,
    required this.location,
    required this.price,
    required this.landlordName,
    required this.landlordImageUrl,
    required this.description,
    required this.type,
    required this.waterCost,
    required this.floor,
    required this.electricityCost,
    required this.garbageCost,
    required this.wifiCost,
    required this.bedCount,
    required this.bathroomCount,
    required this.roomSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final PageController pageController = PageController();

    return Scaffold(
      body: Stack(
        children: [
          // Sliding Images with Indicator on Top
          SizedBox(
            height: screenHeight * 0.4,
            child: PageView.builder(
              controller: pageController,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          // Dot Indicator (Positioned over the image)
          Positioned(
            top: screenHeight * 0.3,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: images.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 8.0,
                      dotWidth: 8.0,
                      activeDotColor: Colors.white,
                      dotColor: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Back Icon (Positioned)
          Positioned(
            top: 40.0,
            left: 10.0,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: IconButton(
                icon:
                    const Icon(Icons.arrow_back, size: 30, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          // Draggable Scrollable Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.65,
            maxChildSize: 1.0,
            builder: (BuildContext context, ScrollController scrollController) {
              return ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(
                                CupertinoIcons.location_solid,
                                size: 18,
                                color: Colors.red,
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  location,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: List.generate(5, (index) {
                                  return const Icon(
                                    CupertinoIcons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  );
                                }),
                              ),
                              Column(
                                children: [
                                  Text(
                                    '\$$price',
                                    style: const TextStyle(
                                      fontSize: 30,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    'per month',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Divider(color: Colors.grey.withOpacity(0.4)),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(landlordImageUrl),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    landlordName,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    'Owner',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  )
                                ],
                              ),
                              Spacer(),
                              IconButton(
                                icon: Icon(CupertinoIcons.phone_fill,
                                    color: Theme.of(context).primaryColor),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(CupertinoIcons.chat_bubble_text_fill,
                                    color: Theme.of(context).primaryColor),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          Divider(color: Colors.grey.withOpacity(0.4)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const Text("Bed",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                    Text('$bedCount',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text("Bathroom",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                    Text('$bathroomCount',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text("Size",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                    Text(roomSize,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(color: Colors.grey.withOpacity(0.4)),
                          const Text("Description",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 5),
                          Text(description,
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[600]),
                              textAlign: TextAlign.justify),
                          Divider(color: Colors.grey.withOpacity(0.4)),
                          const Text("Basic Information",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BasicInfoComponent(
                                          icon: Icons.home,
                                          labelText: 'Type',
                                          valueText: type),
                                      BasicInfoComponent(
                                          icon: Icons.water_drop,
                                          labelText: 'Water',
                                          valueText: waterCost),
                                      BasicInfoComponent(
                                          icon: Icons.stairs_outlined,
                                          labelText: 'Floor',
                                          valueText: floor),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BasicInfoComponent(
                                          icon: CupertinoIcons.bolt,
                                          labelText: 'Electricity',
                                          valueText: electricityCost),
                                      BasicInfoComponent(
                                          icon: CupertinoIcons.trash,
                                          labelText: 'Garbage',
                                          valueText: garbageCost),
                                      BasicInfoComponent(
                                          icon: CupertinoIcons.wifi,
                                          labelText: 'Wifi',
                                          valueText: wifiCost),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          MapView(
                            mapController: MapController(),
                            markers: [],
                          ),
                          Divider(color: Colors.grey.withOpacity(0.4)),
                          const Text("Location",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          FullWidthButton(
                            onPressed: () {
                              // Get.to(() => const BookingUrDate());
                            },
                            text: 'Book Now',
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BasicInfoComponent extends StatelessWidget {
  final IconData icon;
  final String labelText;
  final String valueText;

  const BasicInfoComponent({
    super.key,
    required this.icon,
    required this.labelText,
    required this.valueText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 25,
            color: Colors.grey[500],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                labelText,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(valueText)
            ],
          )
        ],
      ),
    );
  }
}
