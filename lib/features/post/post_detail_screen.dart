import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
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
    final MapController mapController = MapController();
    
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
        ],
      ),
    );
  }
}