import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:room_rental_app/shared/widgets/custom_button.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
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
                      radius: 60,
                      backgroundImage: NetworkImage(
                          'https://i.postimg.cc/g25VYN7X/user-1.png'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // Logic to upload/change profile picture
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0A2B4F),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 6,
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Iconsax.camera,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Profile Details Form
            _buildProfileTextField(
              label: 'Full Name',
              initialValue: 'Morm Borenn',
              icon: Iconsax.user,
            ),
            const SizedBox(height: 20),
            _buildProfileTextField(
              label: 'Email Address',
              initialValue: 'borenn.morm@example.com',
              icon: Iconsax.message,
            ),
            const SizedBox(height: 20),
            _buildProfileTextField(
              label: 'Phone Number',
              initialValue: '+123456789',
              icon: Iconsax.call,
            ),
            const SizedBox(height: 20),
            _buildProfileTextField(
              label: 'Gender',
              initialValue: 'Male',
              icon: Iconsax.personalcard,
            ),
            const SizedBox(height: 10),
            FullWidthButton(
              onPressed: () {},
              text: 'Save',
              color: const Color(0xFF002352),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build text fields with an icon
  Widget _buildProfileTextField({
    required String label,
    required String initialValue,
    required IconData icon,
  }) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color(0xFF0A2B4F)),
        labelText: label,
        labelStyle: const TextStyle(fontSize: 16, color: Colors.grey),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF0A2B4F)),
        ),
      ),
    );
  }
}
