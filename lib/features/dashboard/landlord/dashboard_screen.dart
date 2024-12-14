import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'booking/booking_screen.dart';
import 'invoice/invoice_screen.dart';
import 'property/properties_screen.dart';

class LandlordDashboardScreen extends StatelessWidget {
  const LandlordDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: false,
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFFF5F6F8),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF5F6F8),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            // Overview Section
            Container(
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
              child: const Column(
                children: [
                  Overviews(
                    icons: Iconsax.home_1,
                    number: '04',
                    titleText: 'Properties',
                    color: Colors.redAccent,
                  ),
                  Overviews(
                    icons: Iconsax.home,
                    number: '100',
                    titleText: 'Rooms',
                    color: Colors.amber,
                  ),
                  Overviews(
                    icons: Iconsax.user,
                    number: '80',
                    titleText: 'Tenants',
                    color: Colors.green,
                  ),
                  Overviews(
                    icons: Iconsax.calendar,
                    number: '03',
                    titleText: 'Booking',
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Row of Cards - Fixed height, expanded width
            SizedBox(
              height: 80, // Fixed height for the cards
              child: Row(
                children: [
                  // Property Button
                  Expanded(
                    child: Cards(
                      icon: Iconsax.home_1,
                      onTap: () {
                        Get.to(() => const PropertyScreen());
                      },
                      text: 'Properties',
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Invoice Button
                  Expanded(
                    child: Cards(
                      icon: Iconsax.check,
                      onTap: () {
                        Get.to(() => const InvoiceScreen());
                      },
                      text: 'Invoice',
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Booking Button
                  Expanded(
                    child: Cards(
                      icon: Iconsax.calendar,
                      onTap: () {
                        Get.to(() => const BookingScreen());
                      },
                      text: 'Booking',
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(), // This will push the cards to the top
          ],
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  final IconData? icon;
  final Function()? onTap;
  final String text;

  const Cards({
    super.key,
    required this.icon,
    this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.black,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class Overviews extends StatelessWidget {
  final Color? color;
  final IconData icons;
  final String titleText;
  final String number;

  const Overviews({
    super.key,
    this.color,
    required this.icons,
    required this.titleText,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.withOpacity(0.1),
        ),
      ),
      child: Row(
        children: [
          // Icon Container with solid color background
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color, // Solid color background
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icons,
              color: Colors.white, // White icon
              size: 24,
            ),
          ),
          const SizedBox(width: 15),
          // Title
          Text(
            titleText,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          // Number
          Text(
            number,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}


