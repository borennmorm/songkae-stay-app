import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RoomCardColumn extends StatefulWidget {
  const RoomCardColumn({super.key});

  @override
  State<RoomCardColumn> createState() => _RoomCardColumnState();
}

class _RoomCardColumnState extends State<RoomCardColumn> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(() => const RoomDetail());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/image_1.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 120,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Theme.of(context).primaryColor,
                    size: 12,
                  ),
                  Text(
                    'Phnom Penh, Cambodia',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Icon(
                    Iconsax.star1,
                    color: Colors.amber,
                    size: 15,
                  ),
                  Text(
                    ' 4.9',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
              const Text(
                'Room Title',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '\$50.00',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
