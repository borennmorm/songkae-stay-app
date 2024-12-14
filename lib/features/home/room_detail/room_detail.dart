import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:room_rental_app/features/booking/booking_screen.dart';
import 'package:room_rental_app/shared/widgets/custom_button.dart';

/// Main screen for displaying room details
class RoomDetail extends StatelessWidget {
  const RoomDetail({super.key});

  // Demo images for the gallery
  static const List<String> _demoImages = [
    'assets/images/room.jpg',
    'assets/images/room.jpg',
    'assets/images/room.jpg',
    'assets/images/room.jpg',
    'assets/images/room.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Stack(
        children: [
          _ImageGallery(
            images: _demoImages,
            onImageBrightnessChanged: (isDark) {
              SystemChrome.setSystemUIOverlayStyle(
                isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
              );
            },
          ),
          const _ContentSheet(),
          // Book Now Button - Always visible at bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: FullWidthButton(
                  onPressed: () => Get.to(() => const BookingScreen()),
                  text: 'Book Now',
                  color: const Color(0xFF002352),
                  textColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Image gallery with page view and indicators
class _ImageGallery extends StatelessWidget {
  const _ImageGallery({
    required this.images,
    required this.onImageBrightnessChanged,
  });

  final List<String> images;
  final Function(bool isDark) onImageBrightnessChanged;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final pageController = PageController();

    return Stack(
      children: [
        // Image Slider with brightness detection
        SizedBox(
          height: screenHeight * 0.4,
          child: PageView.builder(
            controller: pageController,
            itemCount: images.length,
            onPageChanged: (index) {
              // Analyze image brightness when page changes
              _analyzeImageBrightness(context, images[index]);
            },
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => _showFullScreenGallery(context, index),
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Colors.transparent,
                  BlendMode.multiply,
                ),
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                  frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                    if (frame == null) return child;
                    if (wasSynchronouslyLoaded) {
                      _analyzeImageBrightness(context, images[index]);
                    }
                    return child;
                  },
                ),
              ),
            ),
          ),
        ),

        // Page Indicator
        Positioned(
          top: screenHeight * 0.35,
          left: 0,
          right: 0,
          child: Container(
            height: 50,
            color: Colors.black26,
            alignment: Alignment.center,
            child: SmoothPageIndicator(
              controller: pageController,
              count: images.length,
              effect: ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: Colors.white,
                dotColor: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
        ),

        // Back Button
        const Positioned(
          top: 40,
          left: 10,
          child: _BackButton(),
        ),
      ],
    );
  }

  Future<void> _analyzeImageBrightness(BuildContext context, String imagePath) async {
    try {
      final imageProvider = AssetImage(imagePath);
      final imageStream = imageProvider.resolve(ImageConfiguration.empty);
      final completer = Completer<bool>();

      imageStream.addListener(
        ImageStreamListener((info, _) async {
          final bytes = await info.image.toByteData(format: ImageByteFormat.rawRgba);
          if (bytes == null) return;

          int totalBrightness = 0;
          for (int i = 0; i < bytes.lengthInBytes; i += 4) {
            final r = bytes.getUint8(i);
            final g = bytes.getUint8(i + 1);
            final b = bytes.getUint8(i + 2);
            totalBrightness += ((r + g + b) / 3).round();
          }

          final averageBrightness = totalBrightness / (bytes.lengthInBytes / 4);
          final isDark = averageBrightness < 128;
          
          if (!completer.isCompleted) {
            completer.complete(isDark);
            onImageBrightnessChanged(isDark);
          }
        }),
      );

      await completer.future;
    } catch (e) {
      debugPrint('Error analyzing image brightness: $e');
    }
  }

  void _showFullScreenGallery(BuildContext context, int initialIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _FullScreenGallery(
          images: images,
          initialIndex: initialIndex,
        ),
      ),
    );
  }
}

/// Back button with transparent background
class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Get.back(),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
    );
  }
}

/// Main content sheet with room details
class _ContentSheet extends StatelessWidget {
  const _ContentSheet();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.6,
      maxChildSize: 1.0,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 80), // Added bottom padding for button
            children: const [
              _RoomHeader(),
              SizedBox(height: 16),
              _LandlordInfo(),
              SizedBox(height: 16),
              _RoomFeatures(),
              SizedBox(height: 16),
              _Description(),
              SizedBox(height: 16),
              _PropertyInfo(),
            ],
          ),
        );
      },
    );
  }
}

/// Location chip showing the property address
class _RoomHeader extends StatelessWidget {
  const _RoomHeader();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Room for rent',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        _LocationChip(),
        SizedBox(height: 16),
        _PriceAndRating(),
      ],
    );
  }
}

// Location chip
class _LocationChip extends StatelessWidget {
  const _LocationChip();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xFF002352).withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2),
            child: Icon(
              Iconsax.location5,
              size: 15,
              color: Color(0xFF002352),
            ),
          ),
          SizedBox(width: 5),
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
    );
  }
}

/// Price and rating row
class _PriceAndRating extends StatelessWidget {
  const _PriceAndRating();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Row(
          children: [
            Icon(
              Iconsax.star,
              color: Colors.amber,
              size: 16,
            ),
            SizedBox(width: 4),
            Text(
              '4.5',
              style: TextStyle(fontSize: 17),
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
    );
  }
}

/// Landlord information card with contact button
class _LandlordInfo extends StatelessWidget {
  const _LandlordInfo();

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
          // Landlord Profile Section
          const Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSrmQwyTD9QQbp9EptXwQgQkwFvtVpCQcgyIk4l8324UQfDMXi6EMz06UmXHbEmLMYS8g&usqp=CAU',
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Property Owner',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Contact Buttons
          Row(
            children: [
              // Phone Button
              InkWell(
                onTap: () {
                  // Add phone call functionality
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFF002352),
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Iconsax.call,
                    color: Color(0xFF002352),
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Telegram Button
              InkWell(
                onTap: () {
                  // Add telegram functionality
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFF002352),
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Iconsax.message,
                    color: Color(0xFF002352),
                    size: 20,
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

/// Room features section with amenities
class _RoomFeatures extends StatelessWidget {
  const _RoomFeatures();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Room Features',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        // Feature items wrapped in a grid
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _FeatureItem(icon: Iconsax.wifi, text: 'Free Wifi'),
            _FeatureItem(icon: Icons.air, text: 'AC'),
            _FeatureItem(icon: Iconsax.box, text: 'Furniture'),
            _FeatureItem(icon: Icons.park, text: 'Parking'),
          ],
        ),
      ],
    );
  }
}

/// Individual feature item with icon and text
class _FeatureItem extends StatelessWidget {
  const _FeatureItem({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF002352).withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: const Color(0xFF002352)),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

/// Room description section
class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Description',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

/// Property information section
class _PropertyInfo extends StatelessWidget {
  const _PropertyInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Property Information',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        // Add property information content here
      ],
    );
  }
}

/// Full screen gallery view
class _FullScreenGallery extends StatelessWidget {
  const _FullScreenGallery({
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
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: PhotoViewGallery.builder(
        itemCount: images.length,
        builder: (_, index) => PhotoViewGalleryPageOptions(
          imageProvider: AssetImage(images[index]),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 2,
        ),
        pageController: PageController(initialPage: initialIndex),
        backgroundDecoration: const BoxDecoration(color: Colors.black),
      ),
    );
  }
}
