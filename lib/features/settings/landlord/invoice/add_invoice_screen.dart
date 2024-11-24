import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class AddInvoiceScreen extends StatefulWidget {
  const AddInvoiceScreen({super.key});

  @override
  State<AddInvoiceScreen> createState() => _AddInvoiceScreenState();
}

class _AddInvoiceScreenState extends State<AddInvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar for navigation and actions
      appBar: AppBar(
        title: const Text(
          'Create Invoice',
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
        child: Column(
          children: [
            // Search Bar Section
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: const SearchBar(),
            ),
            const SizedBox(
              height: 10,
            ),
            // Pricing Overview Section
            const CollapsibleContainer(),
            const SizedBox(
              height: 10,
            ),
            // Invoice Form Section
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
              ),
              child: InvoiceForm(),
            ),
          ],
        ),
      ),
    );
  }
}

// --------------------------------- Components --------------------------------- //

/// Search bar widget for filtering content
class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String dropdownValue = 'Name';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          DropdownButton<String>(
            value: dropdownValue,
            underline: const SizedBox(),
            icon: const Icon(Icons.arrow_drop_down),
            onChanged: (String? newValue) {
              print('Selected Value: $newValue');
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['Name', 'Room', 'Phone']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

/// Pricing overview widget to display room, utilities, and services costs
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
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
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
                    style: TextStyle(
                      fontSize: 16,
                    ),
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

/// Reusable row for pricing details
class _PricingRow extends StatelessWidget {
  final String label;
  final String price;
  final IconData icon;

  const _PricingRow({
    required this.label,
    required this.price,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 15),
              const SizedBox(width: 5),
              Text(label),
            ],
          ),
          Text(price),
        ],
      ),
    );
  }
}

/// Invoice form widget to input month, utilities usage, payment status, and total cost
class InvoiceForm extends StatelessWidget {
  const InvoiceForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Month Picker
          const FormSectionTitle(title: 'Month'),
          const SizedBox(height: 10),
          const SelectDateWidget(),

          const SizedBox(height: 15),
          const FormSectionTitle(title: 'Usage'),
          const SizedBox(height: 10),
          const CustomTextField(hintText: 'Electricity (kWH)'),

          const CustomTextField(hintText: 'Water (m3)'),

          const SizedBox(height: 15),
          const FormSectionTitle(title: 'Payment Status'),
          const YesNoCheckbox(),

          const SizedBox(height: 15),
          const FormSectionTitle(title: 'Total Cost'),
          const SizedBox(height: 10),

          const _TotalCost(),

          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                text: 'Calculate',
                color: const Color(0xFF002352),
                onPressed: () {
                  print("Calculate pressed");
                },
              ),
              CustomButton(
                text: 'Generate',
                color: const Color(0xFF002352),
                onPressed: () {
                  print("Generate pressed");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Section Title widget for invoice form
class FormSectionTitle extends StatelessWidget {
  final String title;

  const FormSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

/// Widget for displaying total cost
class _TotalCost extends StatelessWidget {
  const _TotalCost();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Total', style: TextStyle(fontSize: 15)),
        Text(r'$0.00', style: TextStyle(fontSize: 16)),
      ],
    );
  }
}

// --------------------------------- Reusable Widgets --------------------------------- //

/// Reusable custom text field
class CustomTextField extends StatelessWidget {
  final String hintText;

  const CustomTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

/// Yes/No checkbox widget
class YesNoCheckbox extends StatefulWidget {
  const YesNoCheckbox({super.key});

  @override
  State<YesNoCheckbox> createState() => _YesNoCheckboxState();
}

class _YesNoCheckboxState extends State<YesNoCheckbox> {
  bool isYesChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isYesChecked,
          onChanged: (value) {
            setState(() {
              isYesChecked = value ?? false;
            });
          },
        ),
        Text(isYesChecked ? "Yes" : "No"),
      ],
    );
  }
}

// Month year picker
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
              color: const Color(0xFFF5F6F8),
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
              color: const Color(0xFFF5F6F8),
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
              color: const Color(0xFFF5F6F8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.arrow_right, size: 24),
          ),
        ),
      ],
    );
  }
}

/// Reusable button
class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.125,
          vertical: MediaQuery.of(context).size.height * 0.02,
        ),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
