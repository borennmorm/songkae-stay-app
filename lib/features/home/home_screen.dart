import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:room_rental_app/features/post/post_detail.dart';
import 'package:room_rental_app/shared/widgets/custom_profile.dart';
import 'package:room_rental_app/shared/widgets/custom_room_card_column.dart';
import 'package:room_rental_app/shared/widgets/custom_room_card_row.dart';
import 'package:room_rental_app/shared/widgets/custom_room_detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF002352),
              Colors.white,
            ],
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
      title: Row(
        children: [
          ProfileImage(
            imageUrl: 'assets/images/user_profile.jpg',
            onTap: () {
              // Handle tap
              print("Profile image clicked!");
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFF002352),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.notifications,
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
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10,
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
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10,
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
