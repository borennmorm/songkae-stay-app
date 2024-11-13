import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_rental_app/shared/widgets/custom_button.dart';
import 'package:room_rental_app/shared/widgets/custom_dropdown.dart';
import 'package:room_rental_app/shared/widgets/custom_textfield.dart';
import 'package:room_rental_app/shared/widgets/custom_upload_id_button.dart';

import 'login.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF002352),
        foregroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white30,
              shape: BoxShape.rectangle,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xFF002352),
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF002352),
              Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                ),
                const Text(
                  'SongkaeStay',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const Text(
                  'Welcome! We\'re excited\nto have you join us',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: emailController,
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  isPassword: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  isPassword: true,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: phoneController,
                  hintText: 'Enter your phone number',
                  labelText: 'Phone Number',
                  isPassword: false,
                ),
                const SizedBox(height: 10),
                // Inside a build method or widget tree
                MyDropdown(
                  labelText: "Account Type",
                  items: const ["Tenant", "Landlord"],
                  hintText: "Select Account Type",
                  onChanged: (value) {
                    // Handle change
                    print("Selected account type: $value");
                  },
                ),
                const SizedBox(height: 10),
                // Inside a build method or widget tree
                UploadButton(
                  labelText: "Upload ID Card",
                  icon: Icons.upload_file,
                  onPress: () {
                    // Handle upload logic
                    print("Upload ID Card button pressed");
                  },
                ),
                const SizedBox(height: 10),

                FullWidthButton(
                  onPressed: () {},
                  text: 'Register',
                  color: const Color(0xFF002352),
                  textColor: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have account?'),
                    TextButton(
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFF002352),
                        ),
                      ),
                      onPressed: () {
                        Get.to(() => const LoginScreen());
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
