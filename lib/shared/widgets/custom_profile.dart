import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;

  const ProfileImage({super.key, required this.imageUrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipOval(
        child: Image.asset(
          imageUrl,
          width: 30.0,
          height: 30.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
