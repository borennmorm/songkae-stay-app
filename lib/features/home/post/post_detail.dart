import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:room_rental_app/features/booking/booking_screen.dart';
import 'package:room_rental_app/shared/widgets/custom_button.dart';
import 'package:room_rental_app/shared/widgets/custom_room_feature.dart';
import 'package:room_rental_app/shared/widgets/property_infortmation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../shared/widgets/custom_mark_detail.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({super.key});

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
          Article(),
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

class Introduction extends StatelessWidget {
  const Introduction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Room for rent',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () {
            print('Tapped');
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: const Color(0xFF002352).withOpacity(0.05),
                borderRadius: BorderRadius.circular(12)),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Icon(
                    Iconsax.location5,
                    size: 15,
                    color: Color(0xFF002352),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Toulta Ek, Battambang, Cambodia',
                    style: TextStyle(
                      fontFamily: 'NotoSansKhmer',
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Iconsax.star,
                  color: Colors.amber,
                  size: 16.0,
                ),
                SizedBox(width: 4.0),
                Text(
                  '4.5',
                  style: TextStyle(
                    fontSize: 17.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '\$45',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' | month',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class LandlordProfile extends StatelessWidget {
  const LandlordProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF002352).withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              // Landlord Profile
              CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSrmQwyTD9QQbp9EptXwQgQkwFvtVpCQcgyIk4l8324UQfDMXi6EMz06UmXHbEmLMYS8g&usqp=CAU',
                ),
              ),
              SizedBox(width: 10),
              // Landlord Name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Will Smith',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF002352),
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  Text(
                    'Owner',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF002352),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Contact
          Row(
            children: [
              // Call
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF002352).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.call, // Use Iconsax call icon
                    color: Color(0xFF002352),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Message
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF002352).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.message, // Use Iconsax message icon
                    color: Color(0xFF002352),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF002352),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        ExpandableText(
          text:
              "This spacious room is filled with natural light and features a comfortable queen-sized bed, a large wardrobe for storage, and a private en-suite bathroom.",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

class ExpandableText extends StatefulWidget {
  final String text;
  final TextStyle? style;

  const ExpandableText({
    super.key,
    required this.text,
    this.style,
  });

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    const int textLimit = 100;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isExpanded
              ? widget.text
              : '${widget.text.substring(0, textLimit)}...',
          style: widget.style,
          textAlign: TextAlign.justify,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            isExpanded ? 'Show Less' : 'Show More',
            style: TextStyle(
              fontSize: widget.style?.fontSize ?? 12,
              color: const Color(0xFF002352),
            ),
          ),
        ),
      ],
    );
  }
}

class BackIcon extends StatelessWidget {
  const BackIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40.0,
      left: 10.0,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 35,
          height: 35,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFF002352).withOpacity(0.3),
            shape: BoxShape.rectangle,
          ),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class DotImageCounter extends StatelessWidget {
  const DotImageCounter({
    super.key,
    required this.screenHeight,
    required this.pageController,
    required this.images,
  });

  final double screenHeight;
  final PageController pageController;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: screenHeight * 0.35,
      left: 0,
      right: 0,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF002352).withOpacity(0.3),
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
    );
  }
}

class ImageSlide extends StatelessWidget {
  const ImageSlide({
    super.key,
    required this.screenHeight,
    required this.pageController,
    required this.images,
  });

  final double screenHeight;
  final PageController pageController;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.4,
      child: PageView.builder(
        controller: pageController,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to full-screen image view with zoom
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenImageView(
                    images: images,
                    initialIndex: index,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(images[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FullScreenImageView extends StatelessWidget {
  const FullScreenImageView({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  final List<String> images;
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: AssetImage(images[index]),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        itemCount: images.length,
        pageController: PageController(initialPage: initialIndex),
        onPageChanged: (index) {},
        backgroundDecoration: const BoxDecoration(
          color: Colors.black,
        ),
      ),
    );
  }
}
