import 'package:flutter/material.dart';
import 'package:room_rental_app/shared/widgets/custom_language_card.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Language',
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
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            LanguageCard(
              flagImage: 'assets/images/flag_cambodia.png',
              languageName: 'Khmer',
            ),
            LanguageCard(
              flagImage: 'assets/images/flag_us.png',
              languageName: 'English',
            ),
          ],
        ),
      ),
    );
  }
}
