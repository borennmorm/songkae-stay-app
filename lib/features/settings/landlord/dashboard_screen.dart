import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'booking/booking_screen.dart';
import 'invoice/invoice_screen.dart';
import 'property/properties_screen.dart';
import 'tenants/tenants_management_screen.dart';

class LandlordDashboardScreen extends StatelessWidget {
  const LandlordDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF002352).withOpacity(0.3),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xFF002352),
            ),
          ),
        ),
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
            // Row of Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Property Button
                Flexible(
                  flex: 1,
                  child: Cards(
                    icon: Iconsax.home_1,
                    onTap: () {
                      Get.to(() => const PropertyScreen());
                    },
                    text: 'Properties',
                    screenWidth: screenWidth,
                  ),
                ),
                const SizedBox(width: 10),
                // Tenants Button
                Flexible(
                  flex: 1,
                  child: Cards(
                    icon: Iconsax.user,
                    onTap: () {
                      Get.to(() => const TenantsManagementScreen());
                    },
                    text: 'Tenants',
                    screenWidth: screenWidth,
                  ),
                ),
                const SizedBox(width: 10),
                // Invoice Button
                Flexible(
                  flex: 1,
                  child: Cards(
                    icon: Iconsax.check,
                    onTap: () {
                      // Invoice screen
                      Get.to(() => const InvoiceScreen());
                    },
                    text: 'Invoice',
                    screenWidth: screenWidth,
                  ),
                ),
                const SizedBox(width: 10),
                // Booking Button
                Flexible(
                  flex: 1,
                  child: Cards(
                    icon: Iconsax.calendar,
                    onTap: () {
                      // Booking screen
                      Get.to(() => const BookingScreen());
                    },
                    text: 'Booking',
                    screenWidth: screenWidth,
                  ),
                ),
              ],
            ),
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
  final double screenWidth;

  const Cards({
    super.key,
    required this.icon,
    this.onTap,
    required this.text,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    final cardWidth = (screenWidth - 60) / 4;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardWidth,
        height: cardWidth * 0.9,
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
              size: cardWidth * 0.4,
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(fontSize: cardWidth * 0.15),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icons,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titleText),
              Text(
                number,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}


