import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class RoomManagementScreen extends StatelessWidget {
  final List<Map<String, dynamic>> rooms = [
    {'roomNumber': '01', 'isFree': false},
    {'roomNumber': '02', 'isFree': true},
    {'roomNumber': '03', 'isFree': false},
    {'roomNumber': '04', 'isFree': true},
    {'roomNumber': '05', 'isFree': false},
    {'roomNumber': '06', 'isFree': true},
    {'roomNumber': '07', 'isFree': false},
    {'roomNumber': '08', 'isFree': true},
    {'roomNumber': '09', 'isFree': false},
    {'roomNumber': '10', 'isFree': true},
    {'roomNumber': '11', 'isFree': false},
    {'roomNumber': '12', 'isFree': true},
    {'roomNumber': '13', 'isFree': false},
    {'roomNumber': '14', 'isFree': true},
    {'roomNumber': '15', 'isFree': false},
    {'roomNumber': '16', 'isFree': true},
    {'roomNumber': '17', 'isFree': false},
    {'roomNumber': '18', 'isFree': true},
    {'roomNumber': '19', 'isFree': false},
    {'roomNumber': '20', 'isFree': true},
    {'roomNumber': '21', 'isFree': false},
    {'roomNumber': '22', 'isFree': true},
    {'roomNumber': '23', 'isFree': false},
    {'roomNumber': '24', 'isFree': true},
    {'roomNumber': '25', 'isFree': false},
  ];

  RoomManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Text(
                'Property Name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  '25',
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
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Iconsax.arrow_left_2,
              size: 30,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.notification,
                size: 25,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey[200],
        // Floating Button for Add new property
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Get.to(() => const AddRoomScreen());
          },
          backgroundColor: Colors.white,
          elevation: 3,
          child: const Icon(
            Iconsax.add,
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const PropertyOverview(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio:
                          0.8, // Adjust the aspect ratio for the card height
                    ),
                    itemCount: rooms.length,
                    itemBuilder: (context, index) {
                      final room = rooms[index];
                      return RoomCards(
                        roomNumber: room['roomNumber'],
                        isFree: room['isFree'],
                        onTap: () {
                          // Handle tap on room card
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class RoomCards extends StatelessWidget {
  final Function()? onTap;
  final String roomNumber;
  final bool isFree;

  const RoomCards({
    super.key,
    this.onTap,
    required this.roomNumber,
    required this.isFree,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            width: 50,
            height: 55,
            decoration: BoxDecoration(
              color: isFree
                  ? Colors.grey.withOpacity(0.25)
                  : Theme.of(context).primaryColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.bed_double,
                  size: 24,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Positioned(
            top: 45,
            right: 0,
            left: 0,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  roomNumber,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PropertyOverview extends StatelessWidget {
  const PropertyOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: Image.asset(
                'assets/images/property.jpg',
                width: 100,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Property Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Iconsax.location,
                        size: 15,
                        color: Colors.black,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Battambang',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 45,
                    height: 33,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.edit,
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
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
