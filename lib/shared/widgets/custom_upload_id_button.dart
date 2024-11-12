import 'package:flutter/material.dart';

class UploadButton extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final VoidCallback onPress;

  const UploadButton({
    super.key,
    required this.labelText,
    required this.icon,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      elevation: 0,
      color: Colors.white38,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color(0xFF002352),
          ),
          const SizedBox(width: 10),
          Text(
            labelText,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
