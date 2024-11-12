import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LandlordSettingsScreen extends StatelessWidget {
  const LandlordSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: TextButton(
          onPressed: () {
            // Get.to(() => const EditProfileScreen());
          },
          child: const Row(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(
                      'assets/images/user_profile.jpg',
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      // SizedBox(height: 10),
                      Text(
                        'Continue with account',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // General Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Landlord',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            _buildSettingsOption(
              icon: Iconsax.grid_2,
              text: 'Dashboard',
              onTap: () {
                // Get.to(() => const LandlordDashboardScreen());
              },
            ),

            // General Section
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'General',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            _buildSettingsOption(
              icon: Iconsax.heart,
              text: 'Favorite',
              onTap: () {},
            ),
            _buildSettingsOption(
              icon: Iconsax.language_circle,
              text: 'Language',
              onTap: () {
                // Add your target page for language settings
              },
            ),
            const SizedBox(height: 10),

            // Account Section
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Account',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            _buildSettingsOption(
              icon: Iconsax.user,
              text: 'Account Type',
              onTap: () {},
            ),
            _buildSettingsOption(
              icon: Iconsax.lock,
              text: 'Privacy Policy',
              onTap: () {
                // Add your target page for privacy policy
              },
            ),
            _buildSettingsOption(
              icon: Iconsax.note,
              text: 'Terms and Conditions',
              onTap: () {
                // Add your target page for terms and conditions
              },
            ),
            _buildSettingsOption(
              icon: Iconsax.info_circle,
              text: 'About Us',
              onTap: () {
                // Add your target page for about us
              },
            ),
          ],
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
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        backgroundColor: Colors.transparent,
        minimumSize: const Size(double.infinity, 0),
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF002352), size: 24),
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
          const Icon(
            Iconsax.arrow_right_3,
            size: 18,
            color: Color(0xFF002352),
          ),
        ],
      ),
    );
  }
}
