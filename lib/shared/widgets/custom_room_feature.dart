import 'package:flutter/material.dart';

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
