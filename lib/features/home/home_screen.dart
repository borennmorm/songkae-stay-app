import 'package:flutter/material.dart';
import 'package:room_rental_app/shared/widgets/custom_profile.dart';
import 'package:room_rental_app/shared/widgets/custom_room_card_column.dart';
import 'package:room_rental_app/shared/widgets/custom_room_card_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
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
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
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
          "All Popular Rooms",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
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
                  print('Card tapped');
                },
              ),
              CustomRoomCardColumn(
                imageUrl: 'assets/images/room.jpg',
                location: 'Battambang, Cambodia',
                title: 'Room Title',
                rating: 4.5,
                price: '\$45',
                onTap: () {
                  print('Card tapped');
                },
              ),
              CustomRoomCardColumn(
                imageUrl: 'assets/images/room.jpg',
                location: 'Battambang, Cambodia',
                title: 'Room Title',
                rating: 4.5,
                price: '\$45',
                onTap: () {
                  print('Card tapped');
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
