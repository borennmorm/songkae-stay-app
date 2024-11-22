import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomRoomCardColumn extends StatelessWidget {
  final String imageUrl;
  final String location;
  final String title;
  final double rating;
  final String price;
  final double width;
  final double height;
  final VoidCallback? onTap;

  const CustomRoomCardColumn({
    super.key,
    required this.imageUrl,
    required this.location,
    required this.title,
    required this.rating,
    required this.price,
    this.width = 250.0,
    this.height = 280.0,
    this.onTap, // Add onTap callback
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: GestureDetector(
        onTap: onTap, // Trigger the onTap callback when tapped
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          elevation: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12.0),
                    ),
                    child: Image.asset(
                      imageUrl,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 16.0,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            location,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 8,
                    right: 8,
                    child: Icon(
                      Iconsax.heart,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16.0,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          rating.toString(),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        Text(
                          price,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        const Text(
                          ' | month',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRoomCardRow extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final double rating;
  final String price;
  final VoidCallback? onTap;

  const CustomRoomCardRow({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.rating,
    required this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17.0),
        ),
        color: Colors.white,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Image section
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),

              // Text and icons section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),

                    // Location
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.black,
                          size: 14.0,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          location,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),

                    // Rating and stars
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16.0,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          rating.toString(),
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Price and favorite icon section
              Column(
                children: [
                  // Price container
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      '\$$price',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Favorite icon
                  const Icon(
                    Iconsax.heart,
                    size: 20,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
