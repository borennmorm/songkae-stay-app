import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PropertyInfortmation extends StatelessWidget {
  const PropertyInfortmation({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> basicInfoList = [
      {
        'icon': Iconsax.trash,
        'labelText': 'Garbage',
        'valueText': '500៛ /month'
      },
      {
        'icon': Icons.water_drop_outlined,
        'labelText': 'Water',
        'valueText': '800៛ /㎥'
      },
      {'icon': Icons.stairs_outlined, 'labelText': 'Floor', 'valueText': '02'},
      {
        'icon': Icons.bolt_outlined,
        'labelText': 'Electricity',
        'valueText': '1200៛ /㎾h'
      },
      {
        'icon': Icons.wifi_outlined,
        'labelText': 'Internet',
        'valueText': 'Available'
      },
      {
        'icon': Icons.local_parking,
        'labelText': 'Parking',
        'valueText': 'Available'
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.3,
          ),
          itemCount: basicInfoList.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final item = basicInfoList[index];
            return BasicInfoComponent(
              icon: item['icon'] as IconData,
              labelText: item['labelText'] as String,
              valueText: item['valueText'] as String,
            );
          },
        ),
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
      mainAxisAlignment: MainAxisAlignment.center,
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
