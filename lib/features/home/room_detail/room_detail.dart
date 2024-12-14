import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_rental_app/features/booking/booking_screen.dart';
import 'package:room_rental_app/shared/widgets/custom_button.dart';
import 'package:room_rental_app/shared/widgets/custom_room_feature.dart';
import 'package:room_rental_app/shared/widgets/property_infortmation.dart';
import 'widget.dart';

class RoomDetail extends StatelessWidget {
  const RoomDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    // Sample list of images
    final List<String> images = [
      'assets/images/room.jpg',
      'assets/images/room.jpg',
      'assets/images/room.jpg',
      'assets/images/room.jpg',
      'assets/images/room.jpg',
    ];

    final PageController pageController = PageController();

    return Scaffold(
      body: Stack(
        children: [
          // Sliding Images with Indicator on Top
          ImageSlide(
              screenHeight: screenHeight,
              pageController: pageController,
              images: images),
          // Dot Indicator (Positioned over the image)
          DotImageCounter(
              screenHeight: screenHeight,
              pageController: pageController,
              images: images),
          // Back Icon (Positioned)
          const BackIcon(),
          // Draggable Scrollable Sheet
          const Article(),
        ],
      ),
    );
  }
}

class Article extends StatelessWidget {
  const Article({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.60,
      minChildSize: 0.60,
      maxChildSize: 1.0,
      builder: (BuildContext context, ScrollController scrollController) {
        return AnimatedBuilder(
          animation: scrollController,
          builder: (context, child) {
            return Container(
              color: Colors.white,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Introduction(),
                      const SizedBox(height: 10),
                      const LandlordProfile(),
                      const SizedBox(height: 5),
                      const RoomFeature(),
                      const Description(),
                      const PropertyInfortmation(),
                      // Location
                      const SizedBox(height: 10),
                      FullWidthButton(
                        onPressed: () {
                          Get.to(() => const BookingScreen());
                        },
                        text: 'Book Now',
                        color: const Color(0xFF002352),
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
