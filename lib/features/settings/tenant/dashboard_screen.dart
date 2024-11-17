import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:room_rental_app/shared/widgets/horizental_date_picker.dart';

class TenantDashboardScreen extends StatelessWidget {
  const TenantDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
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
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const CollapsibleCard(),
                const SizedBox(
                  height: 10,
                ),
                HorizontalMonthYearPicker(
                  initialDate: DateTime.now(),
                  onDateChanged: (DateTime selectedDate) {
                    print(
                        'Selected Date: ${selectedDate.month}/${selectedDate.year}');
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const ExpandableContainer(),
              ],
            )),
      ),
    );
  }
}

class CollapsibleCard extends StatefulWidget {
  const CollapsibleCard({super.key});

  @override
  _CollapsibleCardState createState() => _CollapsibleCardState();
}

class _CollapsibleCardState extends State<CollapsibleCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/room.jpg',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Post Title'),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Iconsax.location5,
                          size: 12,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Battambang, Cambodia',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (isExpanded)
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PropertyFeatures(
                        icon: Icons.bolt_outlined,
                        labelText: 'Electricity',
                        valueText: '1500៛ | month',
                      ),
                      PropertyFeatures(
                        icon: Icons.water_drop_outlined,
                        labelText: 'Water',
                        valueText: '800៛ | month',
                      ),
                      PropertyFeatures(
                        icon: Icons.money,
                        labelText: 'Price',
                        valueText: '45\$ | month',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  LandlordProfile(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PropertyFeatures(
                        icon: Iconsax.trash,
                        labelText: 'Garbage',
                        valueText: '0៛ | month',
                      ),
                      PropertyFeatures(
                        icon: Icons.wifi,
                        labelText: 'Internet',
                        valueText: '4000៛ | month',
                      ),
                      PropertyFeatures(
                        icon: Icons.square_foot_outlined,
                        labelText: 'Size',
                        valueText: '4 x 5 m',
                      ),
                      PropertyFeatures(
                        icon: Icons.local_parking,
                        labelText: 'Parking',
                        valueText: 'Available',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(
                isExpanded ? Iconsax.arrow_up_2 : Iconsax.arrow_down_1,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PropertyFeatures extends StatelessWidget {
  final IconData icon;
  final String labelText;
  final String valueText;

  const PropertyFeatures({
    required this.icon,
    required this.labelText,
    required this.valueText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 25,
          color: const Color(0xFF002352),
        ),
        const SizedBox(height: 5),
        Text(
          labelText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Text(
          valueText,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class LandlordProfile extends StatelessWidget {
  const LandlordProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF002352).withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              // Landlord Profile
              CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSrmQwyTD9QQbp9EptXwQgQkwFvtVpCQcgyIk4l8324UQfDMXi6EMz06UmXHbEmLMYS8g&usqp=CAU',
                ),
              ),
              SizedBox(width: 10),
              // Landlord Name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Will Smith',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF002352),
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  Text(
                    'Owner',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF002352),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Contact
          Row(
            children: [
              // Call
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF002352).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.call, // Use Iconsax call icon
                    color: Color(0xFF002352),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Message
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF002352).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.message, // Use Iconsax message icon
                    color: Color(0xFF002352),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ExpandableContainer extends StatefulWidget {
  const ExpandableContainer({super.key});

  @override
  _ExpandableContainerState createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.06),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: [
        Row(
          children: [
            const Row(
              children: [
                Icon(
                  CupertinoIcons.calendar,
                  size: 18,
                ),
                SizedBox(width: 5),
                Text(
                  'September 2024',
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Your printer functionality goes here
                  },
                  icon: const Icon(
                    Icons.share,
                    size: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded; // Toggle the expanded state
                    });
                  },
                  icon: Icon(
                    isExpanded ? Iconsax.arrow_up_2 : Iconsax.arrow_down_1,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
        if (isExpanded) // Only show content when expanded
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(title: 'Usage'),
                SizedBox(height: 10),
                InfoRow(
                  icon: Icons.bolt_outlined,
                  label: 'Electricity:',
                  value: '27 kWh',
                ),
                SizedBox(height: 10),
                InfoRow(
                  icon: Icons.water_drop_outlined,
                  label: 'Water:',
                  value: '5 m³',
                ),
                DashedLine(),
                SectionTitle(title: 'Status'),
                SizedBox(height: 10),
                InfoRow(
                  icon: Icons.check_circle_outline,
                  label: 'Paid:',
                  value: 'Yes',
                ),
                SizedBox(height: 10),
                InfoRow(
                  icon: Iconsax.calendar_1,
                  label: 'Paid Date:',
                  value: '29 Aug 2024',
                ),
                DashedLine(),
                SectionTitle(title: 'Total Cost'),
                SizedBox(height: 10),
                InfoRow(
                  icon: Iconsax.coin_1,
                  label: 'Total:',
                  value: r'$78.56',
                ),
              ],
            ),
          )
      ]),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, size: 15),
            const SizedBox(width: 5),
            Text(label),
          ],
        ),
        Text(value),
      ],
    );
  }
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
