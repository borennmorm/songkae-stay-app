import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:room_rental_app/features/home/room_detail/room_detail.dart';
import 'package:room_rental_app/features/notification/notification_screen.dart';
import '../Map/map_on_search_home.dart';
import 'widgets/home_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

final List<String> bannerImages = [
  'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267',
  'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2',
  'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af',
  'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688',
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.grey[100],
      body: const _HomeBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: _buildLogo(),
      actions: _buildAppBarActions(),
    );
  }

  Widget _buildLogo() {
    return ClipRRect(
      child: SvgPicture.asset(
        'assets/images/logo_blue.svg',
        width: 35,
        height: 35,
        colorFilter: const ColorFilter.mode(Color(0xFF002352), BlendMode.srcIn),
      ),
    );
  }

  List<Widget> _buildAppBarActions() {
    return [
      IconButton(
        icon: const Icon(Iconsax.search_normal4, size: 23),
        onPressed: () => Get.to(() => const MapOnSearchHome()),
      ),
      _buildNotificationButton(),
    ];
  }

  Widget _buildNotificationButton() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          icon: const Icon(Iconsax.notification, size: 23),
          onPressed: () => Get.to(() => const NotificationScreen()),
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
    );
  }
}

class _HomeBody extends StatefulWidget {
  const _HomeBody();

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> {
  final RefreshController _refreshController = RefreshController();
  bool _showAllCards = false;

  Future<void> _onRefresh() async {
    // Simulate refresh delay
    await Future.delayed(const Duration(milliseconds: 1500));
    _refreshController.refreshCompleted();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      header: const WaterDropHeader(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _BannerSlider(),
            const SectionOne(
              title: "All Popular Rooms",
              fetchData: _fetchPopularRooms,
            ),
            SectionTwo(
              title: "More Rooms",
              fetchData: _fetchMoreRooms,
              showAllCards: _showAllCards,
              onSeeMorePressed: () {
                setState(() {
                  _showAllCards = true;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _BannerSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: CarouselSlider.builder(
        itemCount: bannerImages.length,
        options: CarouselOptions(
          height: 180,
          viewportFraction: 0.93,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        itemBuilder: (context, index, realIndex) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  Image.network(
                    bannerImages[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / 
                                loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.6),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Featured Room ${index + 1}',
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Mock data functions
Future<List<Map<String, dynamic>>> _fetchPopularRooms() async {
  return List.generate(
    5,
    (index) => {
      "imageUrl": 'assets/images/room.jpg',
      "location": 'Battambang, Cambodia',
      "title": 'Room Title $index',
      "price": '50',
    },
  );
}

Future<List<Map<String, dynamic>>> _fetchMoreRooms() async {
  return List.generate(
    10,
    (index) => {
      "imageUrl": 'assets/images/room.jpg',
      "location": 'Siem Reap, Cambodia',
      "title": 'Room Title $index',
      "price": '45',
    },
  );
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                title,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
  final bool showAllCards;
  final VoidCallback onSeeMorePressed;

  const SectionTwo({
    required this.title,
    required this.fetchData,
    this.showAllCards = false,
    required this.onSeeMorePressed,
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
        final displayedData = showAllCards ? data : data.take(5).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                title,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: displayedData.length,
              padding: const EdgeInsets.symmetric(horizontal: 6),
              itemBuilder: (context, index) {
                final room = displayedData[index];
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
            if (!showAllCards && data.length > 5)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Center(
                  child: ElevatedButton(
                    onPressed: onSeeMorePressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Theme.of(context).primaryColor,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_forward, size: 16),
                      ],
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 50),
          ],
        );
      },
    );
  }
}