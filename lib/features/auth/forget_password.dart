import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_rental_app/features/auth/register.dart';
import 'package:room_rental_app/shared/widgets/custom_button.dart';
import 'package:room_rental_app/shared/widgets/custom_textfield.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

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
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Space between the content
              children: [
                // Form content
                Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 150,
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
                      'Enter your email to reset password\nPlease check your email.',
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
                    const SizedBox(height: 20),
                    FullWidthButton(
                      onPressed: () {},
                      text: 'Submit',
                      color: const Color(0xFF002352),
                      textColor: Colors.white,
                    ),
                  ],
                ),

                // Spacer to push the register row to the bottom
                const SizedBox(height: 20),

                // Row with "Register" text at the bottom
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account yet?'),
                    TextButton(
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Color(0xFF002352),
                        ),
                      ),
                      onPressed: () {
                        Get.to(() => const RegisterScreen());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
