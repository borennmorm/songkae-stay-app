import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TenantsApplicationScreen extends StatelessWidget {
  const TenantsApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tenants Application',
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.check,
              color: Color(0xFF002352),
            ),
          )
        ],
      ),
      backgroundColor: const Color(0xFFF5F6F8),
      body: Column(
        children: [
          // Informations
          const Information(),
          // Pricing
          const CollapsibleContainer(),
          // Select Date
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: SelectDateWidget(),
          ),
          // ListView Builder
          Expanded(
            // Wrap ListView.builder with Expanded
            child: ListView.builder(
              itemCount: 2,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              itemBuilder: (context, index) {
                return const ExpandableContainer();
              },
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class Information extends StatelessWidget {
  const Information({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image
            Image.network(
              'https://i.postimg.cc/g25VYN7X/user-5.png',
              width: 80,
            ),
            const SizedBox(width: 10),
            // Tenant Information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tenant Name',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // Phone Information
                  Row(
                    children: [
                      const Icon(Iconsax.call, size: 15),
                      const SizedBox(width: 5),
                      const Text('Phone:'),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          '091234545',
                          style: TextStyle(
                            color: Color(0xFF002352),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  // Check-in Information
                  const Row(
                    children: [
                      Icon(Iconsax.calendar, size: 15),
                      SizedBox(width: 5),
                      Text('Check in:'),
                      Spacer(),
                      Text(
                        '19 Aug 2024',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  // Room ID and Property ID
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Room ID
                      Row(
                        children: [
                          Icon(Iconsax.home, size: 15),
                          SizedBox(width: 5),
                          Text('Room ID:'),
                          SizedBox(width: 5),
                          Text(
                            '01',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // Property ID
                      Row(
                        children: [
                          Icon(Iconsax.house, size: 15),
                          SizedBox(width: 5),
                          Text('Property ID:'),
                          SizedBox(width: 5),
                          Text(
                            '01',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        icon: Iconsax.logout,
                        backgroundColor:
                            const Color(0xFF002352).withOpacity(0.2),
                        iconColor: const Color(0xFF002352),
                        onPressed: () {
                          // Handle button press
                          print("Tenant is check out?");
                          _showCustomWarningDialog(context);
                        },
                      ),
                      Row(
                        children: [
                          CustomButton(
                            icon: Iconsax.card,
                            backgroundColor:
                                const Color(0xFF002352).withOpacity(0.2),
                            iconColor: const Color(0xFF002352),
                            onPressed: () {
                              // Handle button press
                              print("Id Card is show?");
                              _showIdCardPopup(
                                context,
                                'assets/images/idcard_example.png',
                              );
                            },
                          ),
                          const SizedBox(width: 10),
                          CustomButton(
                            icon: Iconsax.message,
                            backgroundColor:
                                const Color(0xFF002352).withOpacity(0.2),
                            iconColor: const Color(0xFF002352),
                            onPressed: () {
                              // Handle button press
                              print("Button Pressed");
                            },
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;

  final Color iconColor;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class CollapsibleContainer extends StatefulWidget {
  const CollapsibleContainer({super.key});

  @override
  _CollapsibleContainerState createState() => _CollapsibleContainerState();
}

class _CollapsibleContainerState extends State<CollapsibleContainer> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded; // Toggle expansion state
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Base Pricing',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    _isExpanded ? Iconsax.arrow_up_15 : Iconsax.arrow_down5,
                  ),
                ],
              ),
            ),
            // Collapsible content
            if (_isExpanded)
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Iconsax.coin,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Room')
                            ],
                          ),
                          Text(
                            r'$50.0',
                            style: TextStyle(
                              color: Color(0xFF002352),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.water_drop_outlined,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Water')
                            ],
                          ),
                          Text(
                            r'$0.35',
                            style: TextStyle(
                              color: Color(0xFF002352),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.electric_bolt_outlined,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Electricity')
                            ],
                          ),
                          Text(
                            r'$45.0',
                            style: TextStyle(
                              color: Color(0xFF002352),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Iconsax.trash,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Garbage')
                            ],
                          ),
                          Text(
                            r'$0.00',
                            style: TextStyle(
                              color: Color(0xFF002352),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Iconsax.wifi,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Wifi')
                            ],
                          ),
                          Text(
                            r'$1.00',
                            style: TextStyle(
                              color: Color(0xFF002352),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
          ],
        ),
      ),
    );
  }
}

class SelectDateWidget extends StatefulWidget {
  const SelectDateWidget({super.key});

  @override
  _SelectDateWidgetState createState() => _SelectDateWidgetState();
}

class _SelectDateWidgetState extends State<SelectDateWidget> {
  DateTime _selectedDate = DateTime.now();

  // Helper to format the date as "Month Year"
  String _formatDate(DateTime date) {
    final List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  // Show the month-year picker as a bottom sheet
  Future<void> _showMonthYearPicker() async {
    DateTime tempDate = _selectedDate;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Month and Year',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  // Year Picker
                  Expanded(
                    child: SizedBox(
                      height: 200, // Constraining the height
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 40,
                        physics: const FixedExtentScrollPhysics(),
                        onSelectedItemChanged: (index) {
                          tempDate = DateTime(2024 + index, tempDate.month);
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) => Center(
                            child: Text(
                              '${2024 + index}', // Year starts at 2024
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          childCount:
                              50, // Limit to 50 years starting from 2024
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Month Picker
                  Expanded(
                    child: SizedBox(
                      height: 200,
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 40,
                        physics: const FixedExtentScrollPhysics(),
                        onSelectedItemChanged: (index) {
                          tempDate = DateTime(tempDate.year, index + 1);
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) => Center(
                            child: Text(
                              _formatMonth(index + 1),
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          childCount: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF002352),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
                onPressed: () {
                  setState(() {
                    _selectedDate = tempDate;
                  });
                  Navigator.pop(context);
                },
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  // Helper to format the month with index
  String _formatMonth(int monthIndex) {
    final List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[monthIndex - 1];
  }

  // Change the month using the left/right buttons
  void _changeMonth(int offset) {
    setState(() {
      _selectedDate = DateTime(
        _selectedDate.year,
        _selectedDate.month + offset,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left Button
        GestureDetector(
          onTap: () => _changeMonth(-1),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.arrow_left, size: 24),
          ),
        ),
        // Center Text (Month-Year)
        GestureDetector(
          onTap: _showMonthYearPicker,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              _formatDate(_selectedDate),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // Right Button
        GestureDetector(
          onTap: () => _changeMonth(1),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.arrow_right, size: 24),
          ),
        ),
      ],
    );
  }
}

// Usage Card
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
                  Iconsax.calendar,
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
