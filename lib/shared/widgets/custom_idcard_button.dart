import 'package:flutter/material.dart';

class IdCardButton extends StatefulWidget {
  const IdCardButton({super.key});

  @override
  State<IdCardButton> createState() => _IdCardButtonState();
}

class _IdCardButtonState extends State<IdCardButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Get.to(() => const ScannerPage());
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey.shade400),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.badge, // Use the ID card icon here
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 10),
          const Text(
            'Verify ID Card',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

