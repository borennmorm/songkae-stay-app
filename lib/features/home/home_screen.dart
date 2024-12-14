import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:room_rental_app/features/home/room_detail/room_detail.dart';
import 'package:room_rental_app/features/notification/notification_screen.dart';
import '../Map/map_on_search_home.dart';
import 'widgets/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SectionOne(
              title: "All Popular Rooms",
              fetchData: _fetchPopularRooms,
            ),
            const SizedBox(height: 15),
            SectionTwo(
              title: "More Rooms",
              fetchData: _fetchMoreRooms,
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: ClipRRect(
        child: SvgPicture.asset(
          'assets/images/logo_blue.svg',
          width: 35,
          height: 35,
          colorFilter: const ColorFilter.mode(Color(0xFF002352), BlendMode.srcIn),
        ),
      ),
      
      actions: [
        IconButton(
          icon:
              const Icon(Iconsax.search_normal4, size: 23,),
          onPressed: () {
            Get.to(() => const MapOnSearchHome());
          },
        ),
        Stack(
          clipBehavior: Clip
              .none, // Ensure the badge overflows outside the icon if needed
          children: [
            IconButton(
              icon: const Icon(Iconsax.notification,
                  size: 23,),
              onPressed: () {
                print("Notification tapped!");
                Get.to(() => const NotificationScreen());
              },
            ),
            Positioned(
              right: 6,
              top: 6,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  '0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Backend-ready function to fetch popular rooms
  Future<List<Map<String, dynamic>>> _fetchPopularRooms() async {
    // Replace with actual backend call
    return List.generate(
      5,
      (index) => {
        "imageUrl": 'assets/images/room.jpg',
        "location": 'Battambang, Cambodia',
        "title": 'Room Title $index',
        "price": '\$50',
      },
    );
  }

  // Backend-ready function to fetch more rooms
  Future<List<Map<String, dynamic>>> _fetchMoreRooms() async {
    // Replace with actual backend call
    return List.generate(
      5,
      (index) => {
        "imageUrl": 'assets/images/room.jpg',
        "location": 'Siem Reap, Cambodia',
        "title": 'Room Title $index',
        "price": '45',
      },
    );
  }
}

class SectionOne extends StatelessWidget {
  final String title;
  final Future<List<Map<String, dynamic>>> Function() fetchData;

  const SectionOne({
    required this.title,
    required this.fetchData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text("Error fetching data."));
        }

        final data = snapshot.data ?? [];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                title,
                style: const TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                padding: const EdgeInsets.only(left: 5),
                itemBuilder: (context, index) {
                  final room = data[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: CustomRoomCardColumn(
                      imageUrl: room['imageUrl'],
                      location: room['location'],
                      title: room['title'],
                      price: room['price'],
                      onTap: () {
                        Get.to(() => const RoomDetail());
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class SectionTwo extends StatelessWidget {
  final String title;
  final Future<List<Map<String, dynamic>>> Function() fetchData;

  const SectionTwo({
    required this.title,
    required this.fetchData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text("Error fetching data."));
        }

        final data = snapshot.data ?? [];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                title,
                style: const TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              padding: const EdgeInsets.symmetric(horizontal: 6),
              itemBuilder: (context, index) {
                final room = data[index];
                return CustomRoomCardRow(
                  imageUrl: room['imageUrl'],
                  title: room['title'],
                  location: room['location'],
                  price: room['price'],
                  onTap: () {
                    Get.to(() => const RoomDetail());
                  },
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        );
      },
    );
  }
}