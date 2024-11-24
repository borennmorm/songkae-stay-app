import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TsbookingScreen extends StatelessWidget {
  const TsbookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Booking',
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
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            InvoiceCard(),
          ],
        ),
      ),
    );
  }
}

class InvoiceCard extends StatefulWidget {
  const InvoiceCard({
    super.key,
  });

  @override
  State<InvoiceCard> createState() => _InvoiceCardState();
}

class _InvoiceCardState extends State<InvoiceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Icon(
                  Iconsax.location5,
                  size: 10,
                  color: Color(0xFF002352),
                ),
                Text(
                  'Battambang, Cambodia',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            // For Download, Share and Delete
            ThreeDotIcon()
          ],
        ),
        Row(
          children: [
            Row(
              children: [
                const Text(
                  'Move In: ',
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF002352).withOpacity(0.1),
                  ),
                  child: const Text(
                    '22 Aug 2024',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            const Text('')
          ],
        ),
        const DashedLine(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Iconsax.user,
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Landloard Name',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: Text(
                '19 Aug 2024',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }

  PopupMenuButton<String> ThreeDotIcon() {
    return PopupMenuButton(
      onSelected: (value) {
        if (value == 'delete') {
          _showCustomWarningDialog(context);
        }
      },
      color: Colors.white,
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'delete',
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Iconsax.trash,
              color: Colors.red,
            ),
            title: Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
      ],
      child: const Icon(
        Icons.more_vert,
      ),
    );
  }
}

// Custom warning dialog with less rounded corners
void _showCustomWarningDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
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
                'Are you sure you want to delete?',
                style: TextStyle(fontSize: 18),
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
                      'Cancel',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle delete action
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Delete',
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

class DashedLine extends StatelessWidget {
  const DashedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CustomPaint(
        size: const Size(double.infinity, 1), // Infinite width, 1px height
        painter: DashPainter(),
      ),
    );
  }
}

class DashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.grey.withOpacity(0.5)
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
