import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:room_rental_app/shared/widgets/property_infortmation.dart';

import 'property_detail_controller.dart';
import 'room_screen.dart';

class PropertyDetailScreen extends StatelessWidget {
  PropertyDetailScreen({super.key});

  final PropertyDetailController controller =
      Get.put(PropertyDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F6F8),
        automaticallyImplyLeading: true,
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
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Iconsax.home,
                  size: 23,
                  color: Color(0xFF002352),
                ),
                onPressed: () {
                  Get.to(() => const RoomScreen());
                },
              ),
              Positioned(
                right: 4,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF002352),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: const Text(
                    '10',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(
              Iconsax.notification,
              size: 23,
              color: Color(0xFF002352),
            ),
            onPressed: () {
              print("hello, I'm a notification!");
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF5F6F8),
      body: const Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PropertyDetails(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
        child: const Icon(Iconsax.edit),
      ),
    );
  }
}

class PropertyDetails extends StatelessWidget {
  const PropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[300],
        ),
        child: const Center(
          child: Text('Location!'),
        ),
      ),
      const SizedBox(height: 5),

      const Text(
        'Property Title',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 5),
      GestureDetector(
        onTap: () {
          print('Tapped');
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: const Color(0xFF002352).withOpacity(0.05),
              borderRadius: BorderRadius.circular(12)),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2),
                child: Icon(
                  Iconsax.location5,
                  size: 15,
                  color: Color(0xFF002352),
                ),
              ),
              Expanded(
                child: Text(
                  'Toulta Ek, Battambang, Cambodia',
                  style: TextStyle(
                    fontFamily: 'NotoSansKhmer',
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 10),
      // Room Feature
      const RoomFeature(),
      // Description
      const Description(),
      // Property Information
      const PropertyInfortmation(),
      const SizedBox(height: 70),
    ]);
  }
}

class Description extends StatelessWidget {
  const Description({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        ExpandableText(
          text:
              "This spacious room is filled with natural light and features a comfortable queen-sized bed, a large wardrobe for storage, and a private en-suite bathroom.",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

class ExpandableText extends StatefulWidget {
  final String text;
  final TextStyle? style;

  const ExpandableText({
    super.key,
    required this.text,
    this.style,
  });

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    const int textLimit = 100;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isExpanded
              ? widget.text
              : '${widget.text.substring(0, textLimit)}...',
          style: widget.style,
          textAlign: TextAlign.justify,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            isExpanded ? 'Show Less' : 'Show More',
            style: TextStyle(
              fontSize: widget.style?.fontSize ?? 11,
              color: const Color(0xFF002352),
            ),
          ),
        ),
      ],
    );
  }
}

class RoomFeature extends StatelessWidget {
  const RoomFeature({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> basicInfoList = [
      {
        'icon': Icons.bed_outlined,
        'labelText': 'Bed',
        'valueText': 'Available'
      },
      {
        'icon': Icons.bathroom_outlined,
        'labelText': 'Bathroom',
        'valueText': 'Available'
      },
      {
        'icon': Icons.square_foot_outlined,
        'labelText': 'Size',
        'valueText': '4 x 5'
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.3,
        ),
        itemCount: basicInfoList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final item = basicInfoList[index];
          return BasicInfoComponent(
            icon: item['icon'] as IconData,
            labelText: item['labelText'] as String,
            valueText: item['valueText'] as String,
          );
        },
      ),
    );
  }
}

class BasicInfoComponent extends StatelessWidget {
  final IconData icon;
  final String labelText;
  final String valueText;

  const BasicInfoComponent({
    super.key,
    required this.icon,
    required this.labelText,
    required this.valueText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 30,
          color: const Color(0xFF002352),
        ),
        const SizedBox(height: 5),
        Text(
          labelText,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          valueText,
          style: TextStyle(color: Colors.grey[600]),
        ),
      ],
    );
  }
}
