import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_rental_app/shared/widgets/custom_bottom_nav.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _logoAnimation;
  late Animation<Offset> _nameAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Initialize the animations
    _logoAnimation = Tween<Offset>(
      begin: const Offset(0, -0.3),
      end: Offset.zero, // Center
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _nameAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero, // Center
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Start the animation
    _controller.forward();

    // Navigate to the next screen after 2 seconds
    Timer(const Duration(seconds: 5), () {
      Get.offAll(() => const CustomBottomNavigationBar());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Brightness overlay
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.3),
          ),
          // Content with animations
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SlideTransition(
                  position: _logoAnimation,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 120,
                  ),
                ),
                const SizedBox(height: 10),
                SlideTransition(
                  position: _nameAnimation,
                  child: Image.asset(
                    'assets/images/name_no_bg.png',
                    width: 150,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
