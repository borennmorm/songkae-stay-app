import 'package:flutter/material.dart';

class LanguageCard extends StatelessWidget {
  final String flagImage;
  final String languageName;

  const LanguageCard({
    super.key,
    required this.flagImage,
    required this.languageName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 1,
      color: Colors.white,
      child: InkWell(
        onTap: () {
          // Handle tap action, like switching the language
          print('Tapped on $languageName');
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              // Flag Image on the left
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  flagImage,
                  width: 40,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              // Language Name text on the right
              Text(
                languageName,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
