import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'property/properties_screen.dart';
import 'tenants/tenants_management_screen.dart';

class LandlordDashboardScreen extends StatelessWidget {
  const LandlordDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Dashboard',
            style: TextStyle(
              fontSize: 18,
            ),
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
                shape: BoxShape.rectangle,
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
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Cards(
                    icon: Iconsax.home_1,
                    onTap: () {
                      Get.to(() => const PropertyScreen());
                    },
                    text: 'Properties',
                  ),
                  Cards(
                    icon: Iconsax.user,
                    onTap: () {
                      Get.to(() => const TenantsManagementScreen());
                    },
                    text: 'Tenants',
                  ),
                  Cards(
                    icon: Iconsax.check,
                    onTap: () {
                      // Get.to(() => const InvoiceScreen());
                    },
                    text: 'Invoice',
                  ),
                  Cards(
                    icon: Iconsax.calendar,
                    onTap: () {
                      // Get.to(() => const BookingScreen());
                    },
                    text: 'Booking',
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class Cards extends StatelessWidget {
  final IconData? icon;
  final Function()? onTap;
  final String text;

  const Cards({super.key, required this.icon, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 75,
        height: 75,
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
              size: 30,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 12),
            )
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
          const SizedBox(
            width: 10,
          ),
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
