import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart'; // Added import for Iconsax
import 'package:room_rental_app/features/settings/profile_screen.dart';
import 'package:room_rental_app/shared/widgets/custom_button.dart';

import '../about_us.dart';
import '../account_type_screen.dart';
import '../privacy_policy.dart';
import '../terms_conditions.dart';
import 'dashboard_screen.dart';
import 'favorite_screen.dart';
import '../language_screen.dart';
import 'support.dart';
import 'tsbooking_screen.dart';

class TenantSettingsScreen extends StatelessWidget {
  const TenantSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              const ProfileSection(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // General Section
                    const SizedBox(height: 15),
                    const Text(
                      'General',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _buildSettingsOption(
                      icon: Iconsax.category, // Updated icon
                      text: 'Dashboard',
                      onTap: () {
                        Get.to(() => const TenantDashboardScreen());
                      },
                    ),
                    _buildSettingsOption(
                      icon: Iconsax.calendar, // Updated icon
                      text: 'Booking',
                      onTap: () {
                        Get.to(() => const TsbookingScreen());
                      },
                    ),

                    _buildSettingsOption(
                      icon: Iconsax.heart, // Updated icon
                      text: 'Favorite',
                      onTap: () {
                        Get.to(() => const FavoriteScreen());
                      },
                    ),
                    _buildSettingsOption(
                      icon: Iconsax.global, // Updated icon
                      text: 'Language',
                      onTap: () {
                        Get.to(() => const LanguageScreen());
                      },
                    ),
                  ],
                ),
              ),
              // Account Section
              const SizedBox(height: 15),
              const Text(
                'Account',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              _buildSettingsOption(
                icon: Iconsax.user, // Updated icon
                text: 'Account Type',
                onTap: () {
                  Get.to(() => const AccountTypeScreen());
                },
              ),
              _buildSettingsOption(
                icon: Iconsax.shield_tick,
                text: 'Privacy Policy',
                onTap: () {
                  Get.to(() => const PrivacyPolicyScreen());
                },
              ),
              _buildSettingsOption(
                icon: Iconsax.book,
                text: 'Terms and Conditions',
                onTap: () {
                  Get.to(() => const TermsScreen());
                },
              ),
              _buildSettingsOption(
                icon: Iconsax.info_circle,
                text: 'About Us',
                onTap: () {
                  Get.to(() => const AboutUsScreen());
                },
              ),
              _buildSettingsOption(
                icon: Iconsax.support,
                text: 'Support',
                onTap: () {
                  Get.to(() => const SupportScreen());
                },
              ),
              const SizedBox(height: 15),

              FullWidthButton(
                onPressed: () {},
                text: 'Log Out',
                color: const Color(0xFF002352).withOpacity(0.2),
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build a settings option
  Widget _buildSettingsOption({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.black87, size: 24),
                const SizedBox(width: 15),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const Icon(Iconsax.arrow_right_34, size: 18),
          ],
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const EditProfileScreen());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFF002352).withOpacity(0.2),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2.0,
                    spreadRadius: 1.0,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 20,
                backgroundImage:
                    NetworkImage('https://i.postimg.cc/g25VYN7X/user-1.png'),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Morm Borenn',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF002352),
                  ),
                ),
                Text(
                  'View Profile',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
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
