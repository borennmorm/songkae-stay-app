import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bookings',
          style: TextStyle(fontSize: screenWidth * 0.045),
        ),
        centerTitle: false,
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFFF5F6F8),
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF002352).withOpacity(0.3),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xFF002352),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF5F6F8),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // List of Booking Cards
            Expanded(
              child: ListView(
                children: const [
                  BookingCard(),
                  BookingCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------------------- Components -------------------------------- //

/// Booking Card Widget
class BookingCard extends StatelessWidget {
  const BookingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.03),
      margin: EdgeInsets.only(bottom: screenWidth * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Top Row: Tenant Name and Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Tenant Name
              Expanded(
                child: Text(
                  'Tenant Name',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Iconsax.calendar, size: screenWidth * 0.045),
                      SizedBox(width: screenWidth * 0.01),
                      Text(
                        '11 Aug 2024',
                        style: TextStyle(fontSize: screenWidth * 0.035),
                      ),
                    ],
                  ),
                  ThreeDotIcon(context),
                ],
              ),
            ],
          ),
          const DashedLine(),

          // Bottom Row: Move-in Date and Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Iconsax.login, size: screenWidth * 0.045),
                  SizedBox(width: screenWidth * 0.01),
                  Text(
                    'Move In: 15 Aug 2024',
                    style: TextStyle(fontSize: screenWidth * 0.035),
                  ),
                ],
              ),
              Row(
                children: [
                  _buildActionIcon(
                    icon: Iconsax.call,
                    onPressed: () {
                      // Handle call action
                    },
                  ),
                  _buildActionIcon(
                    icon: Iconsax.message,
                    onPressed: () {
                      print("message, hello!!!");
                      // Get.to(() => const MessagesScreen());
                    },
                  ),
                  _buildActionIcon(
                    icon: Iconsax.card,
                    onPressed: () {
                      print("Id Card is show?");
                      _showIdCardPopup(
                        context,
                        'assets/images/idcard_example.png',
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Popup Menu for Booking Actions
PopupMenuButton<String> ThreeDotIcon(context) {
  return PopupMenuButton(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    icon: const Icon(Icons.more_vert),
    padding: EdgeInsets.zero,
    onSelected: (value) {
      switch (value) {
        case 'accept':
          // Handle Accept
          _showCustomWarningDialog(context);
          break;
        case 'reject':
          // Handle Reject
          _showCustomWarningDialog(context);
          break;
      }
    },
    itemBuilder: (context) => [
      const PopupMenuItem(
        value: 'accept',
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(CupertinoIcons.check_mark_circled),
          title: Text('Accept'),
        ),
      ),
      const PopupMenuItem(
        value: 'reject',
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(CupertinoIcons.xmark_circle),
          title: Text('Reject'),
        ),
      ),
    ],
  );
}

/// Action Icon for Call, Message, and Payment
Widget _buildActionIcon({
  required IconData icon,
  required VoidCallback onPressed,
}) {
  return Container(
    width: 35,
    height: 35,
    margin: const EdgeInsets.only(left: 10),
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.2),
      borderRadius: BorderRadius.circular(5),
    ),
    child: IconButton(
      onPressed: onPressed,
      icon: Icon(icon, size: 20, color: Colors.black),
    ),
  );
}

/// Dashed Line Divider
class DashedLine extends StatelessWidget {
  const DashedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: CustomPaint(
        size: const Size(double.infinity, 1),
        painter: DashPainter(),
      ),
    );
  }
}

/// Custom Dashed Line Painter
class DashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color(0xFF002352).withOpacity(0.5)
      ..strokeWidth = 1;

    var max = size.width;
    var dashWidth = 5;
    var dashSpace = 3;
    double startX = 0;

    while (startX < max) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Warning dialog
void _showCustomWarningDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                CupertinoIcons.exclamationmark_triangle_fill,
                color: Colors.orange,
                size: 40,
              ),
              const SizedBox(height: 20),
              const Text(
                'Is this tenant check out?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Text(
                'This mean that the tenant will not be in your management any more.',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle cancel action
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'No',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle delete action
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Yes',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

// Function to display the ID card popup
void _showIdCardPopup(BuildContext context, String imageUrl) {
  showDialog(
    context: context,
    barrierColor:
        Colors.black.withOpacity(0.8), // Overlay with black and opacity
    builder: (context) {
      return Dialog(
        backgroundColor:
            Colors.transparent, // Transparent background for the dialog
        child: Stack(
          children: [
            // ID Card with zoom functionality
            Center(
              child: InteractiveViewer(
                maxScale: 5.0, // Maximum zoom scale
                minScale: 1.0, // Minimum zoom scale
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            // Close/Exit Button
            Positioned(
              top: 10,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
