import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:room_rental_app/features/home/post/post_detail.dart';
import 'package:room_rental_app/shared/widgets/custom_profile.dart';
import 'package:room_rental_app/shared/widgets/custom_room_detail.dart';

import '../Map/map_on_search_home.dart';
import 'widgets/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(),
      // backgroundColor: const Color(0xFFF5F6F8),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(218, 0, 36, 82),
              Color.fromARGB(255, 230, 236, 241)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              // Section 1
              children: [
                sectionOne(),
                SizedBox(
                  height: 15,
                ),
                sectionTwo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // AppBar
  AppBar customAppbar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(218, 0, 36, 82),
      title: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2.0,
                    spreadRadius: 1.0,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: ProfileImage(
                imageUrl: 'https://i.postimg.cc/g25VYN7X/user-1.png',
                onTap: () {
                  // Handle the tap event
                  print('Profile image tapped!');
                },
              )),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Iconsax.search_normal4,
            size: 23,
            color: Colors.white,
          ),
          onPressed: () {
            Get.to(() => const MapOnSearchHome());
          },
        ),
        IconButton(
          icon: const Icon(
            Iconsax.notification,
            size: 23,
            color: Colors.white,
          ),
          onPressed: () {
            print("hello, I'm a notification!");
          },
        ),
      ],
    );
  }
}

class sectionTwo extends StatelessWidget {
  const sectionTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "More Rooms",
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
        CustomRoomCardRow(
          imageUrl: 'assets/images/room.jpg',
          title: 'Room Title',
          location: 'Battambang, Cambodia',
          rating: 4.8,
          price: '45',
          onTap: () {
            Get.to(() => const PostDetail());
            print('Card tapped');
          },
        ),
        CustomRoomCardRow(
          imageUrl: 'assets/images/room.jpg',
          title: 'Room Title',
          location: 'Battambang, Cambodia',
          rating: 4.8,
          price: '45',
          onTap: () {
            Get.to(() => const PostDetail());
            print('Card tapped');
          },
        ),
        CustomRoomCardRow(
          imageUrl: 'assets/images/room.jpg',
          title: 'Room Title',
          location: 'Battambang, Cambodia',
          rating: 4.8,
          price: '45',
          onTap: () {
            Get.to(() => const PostDetail());
            print('Card tapped');
          },
        ),
        CustomRoomCardRow(
          imageUrl: 'assets/images/room.jpg',
          title: 'Room Title',
          location: 'Battambang, Cambodia',
          rating: 4.8,
          price: '45',
          onTap: () {
            print('Card tapped');
          },
        )
      ],
    );
  }
}

class sectionOne extends StatelessWidget {
  const sectionOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "All Popular Rooms",
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),

        // Filter
        // Column
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CustomRoomCardColumn(
                imageUrl: 'assets/images/room.jpg',
                location: 'Battambang, Cambodia',
                title: 'Room Title',
                rating: 4.5,
                price: '\$50',
                onTap: () {
                  const RoomDetail(
                      images: ['assets/images/room.jpg'],
                      title: 'Room Title',
                      location: "location",
                      price: 45,
                      landlordName: "landlordName",
                      landlordImageUrl: "landlordImageUrl",
                      description: "description",
                      type: "type",
                      waterCost: "waterCost",
                      floor: "floor",
                      electricityCost: "electricityCost",
                      garbageCost: "garbageCost",
                      wifiCost: "wifiCost",
                      bedCount: 10,
                      bathroomCount: 10,
                      roomSize: "roomSize");
                },
              ),
              CustomRoomCardColumn(
                imageUrl: 'assets/images/room.jpg',
                location: 'Battambang, Cambodia',
                title: 'Room Title',
                rating: 4.5,
                price: '\$45',
                onTap: () {
                  const RoomDetail(
                      images: ['assets/images/room.jpg'],
                      title: 'Room Title',
                      location: "location",
                      price: 45,
                      landlordName: "landlordName",
                      landlordImageUrl: "landlordImageUrl",
                      description: "description",
                      type: "type",
                      waterCost: "waterCost",
                      floor: "floor",
                      electricityCost: "electricityCost",
                      garbageCost: "garbageCost",
                      wifiCost: "wifiCost",
                      bedCount: 10,
                      bathroomCount: 10,
                      roomSize: "roomSize");
                },
              ),
              CustomRoomCardColumn(
                imageUrl: 'assets/images/room.jpg',
                location: 'Battambang, Cambodia',
                title: 'Room Title',
                rating: 4.5,
                price: '\$45',
                onTap: () {
                  const RoomDetail(
                      images: ['assets/images/room.jpg'],
                      title: 'Room Title',
                      location: "location",
                      price: 45,
                      landlordName: "landlordName",
                      landlordImageUrl: "landlordImageUrl",
                      description: "description",
                      type: "type",
                      waterCost: "waterCost",
                      floor: "floor",
                      electricityCost: "electricityCost",
                      garbageCost: "garbageCost",
                      wifiCost: "wifiCost",
                      bedCount: 10,
                      bathroomCount: 10,
                      roomSize: "roomSize");
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
