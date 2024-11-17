import 'package:flutter/material.dart';

class CustomRowIconButton extends StatelessWidget {
  final IconData icon;
  final String languageName;

  const CustomRowIconButton({
    super.key,
    required this.icon,
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
              // Icon on the left
              Icon(
                icon,
                size: 30,
                color: const Color(0xFF002352),
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
